`ifndef AXI4LITEBACKTOBACKTRANSFERSWITH1CLKDELAYTEST_INCLUDED_
`define AXI4LITEBACKTOBACKTRANSFERSWITH1CLKDELAYTEST_INCLUDED_

class Axi4LiteBackToBackTransfersWith1ClkDelayTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteBackToBackTransfersWith1ClkDelayTest)

  Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq;
  
  extern function new(string name = "Axi4LiteBackToBackTransfersWith1ClkDelayTest", uvm_component parent = null);
  extern function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteBackToBackTransfersWith1ClkDelayTest

function Axi4LiteBackToBackTransfersWith1ClkDelayTest::new(string name = "Axi4LiteBackToBackTransfersWith1ClkDelayTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteBackToBackTransfersWith1ClkDelayTest::setupAxi4LiteSlaveWriteAgentConfig();
  super.setupAxi4LiteSlaveWriteAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

task Axi4LiteBackToBackTransfersWith1ClkDelayTest::run_phase(uvm_phase phase);

  axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq=Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq::type_id::create("axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteBackToBackTransfersWith1ClkDelayTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

