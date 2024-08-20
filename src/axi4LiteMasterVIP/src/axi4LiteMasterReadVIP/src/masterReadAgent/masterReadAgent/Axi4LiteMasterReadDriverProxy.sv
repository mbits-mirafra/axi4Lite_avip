`ifndef AXI4LITEMASTERREADDRIVERPROXY_INCLUDED_
`define AXI4LITEMASTERREADDRIVERPROXY_INCLUDED_

class Axi4LiteMasterReadDriverProxy extends uvm_driver #(Axi4LiteMasterReadTransaction);
  `uvm_component_utils(Axi4LiteMasterReadDriverProxy)

  uvm_seq_item_pull_port #(REQ, RSP) axi4LiteMasterReadSeqItemPort;
  uvm_analysis_port #(RSP) axi4LiteMasterReadRspPort;
  uvm_tlm_analysis_fifo #(Axi4LiteMasterReadTransaction) axi4LiteMasterReadDataFIFO;

  REQ reqRead;
  RSP rspRead;

  semaphore readDataKey;
  semaphore readResponseKey;
  process readAddressProcess;
  process readResponseProcess;

  Axi4LiteMasterReadAgentConfig axi4LiteMasterReadAgentConfig;

  virtual Axi4LiteMasterReadDriverBFM axi4LiteMasterReadDriverBFM;

  extern function new(string name = "Axi4LiteMasterReadDriverProxy", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual task waitForAresetnTask();
  extern virtual task readTransferTask();

endclass : Axi4LiteMasterReadDriverProxy

function Axi4LiteMasterReadDriverProxy::new(string name = "Axi4LiteMasterReadDriverProxy",
                                             uvm_component parent = null);
  super.new(name, parent);
  axi4LiteMasterReadSeqItemPort  = new("axi4LiteMasterReadSeqItemPort", this);
  axi4LiteMasterReadRspPort      = new("axi4LiteMasterReadRspPort", this);
  axi4LiteMasterReadDataFIFO     = new("axi4LiteMasterReadDataFIFO", this);
  readDataKey                    = new(1);
  readResponseKey                = new(1);
endfunction : new

function void Axi4LiteMasterReadDriverProxy::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if (!uvm_config_db#(virtual Axi4LiteMasterReadDriverBFM)::get(
          this, "", "Axi4LiteMasterReadDriverBFM", axi4LiteMasterReadDriverBFM
      )) begin
    `uvm_fatal("FATAL_MDP_CANNOT_GET_Axi4LiteMasterReadDriverBFM",
               "cannot get() axi4LiteMasterReadDriverBFM");
  end
endfunction : build_phase

function void Axi4LiteMasterReadDriverProxy::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  axi4LiteMasterReadDriverBFM.axi4LiteMasterReadDriverProxy = this;
endfunction : end_of_elaboration_phase

task Axi4LiteMasterReadDriverProxy::run_phase(uvm_phase phase);
  waitForAresetnTask();
  readTransferTask();
endtask : run_phase

task Axi4LiteMasterReadDriverProxy::waitForAresetnTask();
  axi4LiteReadMasterTransferCfgStruct  masterReadConfigStruct;
  Axi4LiteMasterReadConfigConverter::fromClass(axi4LiteMasterReadAgentConfig, masterReadConfigStruct);
  axi4LiteMasterReadDriverBFM.waitForAresetn(masterReadConfigStruct);
endtask : waitForAresetnTask

task Axi4LiteMasterReadDriverProxy::readTransferTask();
  //readDataKey.get(1);
  forever begin
    Axi4LiteMasterReadTransaction  masterReadTx;
    axi4LiteReadMasterTransferCfgStruct  masterReadConfigStruct;
    axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct;

    axi4LiteMasterReadSeqItemPort.get_next_item(reqRead);
    `uvm_info(get_type_name(), $sformatf(
              "MASTER_READ_TASK::Before Sending_Req_Read_Packet = \n%s", reqRead.sprint()),
              UVM_HIGH);

    if(!axi4LiteMasterReadDataFIFO.is_full()) begin
      axi4LiteMasterReadDataFIFO.write(reqRead);
    end
    else begin
      `uvm_error(get_type_name(),$sformatf("MASTER_READ_TASK::Cannot write into FIFO as axi4LiteMasterReadDataFIFO IS FULL"));
    end

    Axi4LiteMasterReadConfigConverter::fromClass(axi4LiteMasterReadAgentConfig, masterReadConfigStruct);

    fork
      begin : MASTER_READ_ADDRESS_CHANNEL
        Axi4LiteMasterReadTransaction  masterReadAddressTx;
        axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct;

        readAddressProcess = process::self();

        Axi4LiteMasterReadSeqItemConverter::fromReadClass(reqRead, masterReadPacketStruct);
        `uvm_info(get_type_name(),$sformatf("MASTER_READ_ADDRESS_THREAD::Checking read address struct packet = %p",
                                               masterReadPacketStruct),UVM_MEDIUM); 
        axi4LiteMasterReadDriverBFM.readAddressChannelTask(masterReadConfigStruct, masterReadPacketStruct);
        Axi4LiteMasterReadSeqItemConverter::toReadClass(masterReadPacketStruct,masterReadAddressTx);
        `uvm_info(get_type_name(),$sformatf("MASTER_READ_ADDRESS_THREAD::Received read address packet From driverBFM = %p",
                                               masterReadPacketStruct),UVM_MEDIUM); 
        //readDataKey.put(1);
      end

      begin : MASTER_READ_DATA_CHANNEL
        Axi4LiteMasterReadTransaction  masterReadDataTx;
        axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct;

        readResponseProcess = process::self();
        readResponseKey.get(1);
        //readDataKey.get(1);

        if(!axi4LiteMasterReadDataFIFO.is_empty()) begin
          axi4LiteMasterReadDataFIFO.get(masterReadDataTx);
        end
        else begin
          `uvm_error(get_type_name(),$sformatf("MASTER_READ_DATA_THREAD::Cannot get into FIFO as READ_DATA_FIFO IS EMPTY"));
        end

        Axi4LiteMasterReadSeqItemConverter::fromReadClass(masterReadDataTx, masterReadPacketStruct);
        `uvm_info(get_type_name(),$sformatf("MASTER_READ_DATA_THREAD::Checking read data struct packet = %p",
                                               masterReadPacketStruct),UVM_MEDIUM); 
        axi4LiteMasterReadDriverBFM.readDataChannelTask(masterReadConfigStruct, masterReadPacketStruct);
        Axi4LiteMasterReadSeqItemConverter::toReadClass(masterReadPacketStruct,masterReadDataTx);
        `uvm_info(get_type_name(),$sformatf("MASTER_READ_DATA_THREAD::Received read data packet From driverBFM = %p",
                                               masterReadPacketStruct),UVM_MEDIUM); 
        readResponseKey.put(1);
      end

    join_any
    readAddressProcess.await();

    `uvm_info(get_type_name(), $sformatf("READ_TASK :: Out of fork_join_any : After await readAddress.status()=%s",
                                            readAddressProcess.status()), UVM_NONE);

    axi4LiteMasterReadSeqItemPort.item_done();
  end
endtask : readTransferTask

`endif

