`ifndef SLAVEVIPMASTERIPOUTSTANDINGTRANSACTIONTEST_INCLUDED_
`define SLAVEVIPMASTERIPOUTSTANDINGTRANSACTIONTEST_INCLUDED_

class SlaveVIPMasterIPOutstandingTransactionTest extends SlaveVIPMasterIPBaseTest;
  `uvm_component_utils(SlaveVIPMasterIPOutstandingTransactionTest)

  SlaveVIPMasterIPVirtualOutstandingTransactionSeq slaveVIPMasterIPVirtualOutstandingTransactionSeq;
  
  extern function new(string name = "SlaveVIPMasterIPOutstandingTransactionTest", uvm_component parent = null);
  extern virtual function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual function void setupAxi4LiteMasterReadAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : SlaveVIPMasterIPOutstandingTransactionTest

function SlaveVIPMasterIPOutstandingTransactionTest::new(string name = "SlaveVIPMasterIPOutstandingTransactionTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void SlaveVIPMasterIPOutstandingTransactionTest::setupAxi4LiteMasterWriteAgentConfig();
  super.setupAxi4LiteMasterWriteAgentConfig();

  foreach(slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
    slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteMasterWriteAgentConfig

function void SlaveVIPMasterIPOutstandingTransactionTest::setupAxi4LiteMasterReadAgentConfig();
  super.setupAxi4LiteMasterReadAgentConfig();

  foreach(slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
    slaveVIPMasterIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteMasterReadAgentConfig

task SlaveVIPMasterIPOutstandingTransactionTest::run_phase(uvm_phase phase);

  slaveVIPMasterIPVirtualOutstandingTransactionSeq=SlaveVIPMasterIPVirtualOutstandingTransactionSeq::type_id::create("slaveVIPMasterIPVirtualOutstandingTransactionSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase SlaveVIPMasterIPOutstandingTransactionTest"),UVM_LOW);
    phase.raise_objection(this);
    slaveVIPMasterIPVirtualOutstandingTransactionSeq.start(slaveVIPMasterIPEnv.slaveVIPMasterIPVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

