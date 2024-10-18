`ifndef MASTERVIPSLAVEIPWRITEFOLLOWEDBYREADTEST_INCLUDED_
`define MASTERVIPSLAVEIPWRITEFOLLOWEDBYREADTEST_INCLUDED_

class MasterVIPSlaveIPWriteFollowedByReadTest extends MasterVIPSlaveIPBaseTest;
  `uvm_component_utils(MasterVIPSlaveIPWriteFollowedByReadTest)

  MasterVIPSlaveIPVirtualWriteFollowedByReadSeq masterVIPSlaveIPVirtualWriteFollowedByReadSeq;

  extern function new(string name = "MasterVIPSlaveIPWriteFollowedByReadTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : MasterVIPSlaveIPWriteFollowedByReadTest

function MasterVIPSlaveIPWriteFollowedByReadTest::new(string name = "MasterVIPSlaveIPWriteFollowedByReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIPWriteFollowedByReadTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  masterVIPSlaveIPVirtualWriteFollowedByReadSeq = MasterVIPSlaveIPVirtualWriteFollowedByReadSeq ::type_id::create("masterVIPSlaveIPVirtualWriteFollowedByReadSeq");
endfunction : build_phase

task MasterVIPSlaveIPWriteFollowedByReadTest::run_phase(uvm_phase phase);
  int maxRepeatCounter = 0;
  `uvm_info(get_type_name(),$sformatf("Inside run_phase MasterVIPSlaveIPWriteFollowedByReadTest"),UVM_LOW);
  phase.raise_objection(this);
    while(masterVIPSlaveIPEnv.axi4LiteMasterEnv.axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteCoverage.axi4LiteMasterWriteTransactionCovergroup.get_inst_coverage() < 50 && 
  masterVIPSlaveIPEnv.axi4LiteMasterEnv.axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadCoverage.axi4LiteMasterReadTransactionCovergroup.get_inst_coverage() < 50 ) begin
    masterVIPSlaveIPVirtualWriteFollowedByReadSeq.start(masterVIPSlaveIPEnv.masterVIPSlaveIPVirtualSequencer); 
  #10;
  
   if(maxRepeatCounter == 100) begin
     `uvm_info(get_type_name(), "maxRepeatCounter reached 100,So exiting loop", UVM_LOW);
     break;
   end
 end

  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection MasterVIPSlaveIPWriteFollowedByReadTest"),UVM_LOW);

endtask : run_phase

`endif


