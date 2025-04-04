`ifndef AXI4LITESLAVEWRITEDRIVERPROXY_INCLUDED_
`define AXI4LITESLAVEWRITEDRIVERPROXY_INCLUDED_

class Axi4LiteSlaveWriteDriverProxy extends uvm_driver#(Axi4LiteSlaveWriteTransaction);
  `uvm_component_utils(Axi4LiteSlaveWriteDriverProxy)

  uvm_seq_item_pull_port #(REQ, RSP) axi4LiteSlaveWriteSeqItemPort;
  uvm_analysis_port #(RSP) axi4LiteSlaveWriteRspPort;

  REQ reqWrite;
  RSP rspWrite;

  semaphore writeResponseDataKey;
  semaphore writeResponseKey;
  semaphore writeDataKey;
  semaphore writeAddressKey;

  process writeAddressProcess;
  process writeDataProcess;
  process writeResponseProcess;

  Axi4LiteSlaveWriteAgentConfig axi4LiteSlaveWriteAgentConfig;
  Axi4LiteSlaveWriteSeqItemConverter axi4LiteSlaveWriteSeqItemConverter;

  virtual Axi4LiteSlaveWriteDriverBFM axi4LiteSlaveWriteDriverBFM;

  uvm_tlm_fifo #(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveWriteResponseFIFO;
  uvm_tlm_fifo #(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveWriteAddressFIFO;

  extern function new(string name = "Axi4LiteSlaveWriteDriverProxy", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual task waitForAresetnTask();
  extern virtual task writeTransferTask();

 endclass : Axi4LiteSlaveWriteDriverProxy

function Axi4LiteSlaveWriteDriverProxy::new(string name = "Axi4LiteSlaveWriteDriverProxy",
                                      uvm_component parent = null);
  super.new(name, parent);
  axi4LiteSlaveWriteSeqItemPort  = new("axi4LiteSlaveWriteSeqItemPort", this);
  axi4LiteSlaveWriteRspPort      = new("axi4LiteSlaveWriteRspPort", this);
  axi4LiteSlaveWriteResponseFIFO = new("axi4LiteSlaveWriteResponseFIFO",this,16);
  axi4LiteSlaveWriteAddressFIFO  = new("axi4LiteSlaveWriteAddressFIFO",this,16);
  writeAddressKey                = new(1);
  writeDataKey                   = new(1);
  writeResponseDataKey           = new(1);
  writeResponseKey               = new(1);
 endfunction : new

function void Axi4LiteSlaveWriteDriverProxy::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db #(virtual Axi4LiteSlaveWriteDriverBFM)::get(this,"","Axi4LiteSlaveWriteDriverBFM",axi4LiteSlaveWriteDriverBFM)) begin
    `uvm_fatal("FATAL_MDP_CANNOT_GET_tx_DRIVER_BFM","cannot get() axi4LiteSlaveWriteDriverBFM");
  end
endfunction : build_phase

function void Axi4LiteSlaveWriteDriverProxy::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  axi4LiteSlaveWriteDriverBFM.axi4LiteSlaveWriteDriverProxy= this;
endfunction  : end_of_elaboration_phase

task Axi4LiteSlaveWriteDriverProxy::run_phase(uvm_phase phase);
 waitForAresetnTask();
 writeTransferTask();
endtask : run_phase

task Axi4LiteSlaveWriteDriverProxy::waitForAresetnTask();
 axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct;
 Axi4LiteSlaveWriteConfigConverter::fromClass(axi4LiteSlaveWriteAgentConfig, slaveWriteConfigStruct);
 axi4LiteSlaveWriteDriverBFM.waitForAresetn(slaveWriteConfigStruct);
endtask : waitForAresetnTask

