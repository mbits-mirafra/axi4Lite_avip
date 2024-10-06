`ifndef AXI4LITESLAVEWRITERANDOMTRANSFERTEST_INCLUDED_
`define AXI4LITESLAVEWRITERANDOMTRANSFERTEST_INCLUDED_

class Axi4LiteSlaveWriteRandomTransferTest extends Axi4LiteSlaveWriteBaseTest;
  `uvm_component_utils(Axi4LiteSlaveWriteRandomTransferTest)

  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  extern function new(string name = "Axi4LiteSlaveWriteRandomTransferTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveWriteRandomTransferTest

function Axi4LiteSlaveWriteRandomTransferTest::new(string name = "Axi4LiteSlaveWriteRandomTransferTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveWriteRandomTransferTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteSlaveWriteRandomTransferTest::run_phase(uvm_phase phase);

  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveWriteRandomTransferTest"),UVM_LOW);

  phase.raise_objection(this);
   super.run_phase(phase);
  `uvm_info(get_type_name(),$sformatf("After raise_objection Axi4LiteSlaveWriteRandomTransferTest"),UVM_LOW);

  axi4LiteSlaveWrite32bitsTransferSeq.start(axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[0].axi4LiteSlaveWriteSequencer); 
  #10;

  `uvm_info(get_type_name(),$sformatf("After start method Axi4LiteSlaveWriteRandomTransferTest"),UVM_LOW);
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveWriteRandomTransferTest"),UVM_LOW);

endtask : run_phase

`endif


