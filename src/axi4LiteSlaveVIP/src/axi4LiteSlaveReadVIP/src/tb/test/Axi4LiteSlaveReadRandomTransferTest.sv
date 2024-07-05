`ifndef AXI4LITESLAVEREADRANDOMTRANSFERTEST_INCLUDED_
`define AXI4LITESLAVEREADRANDOMTRANSFERTEST_INCLUDED_

class Axi4LiteSlaveReadRandomTransferTest extends Axi4LiteSlaveReadBaseTest;
  `uvm_component_utils(Axi4LiteSlaveReadRandomTransferTest)

  Axi4LiteSlaveReadRandomTransferSeq axi4LiteSlaveReadRandomTransferSeq;
  extern function new(string name = "Axi4LiteSlaveReadRandomTransferTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveReadRandomTransferTest

function Axi4LiteSlaveReadRandomTransferTest::new(string name = "Axi4LiteSlaveReadRandomTransferTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveReadRandomTransferTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteSlaveReadRandomTransferTest::run_phase(uvm_phase phase);

  axi4LiteSlaveReadRandomTransferSeq = Axi4LiteSlaveReadRandomTransferSeq ::type_id::create("axi4LiteSlaveReadRandomTransferSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveReadRandomTransferTest"),UVM_LOW);

  phase.raise_objection(this);
   super.run_phase(phase);
  `uvm_info(get_type_name(),$sformatf("After raise_objection Axi4LiteSlaveReadRandomTransferTest"),UVM_LOW);

  axi4LiteSlaveReadRandomTransferSeq.start(axi4LiteReadSlaveEnv.axi4LiteSlaveReadAgent[0].axi4LiteSlaveReadSequencer); 
  #10;

  `uvm_info(get_type_name(),$sformatf("After start method Axi4LiteSlaveReadRandomTransferTest"),UVM_LOW);
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveReadRandomTransferTest"),UVM_LOW);

endtask : run_phase

`endif


