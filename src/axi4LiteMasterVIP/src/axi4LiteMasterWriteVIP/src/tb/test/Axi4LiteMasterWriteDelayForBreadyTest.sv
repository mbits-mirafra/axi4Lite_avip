`ifndef AXI4LITEMASTERWRITEDELAYFORBREADYTEST_INCLUDED_
`define AXI4LITEMASTERWRITEDELAYFORBREADYTEST_INCLUDED_

class Axi4LiteMasterWriteDelayForBreadyTest extends Axi4LiteMasterWriteBaseTest;
  `uvm_component_utils(Axi4LiteMasterWriteDelayForBreadyTest)

  Axi4LiteMasterWriteDelayForBreadySeq axi4LiteMasterWriteDelayForBreadySeq;
  extern function new(string name = "Axi4LiteMasterWriteDelayForBreadyTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteDelayForBreadyTest

function Axi4LiteMasterWriteDelayForBreadyTest::new(string name = "Axi4LiteMasterWriteDelayForBreadyTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteDelayForBreadyTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteMasterWriteDelayForBreadySeq = Axi4LiteMasterWriteDelayForBreadySeq ::type_id::create("axi4LiteMasterWriteDelayForWvalidSeq");
endfunction : build_phase

task Axi4LiteMasterWriteDelayForBreadyTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteDelayForBreadyTest"),UVM_LOW);
    
   if(!axi4LiteMasterWriteDelayForBreadySeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteDelayForBreadyTest delayForBready :%0d", axi4LiteMasterWriteDelayForBreadySeq.delayForBready),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteMasterWriteDelayForBreadySeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteDelayForBreadyTest"),UVM_LOW);

endtask : run_phase

`endif


