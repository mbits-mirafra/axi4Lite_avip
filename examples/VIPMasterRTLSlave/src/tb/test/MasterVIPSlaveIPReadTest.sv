`ifndef MASTERVIPSLAVEIPREADTEST_INCLUDED_
`define MASTERVIPSLAVEIPREADTEST_INCLUDED_

class MasterVIPSlaveIPReadTest extends MasterVIPSlaveIPBaseTest;
  `uvm_component_utils(MasterVIPSlaveIPReadTest)

  MasterVIPSlaveIPVirtualReadSeq masterVIPSlaveIPVirtualReadSeq;
  
  extern function new(string name = "MasterVIPSlaveIPReadTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : MasterVIPSlaveIPReadTest

function MasterVIPSlaveIPReadTest::new(string name = "MasterVIPSlaveIPReadTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIPReadTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  masterVIPSlaveIPVirtualReadSeq = MasterVIPSlaveIPVirtualReadSeq ::type_id::create("masterVIPSlaveIPVirtualReadSeq");
endfunction 

task MasterVIPSlaveIPReadTest::run_phase(uvm_phase phase);
 
  int maxRepeatCounter = 0;
  `uvm_info(get_type_name(),$sformatf("Inside run_phase MasterVIPSlaveIPReadTest"),UVM_LOW); 
   phase.raise_objection(this);
    while(masterVIPSlaveIPEnv.axi4LiteMasterEnv.axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadCoverage.axi4LiteMasterReadTransactionCovergroup.get_inst_coverage() < 50) begin
    masterVIPSlaveIPVirtualReadSeq.start(masterVIPSlaveIPEnv.masterVIPSlaveIPVirtualSequencer); 
   #10;
   maxRepeatCounter++;

   if(maxRepeatCounter == 100) begin
     `uvm_info(get_type_name(), "maxRepeatCounter reached 100,So exiting loop", UVM_LOW);
     break;
   end
 end
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection MasterVIPSlaveIPReadTest"),UVM_LOW);

endtask : run_phase

`endif


