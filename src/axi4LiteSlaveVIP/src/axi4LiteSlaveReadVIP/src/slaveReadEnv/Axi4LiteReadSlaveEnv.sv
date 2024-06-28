`ifndef AXI4LITEREADSLAVEENV_INCLUDED_
`define AXI4LITEREADSLAVEENV_INCLUDED_

class Axi4LiteReadSlaveEnv extends uvm_env;
  `uvm_component_utils(Axi4LiteReadSlaveEnv)
  
  Axi4LiteReadSlaveEnvConfig axi4LiteReadSlaveEnvConfig;

  Axi4LiteSlaveReadAgent axi4LiteSlaveReadAgent[];

  Axi4LiteSlaveReadAgentConfig axi4LiteSlaveReadAgentConfig[];

  uvm_analysis_port#(Axi4LiteSlaveReadTransaction) axi4LiteSlaveReadEnvAddressAnalysisPort;
  uvm_analysis_port#(Axi4LiteSlaveReadTransaction) axi4LiteSlaveReadEnvDataAnalysisPort;

  extern function new(string name = "Axi4LiteReadSlaveEnv", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : Axi4LiteReadSlaveEnv

function Axi4LiteReadSlaveEnv::new(string name = "Axi4LiteReadSlaveEnv",uvm_component parent = null);
  super.new(name, parent);
  axi4LiteSlaveReadEnvAddressAnalysisPort  = new("axi4LiteSlaveReadEnvAddressAnalysisPort",this);
  axi4LiteSlaveReadEnvDataAnalysisPort     = new("axi4LiteSlaveReadEnvDataAnalysisPort",this);
endfunction : new

function void Axi4LiteReadSlaveEnv::build_phase(uvm_phase phase);
  super.build_phase(phase);
 axi4LiteReadSlaveEnvConfig = Axi4LiteReadSlaveEnvConfig::type_id::create("axi4LiteReadSlaveEnvConfig"); 
  
  if(!uvm_config_db #(Axi4LiteReadSlaveEnvConfig)::get(this,"","Axi4LiteReadSlaveEnvConfig",axi4LiteReadSlaveEnvConfig)) begin
    `uvm_fatal("FATAL_READ_SLAVE_ENV_AGENT_CONFIG", $sformatf("Couldn't get the readSlaveEnvAgentConfig from config_db"))
  end

 axi4LiteSlaveReadAgentConfig = new[axi4LiteReadSlaveEnvConfig.no_of_slaves];
  foreach(axi4LiteSlaveReadAgentConfig[i]) begin
    if(!uvm_config_db #(Axi4LiteSlaveReadAgentConfig)::get(this,"",$sformatf("Axi4LiteSlaveReadAgentConfig[%0d]",i),axi4LiteSlaveReadAgentConfig[i])) begin
      `uvm_fatal("FATAL_SLAVE_READ_AGENT_CONFIG", $sformatf("Couldn't get the Axi4LiteSlaveReadAgentConfig[%0d] from config_db",i))
    end
  end

  axi4LiteSlaveReadAgent = new[axi4LiteReadSlaveEnvConfig.no_of_slaves];
  foreach(axi4LiteSlaveReadAgent[i]) begin
    axi4LiteSlaveReadAgent[i]=Axi4LiteSlaveReadAgent::type_id::create($sformatf("axi4LiteSlaveReadAgent[%0d]",i),this);
  end

  foreach(axi4LiteSlaveReadAgent[i]) begin
    axi4LiteSlaveReadAgent[i].axi4LiteSlaveReadAgentConfig = axi4LiteSlaveReadAgentConfig[i];
  end
  
endfunction : build_phase


function void Axi4LiteReadSlaveEnv::connect_phase(uvm_phase phase);
  super.connect_phase(phase);

  foreach(axi4LiteSlaveReadAgent[i]) begin
    axi4LiteSlaveReadAgent[i].axi4LiteSlaveReadAgentAddressAnalysisPort.connect(axi4LiteSlaveReadEnvAddressAnalysisPort);
    axi4LiteSlaveReadAgent[i].axi4LiteSlaveReadAgentDataAnalysisPort.connect(axi4LiteSlaveReadEnvDataAnalysisPort);
  end

endfunction : connect_phase

`endif

