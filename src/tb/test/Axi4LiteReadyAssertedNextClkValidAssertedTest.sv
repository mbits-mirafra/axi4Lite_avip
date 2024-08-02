`ifndef AXI4LITEREADYASSERTEDNEXTCLKVALIDASSERTEDTEST_INCLUDED_
`define AXI4LITEREADYASSERTEDNEXTCLKVALIDASSERTEDTEST_INCLUDED_

class Axi4LiteReadyAssertedNextClkValidAssertedTest extends Axi4LiteToggleReadyTest;
  `uvm_component_utils(Axi4LiteReadyAssertedNextClkValidAssertedTest)

  Axi4LiteVirtualReadyAssertedNextClkValidAssertedSeq axi4LiteVirtualReadyAssertedNextClkValidAssertedSeq;
  
  extern function new(string name = "Axi4LiteReadyAssertedNextClkValidAssertedTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteReadyAssertedNextClkValidAssertedTest

function Axi4LiteReadyAssertedNextClkValidAssertedTest::new(string name = "Axi4LiteReadyAssertedNextClkValidAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteReadyAssertedNextClkValidAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualReadyAssertedNextClkValidAssertedSeq=Axi4LiteVirtualReadyAssertedNextClkValidAssertedSeq::type_id::create("axi4LiteVirtualReadyAssertedNextClkValidAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteReadyAssertedNextClkValidAssertedTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualReadyAssertedNextClkValidAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

