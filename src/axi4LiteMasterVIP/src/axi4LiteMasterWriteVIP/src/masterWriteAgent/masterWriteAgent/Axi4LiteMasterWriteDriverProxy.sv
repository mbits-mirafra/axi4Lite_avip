`ifndef AXI4LITEMASTERWRITEDRIVERPROXY_INCLUDED_
`define AXI4LITEMASTERWRITEDRIVERPROXY_INCLUDED_

class Axi4LiteMasterWriteDriverProxy extends uvm_driver #(Axi4LiteMasterWriteTransaction);
  `uvm_component_utils(Axi4LiteMasterWriteDriverProxy)

  uvm_seq_item_pull_port #(REQ,RSP) axi4LiteMasterWriteSeqItemPort;
  uvm_analysis_port #(RSP) axi4LiteMasterWriteRspPort;
  uvm_tlm_analysis_fifo #(Axi4LiteMasterWriteTransaction) axi4LiteMasterWriteResponseFIFO;

  REQ reqWrite;
  RSP rspWrite;

  semaphore writeResponseKey;
  semaphore writeDataKey;
  semaphore writeAddressKey;
  semaphore writeDataResponseKey;

  process writeAddressProcess;
  process writeDataProcess;
  process writeResponseProcess;

  int outstandingTxCounter;
  int remainOutstandingTxCounter;

  Axi4LiteMasterWriteAgentConfig axi4LiteMasterWriteAgentConfig;

  virtual Axi4LiteMasterWriteDriverBFM axi4LiteMasterWriteDriverBFM;

  extern function new(string name = "Axi4LiteMasterWriteDriverProxy", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual task waitForAresetnTask();
  extern virtual task writeTransferTask();

endclass : Axi4LiteMasterWriteDriverProxy

function Axi4LiteMasterWriteDriverProxy::new(string name = "Axi4LiteMasterWriteDriverProxy",
                                             uvm_component parent = null);
  super.new(name, parent);
  axi4LiteMasterWriteSeqItemPort  = new("axi4LiteMasterWriteSeqItemPort", this);
  axi4LiteMasterWriteRspPort      = new("axi4LiteMasterWriteRspPort", this);
  axi4LiteMasterWriteResponseFIFO = new("axi4LiteMasterWriteResponseFIFO", this);
  writeAddressKey                 = new(1);
  writeDataKey                    = new(1);
  writeResponseKey                = new(1);
  writeDataResponseKey            = new(1);
endfunction : new

function void Axi4LiteMasterWriteDriverProxy::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(virtual Axi4LiteMasterWriteDriverBFM)::get(
          this, "*", "Axi4LiteMasterWriteDriverBFM", axi4LiteMasterWriteDriverBFM
      )) begin
    `uvm_fatal("FATAL_MDP_CANNOT_GET_Axi4LiteMasterWriteDriverBFM",
               "cannot get() axi4LiteMasterWriteDriverBFM");
  end
endfunction : build_phase

function void Axi4LiteMasterWriteDriverProxy::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  axi4LiteMasterWriteDriverBFM.axi4LiteMasterWriteDriverProxy = this;
endfunction : end_of_elaboration_phase

task Axi4LiteMasterWriteDriverProxy::run_phase(uvm_phase phase);
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteDriverProxy"),UVM_LOW);
  waitForAresetnTask();
  `uvm_info(get_type_name(),$sformatf("Inside run_phase after waitForAresetn Axi4LiteMasterWriteDriverProxy"),UVM_LOW);
  writeTransferTask();
  `uvm_info(get_type_name(),$sformatf("Inside run_phase after writeTransferTask Axi4LiteMasterWriteDriverProxy"),UVM_LOW);
endtask : run_phase

