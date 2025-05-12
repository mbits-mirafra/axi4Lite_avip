`ifndef MASTERVIPSLAVEIPWRITETEST_INCLUDED_
`define MASTERVIPSLAVEIPWRITETEST_INCLUDED_

class MasterVIPSlaveIPWriteTest extends MasterVIPSlaveIPBaseTest;
  `uvm_component_utils(MasterVIPSlaveIPWriteTest)

  MasterVIPSlaveIPVirtualWriteSeq masterVIPSlaveIPVirtualWriteSeq;
  
  extern function new(string name = "MasterVIPSlaveIPWriteTest", uvm_component parent = null);
  extern function void setupMasterVIPSlaveIPEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : MasterVIPSlaveIPWriteTest

function MasterVIPSlaveIPWriteTest::new(string name = "MasterVIPSlaveIPWriteTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIPWriteTest::setupMasterVIPSlaveIPEnvConfig();
 super.setupMasterVIPSlaveIPEnvConfig();
 masterVIPSlaveIPEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupMasterVIPSlaveIPEnvConfig

task MasterVIPSlaveIPWriteTest::run_phase(uvm_phase phase);
 int maxRepeatCounter = 0;
  masterVIPSlaveIPVirtualWriteSeq=MasterVIPSlaveIPVirtualWriteSeq::type_id::create("masterVIPSlaveIPVirtualWriteSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase MasterVIPSlaveIPWriteTest"),UVM_LOW);
    phase.raise_objection(this);
    while(masterVIPSlaveIPEnv.axi4LiteMasterEnv.axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteCoverage.axi4LiteMasterWriteTransactionCovergroup.get_inst_coverage() < 100) begin
     masterVIPSlaveIPVirtualWriteSeq.start(masterVIPSlaveIPEnv.masterVIPSlaveIPVirtualSequencer);
     #10;
     maxRepeatCounter++;

     if(maxRepeatCounter == 100) begin
       `uvm_info(get_type_name(), "maxRepeatCounter reached 100,So exiting loop", UVM_LOW);
      break;
     end
    end
  phase.drop_objection(this);

endtask : run_phase

`endif

