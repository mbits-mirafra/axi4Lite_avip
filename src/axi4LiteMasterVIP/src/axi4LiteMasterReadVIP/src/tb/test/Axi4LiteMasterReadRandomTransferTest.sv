`ifndef AXI4LITEMASTERREADRANDOMTRANSFERTEST_INCLUDED_
`define AXI4LITEMASTERREADRANDOMTRANSFERTEST_INCLUDED_

class Axi4LiteMasterReadRandomTransferTest extends Axi4LiteMasterReadBaseTest;
  `uvm_component_utils(Axi4LiteMasterReadRandomTransferTest)

  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  extern function new(string name = "Axi4LiteMasterReadRandomTransferTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterReadRandomTransferTest

function Axi4LiteMasterReadRandomTransferTest::new(string name = "Axi4LiteMasterReadRandomTransferTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterReadRandomTransferTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterReadRandomTransferTest::run_phase(uvm_phase phase);

  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq ::type_id::create("axi4LiteMasterRead32bitsTransferSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterReadRandomTransferTest"),UVM_LOW);

  phase.raise_objection(this);
   super.run_phase(phase);
  `uvm_info(get_type_name(),$sformatf("After raise_objection Axi4LiteMasterReadRandomTransferTest"),UVM_LOW);

  axi4LiteMasterRead32bitsTransferSeq.start(axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadSequencer); 
  #10;

  `uvm_info(get_type_name(),$sformatf("After start method Axi4LiteMasterReadRandomTransferTest"),UVM_LOW);
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterReadRandomTransferTest"),UVM_LOW);

endtask : run_phase

`endif


