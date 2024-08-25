`ifndef AXI4LITEMASTERANDSLAVENOTSUPPORTREADOUTSTANDINGTRANSACTIONTEST_INCLUDED_
`define AXI4LITEMASTERANDSLAVENOTSUPPORTREADOUTSTANDINGTRANSACTIONTEST_INCLUDED_

class Axi4LiteMasterAndSlaveNotSupportReadOutstandingTransactionTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteMasterAndSlaveNotSupportReadOutstandingTransactionTest)

  Axi4LiteVirtualMasterAndSlaveNotSupportReadOutstandingTransaction axi4LiteVirtualMasterAndSlaveNotSupportReadOutstandingTransaction;
  
  extern function new(string name = "Axi4LiteMasterAndSlaveNotSupportReadOutstandingTransactionTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterAndSlaveNotSupportReadOutstandingTransactionTest

function Axi4LiteMasterAndSlaveNotSupportReadOutstandingTransactionTest::new(string name = "Axi4LiteMasterAndSlaveNotSupportReadOutstandingTransactionTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteMasterAndSlaveNotSupportReadOutstandingTransactionTest::run_phase(uvm_phase phase);

  axi4LiteVirtualMasterAndSlaveNotSupportReadOutstandingTransaction=Axi4LiteVirtualMasterAndSlaveNotSupportReadOutstandingTransaction::type_id::create("axi4LiteVirtualMasterAndSlaveNotSupportReadOutstandingTransaction");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterAndSlaveNotSupportReadOutstandingTransactionTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualMasterAndSlaveNotSupportReadOutstandingTransaction.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

