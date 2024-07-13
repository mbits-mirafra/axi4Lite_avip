`ifndef AXI4LITESLAVEWRITEODDADDRESSTEST_INCLUDED_
`define AXI4LITESLAVEWRITEODDADDRESSTEST_INCLUDED_

class Axi4LiteSlaveWriteOddAddressTest extends Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeTest;
  `uvm_component_utils(Axi4LiteSlaveWriteOddAddressTest)

  extern function new(string name = "Axi4LiteSlaveWriteOddAddressTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveWriteOddAddressTest

function Axi4LiteSlaveWriteOddAddressTest::new(string name = "Axi4LiteSlaveWriteOddAddressTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveWriteOddAddressTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteSlaveWriteOddAddressTest::run_phase(uvm_phase phase);
  
  axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq = Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq ::type_id::create("axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq");
 
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveWriteOddAddressTest"),UVM_LOW);
    
   if(!axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq.randomize()with {awaddr == 45;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteSlaveWriteOddAddressTest awaddr :%0d", axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq.awaddr),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq.start(axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[0].axi4LiteSlaveWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveWriteOddAddressTest"),UVM_LOW);

endtask : run_phase

`endif


