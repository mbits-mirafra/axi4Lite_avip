`ifndef AXI4LITEBVALIDASSERTEDANDSAMECLKBREADYASSERTEDTEST_INCLUDED_
`define AXI4LITEBVALIDASSERTEDANDSAMECLKBREADYASSERTEDTEST_INCLUDED_

class Axi4LiteBvalidAssertedAndSameClkBreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteBvalidAssertedAndSameClkBreadyAssertedTest)

  Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteBvalidAssertedAndSameClkBreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);
endclass : Axi4LiteBvalidAssertedAndSameClkBreadyAssertedTest

function Axi4LiteBvalidAssertedAndSameClkBreadyAssertedTest::new(string name = "Axi4LiteBvalidAssertedAndSameClkBreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteBvalidAssertedAndSameClkBreadyAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = 1;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteBvalidAssertedAndSameClkBreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq=Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq::type_id::create("axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteBvalidAssertedAndSameClkBreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

