`ifndef AXI4LITESLAVEWRITEMONITORPROXY_INCLUDED_
`define AXI4LITESLAVEWRITEMONITORPROXY_INCLUDED_

class Axi4LiteSlaveWriteMonitorProxy extends uvm_component;
  `uvm_component_utils(Axi4LiteSlaveWriteMonitorProxy)

  Axi4LiteSlaveWriteAgentConfig axi4LiteSlaveWriteAgentConfig;
  
  Axi4LiteSlaveWriteTransaction reqWrite;
 
  virtual Axi4LiteSlaveWriteMonitorBFM axi4LiteSlaveWriteMonitorBFM;


  uvm_analysis_port#(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveWriteAddressAnalysisPort;
  uvm_analysis_port#(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveWriteDataAnalysisPort;
  uvm_analysis_port#(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveWriteResponseAnalysisPort;

  uvm_tlm_analysis_fifo #(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveWriteAddressFIFO;
  uvm_tlm_analysis_fifo #(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveWriteDataFIFO;
  
  extern function new(string name = "Axi4LiteSlaveWriteMonitorProxy", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual task writeAddressSampleTask();
  extern virtual task writeDataSampleTask();
  extern virtual task writeResponseSampleTask();

endclass : Axi4LiteSlaveWriteMonitorProxy

function Axi4LiteSlaveWriteMonitorProxy::new(string name = "Axi4LiteSlaveWriteMonitorProxy",
                                 uvm_component parent = null);
  super.new(name, parent);
  axi4LiteSlaveWriteAddressAnalysisPort  = new("axi4LiteSlaveWriteAddressAnalysisPort",this);
  axi4LiteSlaveWriteDataAnalysisPort     = new("axi4LiteSlaveWriteDataAnalysisPort",this);
  axi4LiteSlaveWriteResponseAnalysisPort = new("axi4LiteSlaveWriteResponseAnalysisPort",this);
  axi4LiteSlaveWriteAddressFIFO          = new("axi4LiteSlaveWriteAddressFIFO",this);
  axi4LiteSlaveWriteDataFIFO             = new("axi4LiteSlaveWriteDataFIFO",this);
endfunction : new

function void Axi4LiteSlaveWriteMonitorProxy::build_phase(uvm_phase phase);
  super.build_phase(phase);
   if(!uvm_config_db#(virtual Axi4LiteSlaveWriteMonitorBFM)::get(this,"","Axi4LiteSlaveWriteMonitorBFM",axi4LiteSlaveWriteMonitorBFM)) begin
    `uvm_fatal("FATAL_MDP_CANNOT_GET_Axi4LiteSlaveWriteMonitorBFM","cannot get() axi4LiteSlaveWriteMonitorBFM");
  end 
endfunction : build_phase

function void Axi4LiteSlaveWriteMonitorProxy::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

function void Axi4LiteSlaveWriteMonitorProxy::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  axi4LiteSlaveWriteMonitorBFM.axi4LiteSlaveWriteMonitorProxy = this;
endfunction : end_of_elaboration_phase


