`ifndef AXI4LITEMASTERWRITEOUTOFRANGEADDRESSTEST_INCLUDED_
`define AXI4LITEMASTERWRITEOUTOFRANGEADDRESSTEST_INCLUDED_

class Axi4LiteMasterWriteOutOfRangeAddressTest extends Axi4LiteMasterWriteBaseTest;
  `uvm_component_utils(Axi4LiteMasterWriteOutOfRangeAddressTest)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;

  extern function new(string name = "Axi4LiteMasterWriteOutOfRangeAddressTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteOutOfRangeAddressTest

function Axi4LiteMasterWriteOutOfRangeAddressTest::new(string name = "Axi4LiteMasterWriteOutOfRangeAddressTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteOutOfRangeAddressTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq ::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
endfunction : build_phase

function void Axi4LiteMasterWriteOutOfRangeAddressTest::setupAxi4LiteMasterWriteAgentConfig();
  super.setupAxi4LiteMasterWriteAgentConfig();
  foreach(axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
  axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].minAddressRange = 1'b1;
  axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxAddressRange = 16'hffff;
end 
endfunction

task Axi4LiteMasterWriteOutOfRangeAddressTest::run_phase(uvm_phase phase);
  
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteOutOfRangeAddressTest"),UVM_LOW);
    
   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize()with {awaddrSeq > 16'hffff;}) begin
       `uvm_error(get_type_name(), "Randomization failed ")
   end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteMasterWriteOutOfRangeAddressTest awaddrSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.awaddrSeq),UVM_LOW);

  phase.raise_objection(this);
  axi4LiteMasterWrite32bitsTransferSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteOutOfRangeAddressTest"),UVM_LOW);

endtask : run_phase

`endif


