`ifndef AXI4LITESLAVEENV_INCLUDED_
`define AXI4LITESLAVEENV_INCLUDED_

class Axi4LiteSlaveEnv extends uvm_env;
  `uvm_component_utils(Axi4LiteSlaveEnv)
  
  Axi4LiteSlaveEnvConfig axi4LiteSlaveEnvConfig;

  Axi4LiteWriteSlaveEnv axi4LiteWriteSlaveEnv;
  Axi4LiteReadSlaveEnv axi4LiteReadSlaveEnv;

  Axi4LiteSlaveVirtualSequencer axi4LiteSlaveVirtualSequencer;

  Axi4LiteWriteSlaveEnvConfig axi4LiteWriteSlaveEnvConfig;
  Axi4LiteReadSlaveEnvConfig axi4LiteReadSlaveEnvConfig;

  uvm_analysis_port#(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveEnvWriteAddressAnalysisPort;
  uvm_analysis_port#(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveEnvWriteDataAnalysisPort;
  uvm_analysis_port#(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveEnvWriteResponseAnalysisPort;
  uvm_analysis_port#(Axi4LiteSlaveReadTransaction) axi4LiteSlaveEnvReadAddressAnalysisPort;
  uvm_analysis_port#(Axi4LiteSlaveReadTransaction) axi4LiteSlaveEnvReadDataAnalysisPort;

  extern function new(string name = "Axi4LiteSlaveEnv", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : Axi4LiteSlaveEnv

function Axi4LiteSlaveEnv::new(string name = "Axi4LiteSlaveEnv",uvm_component parent = null);
  super.new(name, parent);
  axi4LiteSlaveEnvWriteAddressAnalysisPort  = new("axi4LiteSlaveEnvWriteAddressAnalysisPort",this);
  axi4LiteSlaveEnvWriteDataAnalysisPort     = new("axi4LiteSlaveEnvWriteDataAnalysisPort",this);
  axi4LiteSlaveEnvWriteResponseAnalysisPort = new("axi4LiteSlaveEnvWriteResponseAnalysisPort",this);
  axi4LiteSlaveEnvReadAddressAnalysisPort  = new("axi4LiteSlaveEnvReadAddressAnalysisPort",this);
  axi4LiteSlaveEnvReadDataAnalysisPort     = new("axi4LiteSlaveEnvReadDataAnalysisPort",this);
endfunction : new

function void Axi4LiteSlaveEnv::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteSlaveEnvConfig = Axi4LiteSlaveEnvConfig::type_id::create("axi4LiteSlaveEnvConfig"); 
  
  if(!uvm_config_db #(Axi4LiteSlaveEnvConfig)::get(this,"","Axi4LiteSlaveEnvConfig",axi4LiteSlaveEnvConfig)) begin
    `uvm_fatal("FATAL_SLAVE_ENV_AGENT_CONFIG", $sformatf("Couldn't get the slave_env_agent_config from config_db"))
  end

  axi4LiteWriteSlaveEnvConfig = Axi4LiteWriteSlaveEnvConfig::type_id::create("axi4LiteWriteSlaveEnvConfig");
  if(!uvm_config_db #(Axi4LiteWriteSlaveEnvConfig)::get(this,"","Axi4LiteWriteSlaveEnvConfig",axi4LiteWriteSlaveEnvConfig))
    `uvm_fatal("FATAL_WRITE_MASTER_ENV_CONFIG","Couldn't get the Axi4LiteWriteSlaveEnvConfig from config_db")

  axi4LiteReadSlaveEnvConfig = Axi4LiteReadSlaveEnvConfig::type_id::create("axi4LiteReadSlaveEnvConfig");
  if(!uvm_config_db#(Axi4LiteReadSlaveEnvConfig)::get(this,"","Axi4LiteReadSlaveEnvConfig",axi4LiteReadSlaveEnvConfig))
    `uvm_fatal("FATAL_READ_MASTER_ENV_CONFIG","Couldn't get the Axi4LiteReadSlaveEnvConfig from config_db")

  if(axi4LiteSlaveEnvConfig.hasSlaveVirtualSequencer) begin
    axi4LiteSlaveVirtualSequencer = Axi4LiteSlaveVirtualSequencer::type_id::create("axi4LiteVirtualSlaveSequencer",this);
  end

  axi4LiteWriteSlaveEnv = Axi4LiteWriteSlaveEnv::type_id::create("axi4LiteWriteSlaveEnv",this);
  axi4LiteReadSlaveEnv = Axi4LiteReadSlaveEnv::type_id::create("axi4LiteReadSlaveEnv",this);

  axi4LiteWriteSlaveEnv.axi4LiteWriteSlaveEnvConfig = axi4LiteWriteSlaveEnvConfig;
  axi4LiteReadSlaveEnv.axi4LiteReadSlaveEnvConfig = axi4LiteReadSlaveEnvConfig;
  
endfunction : build_phase


function void Axi4LiteSlaveEnv::connect_phase(uvm_phase phase);
  super.connect_phase(phase);

  if(axi4LiteSlaveEnvConfig.hasSlaveVirtualSequencer) begin
    foreach(axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[i]) begin
      axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer = axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[i].axi4LiteSlaveWriteSequencer;
    end
    foreach(axi4LiteReadSlaveEnv.axi4LiteSlaveReadAgent[i]) begin
     axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer = axi4LiteReadSlaveEnv.axi4LiteSlaveReadAgent[i].axi4LiteSlaveReadSequencer;
    end
  end

  foreach(axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[i]) begin
    axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteEnvAddressAnalysisPort.connect(axi4LiteSlaveEnvWriteAddressAnalysisPort);
    axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteEnvDataAnalysisPort.connect(axi4LiteSlaveEnvWriteDataAnalysisPort);
    axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteEnvResponseAnalysisPort.connect(axi4LiteSlaveEnvWriteResponseAnalysisPort);
  end

  foreach(axi4LiteReadSlaveEnv.axi4LiteSlaveReadAgent[i]) begin
    axi4LiteReadSlaveEnv.axi4LiteSlaveReadEnvAddressAnalysisPort.connect(axi4LiteSlaveEnvReadAddressAnalysisPort);
    axi4LiteReadSlaveEnv.axi4LiteSlaveReadEnvDataAnalysisPort.connect(axi4LiteSlaveEnvReadDataAnalysisPort);
  end

endfunction : connect_phase

`endif

