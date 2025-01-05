`ifndef SLAVEVIPMASTERIPADDRESSISOUTOFRANGETEST_INCLUDED_
`define SLAVEVIPMASTERIPADDRESSISOUTOFRANGETEST_INCLUDED_

class SlaveVIPMasterIPAddressIsOutOfRangeTest extends SlaveVIPMasterIP32bitsWriteReadTest;
  `uvm_component_utils(SlaveVIPMasterIPAddressIsOutOfRangeTest)

  extern function new(string name = "SlaveVIPMasterIPAddressIsOutOfRangeTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : SlaveVIPMasterIPAddressIsOutOfRangeTest

function SlaveVIPMasterIPAddressIsOutOfRangeTest::new(string name = "SlaveVIPMasterIPAddressIsOutOfRangeTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void SlaveVIPMasterIPAddressIsOutOfRangeTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction 

task SlaveVIPMasterIPAddressIsOutOfRangeTest::run_phase(uvm_phase phase);
  `uvm_info(get_type_name(),$sformatf("Inside run_phase SlaveVIPMasterIPAddressIsOutOfRangeTest"),UVM_LOW);
    
   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with{ awaddrSeq == 'hffff;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
   phase.raise_objection(this);
   axi4LiteMasterWrite32bitsTransferSeq.start(masterVIPSlaveIPEnv.axi4LiteMasterEnv.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer); 
   #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection SlaveVIPMasterIPAddressIsOutOfRangeTest"),UVM_LOW);

endtask : run_phase

`endif


