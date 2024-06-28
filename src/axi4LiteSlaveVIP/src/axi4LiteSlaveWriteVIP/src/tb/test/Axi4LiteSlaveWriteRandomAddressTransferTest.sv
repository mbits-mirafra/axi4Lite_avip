`ifndef AXI4LITESLAVEWRITERANDOMADDRESSTRANSFERTEST_INCLUDED_
`define AXI4LITESLAVEWRITERANDOMADDRESSTRANSFERTEST_INCLUDED_

class Axi4LiteSlaveWriteRandomAddressTransferTest extends Axi4LiteWriteSlaveBaseTest;
  `uvm_component_utils(Axi4LiteSlaveWriteRandomAddressTransferTest)

  Axi4LiteSlaveWriteRandomAddressTransferSeq axi4LiteSlaveWriteRandomAddressTransferSeq;
  extern function new(string name = "Axi4LiteSlaveWriteRandomAddressTransferTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveWriteRandomAddressTransferTest

function Axi4LiteSlaveWriteRandomAddressTransferTest::new(string name = "Axi4LiteSlaveWriteRandomAddressTransferTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveWriteRandomAddressTransferTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteSlaveWriteRandomAddressTransferTest::run_phase(uvm_phase phase);

  axi4LiteSlaveWriteRandomAddressTransferSeq = Axi4LiteSlaveWriteRandomAddressTransferSeq ::type_id::create("axi4LiteSlaveWriteRandomAddressTransferSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveWriteRandomAddressTransferTest"),UVM_LOW);

  phase.raise_objection(this);
   super.run_phase(phase);
  `uvm_info(get_type_name(),$sformatf("After raise_objection Axi4LiteSlaveWriteRandomAddressTransferTest"),UVM_LOW);

  axi4LiteSlaveWriteRandomAddressTransferSeq.start(axi4LiteWriteSlaveEnv.axi4LiteSlaveWriteAgent[0].axi4LiteSlaveWriteSequencer); 
  #10;

  `uvm_info(get_type_name(),$sformatf("After start method Axi4LiteSlaveWriteRandomAddressTransferTest"),UVM_LOW);
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveWriteRandomAddressTransferTest"),UVM_LOW);

endtask : run_phase

`endif


