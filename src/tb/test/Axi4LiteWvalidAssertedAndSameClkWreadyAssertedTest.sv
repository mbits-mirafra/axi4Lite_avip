`ifndef AXI4LITEWVALIDASSERTEDANDSAMECLKWREADYASSERTEDTEST_INCLUDED_
`define AXI4LITEWVALIDASSERTEDANDSAMECLKWREADYASSERTEDTEST_INCLUDED_

class Axi4LiteWvalidAssertedAndSameClkWreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteWvalidAssertedAndSameClkWreadyAssertedTest)

  Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteWvalidAssertedAndSameClkWreadyAssertedTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);
endclass : Axi4LiteWvalidAssertedAndSameClkWreadyAssertedTest

function Axi4LiteWvalidAssertedAndSameClkWreadyAssertedTest::new(string name = "Axi4LiteWvalidAssertedAndSameClkWreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteWvalidAssertedAndSameClkWreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq=Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq::type_id::create("axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteWvalidAssertedAndSameClkWreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