task Axi4LiteSlaveWriteMonitorProxy::run_phase(uvm_phase phase);
  axi4LiteSlaveWriteMonitorBFM.waitForAresetn();
 fork
   writeAddressSampleTask(); 
   writeDataSampleTask(); 
   writeResponseSampleTask();
 join
  `uvm_info("ID","Mahdeva", UVM_HIGH);
endtask : run_phase 

task Axi4LiteSlaveWriteMonitorProxy::writeAddressSampleTask();
  forever begin
   Axi4LiteSlaveWriteTransaction slaveWriteAddressTx;
   axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct;
   axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct;

   Axi4LiteSlaveWriteConfigConverter::fromClass(axi4LiteSlaveWriteAgentConfig, slaveWriteConfigStruct);
   `uvm_info(get_type_name(), $sformatf("Inside Slave_Write_Monitor writeAddressTask Converted cfg struct\n%p",slaveWritePacketStruct), UVM_HIGH)
   axi4LiteSlaveWriteMonitorBFM.writeAddressChannelSampleTask(slaveWriteConfigStruct, slaveWritePacketStruct);
  `uvm_info(get_type_name(), $sformatf("Slave_Write_Monitor writeAddressTask Converted packet from BFM  struct\n%p",slaveWritePacketStruct), UVM_HIGH)

   Axi4LiteSlaveWriteSeqItemConverter::toWriteClass(slaveWritePacketStruct,reqWrite);
   
   $cast(slaveWriteAddressTx,reqWrite.clone());

  `uvm_info(get_type_name(),$sformatf("Packet Received OutsideWriteAddressSampleTask: from Master_Read_Monitor_BFM clone packet is\n %s",slaveWriteAddressTx.sprint()),UVM_HIGH)
    axi4LiteSlaveWriteAddressAnalysisPort.write(slaveWriteAddressTx);
  end
endtask

task Axi4LiteSlaveWriteMonitorProxy::writeDataSampleTask();
  forever begin
   Axi4LiteSlaveWriteTransaction slaveWriteDataTx;
   axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct;
   axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct;

   Axi4LiteSlaveWriteConfigConverter::fromClass(axi4LiteSlaveWriteAgentConfig, slaveWriteConfigStruct);
   `uvm_info(get_type_name(), $sformatf("Inside Slave_Write_Monitor writeDataTask Converted cfg struct\n%p",slaveWritePacketStruct), UVM_HIGH)
   axi4LiteSlaveWriteMonitorBFM.writeDataChannelSampleTask(slaveWriteConfigStruct, slaveWritePacketStruct);
  `uvm_info(get_type_name(), $sformatf("Slave_Write_Monitor writeDataTask Converted packet from BFM  struct\n%p",slaveWritePacketStruct), UVM_HIGH)
   Axi4LiteSlaveWriteSeqItemConverter::toWriteClass(slaveWritePacketStruct,reqWrite);
    // Clone and publish the cloned item to the subscribers
   $cast(slaveWriteDataTx,reqWrite.clone());

  `uvm_info(get_type_name(),$sformatf(" Packet Received OutsideWriteDataSampleTask: from Slave_Read_Monitor_BFM clone packet is\n %s",slaveWriteDataTx.sprint()),UVM_HIGH)
    axi4LiteSlaveWriteDataAnalysisPort.write(slaveWriteDataTx);
  end
endtask

task Axi4LiteSlaveWriteMonitorProxy::writeResponseSampleTask();
  forever begin
   Axi4LiteSlaveWriteTransaction slaveWriteResponseTx;
   axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct;
   axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct;

   Axi4LiteSlaveWriteConfigConverter::fromClass(axi4LiteSlaveWriteAgentConfig, slaveWriteConfigStruct);
   `uvm_info(get_type_name(), $sformatf("Inside Slave_Write_Monitor writeResponseTask Converted cfg struct\n%p",slaveWritePacketStruct), UVM_HIGH)
   axi4LiteSlaveWriteMonitorBFM.writeResponseChannelSampleTask(slaveWriteConfigStruct, slaveWritePacketStruct);
  `uvm_info(get_type_name(), $sformatf("Slave_Write_Monitor writeResponseTask Converted packet from BFM  struct\n%p",slaveWritePacketStruct), UVM_HIGH)
   Axi4LiteSlaveWriteSeqItemConverter::toWriteClass(slaveWritePacketStruct,reqWrite);
  
   $cast(slaveWriteResponseTx,reqWrite.clone());

  `uvm_info(get_type_name(),$sformatf(" Packet Received OutsideWriteResponseSampleTask: from Slave_Read_Monitor_BFM clone packet is\n %s",slaveWriteResponseTx.sprint()),UVM_HIGH)
    axi4LiteSlaveWriteResponseAnalysisPort.write(slaveWriteResponseTx);
  end
endtask


`endif
