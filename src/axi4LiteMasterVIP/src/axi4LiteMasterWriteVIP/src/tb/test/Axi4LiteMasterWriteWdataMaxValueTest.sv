`ifndef AXI4LITEMASTERWRITEWDATAMAXVALUETEST_INCLUDED_
`define AXI4LITEMASTERWRITEWDATAMAXVALUETEST_INCLUDED_

class Axi4LiteMasterWriteWdataMaxValueTest extends Axi4LiteMasterWrite32bitsTransferTest;
  `uvm_component_utils(Axi4LiteMasterWriteWdataMaxValueTest)

  extern function new(string name = "Axi4LiteMasterWriteWdataMaxValueTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteWdataMaxValueTest

function Axi4LiteMasterWriteWdataMaxValueTest::new(string name = "Axi4LiteMasterWriteWdataMaxValueTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteWdataMaxValueTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterWriteWdataMaxValueTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteWdataMaxValueTest"),UVM_LOW);
    
   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize()with {wdataSeq == 32'hFFFF_FFFF;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteWdataMaxValueTest wdataSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.wdataSeq),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteMasterWrite32bitsTransferSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteWdataMaxValueTest"),UVM_LOW);

endtask : run_phase

`endif


