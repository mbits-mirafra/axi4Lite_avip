`ifndef AXI4LITEREADYASSERTEDANDDEASSERTEDANDNEXTCLKVALIDASSERTEDTEST_INCLUDED_
`define AXI4LITEREADYASSERTEDANDDEASSERTEDANDNEXTCLKVALIDASSERTEDTEST_INCLUDED_

class Axi4LiteReadyAssertedAndDeAssertedAndNextClkValidAssertedTest extends Axi4LiteToggleReadyTest;
  `uvm_component_utils(Axi4LiteReadyAssertedAndDeAssertedAndNextClkValidAssertedTest)

  Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq;
  
  extern function new(string name = "Axi4LiteReadyAssertedAndDeAssertedAndNextClkValidAssertedTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteReadyAssertedAndDeAssertedAndNextClkValidAssertedTest

function Axi4LiteReadyAssertedAndDeAssertedAndNextClkValidAssertedTest::new(string name = "Axi4LiteReadyAssertedAndDeAssertedAndNextClkValidAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteReadyAssertedAndDeAssertedAndNextClkValidAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq=Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq::type_id::create("axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteReadyAssertedAndDeAssertedAndNextClkValidAssertedTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

