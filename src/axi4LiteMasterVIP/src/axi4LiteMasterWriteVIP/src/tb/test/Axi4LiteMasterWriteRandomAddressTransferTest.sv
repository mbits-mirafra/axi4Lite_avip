`ifndef AXI4LITEMASTERWRITERANDOMADDRESSTRANSFERTEST_INCLUDED_
`define AXI4LITEMASTERWRITERANDOMADDRESSTRANSFERTEST_INCLUDED_

class Axi4LiteMasterWriteRandomAddressTransferTest extends Axi4LiteWriteMasterBaseTest;
  `uvm_component_utils(Axi4LiteMasterWriteRandomAddressTransferTest)

  Axi4LiteMasterWriteRandomAddressTransferSeq axi4LiteMasterWriteRandomAddressTransferSeq;
  extern function new(string name = "Axi4LiteMasterWriteRandomAddressTransferTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterWriteRandomAddressTransferTest

function Axi4LiteMasterWriteRandomAddressTransferTest::new(string name = "Axi4LiteMasterWriteRandomAddressTransferTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterWriteRandomAddressTransferTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterWriteRandomAddressTransferTest::run_phase(uvm_phase phase);

  axi4LiteMasterWriteRandomAddressTransferSeq = Axi4LiteMasterWriteRandomAddressTransferSeq ::type_id::create("axi4LiteMasterWriteRandomAddressTransferSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterWriteRandomAddressTransferTest"),UVM_LOW);

  phase.raise_objection(this);
   super.run_phase(phase);
  `uvm_info(get_type_name(),$sformatf("After raise_objection Axi4LiteMasterWriteRandomAddressTransferTest"),UVM_LOW);

  axi4LiteMasterWriteRandomAddressTransferSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteSequencer); 
  #10;

  `uvm_info(get_type_name(),$sformatf("After start method Axi4LiteMasterWriteRandomAddressTransferTest"),UVM_LOW);
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterWriteRandomAddressTransferTest"),UVM_LOW);

endtask : run_phase

`endif


