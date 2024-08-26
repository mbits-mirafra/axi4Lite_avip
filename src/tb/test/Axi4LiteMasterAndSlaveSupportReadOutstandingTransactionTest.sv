`ifndef AXI4LITEMASTERANDSLAVESUPPORTREADOUTSTANDINGTRANSACTIONTEST_INCLUDED_
`define AXI4LITEMASTERANDSLAVESUPPORTREADOUTSTANDINGTRANSACTIONTEST_INCLUDED_

class Axi4LiteMasterAndSlaveSupportReadOutstandingTransactionTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteMasterAndSlaveSupportReadOutstandingTransactionTest)

  Axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction;
  
  extern function new(string name = "Axi4LiteMasterAndSlaveSupportReadOutstandingTransactionTest", uvm_component parent = null);
  extern virtual function void setupAxi4LiteMasterReadAgentConfig();
  extern virtual function void setupAxi4LiteSlaveReadAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterAndSlaveSupportReadOutstandingTransactionTest

function Axi4LiteMasterAndSlaveSupportReadOutstandingTransactionTest::new(string name = "Axi4LiteMasterAndSlaveSupportReadOutstandingTransactionTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterAndSlaveSupportReadOutstandingTransactionTest::setupAxi4LiteMasterReadAgentConfig();
  super.setupAxi4LiteMasterReadAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
    axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteMasterReadAgentConfig

function void Axi4LiteMasterAndSlaveSupportReadOutstandingTransactionTest::setupAxi4LiteSlaveReadAgentConfig();
  super.setupAxi4LiteSlaveReadAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin
    axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteSlaveReadAgentConfig


task Axi4LiteMasterAndSlaveSupportReadOutstandingTransactionTest::run_phase(uvm_phase phase);

  axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction=Axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction::type_id::create("axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterAndSlaveSupportReadOutstandingTransactionTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

