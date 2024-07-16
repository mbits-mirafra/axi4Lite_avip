`ifndef AXI4LITEMASTERWRITEDELAYFORAWVALIDTEST_INCLUDED_
`define AXI4LITEMASTERWRITEDELAYFORAWVALIDTEST_INCLUDED_

class Axi4LiteMasterWriteDelayForAwvalidTest extends Axi4LiteMasterWriteBaseTest;
  `uvm_component_utils(Axi4LiteMasterWriteDelayForAwvalidTest)

  Axi4LiteMasterWriteDelayForAwvalidSeq axi4LiteMasterWriteDelayForAwvalidSeq;
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
  axi4LiteMasterWriteDelayForAwvalidSeq = Axi4LiteMasterWriteDelayForAwvalidSeq ::type_id::create("axi4LiteMasterWriteDelayForAwvalidSeq");
endfunction : build_phase

task Axi4LiteMasterWriteDelayForAwvalidTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteDelayForAwvalidTest"),UVM_LOW);
    
   if(!axi4LiteMasterWriteDelayForAwvalidSeq.randomize()with {delayForAwvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteDelayForAwvalidTest delayForAwvalid :%0d", axi4LiteMasterWriteDelayForAwvalidSeq.delayForAwvalid),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteMasterWriteDelayForAwvalidSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteDelayForAwvalidTest"),UVM_LOW);

endtask : run_phase

`endif


