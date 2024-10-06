`ifndef MASTERVIPSLAVEIP32BITSWRITEDATATEST_INCLUDED_
`define MASTERVIPSLAVEIP32BITSWRITEDATATEST_INCLUDED_

class MasterVIPSlaveIP32bitsWriteDataTest extends MasterVIPSlaveIP32bitsWriteReadTest;
  `uvm_component_utils(MasterVIPSlaveIP32bitsWriteDataTest)

  MasterVIPSlaveIPVirtual32bitsWriteSeq masterVIPSlaveIPVirtual32bitsWriteSeq;
  extern function new(string name = "MasterVIPSlaveIP32bitsWriteDataTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : MasterVIPSlaveIP32bitsWriteDataTest

function MasterVIPSlaveIP32bitsWriteDataTest::new(string name = "MasterVIPSlaveIP32bitsWriteDataTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIP32bitsWriteDataTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  masterVIPSlaveIPVirtual32bitsWriteSeq = MasterVIPSlaveIPVirtual32bitsWriteSeq ::type_id::create("masterVIPSlaveIPVirtual32bitsWriteSeq");
endfunction 

task MasterVIPSlaveIP32bitsWriteDataTest::run_phase(uvm_phase phase);
  `uvm_info(get_type_name(),$sformatf("Inside run_phase MasterVIPSlaveIP32bitsWriteDataTest"),UVM_LOW); 
   phase.raise_objection(this);
   super.run_phase(phase);
    masterVIPSlaveIPVirtual32bitsWriteSeq.start(masterVIPSlaveIPEnv.masterVIPSlaveIPVirtualSequencer); 
   #10;
   phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection MasterVIPSlaveIP32bitsWriteDataTest"),UVM_LOW);

endtask : run_phase

`endif


