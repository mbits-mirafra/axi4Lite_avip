`ifndef MASTERVIPSLAVEIPENV_INCLUDED_
`define MASTERVIPSLAVEIPENV_INCLUDED_

class MasterVIPSlaveIPEnv extends uvm_env;
  `uvm_component_utils(MasterVIPSlaveIPEnv)
  
  MasterVIPSlaveIPEnvConfig masterVIPSlaveIPEnvConfig;

  Axi4LiteMasterEnv axi4LiteMasterEnv;
  Axi4LiteSlaveEnv axi4LiteSlaveEnv;

  MasterVIPSlaveIPVirtualSequencer masterVIPSlaveIPVirtualSequencer;

  Axi4LiteMasterEnvConfig axi4LiteMasterEnvConfig;
  Axi4LiteSlaveEnvConfig axi4LiteSlaveEnvConfig;

  MasterVIPSlaveIPScoreboard masterVIPSlaveIPScoreboard;

  extern function new(string name = "MasterVIPSlaveIPEnv", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : MasterVIPSlaveIPEnv

function MasterVIPSlaveIPEnv::new(string name = "MasterVIPSlaveIPEnv",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIPEnv::build_phase(uvm_phase phase);
  super.build_phase(phase);
  
  if(!uvm_config_db #(MasterVIPSlaveIPEnvConfig)::get(this,"","MasterVIPSlaveIPEnvConfig",masterVIPSlaveIPEnvConfig)) begin
    `uvm_fatal("FATAL_ENV_CONFIG", $sformatf("Couldn't get the MasterVIPSlaveIPEnvConfig from config_db"))
  end

  axi4LiteMasterEnvConfig = Axi4LiteMasterEnvConfig::type_id::create("axi4LiteMasterEnvConfig");
   if(!uvm_config_db #(Axi4LiteMasterEnvConfig)::get(this,"","Axi4LiteMasterEnvConfig",axi4LiteMasterEnvConfig)) 
   `uvm_fatal("FATAL_MASTER_ENV_CONFIG","Couldn't get the Axi4LiteMasterEnvConfig from config_db")

    axi4LiteSlaveEnvConfig = Axi4LiteSlaveEnvConfig::type_id::create("axi4LiteSlaveEnvConfig");
    if(!uvm_config_db#(Axi4LiteSlaveEnvConfig)::get(this,"","Axi4LiteSlaveEnvConfig",axi4LiteSlaveEnvConfig)) 
   `uvm_fatal("FATAL_SLAVE_ENV_CONFIG","Couldn't get the Axi4LiteSlaveEnvConfig from config_db")

    if(masterVIPSlaveIPEnvConfig.hasVirtualSequencer) begin
    masterVIPSlaveIPVirtualSequencer = MasterVIPSlaveIPVirtualSequencer::type_id::create("masterVIPSlaveIPVirtualSequencer",this);
  end

   axi4LiteMasterEnv = Axi4LiteMasterEnv::type_id::create("axi4LiteMasterEnv",this); 
   axi4LiteSlaveEnv = Axi4LiteSlaveEnv::type_id::create("axi4LiteSlaveEnv",this); 

   axi4LiteMasterEnv.axi4LiteMasterEnvConfig = axi4LiteMasterEnvConfig;
   axi4LiteSlaveEnv.axi4LiteSlaveEnvConfig = axi4LiteSlaveEnvConfig;

   if(masterVIPSlaveIPEnvConfig.hasScoreboard) begin
     masterVIPSlaveIPScoreboard = MasterVIPSlaveIPScoreboard::type_id::create("masterVIPSlaveIPScoreboard",this); 
   end
  
endfunction : build_phase

function void MasterVIPSlaveIPEnv::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  
  if(masterVIPSlaveIPEnvConfig.hasVirtualSequencer) begin
     masterVIPSlaveIPVirtualSequencer.axi4LiteMasterVirtualSequencer = axi4LiteMasterEnv.axi4LiteMasterVirtualSequencer;
  end

    axi4LiteMasterEnv.axi4LiteMasterEnvWriteAddressAnalysisPort.connect(masterVIPSlaveIPScoreboard.axi4LiteMasterWriteEnvAddressFIFO.analysis_export);
    axi4LiteMasterEnv.axi4LiteMasterEnvWriteDataAnalysisPort.connect(masterVIPSlaveIPScoreboard.axi4LiteMasterWriteEnvDataFIFO.analysis_export);
    axi4LiteMasterEnv.axi4LiteMasterEnvWriteResponseAnalysisPort.connect(masterVIPSlaveIPScoreboard.axi4LiteMasterWriteEnvResponseFIFO.analysis_export);
    axi4LiteMasterEnv.axi4LiteMasterEnvReadAddressAnalysisPort.connect(masterVIPSlaveIPScoreboard.axi4LiteMasterReadEnvAddressFIFO.analysis_export);
    axi4LiteMasterEnv.axi4LiteMasterEnvReadDataAnalysisPort.connect(masterVIPSlaveIPScoreboard.axi4LiteMasterReadEnvDataFIFO.analysis_export);

    axi4LiteSlaveEnv.axi4LiteSlaveEnvWriteAddressAnalysisPort.connect(masterVIPSlaveIPScoreboard.axi4LiteSlaveWriteEnvAddressFIFO.analysis_export);
    axi4LiteSlaveEnv.axi4LiteSlaveEnvWriteDataAnalysisPort.connect(masterVIPSlaveIPScoreboard.axi4LiteSlaveWriteEnvDataFIFO.analysis_export);
    axi4LiteSlaveEnv.axi4LiteSlaveEnvWriteResponseAnalysisPort.connect(masterVIPSlaveIPScoreboard.axi4LiteSlaveWriteEnvResponseFIFO.analysis_export);
    axi4LiteSlaveEnv.axi4LiteSlaveEnvReadAddressAnalysisPort.connect(masterVIPSlaveIPScoreboard.axi4LiteSlaveReadEnvAddressFIFO.analysis_export);
    axi4LiteSlaveEnv.axi4LiteSlaveEnvReadDataAnalysisPort.connect(masterVIPSlaveIPScoreboard.axi4LiteSlaveReadEnvDataFIFO.analysis_export);

endfunction : connect_phase

`endif

