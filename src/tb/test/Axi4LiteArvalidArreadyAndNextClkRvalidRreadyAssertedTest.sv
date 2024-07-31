`ifndef AXI4LITEARVALIDARREADYANDNEXTCLKRVALIDRREADYASSERTEDTEST_INCLUDED_
`define AXI4LITEARVALIDARREADYANDNEXTCLKRVALIDRREADYASSERTEDTEST_INCLUDED_

class Axi4LiteArvalidArreadyAndNextClkRvalidRreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteArvalidArreadyAndNextClkRvalidRreadyAssertedTest)

  Axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteArvalidArreadyAndNextClkRvalidRreadyAssertedTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteArvalidArreadyAndNextClkRvalidRreadyAssertedTest

function Axi4LiteArvalidArreadyAndNextClkRvalidRreadyAssertedTest::new(string name = "Axi4LiteArvalidArreadyAndNextClkRvalidRreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteArvalidArreadyAndNextClkRvalidRreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq=Axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq::type_id::create("axi4LiteVirtual32bitWriteDataSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteArvalidArreadyAndNextClkRvalidRreadyAssertedTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

