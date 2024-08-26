`ifndef AXI4LITESLAVEREADDRIVERPROXY_INCLUDED_
`define AXI4LITESLAVEREADDRIVERPROXY_INCLUDED_

class Axi4LiteSlaveReadDriverProxy extends uvm_driver#(Axi4LiteSlaveReadTransaction);
  `uvm_component_utils(Axi4LiteSlaveReadDriverProxy)

  uvm_seq_item_pull_port #(REQ, RSP) axi4LiteSlaveReadSeqItemPort;
  uvm_analysis_port #(RSP) axi4LiteSlaveReadRspPort;

  REQ reqRead;
  RSP rspRead;

  semaphore readDataKey;
  semaphore readResponseKey;

  process readAddressProcess;
  process readResponseProcess;

  Axi4LiteSlaveReadAgentConfig axi4LiteSlaveReadAgentConfig;
  Axi4LiteSlaveReadSeqItemConverter axi4LiteSlaveReadSeqItemConverter;

  virtual Axi4LiteSlaveReadDriverBFM axi4LiteSlaveReadDriverBFM;

  uvm_tlm_fifo #(Axi4LiteSlaveReadTransaction) axi4LiteSlaveReadDataFIFO;
  uvm_tlm_fifo #(Axi4LiteSlaveReadTransaction) axi4LiteSlaveReadAddressFIFO;

  extern function new(string name = "Axi4LiteSlaveReadDriverProxy", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual task waitForAresetnTask();
  extern virtual task readTransferTask();

endclass : Axi4LiteSlaveReadDriverProxy

function Axi4LiteSlaveReadDriverProxy::new(string name = "Axi4LiteSlaveReadDriverProxy",
                                      uvm_component parent = null);
  super.new(name, parent);
  axi4LiteSlaveReadSeqItemPort = new("axi4LiteSlaveReadSeqItemPort", this);
  axi4LiteSlaveReadRspPort     = new("axi4LiteSlaveReadRspPort", this);
  axi4LiteSlaveReadDataFIFO    = new("axi4LiteSlaveReadDataFIFO",this,16);
  axi4LiteSlaveReadAddressFIFO = new("axi4LiteSlaveReadAddressFIFO",this,16);
  readDataKey                  = new(1);     
  readResponseKey              = new(1);     
endfunction : new

function void Axi4LiteSlaveReadDriverProxy::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db #(virtual Axi4LiteSlaveReadDriverBFM)::get(this,"","Axi4LiteSlaveReadDriverBFM",axi4LiteSlaveReadDriverBFM)) begin
    `uvm_fatal("FATAL_MDP_CANNOT_GET_tx_DRIVER_BFM","cannot get() axi4LiteSlaveReadDriverBFM");
  end

 endfunction : build_phase

function void Axi4LiteSlaveReadDriverProxy::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  axi4LiteSlaveReadDriverBFM.axi4LiteSlaveReadDriverProxy= this;
endfunction  : end_of_elaboration_phase

task Axi4LiteSlaveReadDriverProxy::run_phase(uvm_phase phase);
  waitForAresetnTask();
  readTransferTask();
endtask : run_phase

task Axi4LiteSlaveReadDriverProxy::waitForAresetnTask();
  axi4LiteReadSlaveTransferCfgStruct slaveReadConfigStruct;
  Axi4LiteSlaveReadConfigConverter::fromClass(axi4LiteSlaveReadAgentConfig, slaveReadConfigStruct);
  axi4LiteSlaveReadDriverBFM.waitForAresetn(slaveReadConfigStruct);
endtask : waitForAresetnTask

