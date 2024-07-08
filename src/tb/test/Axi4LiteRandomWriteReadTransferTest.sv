`ifndef AXI4LITERANDOMWRITEREADTRANSFERTEST_INCLUDED_
`define AXI4LITERANDOMWRITEREADTRANSFERTEST_INCLUDED_

class Axi4LiteRandomWriteReadTransferTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteRandomWriteReadTransferTest)

  Axi4LiteVirtualRandomWriteReadTransferSeq axi4LiteVirtualRandomWriteReadTransferSeq;
  
  extern function new(string name = "Axi4LiteRandomWriteReadTransferTest", uvm_component parent = null);
extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteRandomWriteReadTransferTest

function Axi4LiteRandomWriteReadTransferTest::new(string name = "Axi4LiteRandomWriteReadTransferTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteRandomWriteReadTransferTest::run_phase(uvm_phase phase);

  axi4LiteVirtualRandomWriteReadTransferSeq=Axi4LiteVirtualRandomWriteReadTransferSeq::type_id::create("axi4LiteVirtualRandomWriteReadTransferSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteRandomWriteReadTransferTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualRandomWriteReadTransferSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

