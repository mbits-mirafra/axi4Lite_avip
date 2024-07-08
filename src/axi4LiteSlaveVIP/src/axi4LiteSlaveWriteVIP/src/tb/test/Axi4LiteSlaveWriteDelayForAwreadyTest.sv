
`ifndef AXI4LITESLAVEWRITEDELAYFORAWREADYTEST_INCLUDED_
`define AXI4LITESLAVEWRITEDELAYFORAWREADYTEST_INCLUDED_

class Axi4LiteSlaveWriteDelayForAwreadyTest extends Axi4LiteSlaveWriteBaseTest;
  `uvm_component_utils(Axi4LiteSlaveWriteDelayForAwreadyTest)

  Axi4LiteSlaveWriteDelayForAwreadySeq axi4LiteSlaveWriteDelayForAwreadySeq;
  extern function new(string name = "Axi4LiteSlaveWriteDelayForAwreadyTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveWriteDelayForAwreadyTest

function Axi4LiteSlaveWriteDelayForAwreadyTest::new(string name = "Axi4LiteSlaveWriteDelayForAwreadyTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveWriteDelayForAwreadyTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteSlaveWriteDelayForAwreadyTest::run_phase(uvm_phase phase);

  axi4LiteSlaveWriteDelayForAwreadySeq = Axi4LiteSlaveWriteDelayForAwreadySeq ::type_id::create("axi4LiteSlaveWriteDelayForAwreadySeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveWriteDelayForAwreadyTest"),UVM_LOW);

   if(!axi4LiteSlaveWriteDelayForAwreadySeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteSlaveWriteDelayForAwreadyTest delayForAwready :%0d", axi4LiteSlaveWriteDelayForAwreadySeq.delayForAwready),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteSlaveWriteDelayForAwreadySeq.start(axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[0].axi4LiteSlaveWriteSequencer);
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveWriteDelayForAwreadyTest"),UVM_LOW);

endtask : run_phase

`endif


