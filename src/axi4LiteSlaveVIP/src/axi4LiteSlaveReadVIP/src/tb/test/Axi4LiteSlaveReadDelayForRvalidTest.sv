`ifndef AXI4LITESLAVEREADDELAYFORRVALIDTEST_INCLUDED_
`define AXI4LITESLAVEREADDELAYFORRVALIDTEST_INCLUDED_

class Axi4LiteSlaveReadDelayForRvalidTest extends Axi4LiteSlaveReadBaseTest;
  `uvm_component_utils(Axi4LiteSlaveReadDelayForRvalidTest)

  Axi4LiteSlaveReadDelayForRvalidSeq axi4LiteSlaveReadDelayForRvalidSeq;
  extern function new(string name = "Axi4LiteSlaveReadDelayForRvalidTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveReadDelayForRvalidTest

function Axi4LiteSlaveReadDelayForRvalidTest::new(string name = "Axi4LiteSlaveReadDelayForRvalidTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveReadDelayForRvalidTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteSlaveReadDelayForRvalidTest::run_phase(uvm_phase phase);

  axi4LiteSlaveReadDelayForRvalidSeq = Axi4LiteSlaveReadDelayForRvalidSeq ::type_id::create("axi4LiteSlaveReadDelayForRvalidSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveReadDelayForRvalidTest"),UVM_LOW);

   if(!axi4LiteSlaveReadDelayForRvalidSeq.randomize() with {delayForRvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteSlaveReadDelayForRvalidTest delayForRvalid :%0d", axi4LiteSlaveReadDelayForRvalidSeq.delayForRvalid),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteSlaveReadDelayForRvalidSeq.start(axi4LiteReadSlaveEnv.axi4LiteSlaveReadAgent[0].axi4LiteSlaveReadSequencer);
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveReadDelayForRvalidTest"),UVM_LOW);

endtask : run_phase

`endif


