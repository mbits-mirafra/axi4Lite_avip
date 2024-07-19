`ifndef AXI4LITEMASTERWRITE32BITSTRANSFERTEST_INCLUDED_
`define AXI4LITEMASTERWRITE32BITSTRANSFERTEST_INCLUDED_

class Axi4LiteMasterWrite32bitsTransferTest extends Axi4LiteMasterWriteBaseTest;
  `uvm_component_utils(Axi4LiteMasterWrite32bitsTransferTest)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  extern function new(string name = "Axi4LiteMasterWrite32bitsTransferTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWrite32bitsTransferTest

function Axi4LiteMasterWrite32bitsTransferTest::new(string name = "Axi4LiteMasterWrite32bitsTransferTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWrite32bitsTransferTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq ::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
endfunction : build_phase

task Axi4LiteMasterWrite32bitsTransferTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWrite32bitsTransferTest"),UVM_LOW);
    
   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize()with { awprot == 3'b010;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWrite32bitsTransferTest wdata :%0d", axi4LiteMasterWrite32bitsTransferSeq.wdata),UVM_LOW);

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteMasterWrite32bitsTransferSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWrite32bitsTransferTest"),UVM_LOW);

endtask : run_phase

`endif


