`ifndef SLAVEVIPMASTERIPOUTSTANDINGTRANSACTIONTEST_INCLUDED_
`define SLAVEVIPMASTERIPOUTSTANDINGTRANSACTIONTEST_INCLUDED_

class SlaveVIPMasterIPOutstandingTransactionTest extends SlaveVIPMasterIPBaseTest;
  `uvm_component_utils(SlaveVIPMasterIPOutstandingTransactionTest)

  SlaveVIPMasterIPVirtualOutstandingTransactionSeq slaveVIPMasterIPVirtualOutstandingTransactionSeq;
  
  extern function new(string name = "SlaveVIPMasterIPOutstandingTransactionTest", uvm_component parent = null);
  extern virtual function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual function void setupAxi4LiteSlaveReadAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : SlaveVIPMasterIPOutstandingTransactionTest

function SlaveVIPMasterIPOutstandingTransactionTest::new(string name = "SlaveVIPMasterIPOutstandingTransactionTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void SlaveVIPMasterIPOutstandingTransactionTest::setupAxi4LiteSlaveWriteAgentConfig();
  super.setupAxi4LiteSlaveWriteAgentConfig();

  foreach(slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
    slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteSlaveWriteAgentConfig

function void SlaveVIPMasterIPOutstandingTransactionTest::setupAxi4LiteSlaveReadAgentConfig();
  super.setupAxi4LiteSlaveReadAgentConfig();

  foreach(slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin
    slaveVIPMasterIPEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteSlaveReadAgentConfig

task SlaveVIPMasterIPOutstandingTransactionTest::run_phase(uvm_phase phase);

  slaveVIPMasterIPVirtualOutstandingTransactionSeq=SlaveVIPMasterIPVirtualOutstandingTransactionSeq::type_id::create("slaveVIPMasterIPVirtualOutstandingTransactionSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase SlaveVIPMasterIPOutstandingTransactionTest"),UVM_LOW);
    phase.raise_objection(this);
    slaveVIPMasterIPVirtualOutstandingTransactionSeq.start(slaveVIPMasterIPEnv.slaveVIPMasterIPVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

