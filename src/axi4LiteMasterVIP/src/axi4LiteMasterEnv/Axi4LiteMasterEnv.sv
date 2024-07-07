`ifndef AXI4LITEMASTERENV_INCLUDED_
`define AXI4LITEMASTERENV_INCLUDED_

class Axi4LiteMasterEnv extends uvm_env;
  `uvm_component_utils(Axi4LiteMasterEnv)
  
  Axi4LiteMasterEnvConfig axi4LiteMasterEnvConfig;

  Axi4LiteWriteMasterEnv axi4LiteWriteMasterEnv;
  Axi4LiteReadMasterEnv axi4LiteReadMasterEnv;

  Axi4LiteMasterVirtualSequencer axi4LiteMasterVirtualSequencer;

  Axi4LiteWriteMasterEnvConfig axi4LiteWriteMasterEnvConfig;
  Axi4LiteReadMasterEnvConfig axi4LiteReadMasterEnvConfig;

  uvm_analysis_port#(Axi4LiteMasterWriteTransaction) axi4LiteMasterEnvWriteAddressAnalysisPort;
  uvm_analysis_port#(Axi4LiteMasterWriteTransaction) axi4LiteMasterEnvWriteDataAnalysisPort;
  uvm_analysis_port#(Axi4LiteMasterWriteTransaction) axi4LiteMasterEnvWriteResponseAnalysisPort;
  uvm_analysis_port#(Axi4LiteMasterReadTransaction) axi4LiteMasterEnvReadAddressAnalysisPort;
  uvm_analysis_port#(Axi4LiteMasterReadTransaction) axi4LiteMasterEnvReadDataAnalysisPort;

  extern function new(string name = "Axi4LiteMasterEnv", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : Axi4LiteMasterEnv

function Axi4LiteMasterEnv::new(string name = "Axi4LiteMasterEnv",uvm_component parent = null);
  super.new(name, parent);
  axi4LiteMasterEnvWriteAddressAnalysisPort  = new("axi4LiteMasterEnvWriteAddressAnalysisPort",this);
  axi4LiteMasterEnvWriteDataAnalysisPort     = new("axi4LiteMasterEnvWriteDataAnalysisPort",this);
  axi4LiteMasterEnvWriteResponseAnalysisPort = new("axi4LiteMasterEnvWriteResponseAnalysisPort",this);
  axi4LiteMasterEnvReadAddressAnalysisPort  = new("axi4LiteMasterEnvReadAddressAnalysisPort",this);
  axi4LiteMasterEnvReadDataAnalysisPort     = new("axi4LiteMasterEnvReadDataAnalysisPort",this);
endfunction : new

function void Axi4LiteMasterEnv::build_phase(uvm_phase phase);
  super.build_phase(phase);
 axi4LiteMasterEnvConfig = Axi4LiteMasterEnvConfig::type_id::create("axi4LiteMasterEnvConfig"); 
  
  if(!uvm_config_db #(Axi4LiteMasterEnvConfig)::get(this,"","Axi4LiteMasterEnvConfig",axi4LiteMasterEnvConfig)) begin
    `uvm_fatal("FATAL_MASTER_ENV_AGENT_CONFIG", $sformatf("Couldn't get the master_env_agent_config from config_db"))
  end

  axi4LiteWriteMasterEnvConfig = Axi4LiteWriteMasterEnvConfig::type_id::create("axi4LiteWriteMasterEnvConfig");
  if(!uvm_config_db #(Axi4LiteWriteMasterEnvConfig)::get(this,"","Axi4LiteWriteMasterEnvConfig",axi4LiteWriteMasterEnvConfig))
    `uvm_fatal("FATAL_WRITE_MASTER_ENV_CONFIG","Couldn't get the Axi4LiteWriteMasterEnvConfig from config_db")

  axi4LiteReadMasterEnvConfig = Axi4LiteReadMasterEnvConfig::type_id::create("axi4LiteReadMasterEnvConfig");
  if(!uvm_config_db#(Axi4LiteReadMasterEnvConfig)::get(this,"","Axi4LiteReadMasterEnvConfig",axi4LiteReadMasterEnvConfig))
    `uvm_fatal("FATAL_READ_MASTER_ENV_CONFIG","Couldn't get the Axi4LiteReadMasterEnvConfig from config_db")

  if(axi4LiteMasterEnvConfig.hasMasterVirtualSequencer) begin
    axi4LiteMasterVirtualSequencer = Axi4LiteMasterVirtualSequencer::type_id::create("axi4LiteVirtualMasterSequencer",this);
  end

  axi4LiteWriteMasterEnv = Axi4LiteWriteMasterEnv::type_id::create("axi4LiteWriteMasterEnv",this);
  axi4LiteReadMasterEnv = Axi4LiteReadMasterEnv::type_id::create("axi4LiteReadMasterEnv",this);

  axi4LiteWriteMasterEnv.axi4LiteWriteMasterEnvConfig = axi4LiteWriteMasterEnvConfig;
  axi4LiteReadMasterEnv.axi4LiteReadMasterEnvConfig = axi4LiteReadMasterEnvConfig;

endfunction : build_phase


function void Axi4LiteMasterEnv::connect_phase(uvm_phase phase);
  super.connect_phase(phase);

  if(axi4LiteMasterEnvConfig.hasMasterVirtualSequencer) begin
    foreach(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[i]) begin
      axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer = axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[i].axi4LiteMasterWriteSequencer;
    end
    foreach(axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[i]) begin
      axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer = axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[i].axi4LiteMasterReadSequencer;
    end
  end

  foreach(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[i]) begin
    axi4LiteWriteMasterEnv.axi4LiteMasterWriteEnvAddressAnalysisPort.connect(axi4LiteMasterEnvWriteAddressAnalysisPort);
    axi4LiteWriteMasterEnv.axi4LiteMasterWriteEnvDataAnalysisPort.connect(axi4LiteMasterEnvWriteDataAnalysisPort);
    axi4LiteWriteMasterEnv.axi4LiteMasterWriteEnvResponseAnalysisPort.connect(axi4LiteMasterEnvWriteResponseAnalysisPort);
  end

  foreach(axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[i]) begin
    axi4LiteReadMasterEnv.axi4LiteMasterReadEnvAddressAnalysisPort.connect(axi4LiteMasterEnvReadAddressAnalysisPort);
    axi4LiteReadMasterEnv.axi4LiteMasterReadEnvDataAnalysisPort.connect(axi4LiteMasterEnvReadDataAnalysisPort);
  end

endfunction : connect_phase

`endif

