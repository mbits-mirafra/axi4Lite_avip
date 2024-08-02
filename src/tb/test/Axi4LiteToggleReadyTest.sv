`ifndef AXI4LITETOGGLEREADYTEST_INCLUDED_
`define AXI4LITETOGGLEREADYTEST_INCLUDED_

class Axi4LiteToggleReadyTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteToggleReadyTest)

  Axi4LiteVirtualToggleReadySeq axi4LiteVirtualToggleReadySeq;
  
  extern function new(string name = "Axi4LiteToggleReadyTest", uvm_component parent = null);
  extern function void setupAxi4LiteMasterWriteAgentConfig();
  extern function void setupAxi4LiteSlaveWriteAgentConfig();
  extern function void setupAxi4LiteMasterReadAgentConfig();
  extern function void setupAxi4LiteSlaveReadAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteToggleReadyTest

function Axi4LiteToggleReadyTest::new(string name = "Axi4LiteToggleReadyTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteToggleReadyTest::setupAxi4LiteMasterWriteAgentConfig();
  super.setupAxi4LiteMasterWriteAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].toggleReady = 1; 
  end
endfunction

function void Axi4LiteToggleReadyTest::setupAxi4LiteSlaveWriteAgentConfig();
  super.setupAxi4LiteSlaveWriteAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].toggleReady = 1; 
  end
endfunction

function void Axi4LiteToggleReadyTest::setupAxi4LiteMasterReadAgentConfig();
  super.setupAxi4LiteMasterReadAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].toggleReady = 1; 
  end
endfunction

function void Axi4LiteToggleReadyTest::setupAxi4LiteSlaveReadAgentConfig();
  super.setupAxi4LiteSlaveReadAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].toggleReady = 1; 
  end
endfunction

task Axi4LiteToggleReadyTest::run_phase(uvm_phase phase);

  axi4LiteVirtualToggleReadySeq=Axi4LiteVirtualToggleReadySeq::type_id::create("axi4LiteVirtualToggleReadySeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteToggleReadyTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualToggleReadySeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

