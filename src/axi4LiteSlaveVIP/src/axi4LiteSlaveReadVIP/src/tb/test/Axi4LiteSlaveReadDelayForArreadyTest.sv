`ifndef AXI4LITESLAVEREADDELAYFORARREADYTEST_INCLUDED_
`define AXI4LITESLAVEREADDELAYFORARREADYTEST_INCLUDED_

class Axi4LiteSlaveReadDelayForArreadyTest extends Axi4LiteSlaveRead32bitsTransferTest;
  `uvm_component_utils(Axi4LiteSlaveReadDelayForArreadyTest)

  extern function new(string name = "Axi4LiteSlaveReadDelayForArreadyTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveReadDelayForArreadyTest

function Axi4LiteSlaveReadDelayForArreadyTest::new(string name = "Axi4LiteSlaveReadDelayForArreadyTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveReadDelayForArreadyTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteSlaveReadDelayForArreadyTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveReadDelayForArreadyTest"),UVM_LOW);

   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForArreadySeq == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteSlaveReadDelayForArreadyTest delayForArreadySeq :%0d", axi4LiteSlaveRead32bitsTransferSeq.delayForArreadySeq),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteSlaveRead32bitsTransferSeq.start(axi4LiteReadSlaveEnv.axi4LiteSlaveReadAgent[0].axi4LiteSlaveReadSequencer);
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveReadDelayForArreadyTest"),UVM_LOW);

endtask : run_phase

`endif


