`ifndef AXI4LITEMASTERREADRANDOMADDRESSTRANSFERTEST_INCLUDED_
`define AXI4LITEMASTERREADRANDOMADDRESSTRANSFERTEST_INCLUDED_

class Axi4LiteMasterReadRandomAddressTransferTest extends Axi4LiteReadMasterBaseTest;
  `uvm_component_utils(Axi4LiteMasterReadRandomAddressTransferTest)

  Axi4LiteMasterReadRandomAddressTransferSeq axi4LiteMasterReadRandomAddressTransferSeq;
  extern function new(string name = "Axi4LiteMasterReadRandomAddressTransferTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterReadRandomAddressTransferTest

function Axi4LiteMasterReadRandomAddressTransferTest::new(string name = "Axi4LiteMasterReadRandomAddressTransferTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteMasterReadRandomAddressTransferTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteMasterReadRandomAddressTransferTest::run_phase(uvm_phase phase);

  axi4LiteMasterReadRandomAddressTransferSeq = Axi4LiteMasterReadRandomAddressTransferSeq ::type_id::create("axi4LiteMasterReadRandomAddressTransferSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteMasterReadRandomAddressTransferTest"),UVM_LOW);

  phase.raise_objection(this);
   super.run_phase(phase);
  `uvm_info(get_type_name(),$sformatf("After raise_objection Axi4LiteMasterReadRandomAddressTransferTest"),UVM_LOW);

  axi4LiteMasterReadRandomAddressTransferSeq.start(axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadSequencer); 
  #10;

  `uvm_info(get_type_name(),$sformatf("After start method Axi4LiteMasterReadRandomAddressTransferTest"),UVM_LOW);
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteMasterReadRandomAddressTransferTest"),UVM_LOW);

endtask : run_phase

`endif


