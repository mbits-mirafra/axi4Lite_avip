`ifndef MASTERVIPSLAVEIP32BITSWRITEREADTEST_INCLUDED_
`define MASTERVIPSLAVEIP32BITSWRITEREADTEST_INCLUDED_

class MasterVIPSlaveIP32bitsWriteReadTest extends MasterVIPSlaveIPBaseTest;
  `uvm_component_utils(MasterVIPSlaveIP32bitsWriteReadTest)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;

  extern function new(string name = "MasterVIPSlaveIP32bitsWriteReadTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : MasterVIPSlaveIP32bitsWriteReadTest

function MasterVIPSlaveIP32bitsWriteReadTest::new(string name = "MasterVIPSlaveIP32bitsWriteReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIP32bitsWriteReadTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq ::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq ::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
endfunction : build_phase

task MasterVIPSlaveIP32bitsWriteReadTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase MasterVIPSlaveIP32bitsWriteReadTest"),UVM_LOW);
    
   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end

   if(!axi4LiteMasterRead32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end

  phase.raise_objection(this);
  super.run_phase(phase);
  axi4LiteMasterWrite32bitsTransferSeq.start(masterVIPSlaveIPEnv.axi4LiteMasterEnv.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer); 
  axi4LiteMasterRead32bitsTransferSeq.start(masterVIPSlaveIPEnv.axi4LiteMasterEnv.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection MasterVIPSlaveIP32bitsWriteReadTest"),UVM_LOW);

endtask : run_phase

`endif


