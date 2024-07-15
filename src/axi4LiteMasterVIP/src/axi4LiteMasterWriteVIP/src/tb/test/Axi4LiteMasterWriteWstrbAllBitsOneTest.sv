`ifndef AXI4LITEMASTERWRITEWSTRBALLBITSONETEST_INCLUDED_
`define AXI4LITEMASTERWRITEWSTRBALLBITSONETEST_INCLUDED_

class Axi4LiteMasterWriteWstrbAllBitsOneTest extends Axi4LiteMasterWriteWstrbSingleBitOneTest;
  `uvm_component_utils(Axi4LiteMasterWriteWstrbAllBitsOneTest)

  extern function new(string name = "Axi4LiteMasterWriteWstrbAllBitsOneTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteWstrbAllBitsOneTest

function Axi4LiteMasterWriteWstrbAllBitsOneTest::new(string name = "Axi4LiteMasterWriteWstrbAllBitsOneTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteWstrbAllBitsOneTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterWriteWstrbAllBitsOneTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteWstrbAllBitsOneTest"),UVM_LOW);
    
   if(!axi4LiteMasterWriteWstrbSeq.randomize() with {wstrb == 4'hf;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteWstrbAllBitsOneTest wstrb :%0h", axi4LiteMasterWriteWstrbSeq.wstrb),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteMasterWriteWstrbSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteWstrbAllBitsOneTest"),UVM_LOW);

endtask : run_phase

`endif


