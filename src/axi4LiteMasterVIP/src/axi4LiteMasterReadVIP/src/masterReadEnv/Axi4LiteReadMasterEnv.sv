`ifndef AXI4LITEREADMASTERENV_INCLUDED_
`define AXI4LITEREADMASTERENV_INCLUDED_

class Axi4LiteReadMasterEnv extends uvm_env;
  `uvm_component_utils(Axi4LiteReadMasterEnv)
  
  Axi4LiteReadMasterEnvConfig axi4LiteReadMasterEnvConfig;

  Axi4LiteMasterReadAgent axi4LiteMasterReadAgent[];

  Axi4LiteMasterReadAgentConfig axi4LiteMasterReadAgentConfig[];

  uvm_analysis_port#(Axi4LiteMasterReadTransaction) axi4LiteMasterReadEnvAddressAnalysisPort;
  uvm_analysis_port#(Axi4LiteMasterReadTransaction) axi4LiteMasterReadEnvDataAnalysisPort;
  uvm_analysis_port#(Axi4LiteMasterReadTransaction) axi4LiteMasterReadEnvResponseAnalysisPort;

  extern function new(string name = "Axi4LiteReadMasterEnv", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : Axi4LiteReadMasterEnv

function Axi4LiteReadMasterEnv::new(string name = "Axi4LiteReadMasterEnv",uvm_component parent = null);
  super.new(name, parent);
  axi4LiteMasterReadEnvAddressAnalysisPort  = new("axi4LiteMasterReadEnvAddressAnalysisPort",this);
  axi4LiteMasterReadEnvDataAnalysisPort     = new("axi4LiteMasterReadEnvDataAnalysisPort",this);
  axi4LiteMasterReadEnvResponseAnalysisPort = new("axi4LiteMasterReadEnvResponseAnalysisPort",this);
endfunction : new

function void Axi4LiteReadMasterEnv::build_phase(uvm_phase phase);
  super.build_phase(phase);
 axi4LiteReadMasterEnvConfig = Axi4LiteReadMasterEnvConfig::type_id::create("axi4LiteReadMasterEnvConfig"); 
  
  if(!uvm_config_db #(Axi4LiteReadMasterEnvConfig)::get(this,"","Axi4LiteReadMasterEnvConfig",axi4LiteReadMasterEnvConfig)) begin
    `uvm_fatal("FATAL_READ_MASTER_ENV_AGENT_CONFIG", $sformatf("Couldn't get the readMasterEnvAgentConfig from config_db"))
  end

 axi4LiteMasterReadAgentConfig = new[axi4LiteReadMasterEnvConfig.no_of_masters];
  foreach(axi4LiteMasterReadAgentConfig[i]) begin
    if(!uvm_config_db #(Axi4LiteMasterReadAgentConfig)::get(this,"",$sformatf("Axi4LiteMasterReadAgentConfig[%0d]",i),axi4LiteMasterReadAgentConfig[i])) begin
      `uvm_fatal("FATAL_MASTER_READ_AGENT_CONFIG", $sformatf("Couldn't get the Axi4LiteMasterReadAgentConfig[%0d] from config_db",i))
    end
  end

  axi4LiteMasterReadAgent = new[axi4LiteReadMasterEnvConfig.no_of_masters];
  foreach(axi4LiteMasterReadAgent[i]) begin
    axi4LiteMasterReadAgent[i]=Axi4LiteMasterReadAgent::type_id::create($sformatf("axi4LiteMasterReadAgent[%0d]",i),this);
  end

  foreach(axi4LiteMasterReadAgent[i]) begin
    axi4LiteMasterReadAgent[i].axi4LiteMasterReadAgentConfig = axi4LiteMasterReadAgentConfig[i];
  end
  
endfunction : build_phase


function void Axi4LiteReadMasterEnv::connect_phase(uvm_phase phase);
  super.connect_phase(phase);

  foreach(axi4LiteMasterReadAgent[i]) begin
    axi4LiteMasterReadAgent[i].axi4LiteMasterReadAgentAddressAnalysisPort.connect(axi4LiteMasterReadEnvAddressAnalysisPort);
    axi4LiteMasterReadAgent[i].axi4LiteMasterReadAgentDataAnalysisPort.connect(axi4LiteMasterReadEnvDataAnalysisPort);
    axi4LiteMasterReadAgent[i].axi4LiteMasterReadAgentResponseAnalysisPort.connect(axi4LiteMasterReadEnvResponseAnalysisPort);
  end

endfunction : connect_phase

`endif

