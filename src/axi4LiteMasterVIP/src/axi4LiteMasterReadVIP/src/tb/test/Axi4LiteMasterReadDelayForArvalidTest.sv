`ifndef AXI4LITEMASTERREADDELAYFORARVALIDTEST_INCLUDED_
`define AXI4LITEMASTERREADDELAYFORARVALIDTEST_INCLUDED_

class Axi4LiteMasterReadDelayForArvalidTest extends Axi4LiteMasterReadBaseTest;
  `uvm_component_utils(Axi4LiteMasterReadDelayForArvalidTest)

  Axi4LiteMasterReadDelayForArvalidSeq axi4LiteMasterReadDelayForArvalidSeq;
  extern function new(string name = "Axi4LiteMasterReadDelayForArvalidTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterReadDelayForArvalidTest

function Axi4LiteMasterReadDelayForArvalidTest::new(string name = "Axi4LiteMasterReadDelayForArvalidTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterReadDelayForArvalidTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterReadDelayForArvalidTest::run_phase(uvm_phase phase);

  axi4LiteMasterReadDelayForArvalidSeq = Axi4LiteMasterReadDelayForArvalidSeq ::type_id::create("axi4LiteMasterReadDelayForWvalidSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterReadDelayForArvalidTest"),UVM_LOW);
    
   if(!axi4LiteMasterReadDelayForArvalidSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterReadDelayForArvalidTest delayForArvalid :%0d", axi4LiteMasterReadDelayForArvalidSeq.delayForArvalid),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteMasterReadDelayForArvalidSeq.start(axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterReadDelayForArvalidTest"),UVM_LOW);

endtask : run_phase

`endif


