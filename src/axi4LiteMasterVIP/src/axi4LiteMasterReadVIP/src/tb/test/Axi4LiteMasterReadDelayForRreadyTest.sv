`ifndef AXI4LITEMASTERREADDELAYFORRREADYTEST_INCLUDED_
`define AXI4LITEMASTERREADDELAYFORRREADYTEST_INCLUDED_

class Axi4LiteMasterReadDelayForRreadyTest extends Axi4LiteMasterRead32bitsTransferTest;
  `uvm_component_utils(Axi4LiteMasterReadDelayForRreadyTest)

  extern function new(string name = "Axi4LiteMasterReadDelayForRreadyTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterReadDelayForRreadyTest

function Axi4LiteMasterReadDelayForRreadyTest::new(string name = "Axi4LiteMasterReadDelayForRreadyTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterReadDelayForRreadyTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterReadDelayForRreadyTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterReadDelayForRreadyTest"),UVM_LOW);
    
   if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {delayForRreadySeq == 4;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterReadDelayForRreadyTest delayForRreadySeq :%0d", axi4LiteMasterRead32bitsTransferSeq.delayForRreadySeq),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteMasterRead32bitsTransferSeq.start(axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterReadDelayForRreadyTest"),UVM_LOW);

endtask : run_phase

`endif


