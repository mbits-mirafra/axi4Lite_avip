`ifndef AXI4LITEMASTERWRITEDELAYFORBREADYTEST_INCLUDED_
`define AXI4LITEMASTERWRITEDELAYFORBREADYTEST_INCLUDED_

class Axi4LiteMasterWriteDelayForBreadyTest extends Axi4LiteMasterWrite32bitsTransferTest;
  `uvm_component_utils(Axi4LiteMasterWriteDelayForBreadyTest)

  extern function new(string name = "Axi4LiteMasterWriteDelayForBreadyTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteDelayForBreadyTest

function Axi4LiteMasterWriteDelayForBreadyTest::new(string name = "Axi4LiteMasterWriteDelayForBreadyTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteDelayForBreadyTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterWriteDelayForBreadyTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteDelayForBreadyTest"),UVM_LOW);
    
   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForBreadySeq == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteDelayForBreadyTest delayForBreadySeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForBreadySeq),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteMasterWrite32bitsTransferSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteDelayForBreadyTest"),UVM_LOW);

endtask : run_phase

`endif


