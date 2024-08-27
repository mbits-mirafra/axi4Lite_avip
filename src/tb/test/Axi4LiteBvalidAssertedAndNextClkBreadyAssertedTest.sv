`ifndef AXI4LITEBVALIDASSERTEDANDNEXTCLKBREADYASSERTEDTEST_INCLUDED_
`define AXI4LITEBVALIDASSERTEDANDNEXTCLKBREADYASSERTEDTEST_INCLUDED_

class Axi4LiteBvalidAssertedAndNextClkBreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteBvalidAssertedAndNextClkBreadyAssertedTest)

  Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteBvalidAssertedAndNextClkBreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteBvalidAssertedAndNextClkBreadyAssertedTest

function Axi4LiteBvalidAssertedAndNextClkBreadyAssertedTest::new(string name = "Axi4LiteBvalidAssertedAndNextClkBreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteBvalidAssertedAndNextClkBreadyAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

function void Axi4LiteBvalidAssertedAndNextClkBreadyAssertedTest::setupAxi4LiteMasterWriteAgentConfig();
  super.setupAxi4LiteMasterWriteAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
   axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

task Axi4LiteBvalidAssertedAndNextClkBreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq=Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq::type_id::create("axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteBvalidAssertedAndNextClkBreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

