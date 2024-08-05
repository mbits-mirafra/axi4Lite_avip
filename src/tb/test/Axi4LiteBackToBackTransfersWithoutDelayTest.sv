`ifndef AXI4LITEBACKTOBACKTRANSFERSWITHOUTDELAYTEST_INCLUDED_
`define AXI4LITEBACKTOBACKTRANSFERSWITHOUTDELAYTEST_INCLUDED_

class Axi4LiteBackToBackTransfersWithoutDelayTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteBackToBackTransfersWithoutDelayTest)

  Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq axi4LiteVirtualBackToBackTransfersWithoutDelaySeq;
  
  extern function new(string name = "Axi4LiteBackToBackTransfersWithoutDelayTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteBackToBackTransfersWithoutDelayTest

function Axi4LiteBackToBackTransfersWithoutDelayTest::new(string name = "Axi4LiteBackToBackTransfersWithoutDelayTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteBackToBackTransfersWithoutDelayTest::run_phase(uvm_phase phase);

  axi4LiteVirtualBackToBackTransfersWithoutDelaySeq=Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq::type_id::create("axi4LiteVirtualBackToBackTransfersWithoutDelaySeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteBackToBackTransfersWithoutDelayTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualBackToBackTransfersWithoutDelaySeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

