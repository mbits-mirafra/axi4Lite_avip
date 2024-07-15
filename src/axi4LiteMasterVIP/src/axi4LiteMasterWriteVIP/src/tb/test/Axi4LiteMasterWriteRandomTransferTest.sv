`ifndef AXI4LITEMASTERWRITERANDOMTRANSFERTEST_INCLUDED_
`define AXI4LITEMASTERWRITERANDOMTRANSFERTEST_INCLUDED_

class Axi4LiteMasterWriteRandomTransferTest extends Axi4LiteMasterWriteBaseTest;
  `uvm_component_utils(Axi4LiteMasterWriteRandomTransferTest)

  Axi4LiteMasterWriteRandomTransferSeq axi4LiteMasterWriteRandomTransferSeq;
  extern function new(string name = "Axi4LiteMasterWriteRandomTransferTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteRandomTransferTest

function Axi4LiteMasterWriteRandomTransferTest::new(string name = "Axi4LiteMasterWriteRandomTransferTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteRandomTransferTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteMasterWriteRandomTransferSeq = Axi4LiteMasterWriteRandomTransferSeq ::type_id::create("axi4LiteMasterWriteRandomTransferSeq");
endfunction : build_phase

task Axi4LiteMasterWriteRandomTransferTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteRandomTransferTest"),UVM_LOW);

  phase.raise_objection(this);
   super.run_phase(phase);
  `uvm_info(get_type_name(),$sformatf("After raise_objection Axi4LiteMasterWriteRandomTransferTest"),UVM_LOW);

  axi4LiteMasterWriteRandomTransferSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;

  `uvm_info(get_type_name(),$sformatf("After start method Axi4LiteMasterWriteRandomTransferTest"),UVM_LOW);
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteRandomTransferTest"),UVM_LOW);

endtask : run_phase

`endif


