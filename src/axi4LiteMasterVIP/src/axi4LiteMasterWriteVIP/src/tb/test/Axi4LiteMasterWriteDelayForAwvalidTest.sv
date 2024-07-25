`ifndef AXI4LITEMASTERWRITEDELAYFORAWVALIDTEST_INCLUDED_
`define AXI4LITEMASTERWRITEDELAYFORAWVALIDTEST_INCLUDED_

class Axi4LiteMasterWriteDelayForAwvalidTest extends Axi4LiteMasterWrite32bitsTransferTest;
  `uvm_component_utils(Axi4LiteMasterWriteDelayForAwvalidTest)

  extern function new(string name = "Axi4LiteMasterWriteDelayForAwvalidTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteDelayForAwvalidTest

function Axi4LiteMasterWriteDelayForAwvalidTest::new(string name = "Axi4LiteMasterWriteDelayForAwvalidTest",
                                                     uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteDelayForAwvalidTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterWriteDelayForAwvalidTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteDelayForAwvalidTest"),UVM_LOW);
    
   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize()with {delayForAwvalidSeq == 4;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteDelayForAwvalidTest delayForAwvalidSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForAwvalidSeq),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteMasterWrite32bitsTransferSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteDelayForAwvalidTest"),UVM_LOW);

endtask : run_phase

`endif
