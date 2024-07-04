`ifndef AXI4LITESLAVEWRITEDRIVERPROXY_INCLUDED_
`define AXI4LITESLAVEWRITEDRIVERPROXY_INCLUDED_

class Axi4LiteSlaveWriteDriverProxy extends uvm_driver#(Axi4LiteSlaveWriteTransaction);
  `uvm_component_utils(Axi4LiteSlaveWriteDriverProxy)

  uvm_seq_item_pull_port #(REQ, RSP) axi4LiteSlaveWriteSeqItemPort;
  uvm_analysis_port #(RSP) axi4LiteSlaveWriteRspPort;

  REQ reqWrite;
  RSP rspWrite;

  Axi4LiteSlaveWriteAgentConfig axi4LiteSlaveWriteAgentConfig;
  Axi4LiteSlaveWriteSeqItemConverter axi4LiteSlaveWriteSeqItemConverter;

  virtual Axi4LiteSlaveWriteDriverBFM axi4LiteSlaveWriteDriverBFM;

  extern function new(string name = "Axi4LiteSlaveWriteDriverProxy", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual task writeTransferTask();

 endclass : Axi4LiteSlaveWriteDriverProxy

function Axi4LiteSlaveWriteDriverProxy::new(string name = "Axi4LiteSlaveWriteDriverProxy",
                                      uvm_component parent = null);
  super.new(name, parent);
  axi4LiteSlaveWriteSeqItemPort        = new("axi4LiteSlaveWriteSeqItemPort", this);
  axi4LiteSlaveWriteRspPort            = new("axi4LiteSlaveWriteRspPort", this);
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
 axi4LiteSlaveWriteDriverBFM.waitForAresetn();
 writeTransferTask();
endtask : run_phase

task Axi4LiteSlaveWriteDriverProxy::writeTransferTask();
 forever begin
    Axi4LiteSlaveWriteTransaction slaveWriteTx;
    axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct;
    axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct;

    axi4LiteSlaveWriteSeqItemPort.get_next_item(reqWrite);
   `uvm_info(get_type_name(), $sformatf("SLAVE_WRITE_TASK::Before Sending_Req_Write_Packet = \n%s", reqWrite.sprint()),UVM_HIGH);

 
    Axi4LiteSlaveWriteConfigConverter::fromClass(axi4LiteSlaveWriteAgentConfig, slaveWriteConfigStruct);

    fork 
     begin : SLAVE_WRITE_ADDRESS_CHANNEL
        Axi4LiteSlaveWriteTransaction slaveWriteAddressTx;
        axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct;

       `uvm_info(get_type_name(),$sformatf("SLAVE_WRITE_ADDRESS_CHANNEL_TASK::Before WriteAddress struct packet = %p",                                                         slaveWritePacketStruct),UVM_MEDIUM);
        Axi4LiteSlaveWriteSeqItemConverter::fromWriteClass(reqWrite, slaveWritePacketStruct);
        axi4LiteSlaveWriteDriverBFM.writeAddressChannelTask(slaveWriteConfigStruct, slaveWritePacketStruct);
        Axi4LiteSlaveWriteSeqItemConverter::toWriteClass(slaveWritePacketStruct,slaveWriteAddressTx);
       `uvm_info(get_type_name(),$sformatf("SLAVE_WRITE_ADDRESS_CHANNEL_TASK:: Received WriteAddress struct packet form DriverBFM = %p",slaveWritePacketStruct),UVM_MEDIUM);
     end

     begin : SLAVE_WRITE_DATA_CHANNEL
       Axi4LiteSlaveWriteTransaction slaveWriteDataTx;
       axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct;
      
       `uvm_info(get_type_name(),$sformatf("SLAVE_WRITE_DATA_CHANNEL_TASK::Before WriteData struct packet = %p",
                                            slaveWritePacketStruct),UVM_MEDIUM);
        Axi4LiteSlaveWriteSeqItemConverter::fromWriteClass(reqWrite, slaveWritePacketStruct);
        axi4LiteSlaveWriteDriverBFM.writeDataChannelTask(slaveWriteConfigStruct, slaveWritePacketStruct);
        Axi4LiteSlaveWriteSeqItemConverter::toWriteClass(slaveWritePacketStruct,slaveWriteDataTx);
       `uvm_info(get_type_name(),$sformatf("SLAVE_WRITE_DATA_CHANNEL_TASK::Received WriteData packet from driverBFM = %p",
                                            slaveWritePacketStruct),UVM_MEDIUM);
     end

     begin : SLAVE_WRITE_RESPONSE_CHANNEL
       Axi4LiteSlaveWriteTransaction slaveWriteResponseTx;
       axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct;
       `uvm_info(get_type_name(),$sformatf("SLAVE_WRITE_RESPONSE_CHANNEL_TASK::Before writeResponse struct packet = %p",
                                            slaveWritePacketStruct),UVM_MEDIUM);
       Axi4LiteSlaveWriteSeqItemConverter::fromWriteClass(reqWrite, slaveWritePacketStruct);
       axi4LiteSlaveWriteDriverBFM.writeResponseChannelTask(slaveWriteConfigStruct, slaveWritePacketStruct);
       Axi4LiteSlaveWriteSeqItemConverter::toWriteClass(slaveWritePacketStruct,slaveWriteResponseTx);
       `uvm_info(get_type_name(),$sformatf("SLAVE_WRITE_RESPONSE_CHANNEL_TASK::Received writeResponse packet from driverBFM = %p",
                                            slaveWritePacketStruct),UVM_MEDIUM);
     end
   join

   axi4LiteSlaveWriteSeqItemPort.item_done();
 end
endtask : writeTransferTask

`endif
                             
