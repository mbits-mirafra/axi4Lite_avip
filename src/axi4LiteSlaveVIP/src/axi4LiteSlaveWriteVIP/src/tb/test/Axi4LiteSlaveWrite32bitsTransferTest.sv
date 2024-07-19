`ifndef AXI4LITESLAVEWRITE32BITSTRANSFERTEST_INCLUDED_
`define AXI4LITESLAVEWRITE32BITSTRANSFERTEST_INCLUDED_

class Axi4LiteSlaveWrite32bitsTransferTest extends Axi4LiteSlaveWriteBaseTest;
  `uvm_component_utils(Axi4LiteSlaveWrite32bitsTransferTest)

  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  extern function new(string name = "Axi4LiteSlaveWrite32bitsTransferTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveWrite32bitsTransferTest

function Axi4LiteSlaveWrite32bitsTransferTest::new(string name = "Axi4LiteSlaveWrite32bitsTransferTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveWrite32bitsTransferTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq ::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
endfunction : build_phase

task Axi4LiteSlaveWrite32bitsTransferTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveWrite32bitsTransferTest"),UVM_LOW);
    
   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteSlaveWrite32bitsTransferTest wdata :%0d", axi4LiteSlaveWrite32bitsTransferSeq.wdata),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteSlaveWrite32bitsTransferSeq.start(axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[0].axi4LiteSlaveWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveWrite32bitsTransferTest"),UVM_LOW);

endtask : run_phase

`endif


