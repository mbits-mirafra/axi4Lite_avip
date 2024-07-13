`ifndef AXI4LITESLAVEWRITEADDRESSINSIDEMINANDMAXRANGETEST_INCLUDED_
`define AXI4LITESLAVEWRITEADDRESSINSIDEMINANDMAXRANGETEST_INCLUDED_

class Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeTest extends Axi4LiteSlaveWriteBaseTest;
  `uvm_component_utils(Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeTest)

  Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq;
  extern function new(string name = "Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeTest

function Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeTest::new(string name = "Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeTest::run_phase(uvm_phase phase);

  axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq = Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq ::type_id::create("axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeTest"),UVM_LOW);
    
   if(!axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeTest awaddr :%0d", axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq.awaddr),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq.start(axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[0].axi4LiteSlaveWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeTest"),UVM_LOW);

endtask : run_phase

`endif


