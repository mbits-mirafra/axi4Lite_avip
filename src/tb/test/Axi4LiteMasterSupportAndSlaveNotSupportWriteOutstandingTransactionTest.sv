`ifndef AXI4LITEMASTERSUPPORTANDSLAVENOTSUPPORTWRITEOUTSTANDINGTRANSACTIONTEST_INCLUDED_
`define AXI4LITEMASTERSUPPORTANDSLAVENOTSUPPORTWRITEOUTSTANDINGTRANSACTIONTEST_INCLUDED_

class Axi4LiteMasterSupportAndSlaveNotSupportWriteOutstandingTransactionTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteMasterSupportAndSlaveNotSupportWriteOutstandingTransactionTest)

  Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction;
  
  extern function new(string name = "Axi4LiteMasterSupportAndSlaveNotSupportWriteOutstandingTransactionTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterSupportAndSlaveNotSupportWriteOutstandingTransactionTest

function Axi4LiteMasterSupportAndSlaveNotSupportWriteOutstandingTransactionTest::new(string name = "Axi4LiteMasterSupportAndSlaveNotSupportWriteOutstandingTransactionTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterSupportAndSlaveNotSupportWriteOutstandingTransactionTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

function void Axi4LiteMasterSupportAndSlaveNotSupportWriteOutstandingTransactionTest::setupAxi4LiteMasterWriteAgentConfig();
  super.setupAxi4LiteMasterWriteAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
    axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteMasterWriteAgentConfig

task Axi4LiteMasterSupportAndSlaveNotSupportWriteOutstandingTransactionTest::run_phase(uvm_phase phase);

  axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction=Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction::type_id::create("axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterSupportAndSlaveNotSupportWriteOutstandingTransactionTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

