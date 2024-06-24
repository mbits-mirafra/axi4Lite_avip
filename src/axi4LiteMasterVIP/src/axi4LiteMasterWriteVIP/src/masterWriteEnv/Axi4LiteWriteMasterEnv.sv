`ifndef AXI4LITEWRITEMASTERENV_INCLUDED_
`define AXI4LITEWRITEMASTERENV_INCLUDED_

class Axi4LiteWriteMasterEnv extends uvm_env;
  `uvm_component_utils(Axi4LiteWriteMasterEnv)
  
  Axi4LiteWriteMasterEnvConfig axi4LiteWriteMasterEnvConfig;

  Axi4LiteMasterWriteAgent axi4LiteMasterWriteAgent[];

  Axi4LiteMasterWriteAgentConfig axi4LiteMasterWriteAgentConfig[];

  uvm_analysis_port#(Axi4LiteMasterWriteTransaction) axi4LiteMasterWriteEnvAddressAnalysisPort;
  uvm_analysis_port#(Axi4LiteMasterWriteTransaction) axi4LiteMasterWriteEnvDataAnalysisPort;
  uvm_analysis_port#(Axi4LiteMasterWriteTransaction) axi4LiteMasterWriteEnvResponseAnalysisPort;

  extern function new(string name = "Axi4LiteWriteMasterEnv", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : Axi4LiteWriteMasterEnv

function Axi4LiteWriteMasterEnv::new(string name = "Axi4LiteWriteMasterEnv",uvm_component parent = null);
  super.new(name, parent);
  axi4LiteMasterWriteEnvAddressAnalysisPort  = new("axi4LiteMasterWriteEnvAddressAnalysisPort",this);
  axi4LiteMasterWriteEnvDataAnalysisPort     = new("axi4LiteMasterWriteEnvDataAnalysisPort",this);
  axi4LiteMasterWriteEnvResponseAnalysisPort = new("axi4LiteMasterWriteEnvResponseAnalysisPort",this);
endfunction : new

function void Axi4LiteWriteMasterEnv::build_phase(uvm_phase phase);
  super.build_phase(phase);
 axi4LiteWriteMasterEnvConfig = Axi4LiteWriteMasterEnvConfig::type_id::create("axi4LiteWriteMasterEnvConfig"); 
  
  if(!uvm_config_db #(Axi4LiteWriteMasterEnvConfig)::get(this,"","Axi4LiteWriteMasterEnvConfig",axi4LiteWriteMasterEnvConfig)) begin
    `uvm_fatal("FATAL_WRITE_MASTER_ENV_AGENT_CONFIG", $sformatf("Couldn't get the writeMasterEnvAgentConfig from config_db"))
  end

 axi4LiteMasterWriteAgentConfig = new[axi4LiteWriteMasterEnvConfig.no_of_masters];
  foreach(axi4LiteMasterWriteAgentConfig[i]) begin
    if(!uvm_config_db #(Axi4LiteMasterWriteAgentConfig)::get(this,"",$sformatf("Axi4LiteMasterWriteAgentConfig[%0d]",i),axi4LiteMasterWriteAgentConfig[i])) begin
      `uvm_fatal("FATAL_MASTER_WRITE_AGENT_CONFIG", $sformatf("Couldn't get the Axi4LiteMasterWriteAgentConfig[%0d] from config_db",i))
    end
  end

  axi4LiteMasterWriteAgent = new[axi4LiteWriteMasterEnvConfig.no_of_masters];
  foreach(axi4LiteMasterWriteAgent[i]) begin
    axi4LiteMasterWriteAgent[i]=Axi4LiteMasterWriteAgent::type_id::create($sformatf("axi4LiteMasterWriteAgent[%0d]",i),this);
  end

  foreach(axi4LiteMasterWriteAgent[i]) begin
    axi4LiteMasterWriteAgent[i].axi4LiteMasterWriteAgentConfig = axi4LiteMasterWriteAgentConfig[i];
  end
  
endfunction : build_phase


function void Axi4LiteWriteMasterEnv::connect_phase(uvm_phase phase);
  super.connect_phase(phase);

  foreach(axi4LiteMasterWriteAgent[i]) begin
    axi4LiteMasterWriteAgent[i].axi4LiteMasterWriteAgentAddressAnalysisPort.connect(axi4LiteMasterWriteEnvAddressAnalysisPort);
    axi4LiteMasterWriteAgent[i].axi4LiteMasterWriteAgentDataAnalysisPort.connect(axi4LiteMasterWriteEnvDataAnalysisPort);
    axi4LiteMasterWriteAgent[i].axi4LiteMasterWriteAgentResponseAnalysisPort.connect(axi4LiteMasterWriteEnvResponseAnalysisPort);
  end

endfunction : connect_phase

`endif

