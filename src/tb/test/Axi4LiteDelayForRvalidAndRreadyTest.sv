`ifndef AXI4LITEDELAYFORRVALIDANDRREADYTEST_INCLUDED_
`define AXI4LITEDELAYFORRVALIDANDRREADYTEST_INCLUDED_

class Axi4LiteDelayForRvalidAndRreadyTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteDelayForRvalidAndRreadyTest)

  Axi4LiteVirtualDelayForRvalidAndRreadySeq axi4LiteVirtualDelayForRvalidAndRreadySeq;
  
  extern function new(string name = "Axi4LiteDelayForRvalidAndRreadyTest", uvm_component parent = null);
extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteDelayForRvalidAndRreadyTest

function Axi4LiteDelayForRvalidAndRreadyTest::new(string name = "Axi4LiteDelayForRvalidAndRreadyTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteDelayForRvalidAndRreadyTest::run_phase(uvm_phase phase);

  axi4LiteVirtualDelayForRvalidAndRreadySeq=Axi4LiteVirtualDelayForRvalidAndRreadySeq::type_id::create("axi4LiteVirtualDelayForRvalidAndRreadySeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteDelayForRvalidAndRreadyTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualDelayForRvalidAndRreadySeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

