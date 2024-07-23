`ifndef AXI4LITEAWVALIDAWREADYANDWVALIDWREADYASSERTEDSAMECLKNEXTCLKBVALIDASSERTEDTEST_INCLUDED_
`define AXI4LITEAWVALIDAWREADYANDWVALIDWREADYASSERTEDSAMECLKNEXTCLKBVALIDASSERTEDTEST_INCLUDED_

class Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest)

  Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq;
  
  extern function new(string name = "Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest

function Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest::new(string name = "Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq=Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq::type_id::create("axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

