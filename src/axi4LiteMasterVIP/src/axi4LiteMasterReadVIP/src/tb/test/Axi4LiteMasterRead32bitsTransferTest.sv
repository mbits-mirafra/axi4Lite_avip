`ifndef AXI4LITEMASTERREAD32BITSTRANSFERTEST_INCLUDED_
`define AXI4LITEMASTERREAD32BITSTRANSFERTEST_INCLUDED_

class Axi4LiteMasterRead32bitsTransferTest extends Axi4LiteMasterReadBaseTest;
  `uvm_component_utils(Axi4LiteMasterRead32bitsTransferTest)

  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  extern function new(string name = "Axi4LiteMasterRead32bitsTransferTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterRead32bitsTransferTest

function Axi4LiteMasterRead32bitsTransferTest::new(string name = "Axi4LiteMasterRead32bitsTransferTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterRead32bitsTransferTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq ::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
endfunction : build_phase

task Axi4LiteMasterRead32bitsTransferTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterRead32bitsTransferTest"),UVM_LOW);
    
   if(!axi4LiteMasterRead32bitsTransferSeq.randomize()with { arprotSeq == 3'b010;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterRead32bitsTransferTest arprotSeq :%0h", axi4LiteMasterRead32bitsTransferSeq.arprotSeq),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteMasterRead32bitsTransferSeq.start(axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterRead32bitsTransferTest"),UVM_LOW);

endtask : run_phase

`endif


