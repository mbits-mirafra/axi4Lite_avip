`ifndef AXI4LITESLAVEWRITEDELAYFORWREADYTEST_INCLUDED_
`define AXI4LITESLAVEWRITEDELAYFORWREADYTEST_INCLUDED_

class Axi4LiteSlaveWriteDelayForWreadyTest extends Axi4LiteSlaveWriteBaseTest;
  `uvm_component_utils(Axi4LiteSlaveWriteDelayForWreadyTest)

  Axi4LiteSlaveWriteDelayForWreadySeq axi4LiteSlaveWriteDelayForWreadySeq;
  extern function new(string name = "Axi4LiteSlaveWriteDelayForWreadyTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveWriteDelayForWreadyTest

function Axi4LiteSlaveWriteDelayForWreadyTest::new(string name = "Axi4LiteSlaveWriteDelayForWreadyTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveWriteDelayForWreadyTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteSlaveWriteDelayForWreadyTest::run_phase(uvm_phase phase);

  axi4LiteSlaveWriteDelayForWreadySeq = Axi4LiteSlaveWriteDelayForWreadySeq ::type_id::create("axi4LiteSlaveWriteDelayForWreadySeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveWriteDelayForWreadyTest"),UVM_LOW);

   if(!axi4LiteSlaveWriteDelayForWreadySeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteSlaveWriteDelayForWreadyTest delayForWready :%0d", axi4LiteSlaveWriteDelayForWreadySeq.delayForWready),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteSlaveWriteDelayForWreadySeq.start(axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[0].axi4LiteSlaveWriteSequencer);
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveWriteDelayForWreadyTest"),UVM_LOW);

endtask : run_phase

`endif


