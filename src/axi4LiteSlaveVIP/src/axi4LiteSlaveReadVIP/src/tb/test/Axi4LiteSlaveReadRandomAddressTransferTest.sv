`ifndef AXI4LITESLAVEREADRANDOMADDRESSTRANSFERTEST_INCLUDED_
`define AXI4LITESLAVEREADRANDOMADDRESSTRANSFERTEST_INCLUDED_

class Axi4LiteSlaveReadRandomAddressTransferTest extends Axi4LiteReadSlaveBaseTest;
  `uvm_component_utils(Axi4LiteSlaveReadRandomAddressTransferTest)

  Axi4LiteSlaveReadRandomAddressTransferSeq axi4LiteSlaveReadRandomAddressTransferSeq;
  extern function new(string name = "Axi4LiteSlaveReadRandomAddressTransferTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveReadRandomAddressTransferTest

function Axi4LiteSlaveReadRandomAddressTransferTest::new(string name = "Axi4LiteSlaveReadRandomAddressTransferTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteSlaveReadRandomAddressTransferTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction : build_phase

task Axi4LiteSlaveReadRandomAddressTransferTest::run_phase(uvm_phase phase);

  axi4LiteSlaveReadRandomAddressTransferSeq = Axi4LiteSlaveReadRandomAddressTransferSeq ::type_id::create("axi4LiteSlaveReadRandomAddressTransferSeq");

  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteSlaveReadRandomAddressTransferTest"),UVM_LOW);

  phase.raise_objection(this);
   super.run_phase(phase);
  `uvm_info(get_type_name(),$sformatf("After raise_objection Axi4LiteSlaveReadRandomAddressTransferTest"),UVM_LOW);

  axi4LiteSlaveReadRandomAddressTransferSeq.start(axi4LiteReadSlaveEnv.axi4LiteSlaveReadAgent[0].axi4LiteSlaveReadSequencer); 
  #10;

  `uvm_info(get_type_name(),$sformatf("After start method Axi4LiteSlaveReadRandomAddressTransferTest"),UVM_LOW);
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection Axi4LiteSlaveReadRandomAddressTransferTest"),UVM_LOW);

endtask : run_phase

`endif


