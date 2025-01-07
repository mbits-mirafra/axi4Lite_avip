`ifndef SLAVEVIPMASTERIPENV_INCLUDED_
`define SLAVEVIPMASTERIPENV_INCLUDED_

class SlaveVIPMasterIPEnv extends uvm_env;
  `uvm_component_utils(SlaveVIPMasterIPEnv)
  
  MasterRTLAgent masterRTLAgent;
  MasterRTLAgentConfig masterRTLAgentConfig;

  SlaveVIPMasterIPEnvConfig slaveVIPMasterIPEnvConfig;

  Axi4LiteMasterEnv axi4LiteMasterEnv;
  Axi4LiteSlaveEnv axi4LiteSlaveEnv;

  SlaveVIPMasterIPVirtualSequencer slaveVIPMasterIPVirtualSequencer;

  Axi4LiteMasterEnvConfig axi4LiteMasterEnvConfig;
  Axi4LiteSlaveEnvConfig axi4LiteSlaveEnvConfig;

  SlaveVIPMasterIPScoreboard slaveVIPMasterIPScoreboard;

  extern function new(string name = "SlaveVIPMasterIPEnv", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : SlaveVIPMasterIPEnv

function SlaveVIPMasterIPEnv::new(string name = "SlaveVIPMasterIPEnv",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void SlaveVIPMasterIPEnv::build_phase(uvm_phase phase);
  super.build_phase(phase);
  
  if(!uvm_config_db #(SlaveVIPMasterIPEnvConfig)::get(this,"","SlaveVIPMasterIPEnvConfig",slaveVIPMasterIPEnvConfig)) begin
    `uvm_fatal("FATAL_ENV_CONFIG", $sformatf("Couldn't get the SlaveVIPMasterIPEnvConfig from config_db"))
  end

  axi4LiteMasterEnvConfig = Axi4LiteMasterEnvConfig::type_id::create("axi4LiteMasterEnvConfig");
   if(!uvm_config_db #(Axi4LiteMasterEnvConfig)::get(this,"","Axi4LiteMasterEnvConfig",axi4LiteMasterEnvConfig)) 
   `uvm_fatal("FATAL_MASTER_ENV_CONFIG","Couldn't get the Axi4LiteMasterEnvConfig from config_db")

    axi4LiteSlaveEnvConfig = Axi4LiteSlaveEnvConfig::type_id::create("axi4LiteSlaveEnvConfig");
    if(!uvm_config_db#(Axi4LiteSlaveEnvConfig)::get(this,"","Axi4LiteSlaveEnvConfig",axi4LiteSlaveEnvConfig)) 
   `uvm_fatal("FATAL_SLAVE_ENV_CONFIG","Couldn't get the Axi4LiteSlaveEnvConfig from config_db")

    if(slaveVIPMasterIPEnvConfig.hasVirtualSequencer) begin
    slaveVIPMasterIPVirtualSequencer = SlaveVIPMasterIPVirtualSequencer::type_id::create("slaveVIPMasterIPVirtualSequencer",this);
  end

   masterRTLAgentConfig = MasterRTLAgentConfig::type_id::create("masterRTLAgentConfig",this); 

    if(!uvm_config_db #(MasterRTLAgentConfig)::get(this,"*",$sformatf("MasterRTLAgentConfig"),masterRTLAgentConfig)) begin
      `uvm_fatal("FATAL_MASTER_RTL_AGENT_CONFIG", $sformatf("Couldn't get the MasterRTLAgentConfig from config_db"))
    end

   masterRTLAgent = MasterRTLAgent::type_id::create("masterRTLAgent",this); 
   masterRTLAgent.masterRTLAgentConfig = masterRTLAgentConfig;

   axi4LiteMasterEnv = Axi4LiteMasterEnv::type_id::create("axi4LiteMasterEnv",this); 
   axi4LiteSlaveEnv = Axi4LiteSlaveEnv::type_id::create("axi4LiteSlaveEnv",this); 

   axi4LiteMasterEnv.axi4LiteMasterEnvConfig = axi4LiteMasterEnvConfig;
   axi4LiteSlaveEnv.axi4LiteSlaveEnvConfig = axi4LiteSlaveEnvConfig;

   if(slaveVIPMasterIPEnvConfig.hasScoreboard) begin
     slaveVIPMasterIPScoreboard = SlaveVIPMasterIPScoreboard::type_id::create("slaveVIPMasterIPScoreboard",this); 
   end
  
endfunction : build_phase

function void SlaveVIPMasterIPEnv::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  
  if(slaveVIPMasterIPEnvConfig.hasVirtualSequencer) begin
     slaveVIPMasterIPVirtualSequencer.axi4LiteSlaveVirtualSequencer = axi4LiteSlaveEnv.axi4LiteSlaveVirtualSequencer;
     slaveVIPMasterIPVirtualSequencer.masterRTLSequencer = masterRTLAgent.masterRTLSequencer;
  end

    axi4LiteMasterEnv.axi4LiteMasterEnvWriteAddressAnalysisPort.connect(slaveVIPMasterIPScoreboard.axi4LiteMasterWriteEnvAddressFIFO.analysis_export);
    axi4LiteMasterEnv.axi4LiteMasterEnvWriteDataAnalysisPort.connect(slaveVIPMasterIPScoreboard.axi4LiteMasterWriteEnvDataFIFO.analysis_export);
    axi4LiteMasterEnv.axi4LiteMasterEnvWriteResponseAnalysisPort.connect(slaveVIPMasterIPScoreboard.axi4LiteMasterWriteEnvResponseFIFO.analysis_export);
    axi4LiteMasterEnv.axi4LiteMasterEnvReadAddressAnalysisPort.connect(slaveVIPMasterIPScoreboard.axi4LiteMasterReadEnvAddressFIFO.analysis_export);
    axi4LiteMasterEnv.axi4LiteMasterEnvReadDataAnalysisPort.connect(slaveVIPMasterIPScoreboard.axi4LiteMasterReadEnvDataFIFO.analysis_export);

    axi4LiteSlaveEnv.axi4LiteSlaveEnvWriteAddressAnalysisPort.connect(slaveVIPMasterIPScoreboard.axi4LiteSlaveWriteEnvAddressFIFO.analysis_export);
    axi4LiteSlaveEnv.axi4LiteSlaveEnvWriteDataAnalysisPort.connect(slaveVIPMasterIPScoreboard.axi4LiteSlaveWriteEnvDataFIFO.analysis_export);
    axi4LiteSlaveEnv.axi4LiteSlaveEnvWriteResponseAnalysisPort.connect(slaveVIPMasterIPScoreboard.axi4LiteSlaveWriteEnvResponseFIFO.analysis_export);
    axi4LiteSlaveEnv.axi4LiteSlaveEnvReadAddressAnalysisPort.connect(slaveVIPMasterIPScoreboard.axi4LiteSlaveReadEnvAddressFIFO.analysis_export);
    axi4LiteSlaveEnv.axi4LiteSlaveEnvReadDataAnalysisPort.connect(slaveVIPMasterIPScoreboard.axi4LiteSlaveReadEnvDataFIFO.analysis_export);

endfunction : connect_phase

`endif

