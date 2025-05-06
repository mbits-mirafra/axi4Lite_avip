`ifndef MASTERRTLAGENT_INCLUDED_
`define MASTERRTLAGENT_INCLUDED_

class MasterRTLAgent extends uvm_agent;
  `uvm_component_utils(MasterRTLAgent)

  MasterRTLAgentConfig masterRTLAgentConfig;

  MasterRTLSequencer masterRTLSequencer;
  
  MasterRTLDriver masterRTLDriver;
  MasterRTLMonitor masterRTLMonitor;
  
  uvm_analysis_port#(MasterRTLTransaction) axi4LiteMasterWriteAgentAddressAnalysisPort;
  uvm_analysis_port#(MasterRTLTransaction) axi4LiteMasterWriteAgentDataAnalysisPort;
  uvm_analysis_port#(MasterRTLTransaction) axi4LiteMasterWriteAgentResponseAnalysisPort;

  extern function new(string name = "MasterRTLAgent", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : MasterRTLAgent

function MasterRTLAgent::new(string name = "MasterRTLAgent", uvm_component parent = null);
  super.new(name, parent);
  axi4LiteMasterWriteAgentAddressAnalysisPort  = new("axi4LiteMasterWriteAgentAddressAnalysisPort",this);
  axi4LiteMasterWriteAgentDataAnalysisPort     = new("axi4LiteMasterWriteAgentDataAnalysisPort",this);
  axi4LiteMasterWriteAgentResponseAnalysisPort = new("axi4LiteMasterWriteAgentResponseAnalysisPort",this);
endfunction : new

function void MasterRTLAgent::build_phase(uvm_phase phase);
  super.build_phase(phase);
  
  if(masterRTLAgentConfig.isActive == UVM_ACTIVE) begin
    masterRTLDriver=MasterRTLDriver::type_id::create("masterRTLDriver",this);
    masterRTLSequencer=MasterRTLSequencer::type_id::create("masterRTLSequencer",this);
  end

  masterRTLMonitor=MasterRTLMonitor::type_id::create("masterRTLMonitor",this);
  
   uvm_config_db#(MasterRTLAgentConfig)::set(uvm_root::get(), "*", "MasterRTLAgentConfig",masterRTLAgentConfig);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_WRITE_AGENT_CONFIG\n%s",
                 masterRTLAgentConfig.sprint()),UVM_LOW);
endfunction : build_phase

function void MasterRTLAgent::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  if(masterRTLAgentConfig.isActive == UVM_ACTIVE) begin
    masterRTLDriver.masterRTLAgentConfig = masterRTLAgentConfig;
    masterRTLSequencer.masterRTLAgentConfig = masterRTLAgentConfig;
  
    //Connecting the ports
    masterRTLDriver.masterSeqItemPort.connect(masterRTLSequencer.seq_item_export);
  end

  masterRTLMonitor.masterRTLAgentConfig = masterRTLAgentConfig;

endfunction : connect_phase

`endif

