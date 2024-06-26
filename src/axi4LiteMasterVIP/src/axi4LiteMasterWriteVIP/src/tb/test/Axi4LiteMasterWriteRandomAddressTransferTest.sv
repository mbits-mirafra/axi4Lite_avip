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


  phase.raise_objection(this);

  //axi4LiteMasterWriteRandomAddressTransferSeq.start(axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent.axi4LiteMasterWriteSequencer); 
  #20;

  phase.drop_objection(this);

endtask : run_phase

`endif


