`ifndef AXI4LITESLAVEREADRDATATOGGLEVALUETEST_INCLUDED_
`define AXI4LITESLAVEREADRDATATOGGLEVALUETEST_INCLUDED_

class Axi4LiteSlaveReadRdataToggleValueTest extends Axi4LiteSlaveRead32bitsTransferTest;
  `uvm_component_utils(Axi4LiteSlaveReadRdataToggleValueTest)

  extern function new(string name = "Axi4LiteSlaveReadRdataToggleValueTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveReadRdataToggleValueTest

function Axi4LiteSlaveReadRdataToggleValueTest::new(string name = "Axi4LiteSlaveReadRdataToggleValueTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveReadRdataToggleValueTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteSlaveReadRdataToggleValueTest::run_phase(uvm_phase phase);
  
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveReadRdataToggleValueTest"),UVM_LOW);
    
   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {rdataSeq == 32'hAAAA_AAAA;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteSlaveReadRdataToggleValueTest rdataSeq :%0h", axi4LiteSlaveRead32bitsTransferSeq.rdataSeq),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteSlaveRead32bitsTransferSeq.start(axi4LiteReadSlaveEnv.axi4LiteSlaveReadAgent[0].axi4LiteSlaveReadSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveReadRdataToggleValueTest"),UVM_LOW);

endtask : run_phase

`endif


