`ifndef AXI4LITEBACKTOBACKTRANSFERSWITH3TO16CLKDELAYTEST_INCLUDED_
`define AXI4LITEBACKTOBACKTRANSFERSWITH3TO16CLKDELAYTEST_INCLUDED_

class Axi4LiteBackToBackTransfersWith3To16ClkDelayTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteBackToBackTransfersWith3To16ClkDelayTest)

  Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq;
  
  extern function new(string name = "Axi4LiteBackToBackTransfersWith3To16ClkDelayTest", uvm_component parent = null);
  extern function void setupAxi4LiteMasterWriteAgentConfig();
  extern function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteBackToBackTransfersWith3To16ClkDelayTest

function Axi4LiteBackToBackTransfersWith3To16ClkDelayTest::new(string name = "Axi4LiteBackToBackTransfersWith3To16ClkDelayTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteBackToBackTransfersWith3To16ClkDelayTest::setupAxi4LiteMasterWriteAgentConfig();
  super.setupAxi4LiteMasterWriteAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

function void Axi4LiteBackToBackTransfersWith3To16ClkDelayTest::setupAxi4LiteSlaveWriteAgentConfig();
  super.setupAxi4LiteSlaveWriteAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

task Axi4LiteBackToBackTransfersWith3To16ClkDelayTest::run_phase(uvm_phase phase);

  axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq=Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq::type_id::create("axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteBackToBackTransfersWith3To16ClkDelayTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

