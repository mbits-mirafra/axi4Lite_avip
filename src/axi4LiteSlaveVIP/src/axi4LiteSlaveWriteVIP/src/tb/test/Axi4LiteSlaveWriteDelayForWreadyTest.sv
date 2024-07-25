`ifndef AXI4LITESLAVEWRITEDELAYFORWREADYTEST_INCLUDED_
`define AXI4LITESLAVEWRITEDELAYFORWREADYTEST_INCLUDED_

class Axi4LiteSlaveWriteDelayForWreadyTest extends Axi4LiteSlaveWrite32bitsTransferTest;
  `uvm_component_utils(Axi4LiteSlaveWriteDelayForWreadyTest)

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

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveWriteDelayForWreadyTest"),UVM_LOW);

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForWreadySeq == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteSlaveWriteDelayForWreadyTest delayForWreadySeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForWreadySeq),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteSlaveWrite32bitsTransferSeq.start(axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[0].axi4LiteSlaveWriteSequencer);
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveWriteDelayForWreadyTest"),UVM_LOW);

endtask : run_phase

`endif


