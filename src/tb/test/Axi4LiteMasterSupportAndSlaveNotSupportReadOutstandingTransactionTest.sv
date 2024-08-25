`ifndef AXI4LITEMASTERSUPPORTANDSLAVENOTSUPPORTREADOUTSTANDINGTRANSACTIONTEST_INCLUDED_
`define AXI4LITEMASTERSUPPORTANDSLAVENOTSUPPORTREADOUTSTANDINGTRANSACTIONTEST_INCLUDED_

class Axi4LiteMasterSupportAndSlaveNotSupportReadOutstandingTransactionTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteMasterSupportAndSlaveNotSupportReadOutstandingTransactionTest)

  Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction;
  
  extern function new(string name = "Axi4LiteMasterSupportAndSlaveNotSupportReadOutstandingTransactionTest", uvm_component parent = null);
  extern virtual function void setupAxi4LiteMasterReadAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterSupportAndSlaveNotSupportReadOutstandingTransactionTest

function Axi4LiteMasterSupportAndSlaveNotSupportReadOutstandingTransactionTest::new(string name = "Axi4LiteMasterSupportAndSlaveNotSupportReadOutstandingTransactionTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterSupportAndSlaveNotSupportReadOutstandingTransactionTest::setupAxi4LiteMasterReadAgentConfig();
  super.setupAxi4LiteMasterReadAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
    axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteMasterReadAgentConfig

task Axi4LiteMasterSupportAndSlaveNotSupportReadOutstandingTransactionTest::run_phase(uvm_phase phase);

  axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction=Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction::type_id::create("axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterSupportAndSlaveNotSupportReadOutstandingTransactionTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

