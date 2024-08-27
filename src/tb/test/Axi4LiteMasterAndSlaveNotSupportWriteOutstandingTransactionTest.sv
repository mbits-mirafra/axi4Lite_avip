`ifndef AXI4LITEMASTERANDSLAVENOTSUPPORTWRITEOUTSTANDINGTRANSACTIONTEST_INCLUDED_
`define AXI4LITEMASTERANDSLAVENOTSUPPORTWRITEOUTSTANDINGTRANSACTIONTEST_INCLUDED_

class Axi4LiteMasterAndSlaveNotSupportWriteOutstandingTransactionTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteMasterAndSlaveNotSupportWriteOutstandingTransactionTest)

  Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction;
  
  extern function new(string name = "Axi4LiteMasterAndSlaveNotSupportWriteOutstandingTransactionTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterAndSlaveNotSupportWriteOutstandingTransactionTest

function Axi4LiteMasterAndSlaveNotSupportWriteOutstandingTransactionTest::new(string name = "Axi4LiteMasterAndSlaveNotSupportWriteOutstandingTransactionTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterAndSlaveNotSupportWriteOutstandingTransactionTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteMasterAndSlaveNotSupportWriteOutstandingTransactionTest::run_phase(uvm_phase phase);

  axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction=Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction::type_id::create("axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterAndSlaveNotSupportWriteOutstandingTransactionTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

