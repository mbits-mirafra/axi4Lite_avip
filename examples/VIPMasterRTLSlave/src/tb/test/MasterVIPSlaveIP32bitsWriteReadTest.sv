`ifndef MASTERVIPSLAVEIP32BITSWRITEREADTEST_INCLUDED_
`define MASTERVIPSLAVEIP32BITSWRITEREADTEST_INCLUDED_

class MasterVIPSlaveIP32bitsWriteReadTest extends MasterVIPSlaveIPBaseTest;
  `uvm_component_utils(MasterVIPSlaveIP32bitsWriteReadTest)

  MasterVIPSlaveIPVirtual32bitsWriteReadSeq masterVIPSlaveIPVirtual32bitsWriteReadSeq;

  extern function new(string name = "MasterVIPSlaveIP32bitsWriteReadTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : MasterVIPSlaveIP32bitsWriteReadTest

function MasterVIPSlaveIP32bitsWriteReadTest::new(string name = "MasterVIPSlaveIP32bitsWriteReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIP32bitsWriteReadTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  masterVIPSlaveIPVirtual32bitsWriteReadSeq = MasterVIPSlaveIPVirtual32bitsWriteReadSeq ::type_id::create("masterVIPSlaveIPVirtual32bitsWriteReadSeq");
endfunction : build_phase

task MasterVIPSlaveIP32bitsWriteReadTest::run_phase(uvm_phase phase);

  `uvm_info(get_type_name(),$sformatf("Inside run_phase MasterVIPSlaveIP32bitsWriteReadTest"),UVM_LOW);
  phase.raise_objection(this);
  super.run_phase(phase);
    masterVIPSlaveIPVirtual32bitsWriteReadSeq.start(masterVIPSlaveIPEnv.masterVIPSlaveIPVirtualSequencer); 
  #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection MasterVIPSlaveIP32bitsWriteReadTest"),UVM_LOW);

endtask : run_phase

`endif


