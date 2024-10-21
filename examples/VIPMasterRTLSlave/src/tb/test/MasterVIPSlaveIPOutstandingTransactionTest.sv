`ifndef MASTERVIPSLAVEIPOUTSTANDINGTRANSACTIONTEST_INCLUDED_
`define MASTERVIPSLAVEIPOUTSTANDINGTRANSACTIONTEST_INCLUDED_

class MasterVIPSlaveIPOutstandingTransactionTest extends MasterVIPSlaveIPBaseTest;
  `uvm_component_utils(MasterVIPSlaveIPOutstandingTransactionTest)

  MasterVIPSlaveIPVirtualOutstandingTransactionSeq masterVIPSlaveIPVirtualOutstandingTransactionSeq;
  
  extern function new(string name = "MasterVIPSlaveIPOutstandingTransactionTest", uvm_component parent = null);
  extern virtual function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual function void setupAxi4LiteMasterReadAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : MasterVIPSlaveIPOutstandingTransactionTest

function MasterVIPSlaveIPOutstandingTransactionTest::new(string name = "MasterVIPSlaveIPOutstandingTransactionTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIPOutstandingTransactionTest::setupAxi4LiteMasterWriteAgentConfig();
  super.setupAxi4LiteMasterWriteAgentConfig();

  foreach(masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
    masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteMasterWriteAgentConfig

function void MasterVIPSlaveIPOutstandingTransactionTest::setupAxi4LiteMasterReadAgentConfig();
  super.setupAxi4LiteMasterReadAgentConfig();

  foreach(masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
    masterVIPSlaveIPEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteMasterReadAgentConfig

task MasterVIPSlaveIPOutstandingTransactionTest::run_phase(uvm_phase phase);

  masterVIPSlaveIPVirtualOutstandingTransactionSeq=MasterVIPSlaveIPVirtualOutstandingTransactionSeq::type_id::create("masterVIPSlaveIPVirtualOutstandingTransactionSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase MasterVIPSlaveIPOutstandingTransactionTest"),UVM_LOW);
    phase.raise_objection(this);
    masterVIPSlaveIPVirtualOutstandingTransactionSeq.start(masterVIPSlaveIPEnv.masterVIPSlaveIPVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

