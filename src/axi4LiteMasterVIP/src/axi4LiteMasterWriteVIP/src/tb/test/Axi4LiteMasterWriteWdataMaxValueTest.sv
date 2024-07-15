`ifndef AXI4LITEMASTERWRITEWDATAMAXVALUETEST_INCLUDED_
`define AXI4LITEMASTERWRITEWDATAMAXVALUETEST_INCLUDED_

class Axi4LiteMasterWriteWdataMaxValueTest extends Axi4LiteMasterWriteBaseTest;
  `uvm_component_utils(Axi4LiteMasterWriteWdataMaxValueTest)

  Axi4LiteMasterWriteWdataSeq axi4LiteMasterWriteWdataSeq;
  extern function new(string name = "Axi4LiteMasterWriteWdataMaxValueTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteWdataMaxValueTest

function Axi4LiteMasterWriteWdataMaxValueTest::new(string name = "Axi4LiteMasterWriteWdataMaxValueTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteWdataMaxValueTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteMasterWriteWdataSeq = Axi4LiteMasterWriteWdataSeq ::type_id::create("axi4LiteMasterWriteWdataSeq");
endfunction : build_phase

task Axi4LiteMasterWriteWdataMaxValueTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteWdataMaxValueTest"),UVM_LOW);
    
   if(!axi4LiteMasterWriteWdataSeq.randomize()with {wdata == 32'hFFFF_FFFF;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteWdataMaxValueTest wdata :%0d", axi4LiteMasterWriteWdataSeq.wdata),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteMasterWriteWdataSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteWdataMaxValueTest"),UVM_LOW);

endtask : run_phase

`endif


