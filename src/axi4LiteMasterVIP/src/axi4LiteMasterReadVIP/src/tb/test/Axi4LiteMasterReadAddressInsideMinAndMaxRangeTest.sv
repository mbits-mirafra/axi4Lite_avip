`ifndef AXI4LITEMASTERREADADDRESSINSIDEMINANDMAXRANGETEST_INCLUDED_
`define AXI4LITEMASTERREADADDRESSINSIDEMINANDMAXRANGETEST_INCLUDED_

class Axi4LiteMasterReadAddressInsideMinAndMaxRangeTest extends Axi4LiteMasterReadBaseTest;
  `uvm_component_utils(Axi4LiteMasterReadAddressInsideMinAndMaxRangeTest)

  Axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq;
  extern function new(string name = "Axi4LiteMasterReadAddressInsideMinAndMaxRangeTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterReadAddressInsideMinAndMaxRangeTest

function Axi4LiteMasterReadAddressInsideMinAndMaxRangeTest::new(string name = "Axi4LiteMasterReadAddressInsideMinAndMaxRangeTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterReadAddressInsideMinAndMaxRangeTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterReadAddressInsideMinAndMaxRangeTest::run_phase(uvm_phase phase);

  axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq = Axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq ::type_id::create("axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterReadAddressInsideMinAndMaxRangeTest"),UVM_LOW);
    
   if(!axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterReadAddressInsideMinAndMaxRangeTest araddr :%0d", axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq.araddr),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq.start(axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterReadAddressInsideMinAndMaxRangeTest"),UVM_LOW);

endtask : run_phase

`endif


