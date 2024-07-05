`ifndef AXI4LITEMASTERRANDOMWRITEREADTRANSFERTEST_INCLUDED_
`define AXI4LITEMASTERRANDOMWRITEREADTRANSFERTEST_INCLUDED_

class Axi4LiteMasterRandomWriteReadTransferTest extends Axi4LiteMasterBaseTest;
  `uvm_component_utils(Axi4LiteMasterRandomWriteReadTransferTest)

  Axi4LiteMasterVirtualRandomWriteReadTransferSeq axi4LiteMasterVirtualRandomWriteReadTransferSeq;
  
  extern function new(string name = "Axi4LiteMasterRandomWriteReadTransferTest", uvm_component parent = null);
extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterRandomWriteReadTransferTest

function Axi4LiteMasterRandomWriteReadTransferTest::new(string name = "Axi4LiteMasterRandomWriteReadTransferTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteMasterRandomWriteReadTransferTest::run_phase(uvm_phase phase);

  axi4LiteMasterVirtualRandomWriteReadTransferSeq=Axi4LiteMasterVirtualRandomWriteReadTransferSeq::type_id::create("axi4LiteMasterVirtualRandomWriteReadTransferSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterRandomWriteReadTransferTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteMasterVirtualRandomWriteReadTransferSeq.start(axi4LiteMasterEnv.axi4LiteMasterVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

