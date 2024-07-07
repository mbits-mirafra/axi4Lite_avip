`ifndef AXI4LITESLAVERANDOMWRITEREADTRANSFERTEST_INCLUDED_
`define AXI4LITESLAVERANDOMWRITEREADTRANSFERTEST_INCLUDED_

class Axi4LiteSlaveRandomWriteReadTransferTest extends Axi4LiteSlaveBaseTest;
  `uvm_component_utils(Axi4LiteSlaveRandomWriteReadTransferTest)

  Axi4LiteSlaveVirtualRandomWriteReadTransferSeq axi4LiteSlaveVirtualRandomWriteReadTransferSeq;
  
  extern function new(string name = "Axi4LiteSlaveRandomWriteReadTransferTest", uvm_component parent = null);
extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveRandomWriteReadTransferTest

function Axi4LiteSlaveRandomWriteReadTransferTest::new(string name = "Axi4LiteSlaveRandomWriteReadTransferTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteSlaveRandomWriteReadTransferTest::run_phase(uvm_phase phase);

  axi4LiteSlaveVirtualRandomWriteReadTransferSeq=Axi4LiteSlaveVirtualRandomWriteReadTransferSeq::type_id::create("axi4LiteSlaveVirtualRandomWriteReadTransferSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveRandomWriteReadTransferTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteSlaveVirtualRandomWriteReadTransferSeq.start(axi4LiteSlaveEnv.axi4LiteSlaveVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

