`ifndef AXI4LITEMASTERWRITEWSTRBSINGLEBITONETEST_INCLUDED_
`define AXI4LITEMASTERWRITEWSTRBSINGLEBITONETEST_INCLUDED_

class Axi4LiteMasterWriteWstrbSingleBitOneTest extends Axi4LiteMasterWriteBaseTest;
  `uvm_component_utils(Axi4LiteMasterWriteWstrbSingleBitOneTest)

  Axi4LiteMasterWriteWstrbSeq axi4LiteMasterWriteWstrbSeq;
  extern function new(string name = "Axi4LiteMasterWriteWstrbSingleBitOneTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteWstrbSingleBitOneTest

function Axi4LiteMasterWriteWstrbSingleBitOneTest::new(string name = "Axi4LiteMasterWriteWstrbSingleBitOneTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteWstrbSingleBitOneTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteMasterWriteWstrbSeq = Axi4LiteMasterWriteWstrbSeq ::type_id::create("axi4LiteMasterWriteWstrbSeq");
endfunction : build_phase

task Axi4LiteMasterWriteWstrbSingleBitOneTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteWstrbSingleBitOneTest"),UVM_LOW);
    
   if(!axi4LiteMasterWriteWstrbSeq.randomize() with {$countones(wstrb) == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteWstrbSingleBitOneTest wstrb :%0h", axi4LiteMasterWriteWstrbSeq.wstrb),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteMasterWriteWstrbSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteWstrbSingleBitOneTest"),UVM_LOW);

endtask : run_phase

`endif


