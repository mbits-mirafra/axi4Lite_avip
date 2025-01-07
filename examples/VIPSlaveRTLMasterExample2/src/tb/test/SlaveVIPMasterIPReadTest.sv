`ifndef SLAVEVIPMASTERIPREADTEST_INCLUDED_
`define SLAVEVIPMASTERIPREADTEST_INCLUDED_

class SlaveVIPMasterIPReadTest extends SlaveVIPMasterIPBaseTest;
  `uvm_component_utils(SlaveVIPMasterIPReadTest)

  SlaveVIPMasterIPVirtualReadSeq slaveVIPMasterIPVirtualReadSeq;
  
  extern function new(string name = "SlaveVIPMasterIPReadTest", uvm_component parent = null);
  extern function void setupSlaveVIPMasterIPEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : SlaveVIPMasterIPReadTest

function SlaveVIPMasterIPReadTest::new(string name = "SlaveVIPMasterIPReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void SlaveVIPMasterIPReadTest::setupSlaveVIPMasterIPEnvConfig();
 super.setupSlaveVIPMasterIPEnvConfig();
 slaveVIPMasterIPEnvConfig.transactionType = Axi4LiteReadSlaveGlobalPkg::READ;
endfunction : setupSlaveVIPMasterIPEnvConfig

task SlaveVIPMasterIPReadTest::run_phase(uvm_phase phase);
  int maxRepeatCounter = 0;
  slaveVIPMasterIPVirtualReadSeq = SlaveVIPMasterIPVirtualReadSeq ::type_id::create("slaveVIPMasterIPVirtualReadSeq");
 
  `uvm_info(get_type_name(),$sformatf("Inside run_phase SlaveVIPMasterIPReadTest"),UVM_LOW); 
   phase.raise_objection(this);
    while(slaveVIPMasterIPEnv.axi4LiteMasterEnv.axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadCoverage.axi4LiteMasterReadTransactionCovergroup.get_inst_coverage() < 100) begin
    slaveVIPMasterIPVirtualReadSeq.start(slaveVIPMasterIPEnv.slaveVIPMasterIPVirtualSequencer); 
   #10;
   maxRepeatCounter++;

   if(maxRepeatCounter == 100) begin
     `uvm_info(get_type_name(), "maxRepeatCounter reached 100,So exiting loop", UVM_LOW);
     break;
   end
 end
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection SlaveVIPMasterIPReadTest"),UVM_LOW);

endtask : run_phase

`endif


