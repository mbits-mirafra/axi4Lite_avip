`ifndef AXI4LITEMASTERRANDOMTRANSFERTEST_INCLUDED_
`define AXI4LITEMASTERRANDOMTRANSFERTEST_INCLUDED_

class Axi4LiteMasterRandomTransferTest extends Axi4LiteMasterBaseTest;
  `uvm_component_utils(Axi4LiteMasterRandomTransferTest)

  Axi4LiteMasterVirtualRandomTransferSeq axi4LiteMasterVirtualRandomTransferSeq;
  
  extern function new(string name = "Axi4LiteMasterRandomTransferTest", uvm_component parent = null);
extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterRandomTransferTest

function Axi4LiteMasterRandomTransferTest::new(string name = "Axi4LiteMasterRandomTransferTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteMasterRandomTransferTest::run_phase(uvm_phase phase);

  axi4LiteMasterVirtualRandomTransferSeq=Axi4LiteMasterVirtualRandomTransferSeq::type_id::create("axi4LiteMasterVirtualRandomTransferSeq");
  `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterRandomTransferTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteMasterVirtualRandomTransferSeq.start(axi4LiteMasterEnv.axi4LiteMasterVirtualSequencer);
 #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

