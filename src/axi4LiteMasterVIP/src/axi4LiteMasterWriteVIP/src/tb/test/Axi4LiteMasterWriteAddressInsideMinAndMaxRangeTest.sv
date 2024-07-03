`ifndef AXI4LITEMASTERWRITEADDRESSINSIDEMINANDMAXRANGETEST_INCLUDED_
`define AXI4LITEMASTERWRITEADDRESSINSIDEMINANDMAXRANGETEST_INCLUDED_

class Axi4LiteMasterWriteAddressInsideMinAndMaxRangeTest extends Axi4LiteMasterWriteBaseTest;
  `uvm_component_utils(Axi4LiteMasterWriteAddressInsideMinAndMaxRangeTest)

  Axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq;
  extern function new(string name = "Axi4LiteMasterWriteAddressInsideMinAndMaxRangeTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteAddressInsideMinAndMaxRangeTest

function Axi4LiteMasterWriteAddressInsideMinAndMaxRangeTest::new(string name = "Axi4LiteMasterWriteAddressInsideMinAndMaxRangeTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteAddressInsideMinAndMaxRangeTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterWriteAddressInsideMinAndMaxRangeTest::run_phase(uvm_phase phase);

  axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq = Axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq ::type_id::create("axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteAddressInsideMinAndMaxRangeTest"),UVM_LOW);
    
   if(!axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteAddressInsideMinAndMaxRangeTest awaddr :%0d", axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq.awaddr),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteAddressInsideMinAndMaxRangeTest"),UVM_LOW);

endtask : run_phase

`endif


