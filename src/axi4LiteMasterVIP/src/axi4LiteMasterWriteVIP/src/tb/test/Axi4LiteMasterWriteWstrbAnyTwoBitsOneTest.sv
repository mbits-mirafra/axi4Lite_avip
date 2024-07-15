`ifndef AXI4LITEMASTERWRITEWSTRBANYTWOBITSONETEST_INCLUDED_
`define AXI4LITEMASTERWRITEWSTRBANYTWOBITSONETEST_INCLUDED_

class Axi4LiteMasterWriteWstrbAnyTwoBitsOneTest extends Axi4LiteMasterWriteWstrbSingleBitOneTest;
  `uvm_component_utils(Axi4LiteMasterWriteWstrbAnyTwoBitsOneTest)

  extern function new(string name = "Axi4LiteMasterWriteWstrbAnyTwoBitsOneTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteWstrbAnyTwoBitsOneTest

function Axi4LiteMasterWriteWstrbAnyTwoBitsOneTest::new(string name = "Axi4LiteMasterWriteWstrbAnyTwoBitsOneTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteWstrbAnyTwoBitsOneTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterWriteWstrbAnyTwoBitsOneTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteWstrbAnyTwoBitsOneTest"),UVM_LOW);
    
   if(!axi4LiteMasterWriteWstrbSeq.randomize() with {$countones(wstrb) == 2;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteWstrbAnyTwoBitsOneTest wstrb :%0h", axi4LiteMasterWriteWstrbSeq.wstrb),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteMasterWriteWstrbSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteWstrbAnyTwoBitsOneTest"),UVM_LOW);

endtask : run_phase

`endif


