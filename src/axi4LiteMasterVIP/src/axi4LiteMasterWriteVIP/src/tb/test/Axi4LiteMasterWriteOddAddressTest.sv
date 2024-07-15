`ifndef AXI4LITEMASTERWRITEODDADDRESSTEST_INCLUDED_
`define AXI4LITEMASTERWRITEODDADDRESSTEST_INCLUDED_

class Axi4LiteMasterWriteOddAddressTest extends Axi4LiteMasterWriteAddressInsideMinAndMaxRangeTest;
  `uvm_component_utils(Axi4LiteMasterWriteOddAddressTest)

  extern function new(string name = "Axi4LiteMasterWriteOddAddressTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteOddAddressTest

function Axi4LiteMasterWriteOddAddressTest::new(string name = "Axi4LiteMasterWriteOddAddressTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteOddAddressTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterWriteOddAddressTest::run_phase(uvm_phase phase);
 
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteOddAddressTest"),UVM_LOW);
    
   if(!axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq.randomize()with {awaddr == 45;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteOddAddressTest awaddr :%0d", axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq.awaddr),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteOddAddressTest"),UVM_LOW);

endtask : run_phase

`endif


