`ifndef AXI4LITEMASTERWRITEMODBY4ADDRESSTEST_INCLUDED_
`define AXI4LITEMASTERWRITEMODBY4ADDRESSTEST_INCLUDED_

class Axi4LiteMasterWriteModBy4AddressTest extends Axi4LiteMasterWrite32bitsTransferTest;
  `uvm_component_utils(Axi4LiteMasterWriteModBy4AddressTest)

  extern function new(string name = "Axi4LiteMasterWriteModBy4AddressTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteModBy4AddressTest

function Axi4LiteMasterWriteModBy4AddressTest::new(string name = "Axi4LiteMasterWriteModBy4AddressTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteModBy4AddressTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterWriteModBy4AddressTest::run_phase(uvm_phase phase);
  
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteModBy4AddressTest"),UVM_LOW);
    
   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize()with {awaddrSeq%4 == 0;}) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteModBy4AddressTest awaddrSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.awaddrSeq),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteMasterWrite32bitsTransferSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteModBy4AddressTest"),UVM_LOW);

endtask : run_phase

`endif


