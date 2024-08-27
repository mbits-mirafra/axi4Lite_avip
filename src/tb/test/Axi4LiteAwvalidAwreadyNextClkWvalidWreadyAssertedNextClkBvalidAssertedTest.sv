`ifndef AXI4LITEAWVALIDAWREADYNEXTCLKWVALIDWREADYASSERTEDNEXTCLKBVALIDASSERTEDTEST_INCLUDED_
`define AXI4LITEAWVALIDAWREADYNEXTCLKWVALIDWREADYASSERTEDNEXTCLKBVALIDASSERTEDTEST_INCLUDED_

class Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedTest)

  Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq;
  
  extern function new(string name = "Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedTest

function Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedTest::new(string name = "Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig


task Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq=Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq::type_id::create("axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

