`ifndef AXI4LITEMASTERREADMONITORPROXY_INCLUDED_
`define AXI4LITEMASTERREADMONITORPROXY_INCLUDED_

class Axi4LiteMasterReadMonitorProxy extends uvm_component;
  `uvm_component_utils(Axi4LiteMasterReadMonitorProxy)

  Axi4LiteMasterReadAgentConfig axi4LiteMasterReadAgentConfig;

  Axi4LiteMasterReadTransaction reqRead;

  virtual Axi4LiteMasterReadMonitorBFM axi4LiteMasterReadMonitorBFM;
  
  // Declaring analysis port for the monitor port
  uvm_analysis_port#(Axi4LiteMasterReadTransaction) axi4LiteMasterReadAddressAnalysisPort;
  uvm_analysis_port#(Axi4LiteMasterReadTransaction) axi4LiteMasterReadDataAnalysisPort;

  //Variable: axi4LiteMasterReadAddressFIFO
  //Declaring handle for uvm_tlm_analysis_fifo for read task
  uvm_tlm_analysis_fifo #(Axi4LiteMasterReadTransaction) axi4LiteMasterReadAddressFIFO;
  
  //Variable: axi4LiteMasterReadDataFIFO
  //Declaring handle for uvm_tlm_analysis_fifo for read task
  uvm_tlm_analysis_fifo #(Axi4LiteMasterReadTransaction) axi4LiteMasterReadDataFIFO;

  extern function new(string name = "Axi4LiteMasterReadMonitorProxy", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
  extern virtual task readAddressSampleTask();
  extern virtual task readDataSampleTask();

endclass : Axi4LiteMasterReadMonitorProxy


function Axi4LiteMasterReadMonitorProxy::new(string name = "Axi4LiteMasterReadMonitorProxy",
                                 uvm_component parent = null);
  super.new(name, parent);
  axi4LiteMasterReadAddressAnalysisPort  = new("axi4LiteMasterReadAddressAnalysisPort",this);
  axi4LiteMasterReadDataAnalysisPort     = new("axi4LiteMasterReadDataAnalysisPort",this);
  axi4LiteMasterReadAddressFIFO          = new("axi4LiteMasterReadAddressFIFO",this);
  axi4LiteMasterReadDataFIFO             = new("axi4LiteMasterReadDataFIFO",this);
endfunction : new

function void Axi4LiteMasterReadMonitorProxy::build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db #(virtual Axi4LiteMasterReadMonitorBFM)::get(this,"","Axi4LiteMasterReadMonitorBFM",axi4LiteMasterReadMonitorBFM)) begin
    `uvm_fatal("FATAL_MDP_CANNOT_GET_Axi4LiteMasterReadMonitorBFM","cannot get() axi4LiteMasterReadMonitorBFM");
  end 
endfunction : build_phase

function void Axi4LiteMasterReadMonitorProxy::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
endfunction : connect_phase

function void Axi4LiteMasterReadMonitorProxy::end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  axi4LiteMasterReadMonitorBFM.axi4LiteMasterReadMonitorProxy = this;
endfunction : end_of_elaboration_phase


task Axi4LiteMasterReadMonitorProxy::run_phase(uvm_phase phase);
  axi4LiteMasterReadMonitorBFM.waitForAresetn();
  fork
    readAddressSampleTask();
    readDataSampleTask();
  join
endtask : run_phase

task Axi4LiteMasterReadMonitorProxy::readAddressSampleTask();
  forever begin
   Axi4LiteMasterReadTransaction masterReadTx;
   axi4LiteReadMasterTransferCfgStruct masterReadConfigStruct;
   axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct;

   Axi4LiteMasterReadConfigConverter::fromClass(axi4LiteMasterReadAgentConfig, masterReadConfigStruct);

   `uvm_info(get_type_name(), $sformatf("Inside Master_Read_Monitor Converted cfg struct\n%p",masterReadConfigStruct), UVM_HIGH)
   axi4LiteMasterReadMonitorBFM.readAddressChannelSampleTask(masterReadConfigStruct, masterReadPacketStruct);
  `uvm_info(get_type_name(), $sformatf("Master_Read_Monitor Converted packet from BFM  struct\n%p",masterReadPacketStruct), UVM_HIGH)
   Axi4LiteMasterReadSeqItemConverter::toReadClass(masterReadPacketStruct,reqRead);

   axi4LiteMasterReadAddressFIFO.write(reqRead);

   $cast(masterReadTx,reqRead.clone());

    `uvm_info(get_type_name(),$sformatf("Packet Received OutsideReadDataSampleTask: from Master_Read_Monitor_BFM clone packet is \n %s",masterReadTx.sprint()),UVM_HIGH)
    axi4LiteMasterReadAddressAnalysisPort.write(masterReadTx);
  end
endtask : readAddressSampleTask

task Axi4LiteMasterReadMonitorProxy::readDataSampleTask();
  forever begin
   Axi4LiteMasterReadTransaction masterReadTx;
   Axi4LiteMasterReadTransaction masterReadAddressTx;
   axi4LiteReadMasterTransferCfgStruct masterReadConfigStruct;
   axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct;

   Axi4LiteMasterReadConfigConverter::fromClass(axi4LiteMasterReadAgentConfig, masterReadConfigStruct);

   `uvm_info(get_type_name(), $sformatf("InsideReadDataTask: Master_Read_Monitor Converted cfg struct\n%p",masterReadConfigStruct), UVM_HIGH)
   axi4LiteMasterReadMonitorBFM.readDataChannelSampleTask(masterReadConfigStruct, masterReadPacketStruct);
 `uvm_info(get_type_name(), $sformatf("Master_Read_Monitor Converted  packet from BFM \n%p",masterReadPacketStruct), UVM_HIGH)
   
   Axi4LiteMasterReadSeqItemConverter::toReadClass(masterReadPacketStruct,reqRead);

   axi4LiteMasterReadAddressFIFO.get(masterReadAddressTx);
   
   Axi4LiteMasterReadSeqItemConverter::toReadAddrRespClass(masterReadAddressTx,masterReadPacketStruct,reqRead);

   $cast(masterReadTx,reqRead.clone());
    `uvm_info(get_type_name(),$sformatf("Packet Received OutsideReadDataSampleTask: from Master_Read_Monitor_BFM clone packet is \n %s",masterReadTx.sprint()),UVM_HIGH)
     axi4LiteMasterReadDataAnalysisPort.write(masterReadTx);
  end
endtask : readDataSampleTask

`endif

