`ifndef AXI4LITESLAVEREAD32BITSTRANSFERTEST_INCLUDED_
`define AXI4LITESLAVEREAD32BITSTRANSFERTEST_INCLUDED_

class Axi4LiteSlaveRead32bitsTransferTest extends Axi4LiteSlaveReadBaseTest;
  `uvm_component_utils(Axi4LiteSlaveRead32bitsTransferTest)

  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
  extern function new(string name = "Axi4LiteSlaveRead32bitsTransferTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveRead32bitsTransferTest

function Axi4LiteSlaveRead32bitsTransferTest::new(string name = "Axi4LiteSlaveRead32bitsTransferTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveRead32bitsTransferTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq ::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");
endfunction : build_phase

task Axi4LiteSlaveRead32bitsTransferTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveRead32bitsTransferTest"),UVM_LOW);
    
   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteSlaveRead32bitsTransferSeq.start(axi4LiteReadSlaveEnv.axi4LiteSlaveReadAgent[0].axi4LiteSlaveReadSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveRead32bitsTransferTest"),UVM_LOW);

endtask : run_phase

`endif


