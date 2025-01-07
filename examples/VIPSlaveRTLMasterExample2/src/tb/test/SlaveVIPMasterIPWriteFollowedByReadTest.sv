`ifndef SLAVEVIPMASTERIPWRITEFOLLOWEDBYREADTEST_INCLUDED_
`define SLAVEVIPMASTERIPWRITEFOLLOWEDBYREADTEST_INCLUDED_

class SlaveVIPMasterIPWriteFollowedByReadTest extends SlaveVIPMasterIPBaseTest;
  `uvm_component_utils(SlaveVIPMasterIPWriteFollowedByReadTest)

  SlaveVIPMasterIPVirtualWriteFollowedByReadSeq slaveVIPMasterIPVirtualWriteFollowedByReadSeq;

  extern function new(string name = "SlaveVIPMasterIPWriteFollowedByReadTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : SlaveVIPMasterIPWriteFollowedByReadTest

function SlaveVIPMasterIPWriteFollowedByReadTest::new(string name = "SlaveVIPMasterIPWriteFollowedByReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void SlaveVIPMasterIPWriteFollowedByReadTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  slaveVIPMasterIPVirtualWriteFollowedByReadSeq = SlaveVIPMasterIPVirtualWriteFollowedByReadSeq ::type_id::create("slaveVIPMasterIPVirtualWriteFollowedByReadSeq");
endfunction : build_phase

task SlaveVIPMasterIPWriteFollowedByReadTest::run_phase(uvm_phase phase);
  int maxRepeatCounter = 0;
  `uvm_info(get_type_name(),$sformatf("Inside run_phase SlaveVIPMasterIPWriteFollowedByReadTest"),UVM_LOW);
  phase.raise_objection(this);
    while(slaveVIPMasterIPEnv.axi4LiteMasterEnv.axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteCoverage.axi4LiteMasterWriteTransactionCovergroup.get_inst_coverage() < 100 && 
  slaveVIPMasterIPEnv.axi4LiteMasterEnv.axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadCoverage.axi4LiteMasterReadTransactionCovergroup.get_inst_coverage() < 100 ) begin
    slaveVIPMasterIPVirtualWriteFollowedByReadSeq.start(slaveVIPMasterIPEnv.slaveVIPMasterIPVirtualSequencer); 
  #10;
  maxRepeatCounter++;
  
   if(maxRepeatCounter == 100) begin
     `uvm_info(get_type_name(), "maxRepeatCounter reached 100,So exiting loop", UVM_LOW);
     break;
   end
 end

  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection SlaveVIPMasterIPWriteFollowedByReadTest"),UVM_LOW);

endtask : run_phase

`endif