task Axi4LiteSlaveWriteDriverProxy::writeTransferTask();
   writeResponseDataKey.get(1);
   writeAddressKey.get(1);
 forever begin
    Axi4LiteSlaveWriteTransaction slaveWriteTx;
    axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct;
    axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct;

    axi4LiteSlaveWriteSeqItemPort.get_next_item(reqWrite);
   `uvm_info(get_type_name(), $sformatf("SLAVE_WRITE_TASK::Before Sending_Req_Write_Packet = \n%s", reqWrite.sprint()),UVM_HIGH);

   if(!axi4LiteSlaveWriteResponseFIFO.is_full()) begin
     axi4LiteSlaveWriteResponseFIFO.put(reqWrite);
   end
   else begin
     `uvm_error(get_type_name(),$sformatf("SLAVE_WRITE_TASK::Cannot write into FIFO as axi4LiteSlaveWriteResponseFIFO IS FULL"));
   end
 
    Axi4LiteSlaveWriteConfigConverter::fromClass(axi4LiteSlaveWriteAgentConfig, slaveWriteConfigStruct);


    fork 
     begin : SLAVE_WRITE_ADDRESS_CHANNEL
        Axi4LiteSlaveWriteTransaction slaveWriteAddressTx;
        axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct;

        writeAddressProcess = process::self();

       `uvm_info(get_type_name(),$sformatf("SLAVE_WRITE_ADDRESS_CHANNEL_TASK::Before WriteAddress struct packet = %p",                                                         slaveWritePacketStruct),UVM_MEDIUM);
        Axi4LiteSlaveWriteSeqItemConverter::fromWriteClass(reqWrite, slaveWritePacketStruct);
        axi4LiteSlaveWriteDriverBFM.writeAddressChannelTask(slaveWriteConfigStruct, slaveWritePacketStruct);
        Axi4LiteSlaveWriteSeqItemConverter::toWriteClass(slaveWritePacketStruct,slaveWriteAddressTx);
       `uvm_info(get_type_name(),$sformatf("SLAVE_WRITE_ADDRESS_CHANNEL_TASK:: Received WriteAddress struct packet form DriverBFM = %p",slaveWritePacketStruct),UVM_MEDIUM);

       if(!axi4LiteSlaveWriteAddressFIFO.is_full()) begin
         axi4LiteSlaveWriteAddressFIFO.put(slaveWriteAddressTx);
       end
       else begin
         `uvm_error(get_type_name(),$sformatf("SLAVE_WRITE_ADDRESS_TASK::Cannot write into FIFO as axi4LiteSlaveWriteAddressFIFO IS FULL"));
       end
 
        writeAddressKey.put(1);
     end

     begin : SLAVE_WRITE_DATA_CHANNEL
       Axi4LiteSlaveWriteTransaction slaveWriteDataTx;
       axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct;
      
       writeDataProcess = process::self();
       writeDataKey.get(1);
       `uvm_info(get_type_name(),$sformatf("SLAVE_WRITE_DATA_CHANNEL_TASK::Before WriteData struct packet = %p",
                                            slaveWritePacketStruct),UVM_MEDIUM);
        Axi4LiteSlaveWriteSeqItemConverter::fromWriteClass(reqWrite, slaveWritePacketStruct);
        axi4LiteSlaveWriteDriverBFM.writeDataChannelTask(slaveWriteConfigStruct, slaveWritePacketStruct);
        Axi4LiteSlaveWriteSeqItemConverter::toWriteClass(slaveWritePacketStruct,slaveWriteDataTx);
       `uvm_info(get_type_name(),$sformatf("SLAVE_WRITE_DATA_CHANNEL_TASK::Received WriteData packet from driverBFM = %p",
                                            slaveWritePacketStruct),UVM_MEDIUM);
        writeResponseDataKey.put(1);
        writeDataKey.put(1);
     end

     begin : SLAVE_WRITE_RESPONSE_CHANNEL
       Axi4LiteSlaveWriteTransaction slaveWriteAddressTx;
       Axi4LiteSlaveWriteTransaction slaveWriteResponseTx;
       axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct;

       writeResponseProcess = process::self();

        writeResponseKey.get(1);
        writeAddressKey.get(1);
        writeResponseDataKey.get(1);

        if(!axi4LiteSlaveWriteResponseFIFO.is_empty()) begin
          axi4LiteSlaveWriteResponseFIFO.get(slaveWriteResponseTx);
        end
        else begin
          `uvm_error(get_type_name(),$sformatf("SLAVE_WRITE_RESPONSE_THREAD::Cannot get into FIFO as WRITE_RESP_FIFO IS EMPTY"));
        end

        if(!axi4LiteSlaveWriteAddressFIFO.is_empty()) begin
          axi4LiteSlaveWriteAddressFIFO.get(slaveWriteAddressTx);
        end
        else begin
          `uvm_error(get_type_name(),$sformatf("SLAVE_WRITE_RESPONSE_THREAD::Cannot get into FIFO as WRITE_ADDRESS_FIFO IS EMPTY"));
        end

       `uvm_info(get_type_name(),$sformatf("SLAVE_WRITE_RESPONSE_CHANNEL_TASK::Before writeResponse struct packet = %p",
                                            slaveWritePacketStruct),UVM_MEDIUM);
       Axi4LiteSlaveWriteSeqItemConverter::fromWriteClass(slaveWriteResponseTx, slaveWritePacketStruct);

       if(!(slaveWriteAddressTx.awaddr inside {[slaveWriteConfigStruct.minAddressRange:slaveWriteConfigStruct.maxAddressRange]})) begin
         slaveWritePacketStruct.bresp = WRITE_SLVERR;
       end else begin
         slaveWritePacketStruct.bresp = WRITE_OKAY;
       end

       axi4LiteSlaveWriteDriverBFM.writeResponseChannelTask(slaveWriteConfigStruct, slaveWritePacketStruct);
       Axi4LiteSlaveWriteSeqItemConverter::toWriteClass(slaveWritePacketStruct,slaveWriteResponseTx);
       `uvm_info(get_type_name(),$sformatf("SLAVE_WRITE_RESPONSE_CHANNEL_TASK::Received writeResponse packet from driverBFM = %p",
                                            slaveWritePacketStruct),UVM_MEDIUM);
        writeResponseKey.put(1);
     end
   join_any

    writeAddressProcess.await();
    writeDataProcess.await();

    `uvm_info(get_type_name(), $sformatf("WRITE_TASK :: Out of fork_join_any : After await writeAddress.status()=%s",
                                            writeAddressProcess.status()), UVM_NONE);

    if(axi4LiteSlaveWriteAgentConfig.enableOutstandingTransaction == 0) begin
      writeResponseProcess.await();
    end
   axi4LiteSlaveWriteSeqItemPort.item_done();
 end
endtask : writeTransferTask

`endif
                             