task Axi4LiteSlaveReadDriverProxy::readTransferTask();
    readDataKey.get(1);
  forever begin
    Axi4LiteSlaveReadTransaction slaveReadTx;
    axi4LiteReadSlaveTransferCfgStruct slaveReadConfigStruct;
    axi4LiteReadSlaveTransferPacketStruct slaveReadPacketStruct;

    `uvm_info(get_type_name(),$sformatf("Inside SlavewriteTransferTask before get_next_item Axi4LiteSlaveReadDriverProxy"),UVM_LOW);
    axi4LiteSlaveReadSeqItemPort.get_next_item(reqRead);
    `uvm_info(get_type_name(),$sformatf("Inside SlaveWriteTransferTask after get_next_item Axi4LitSlaveReadDriverProxy"),UVM_LOW);

    if(!axi4LiteSlaveReadDataFIFO.is_full()) begin
      axi4LiteSlaveReadDataFIFO.put(reqRead);
    end
    else begin
      `uvm_error(get_type_name(),$sformatf("SLAVE_READ_TASK::Cannot write into FIFO as axi4LiteSlaveReadDataFIFO IS FULL"));
    end

    `uvm_info(get_type_name(),$sformatf("SLAVE_READ_TASK::Before Sending_Req_Read_Packet = \n%s",reqRead.sprint()),UVM_HIGH);
  
    `uvm_info(get_type_name(),$sformatf("Inside writeTransferTask before fromClass Axi4LiteSlaveReadDriverProxy"),UVM_LOW);
      Axi4LiteSlaveReadConfigConverter::fromClass(axi4LiteSlaveReadAgentConfig, slaveReadConfigStruct);
    `uvm_info(get_type_name(),$sformatf("Inside writeTransferTask after fromClass Axi4LiteSlaverReadDriverProxy"),UVM_LOW);
   
    fork 
      begin : SLAVE_READ_ADDRESS_TASK 
      Axi4LiteSlaveReadTransaction slaveReadAddressTx;
      axi4LiteReadSlaveTransferPacketStruct slaveReadPacketStruct;

      readAddressProcess = process::self();

      Axi4LiteSlaveReadSeqItemConverter::fromReadClass(reqRead, slaveReadPacketStruct);
      `uvm_info(get_type_name(),$sformatf("SLAVE_READ_ADDRESS_TASK::After the FromClass read address struct packet = %p",
                                          slaveReadPacketStruct),UVM_MEDIUM);
      axi4LiteSlaveReadDriverBFM.readAddressChannelTask(slaveReadConfigStruct, slaveReadPacketStruct);
      Axi4LiteSlaveReadSeqItemConverter::toReadClass(slaveReadPacketStruct,slaveReadAddressTx);
      `uvm_info(get_type_name(),$sformatf("SLAVE_READ_ADDRESS_TASK::Received read address packet From driverBFM = %p",
                                          slaveReadPacketStruct),UVM_MEDIUM);  

        if(!axi4LiteSlaveReadAddressFIFO.is_full()) begin
          axi4LiteSlaveReadAddressFIFO.put(slaveReadAddressTx);
        end
        else begin
          `uvm_error(get_type_name(),$sformatf("SLAVE_READ_ADDRESS_TASK::Cannot write into FIFO as axi4LiteSlaveReadAddressFIFO IS FULL"));
        end
        readDataKey.put(1);
      end

      begin : SLAVE_READ_DATA_TASK
      Axi4LiteSlaveReadTransaction slaveReadAddressTx;
      Axi4LiteSlaveReadTransaction slaveReadDataTx;
      axi4LiteReadSlaveTransferPacketStruct slaveReadPacketStruct;

      readResponseProcess = process::self();

      readResponseKey.get(1);
      readDataKey.get(1);

      if(!axi4LiteSlaveReadDataFIFO.is_empty()) begin
        axi4LiteSlaveReadDataFIFO.get(slaveReadDataTx);
      end
      else begin
        `uvm_error(get_type_name(),$sformatf("SLAVE_READ_DATA_THREAD::Cannot get into FIFO as READ_DATA_FIFO IS EMPTY"));
      end

      if(!axi4LiteSlaveReadAddressFIFO.is_empty()) begin
        axi4LiteSlaveReadAddressFIFO.get(slaveReadAddressTx);
      end
      else begin
        `uvm_error(get_type_name(),$sformatf("SLAVE_READ_DATA_THREAD::Cannot get into FIFO as READ_ADDRESS_FIFO IS EMPTY"));
      end

      Axi4LiteSlaveReadSeqItemConverter::fromReadClass(slaveReadDataTx, slaveReadPacketStruct);
      `uvm_info(get_type_name(),$sformatf("SLAVE_READ_DATA_TASK::After the FromClass read Data struct packet = %p",
                                          slaveReadPacketStruct),UVM_MEDIUM);    

       if(!(slaveReadAddressTx.araddr inside {[slaveReadConfigStruct.minAddressRange:slaveReadConfigStruct.maxAddressRange]})) begin
         slaveReadPacketStruct.rresp = READ_SLVERR;
       end else begin
         slaveReadPacketStruct.rresp = READ_OKAY;
       end

      axi4LiteSlaveReadDriverBFM.readDataChannelTask(slaveReadConfigStruct, slaveReadPacketStruct);
      Axi4LiteSlaveReadSeqItemConverter::toReadClass(slaveReadPacketStruct,slaveReadDataTx);
      `uvm_info(get_type_name(),$sformatf("SLAVE_READ_DATA_TASK::Received read data packet From driverBFM = %p",
                                          slaveReadPacketStruct),UVM_MEDIUM);
        readResponseKey.put(1);
      end
    join_any 

    readAddressProcess.await();

    `uvm_info(get_type_name(), $sformatf("READ_TASK :: Out of fork_join_any : After await readAddress.status()=%s",
                                            readAddressProcess.status()), UVM_NONE);

    if(axi4LiteSlaveReadAgentConfig.enableOutstandingTransaction == 0) begin
      readResponseProcess.await();
    end
   axi4LiteSlaveReadSeqItemPort.item_done();
  end
endtask : readTransferTask

`endif

