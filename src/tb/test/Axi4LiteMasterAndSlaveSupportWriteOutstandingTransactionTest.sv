`ifndef AXI4LITEMASTERANDSLAVESUPPORTWRITEOUTSTANDINGTRANSACTIONTEST_INCLUDED_
`define AXI4LITEMASTERANDSLAVESUPPORTWRITEOUTSTANDINGTRANSACTIONTEST_INCLUDED_

class Axi4LiteMasterAndSlaveSupportWriteOutstandingTransactionTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteMasterAndSlaveSupportWriteOutstandingTransactionTest)

  Axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction;
  
  extern function new(string name = "Axi4LiteMasterAndSlaveSupportWriteOutstandingTransactionTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterAndSlaveSupportWriteOutstandingTransactionTest

function Axi4LiteMasterAndSlaveSupportWriteOutstandingTransactionTest::new(string name = "Axi4LiteMasterAndSlaveSupportWriteOutstandingTransactionTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterAndSlaveSupportWriteOutstandingTransactionTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

function void Axi4LiteMasterAndSlaveSupportWriteOutstandingTransactionTest::setupAxi4LiteMasterWriteAgentConfig();
  super.setupAxi4LiteMasterWriteAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
    axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteMasterWriteAgentConfig

function void Axi4LiteMasterAndSlaveSupportWriteOutstandingTransactionTest::setupAxi4LiteSlaveWriteAgentConfig();
  super.setupAxi4LiteSlaveWriteAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
    axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteSlaveWriteAgentConfig

task Axi4LiteMasterAndSlaveSupportWriteOutstandingTransactionTest::run_phase(uvm_phase phase);

  axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction=Axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction::type_id::create("axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterAndSlaveSupportWriteOutstandingTransactionTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

