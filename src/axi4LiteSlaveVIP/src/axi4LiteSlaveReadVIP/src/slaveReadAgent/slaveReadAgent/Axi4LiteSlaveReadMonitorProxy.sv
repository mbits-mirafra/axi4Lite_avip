`ifndef AXI4LITESLAVEREADMONITORPROXY_INCLUDED_
`define AXI4LITESLAVEREADMONITORPROXY_INCLUDED_

class Axi4LiteSlaveReadMonitorProxy extends uvm_monitor;
  `uvm_component_utils(Axi4LiteSlaveReadMonitorProxy)

  Axi4LiteSlaveReadAgentConfig axi4LiteSlaveReadAgentConfig;

  virtual Axi4LiteSlaveReadMonitorBFM axi4LiteSlaveReadMonitorBFM;

  Axi4LiteSlaveReadTransaction reqRead;

   uvm_analysis_port#(Axi4LiteSlaveReadTransaction) axi4LiteSlaveReadAddressAnalysisPort;
   uvm_analysis_port#(Axi4LiteSlaveReadTransaction) axi4LiteSlaveReadDataAnalysisPort;
 
   uvm_tlm_analysis_fifo #(Axi4LiteSlaveReadTransaction) axi4LiteSlaveReadAddressFIFO;
   uvm_tlm_analysis_fifo #(Axi4LiteSlaveReadTransaction) axi4LiteSlaveReadDataFIFO;
  
  extern function new(string name = "Axi4LiteSlaveReadMonitorProxy", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual task ReadAddressSampleTask();
  extern virtual task ReadDataSampleTask();

endclass : Axi4LiteSlaveReadMonitorProxy


function Axi4LiteSlaveReadMonitorProxy::new(string name = "Axi4LiteSlaveReadMonitorProxy",
                                 uvm_component parent = null);
  super.new(name, parent);
  axi4LiteSlaveReadAddressAnalysisPort  = new("axi4LiteSlaveReadAddressAnalysisPort",this);
  axi4LiteSlaveReadDataAnalysisPort     = new("axi4LiteSlaveReadDataAnalysisPort",this);
  axi4LiteSlaveReadAddressFIFO          = new("axi4LiteSlaveReadAddressFIFO",this);
  axi4LiteSlaveReadDataFIFO             = new("axi4LiteSlaveReadDataFIFO",this);
endfunction : new

function void Axi4LiteSlaveReadMonitorProxy::build_phase(uvm_phase phase);
  super.build_phase(phase);
   if(!uvm_config_db#(virtual Axi4LiteSlaveReadMonitorBFM)::get(this,"","Axi4LiteSlaveReadMonitorBFM",axi4LiteSlaveReadMonitorBFM)) begin
     `uvm_fatal("FATAL_SMP_MON_BFM",$sformatf("Couldn't get S_MON_BFM in Axi4LiteSlaveReadMonitorProxy"));  
  end 
endfunction : build_phase

function void Axi4LiteSlaveReadMonitorProxy::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  axi4LiteSlaveReadMonitorBFM.axi4LiteSlaveReadMonitorProxy = this;
endfunction : end_of_elaboration_phase

task Axi4LiteSlaveReadMonitorProxy::run_phase(uvm_phase phase);
  axi4LiteSlaveReadMonitorBFM.waitForAresetn();
  fork
    ReadAddressSampleTask(); 
    ReadDataSampleTask(); 
  join
endtask : run_phase 

task Axi4LiteSlaveReadMonitorProxy::ReadAddressSampleTask();
  forever begin
   Axi4LiteSlaveReadTransaction slaveReadAddressTx;
   axi4LiteReadSlaveTransferCfgStruct slaveReadConfigStruct;
   axi4LiteReadSlaveTransferPacketStruct slaveReadPacketStruct;

   Axi4LiteSlaveReadConfigConverter::fromClass(axi4LiteSlaveReadAgentConfig, slaveReadConfigStruct);
  
   `uvm_info(get_type_name(), $sformatf("Inside Slave_Read_Monitor Converted cfg struct\n%p",slaveReadConfigStruct), UVM_HIGH)
   axi4LiteSlaveReadMonitorBFM.readAddressChannelSampleTask(slaveReadConfigStruct, slaveReadPacketStruct);
   `uvm_info(get_type_name(), $sformatf("Slave_Read_Monitor Converted packet from BFM  struct\n%p",slaveReadPacketStruct), UVM_HIGH)
 
   Axi4LiteSlaveReadSeqItemConverter::toReadClass(slaveReadPacketStruct,reqRead);

   axi4LiteSlaveReadAddressFIFO.write(reqRead);

   $cast(slaveReadAddressTx,reqRead.clone());

    `uvm_info(get_type_name(),$sformatf("Packet received from slave read monitor BFM clone packet is \n %s",slaveReadAddressTx.sprint()),UVM_HIGH)
    axi4LiteSlaveReadAddressAnalysisPort.write(slaveReadAddressTx);
  end
endtask

task Axi4LiteSlaveReadMonitorProxy::ReadDataSampleTask();
  forever begin
   Axi4LiteSlaveReadTransaction slaveReadTx;
   Axi4LiteSlaveReadTransaction slaveReadAddressTx;
   axi4LiteReadSlaveTransferCfgStruct slaveReadConfigStruct;
   axi4LiteReadSlaveTransferPacketStruct slaveReadPacketStruct;

   Axi4LiteSlaveReadConfigConverter::fromClass(axi4LiteSlaveReadAgentConfig, slaveReadConfigStruct);
   `uvm_info(get_type_name(), $sformatf("InsideReadDataTask: Slave_Read_Monitor Converted cfg struct\n%p",slaveReadConfigStruct), UVM_HIGH)
   axi4LiteSlaveReadMonitorBFM.readDataChannelSampleTask(slaveReadConfigStruct, slaveReadPacketStruct);
 `uvm_info(get_type_name(), $sformatf("Slave_Read_Monitor Converted  packet from BFM \n%p",slaveReadPacketStruct), UVM_HIGH)
   Axi4LiteSlaveReadSeqItemConverter::toReadClass(slaveReadPacketStruct,reqRead);
  
   axi4LiteSlaveReadAddressFIFO.get(slaveReadAddressTx);
   
   Axi4LiteSlaveReadSeqItemConverter::toReadAddrRespClass(slaveReadAddressTx,slaveReadPacketStruct,reqRead);
   
   $cast(slaveReadTx,reqRead.clone());

    `uvm_info(get_type_name(),$sformatf("Packet received from slave read monitor BFM clone packet is \n %s",slaveReadTx.sprint()),UVM_HIGH)
    axi4LiteSlaveReadDataAnalysisPort.write(slaveReadTx);
  end
endtask : ReadDataSampleTask


`endif
