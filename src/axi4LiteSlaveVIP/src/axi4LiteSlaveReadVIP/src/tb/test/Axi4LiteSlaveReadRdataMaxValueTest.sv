`ifndef AXI4LITESLAVEREADRDATAMAXVALUETEST_INCLUDED_
`define AXI4LITESLAVEREADRDATAMAXVALUETEST_INCLUDED_

class Axi4LiteSlaveReadRdataMaxValueTest extends Axi4LiteSlaveRead32bitsTransferTest;
  `uvm_component_utils(Axi4LiteSlaveReadRdataMaxValueTest)

  extern function new(string name = "Axi4LiteSlaveReadRdataMaxValueTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveReadRdataMaxValueTest

function Axi4LiteSlaveReadRdataMaxValueTest::new(string name = "Axi4LiteSlaveReadRdataMaxValueTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveReadRdataMaxValueTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteSlaveReadRdataMaxValueTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveReadRdataMaxValueTest"),UVM_LOW);
    
   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize()with {rdataSeq == 32'hFFFF_FFFF;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteSlaveReadRdataMaxValueTest rdataSeq :%0h", axi4LiteSlaveRead32bitsTransferSeq.rdataSeq),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteSlaveRead32bitsTransferSeq.start(axi4LiteReadSlaveEnv.axi4LiteSlaveReadAgent[0].axi4LiteSlaveReadSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveReadRdataMaxValueTest"),UVM_LOW);

endtask : run_phase

`endif


