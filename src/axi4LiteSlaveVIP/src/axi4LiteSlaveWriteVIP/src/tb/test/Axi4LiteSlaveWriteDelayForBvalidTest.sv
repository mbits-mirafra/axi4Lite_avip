`ifndef AXI4LITESLAVEWRITEDELAYFORBVALIDTEST_INCLUDED_
`define AXI4LITESLAVEWRITEDELAYFORBVALIDTEST_INCLUDED_

class Axi4LiteSlaveWriteDelayForBvalidTest extends Axi4LiteSlaveWriteBaseTest;
  `uvm_component_utils(Axi4LiteSlaveWriteDelayForBvalidTest)

  Axi4LiteSlaveWriteDelayForBvalidSeq axi4LiteSlaveWriteDelayForBvalidSeq;
  extern function new(string name = "Axi4LiteSlaveWriteDelayForBvalidTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveWriteDelayForBvalidTest

function Axi4LiteSlaveWriteDelayForBvalidTest::new(string name = "Axi4LiteSlaveWriteDelayForBvalidTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveWriteDelayForBvalidTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteSlaveWriteDelayForBvalidTest::run_phase(uvm_phase phase);

  axi4LiteSlaveWriteDelayForBvalidSeq = Axi4LiteSlaveWriteDelayForBvalidSeq ::type_id::create("axi4LiteSlaveWriteDelayForBvalidSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveWriteDelayForBvalidTest"),UVM_LOW);

   if(!axi4LiteSlaveWriteDelayForBvalidSeq.randomize() with {delayForBvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteSlaveWriteDelayForBvalidTest delayForBvalid :%0d", axi4LiteSlaveWriteDelayForBvalidSeq.delayForBvalid),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteSlaveWriteDelayForBvalidSeq.start(axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[0].axi4LiteSlaveWriteSequencer);
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveWriteDelayForBvalidTest"),UVM_LOW);

endtask : run_phase

`endif


