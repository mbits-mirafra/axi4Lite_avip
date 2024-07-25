`ifndef AXI4LITEMASTERWRITEWSTRBANYTHREEBITSONETEST_INCLUDED_
`define AXI4LITEMASTERWRITEWSTRBANYTHREEBITSONETEST_INCLUDED_

class Axi4LiteMasterWriteWstrbAnyThreeBitsOneTest extends Axi4LiteMasterWrite32bitsTransferTest;
  `uvm_component_utils(Axi4LiteMasterWriteWstrbAnyThreeBitsOneTest)

  extern function new(string name = "Axi4LiteMasterWriteWstrbAnyThreeBitsOneTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteWstrbAnyThreeBitsOneTest

function Axi4LiteMasterWriteWstrbAnyThreeBitsOneTest::new(string name = "Axi4LiteMasterWriteWstrbAnyThreeBitsOneTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteWstrbAnyThreeBitsOneTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterWriteWstrbAnyThreeBitsOneTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteWstrbAnyThreeBitsOneTest"),UVM_LOW);
    
   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {$countones(wstrbSeq) == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteWstrbAnyThreeBitsOneTest wstrbSeq :%0h", axi4LiteMasterWrite32bitsTransferSeq.wstrbSeq),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteMasterWrite32bitsTransferSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteWstrbAnyThreeBitsOneTest"),UVM_LOW);

endtask : run_phase

`endif


