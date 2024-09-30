`ifndef AXI4LITEBACKTOBACKTRANSFERSWITHOUTDELAYTEST_INCLUDED_
`define AXI4LITEBACKTOBACKTRANSFERSWITHOUTDELAYTEST_INCLUDED_

class Axi4LiteBackToBackTransfersWithoutDelayTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteBackToBackTransfersWithoutDelayTest)

  Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq axi4LiteVirtualBackToBackTransfersWithoutDelaySeq;
  
  extern function new(string name = "Axi4LiteBackToBackTransfersWithoutDelayTest", uvm_component parent = null);
  extern virtual function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual function void setupAxi4LiteMasterReadAgentConfig();
  extern virtual function void setupAxi4LiteSlaveReadAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteBackToBackTransfersWithoutDelayTest

function Axi4LiteBackToBackTransfersWithoutDelayTest::new(string name = "Axi4LiteBackToBackTransfersWithoutDelayTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteBackToBackTransfersWithoutDelayTest::setupAxi4LiteMasterWriteAgentConfig();
  super.setupAxi4LiteMasterWriteAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
    axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteMasterWriteAgentConfig

function void Axi4LiteBackToBackTransfersWithoutDelayTest::setupAxi4LiteSlaveWriteAgentConfig();
  super.setupAxi4LiteSlaveWriteAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
    axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteSlaveWriteAgentConfig

function void Axi4LiteBackToBackTransfersWithoutDelayTest::setupAxi4LiteMasterReadAgentConfig();
  super.setupAxi4LiteMasterReadAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
    axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteMasterReadAgentConfig

function void Axi4LiteBackToBackTransfersWithoutDelayTest::setupAxi4LiteSlaveReadAgentConfig();
  super.setupAxi4LiteSlaveReadAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin
    axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteSlaveReadAgentConfig

task Axi4LiteBackToBackTransfersWithoutDelayTest::run_phase(uvm_phase phase);

  axi4LiteVirtualBackToBackTransfersWithoutDelaySeq=Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq::type_id::create("axi4LiteVirtualBackToBackTransfersWithoutDelaySeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteBackToBackTransfersWithoutDelayTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualBackToBackTransfersWithoutDelaySeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

