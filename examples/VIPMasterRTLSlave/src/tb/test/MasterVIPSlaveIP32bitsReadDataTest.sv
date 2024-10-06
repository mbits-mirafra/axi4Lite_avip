`ifndef MASTERVIPSLAVEIP32BITSREADDATATEST_INCLUDED_
`define MASTERVIPSLAVEIP32BITSREADDATATEST_INCLUDED_

class MasterVIPSlaveIP32bitsReadDataTest extends MasterVIPSlaveIP32bitsWriteReadTest;
  `uvm_component_utils(MasterVIPSlaveIP32bitsReadDataTest)

  MasterVIPSlaveIPVirtual32bitsReadSeq masterVIPSlaveIPVirtual32bitsReadSeq;
  
  extern function new(string name = "MasterVIPSlaveIP32bitsReadDataTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : MasterVIPSlaveIP32bitsReadDataTest

function MasterVIPSlaveIP32bitsReadDataTest::new(string name = "MasterVIPSlaveIP32bitsReadDataTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIP32bitsReadDataTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  masterVIPSlaveIPVirtual32bitsReadSeq = MasterVIPSlaveIPVirtual32bitsReadSeq ::type_id::create("masterVIPSlaveIPVirtual32bitsReadSeq");
endfunction 

task MasterVIPSlaveIP32bitsReadDataTest::run_phase(uvm_phase phase);
  `uvm_info(get_type_name(),$sformatf("Inside run_phase MasterVIPSlaveIP32bitsReadDataTest"),UVM_LOW); 
   phase.raise_objection(this);
   super.run_phase(phase);
    masterVIPSlaveIPVirtual32bitsReadSeq.start(masterVIPSlaveIPEnv.masterVIPSlaveIPVirtualSequencer); 
   #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection MasterVIPSlaveIP32bitsReadDataTest"),UVM_LOW);

endtask : run_phase

`endif