task Axi4LiteMasterWriteDriverProxy::waitForAresetnTask();
  axi4LiteWriteMasterTransferCfgStruct  masterWriteConfigStruct;
  Axi4LiteMasterWriteConfigConverter::fromClass(axi4LiteMasterWriteAgentConfig, masterWriteConfigStruct);

  axi4LiteMasterWriteDriverBFM.waitForAresetn(masterWriteConfigStruct);
endtask : waitForAresetnTask

task Axi4LiteMasterWriteDriverProxy::writeTransferTask();
   writeDataResponseKey.get(1);
   writeAddressKey.get(1);
   remainOutstandingTxCounter <= axi4LiteMasterWriteAgentConfig.noOfOutstandingTx;

  forever begin
    Axi4LiteMasterWriteTransaction  masterWriteTx;
    axi4LiteWriteMasterTransferCfgStruct  masterWriteConfigStruct;
    axi4LiteWriteMasterTransferPacketStruct masterWritePacketStruct;

  `uvm_info(get_type_name(),$sformatf("Inside writeTransferTask before get_next_item Axi4LiteMasterWriteDriverProxy"),UVM_LOW);
    axi4LiteMasterWriteSeqItemPort.get_next_item(reqWrite);
  `uvm_info(get_type_name(),$sformatf("Inside writeTransferTask after get_next_item Axi4LiteMasterWriteDriverProxy"),UVM_LOW);
    `uvm_info(get_type_name(), $sformatf(
              "MASTER_WRITE_TASK::Before Sending_Req_Write_Packet = \n%s", reqWrite.sprint()),
              UVM_HIGH);

   if(!axi4LiteMasterWriteResponseFIFO.is_full()) begin
     axi4LiteMasterWriteResponseFIFO.write(reqWrite);
   end
   else begin
     `uvm_error(get_type_name(),$sformatf("MASTER_WRITE_TASK::Cannot write into FIFO as axi4LiteMasterWriteResponseFIFO IS FULL"));
   end

  `uvm_info(get_type_name(),$sformatf("Inside writeTransferTask before fromClass Axi4LiteMasterWriteDriverProxy"),UVM_LOW);
    Axi4LiteMasterWriteConfigConverter::fromClass(axi4LiteMasterWriteAgentConfig, masterWriteConfigStruct);
  `uvm_info(get_type_name(),$sformatf("Inside writeTransferTask after fromClass Axi4LiteMasterWriteDriverProxy"),UVM_LOW);

    fork
      begin : MASTER_WRITE_ADDRESS_CHANNEL
        Axi4LiteMasterWriteTransaction  masterWriteAddressTx;
        axi4LiteWriteMasterTransferPacketStruct masterWritePacketStruct;

        writeAddressProcess = process::self();

        Axi4LiteMasterWriteSeqItemConverter::fromWriteClass(reqWrite, masterWritePacketStruct);
        `uvm_info(get_type_name(),$sformatf("MASTER_WRITE_ADDRESS_THREAD::Checking write address struct packet = %p",
                                               masterWritePacketStruct),UVM_MEDIUM); 
        axi4LiteMasterWriteDriverBFM.writeAddressChannelTask(masterWriteConfigStruct, masterWritePacketStruct);
        Axi4LiteMasterWriteSeqItemConverter::toWriteClass(masterWritePacketStruct,masterWriteAddressTx);
        `uvm_info(get_type_name(),$sformatf("MASTER_WRITE_ADDRESS_THREAD::Received write address packet From driverBFM = %p",masterWritePacketStruct),UVM_MEDIUM); 

        writeAddressKey.put(1);
      end

      begin : MASTER_WRITE_DATA_CHANNEL
        Axi4LiteMasterWriteTransaction  masterWriteDataTx;
        axi4LiteWriteMasterTransferPacketStruct masterWritePacketStruct;

        writeDataProcess = process::self();
        writeDataKey.get(1);

        Axi4LiteMasterWriteSeqItemConverter::fromWriteClass(reqWrite, masterWritePacketStruct);
        `uvm_info(get_type_name(),$sformatf("MASTER_WRITE_DATA_THREAD::Checking write data struct packet = %p",
                                               masterWritePacketStruct),UVM_MEDIUM); 

       foreach(masterWritePacketStruct.wstrb[i]) begin
         if(masterWritePacketStruct.wstrb[i] == 0) begin
           masterWritePacketStruct.wdata[i*8+:8] = 'b0;
         end
       end

        axi4LiteMasterWriteDriverBFM.writeDataChannelTask(masterWriteConfigStruct, masterWritePacketStruct);
        Axi4LiteMasterWriteSeqItemConverter::toWriteClass(masterWritePacketStruct,masterWriteDataTx);
        `uvm_info(get_type_name(),$sformatf("MASTER_WRITE_DATA_THREAD::Received write data packet From driverBFM = %p",
                                               masterWritePacketStruct),UVM_MEDIUM); 

        writeDataResponseKey.put(1);
        writeDataKey.put(1);
      end

      begin : MASTER_WRITE_RESPONSE_CHANNEL
        Axi4LiteMasterWriteTransaction  masterWriteResponseTx;
        axi4LiteWriteMasterTransferPacketStruct masterWritePacketStruct;

        writeResponseProcess = process::self();
        writeResponseKey.get(1);
        writeAddressKey.get(1);
        writeDataResponseKey.get(1);

        if(!axi4LiteMasterWriteResponseFIFO.is_empty()) begin
          axi4LiteMasterWriteResponseFIFO.get(masterWriteResponseTx);
        end
        else begin
          `uvm_error(get_type_name(),$sformatf("MASTER_WRITE_RESPONSE_THREAD::Cannot get into FIFO as WRITE_RESP_FIFO IS EMPTY"));
        end

        Axi4LiteMasterWriteSeqItemConverter::fromWriteClass(masterWriteResponseTx, masterWritePacketStruct);
        `uvm_info(get_type_name(),$sformatf("MASTER_WRITE_RESPONSE_THREAD::Checking write response struct packet = %p",
                                               masterWritePacketStruct),UVM_MEDIUM); 
        axi4LiteMasterWriteDriverBFM.writeResponseChannelTask(masterWriteConfigStruct, masterWritePacketStruct);
        Axi4LiteMasterWriteSeqItemConverter::toWriteClass(masterWritePacketStruct,masterWriteResponseTx);
        `uvm_info(get_type_name(),$sformatf("MASTER_WRITE_RESPONSE_THREAD::Received write response packet From driverBFM = %p",
                                               masterWritePacketStruct),UVM_MEDIUM); 
        writeResponseKey.put(1);

        if(axi4LiteMasterWriteAgentConfig.enableOutstandingTransaction == 1) begin
          outstandingTxCounter--;
          remainOutstandingTxCounter--;
          `uvm_info(get_type_name(),$sformatf("MASTER_WRITE_TASK:: Remaining number of Outstanding Transaction = %0d",remainOutstandingTxCounter),UVM_MEDIUM);
        end
      end

    join_any

    writeAddressProcess.await();
    writeDataProcess.await();

    if(axi4LiteMasterWriteAgentConfig.enableOutstandingTransaction == 0) begin
      writeResponseProcess.await();
    end
    else begin
      `uvm_info(get_type_name(),$sformatf("MASTER_WRITE_TASK:: Total number of Outstanding Transaction = %0d",axi4LiteMasterWriteAgentConfig.noOfOutstandingTx),UVM_MEDIUM);

      outstandingTxCounter++;
      if(outstandingTxCounter > axi4LiteMasterWriteAgentConfig.maxLimitOfOutstandingTx) begin
        `uvm_warning(get_type_name(),$sformatf("MASTER_WRITE:: outstanding transaction counter reached maxLimitOfOutstandingTx"));
      end
    end

    axi4LiteMasterWriteSeqItemPort.item_done();
  end
endtask : writeTransferTask

`endif

