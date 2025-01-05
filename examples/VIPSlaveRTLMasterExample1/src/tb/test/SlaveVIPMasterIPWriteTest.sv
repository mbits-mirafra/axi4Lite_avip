`ifndef SLAVEVIPMASTERIPWRITETEST_INCLUDED_
`define SLAVEVIPMASTERIPWRITETEST_INCLUDED_

class SlaveVIPMasterIPWriteTest extends SlaveVIPMasterIPBaseTest;
  `uvm_component_utils(SlaveVIPMasterIPWriteTest)

  SlaveVIPMasterIPVirtualWriteSeq slaveVIPMasterIPVirtualWriteSeq;
  
  extern function new(string name = "SlaveVIPMasterIPWriteTest", uvm_component parent = null);
  extern function void setupSlaveVIPMasterIPEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : SlaveVIPMasterIPWriteTest

function SlaveVIPMasterIPWriteTest::new(string name = "SlaveVIPMasterIPWriteTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void SlaveVIPMasterIPWriteTest::setupSlaveVIPMasterIPEnvConfig();
 super.setupSlaveVIPMasterIPEnvConfig();
 slaveVIPMasterIPEnvConfig.transactionType = Axi4LiteWriteSlaveGlobalPkg::WRITE;
endfunction : setupSlaveVIPMasterIPEnvConfig

task SlaveVIPMasterIPWriteTest::run_phase(uvm_phase phase);
 int maxRepeatCounter = 0;
  slaveVIPMasterIPVirtualWriteSeq=SlaveVIPMasterIPVirtualWriteSeq::type_id::create("slaveVIPMasterIPVirtualWriteSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase SlaveVIPMasterIPWriteTest"),UVM_LOW);
    phase.raise_objection(this);
    while(slaveVIPMasterIPEnv.axi4LiteSlaveEnv.axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[0].axi4LiteSlaveWriteCoverage.axi4LiteSlaveWriteTransactionCovergroup.get_inst_coverage() < 100) begin
     slaveVIPMasterIPVirtualWriteSeq.start(slaveVIPMasterIPEnv.slaveVIPMasterIPVirtualSequencer);
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

