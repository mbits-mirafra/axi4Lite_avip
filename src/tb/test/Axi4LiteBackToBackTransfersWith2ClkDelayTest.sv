`ifndef AXI4LITEBACKTOBACKTRANSFERSWITH2CLKDELAYTEST_INCLUDED_
`define AXI4LITEBACKTOBACKTRANSFERSWITH2CLKDELAYTEST_INCLUDED_

class Axi4LiteBackToBackTransfersWith2ClkDelayTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteBackToBackTransfersWith2ClkDelayTest)

  Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq;
  
  extern function new(string name = "Axi4LiteBackToBackTransfersWith2ClkDelayTest", uvm_component parent = null);
  extern function void setupAxi4LiteMasterWriteAgentConfig();
  extern function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteBackToBackTransfersWith2ClkDelayTest

function Axi4LiteBackToBackTransfersWith2ClkDelayTest::new(string name = "Axi4LiteBackToBackTransfersWith2ClkDelayTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteBackToBackTransfersWith2ClkDelayTest::setupAxi4LiteMasterWriteAgentConfig();
  super.setupAxi4LiteMasterWriteAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

function void Axi4LiteBackToBackTransfersWith2ClkDelayTest::setupAxi4LiteSlaveWriteAgentConfig();
  super.setupAxi4LiteSlaveWriteAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

task Axi4LiteBackToBackTransfersWith2ClkDelayTest::run_phase(uvm_phase phase);

  axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq=Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq::type_id::create("axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteBackToBackTransfersWith2ClkDelayTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

