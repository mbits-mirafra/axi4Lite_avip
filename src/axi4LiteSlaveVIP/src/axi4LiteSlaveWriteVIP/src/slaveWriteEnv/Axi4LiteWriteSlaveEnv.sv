`ifndef AXI4LITEWRITESLAVEENV_INCLUDED_
`define AXI4LITEWRITESLAVEENV_INCLUDED_

class Axi4LiteWriteSlaveEnv extends uvm_env;
  `uvm_component_utils(Axi4LiteWriteSlaveEnv)
  
  Axi4LiteWriteSlaveEnvConfig axi4LiteWriteSlaveEnvConfig;

  Axi4LiteSlaveWriteAgent axi4LiteSlaveWriteAgent[];

  Axi4LiteSlaveWriteAgentConfig axi4LiteSlaveWriteAgentConfig[];

  uvm_analysis_port#(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveWriteEnvAddressAnalysisPort;
  uvm_analysis_port#(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveWriteEnvDataAnalysisPort;
  uvm_analysis_port#(Axi4LiteSlaveWriteTransaction) axi4LiteSlaveWriteEnvResponseAnalysisPort;

  extern function new(string name = "Axi4LiteWriteSlaveEnv", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : Axi4LiteWriteSlaveEnv

function Axi4LiteWriteSlaveEnv::new(string name = "Axi4LiteWriteSlaveEnv",uvm_component parent = null);
  super.new(name, parent);
  axi4LiteSlaveWriteEnvAddressAnalysisPort  = new("axi4LiteSlaveWriteEnvAddressAnalysisPort",this);
  axi4LiteSlaveWriteEnvDataAnalysisPort     = new("axi4LiteSlaveWriteEnvDataAnalysisPort",this);
  axi4LiteSlaveWriteEnvResponseAnalysisPort = new("axi4LiteSlaveWriteEnvResponseAnalysisPort",this);
endfunction : new

function void Axi4LiteWriteSlaveEnv::build_phase(uvm_phase phase);
  super.build_phase(phase);
 axi4LiteWriteSlaveEnvConfig = Axi4LiteWriteSlaveEnvConfig::type_id::create("axi4LiteWriteSlaveEnvConfig"); 
  
  if(!uvm_config_db #(Axi4LiteWriteSlaveEnvConfig)::get(this,"","Axi4LiteWriteSlaveEnvConfig",axi4LiteWriteSlaveEnvConfig)) begin
    `uvm_fatal("FATAL_WRITE_SLAVE_ENV_AGENT_CONFIG", $sformatf("Couldn't get the writeSlaveEnvAgentConfig from config_db"))
  end

 axi4LiteSlaveWriteAgentConfig = new[axi4LiteWriteSlaveEnvConfig.no_of_slaves];
  foreach(axi4LiteSlaveWriteAgentConfig[i]) begin
    if(!uvm_config_db #(Axi4LiteSlaveWriteAgentConfig)::get(this,"*",$sformatf("Axi4LiteSlaveWriteAgentConfig[%0d]",i),axi4LiteSlaveWriteAgentConfig[i])) begin
      `uvm_fatal("FATAL_SLAVE_WRITE_AGENT_CONFIG", $sformatf("Couldn't get the Axi4LiteSlaveWriteAgentConfig[%0d] from config_db",i))
    end
  end

  axi4LiteSlaveWriteAgent = new[axi4LiteWriteSlaveEnvConfig.no_of_slaves];
  foreach(axi4LiteSlaveWriteAgent[i]) begin
    axi4LiteSlaveWriteAgent[i]=Axi4LiteSlaveWriteAgent::type_id::create($sformatf("axi4LiteSlaveWriteAgent[%0d]",i),this);
  end

  foreach(axi4LiteSlaveWriteAgent[i]) begin
    axi4LiteSlaveWriteAgent[i].axi4LiteSlaveWriteAgentConfig = axi4LiteSlaveWriteAgentConfig[i];
  end
  
endfunction : build_phase


function void Axi4LiteWriteSlaveEnv::connect_phase(uvm_phase phase);
  super.connect_phase(phase);

  foreach(axi4LiteSlaveWriteAgent[i]) begin
    axi4LiteSlaveWriteAgent[i].axi4LiteSlaveWriteAgentAddressAnalysisPort.connect(axi4LiteSlaveWriteEnvAddressAnalysisPort);
    axi4LiteSlaveWriteAgent[i].axi4LiteSlaveWriteAgentDataAnalysisPort.connect(axi4LiteSlaveWriteEnvDataAnalysisPort);
    axi4LiteSlaveWriteAgent[i].axi4LiteSlaveWriteAgentResponseAnalysisPort.connect(axi4LiteSlaveWriteEnvResponseAnalysisPort);
  end

endfunction : connect_phase

`endif

