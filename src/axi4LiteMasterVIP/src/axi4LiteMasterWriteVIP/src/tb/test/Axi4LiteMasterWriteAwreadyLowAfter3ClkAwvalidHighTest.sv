`ifndef AXI4LITEMASTERWRITEAWREADYLOWAFTER3CLKAWVALIDHIGHTEST_INCLUDED_
`define AXI4LITEMASTERWRITEAWREADYLOWAFTER3CLKAWVALIDHIGHTEST_INCLUDED_

class Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighTest extends Axi4LiteMasterWriteBaseTest;
  `uvm_component_utils(Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighTest)

  Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq;
  extern function new(string name = "Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighTest

function Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighTest::new(string name = "Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighTest::run_phase(uvm_phase phase);

  axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq = Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq ::type_id::create("axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighTest"),UVM_LOW);
    
   if(!axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq.randomize()with {delayForAwvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighTest delayForAwvalid :%0d", axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq.delayForAwvalid),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighTest"),UVM_LOW);

endtask : run_phase

`endif


