`ifndef AXI4LITEMASTERREADDELAYFORARVALIDTEST_INCLUDED_
`define AXI4LITEMASTERREADDELAYFORARVALIDTEST_INCLUDED_

class Axi4LiteMasterReadDelayForArvalidTest extends Axi4LiteMasterRead32bitsTransferTest;
  `uvm_component_utils(Axi4LiteMasterReadDelayForArvalidTest)

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

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterReadDelayForArvalidTest"),UVM_LOW);
    
   if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {delayForArvalidSeq == 4;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterReadDelayForArvalidTest delayForArvalidSeq :%0d", axi4LiteMasterRead32bitsTransferSeq.delayForArvalidSeq),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteMasterRead32bitsTransferSeq.start(axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterReadDelayForArvalidTest"),UVM_LOW);

endtask : run_phase

`endif


