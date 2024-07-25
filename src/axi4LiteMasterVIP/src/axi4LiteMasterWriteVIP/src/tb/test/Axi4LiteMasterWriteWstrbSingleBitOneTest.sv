`ifndef AXI4LITEMASTERWRITEWSTRBSINGLEBITONETEST_INCLUDED_
`define AXI4LITEMASTERWRITEWSTRBSINGLEBITONETEST_INCLUDED_

class Axi4LiteMasterWriteWstrbSingleBitOneTest extends Axi4LiteMasterWrite32bitsTransferTest;
  `uvm_component_utils(Axi4LiteMasterWriteWstrbSingleBitOneTest)

  extern function new(string name = "Axi4LiteMasterWriteWstrbSingleBitOneTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteWstrbSingleBitOneTest

function Axi4LiteMasterWriteWstrbSingleBitOneTest::new(string name = "Axi4LiteMasterWriteWstrbSingleBitOneTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteWstrbSingleBitOneTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterWriteWstrbSingleBitOneTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteWstrbSingleBitOneTest"),UVM_LOW);
    
   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {$countones(wstrbSeq) == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteWstrbSingleBitOneTest wstrbSeq :%0h", axi4LiteMasterWrite32bitsTransferSeq.wstrbSeq),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteMasterWrite32bitsTransferSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteWstrbSingleBitOneTest"),UVM_LOW);

endtask : run_phase

`endif


