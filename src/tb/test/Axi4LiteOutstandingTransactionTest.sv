`ifndef AXI4LITEOUTSTANDINGTRANSACTIONTEST_INCLUDED_
`define AXI4LITEOUTSTANDINGTRANSACTIONTEST_INCLUDED_

class Axi4LiteOutstandingTransactionTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteOutstandingTransactionTest)

  Axi4LiteVirtualOutstandingTransaction axi4LiteVirtualOutstandingTransaction;
  
  extern function new(string name = "Axi4LiteOutstandingTransactionTest", uvm_component parent = null);
  extern virtual function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual function void setupAxi4LiteMasterReadAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteOutstandingTransactionTest

function Axi4LiteOutstandingTransactionTest::new(string name = "Axi4LiteOutstandingTransactionTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteOutstandingTransactionTest::setupAxi4LiteMasterWriteAgentConfig();
  super.setupAxi4LiteMasterWriteAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
    axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteMasterWriteAgentConfig

function void Axi4LiteOutstandingTransactionTest::setupAxi4LiteMasterReadAgentConfig();
  super.setupAxi4LiteMasterReadAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
    axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].enableOutstandingTransaction = 1;
  end
endfunction : setupAxi4LiteMasterReadAgentConfig

task Axi4LiteOutstandingTransactionTest::run_phase(uvm_phase phase);

  axi4LiteVirtualOutstandingTransaction=Axi4LiteVirtualOutstandingTransaction::type_id::create("axi4LiteVirtualOutstandingTransaction");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteOutstandingTransactionTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualOutstandingTransaction.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

