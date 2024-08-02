`ifndef AXI4LITEREADYASSERTEDANDDEASSERTED3TIMESANDNEXTCLKVALIDASSERTEDTEST_INCLUDED_
`define AXI4LITEREADYASSERTEDANDDEASSERTED3TIMESANDNEXTCLKVALIDASSERTEDTEST_INCLUDED_

class Axi4LiteReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedTest extends Axi4LiteToggleReadyTest;
  `uvm_component_utils(Axi4LiteReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedTest)

  Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq;
  
  extern function new(string name = "Axi4LiteReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedTest

function Axi4LiteReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedTest::new(string name = "Axi4LiteReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq=Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq::type_id::create("axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

