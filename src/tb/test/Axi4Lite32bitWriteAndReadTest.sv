`ifndef AXI4LITE32BITWRITEANDREADTEST_INCLUDED_
`define AXI4LITE32BITWRITEANDREADTEST_INCLUDED_

class Axi4Lite32bitWriteAndReadTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4Lite32bitWriteAndReadTest)

  Axi4LiteVirtual32bitWriteAndReadSeq axi4LiteVirtual32bitWriteAndReadSeq;
  
  extern function new(string name = "Axi4Lite32bitWriteAndReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4Lite32bitWriteAndReadTest

function Axi4Lite32bitWriteAndReadTest::new(string name = "Axi4Lite32bitWriteAndReadTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4Lite32bitWriteAndReadTest::run_phase(uvm_phase phase);

  axi4LiteVirtual32bitWriteAndReadSeq=Axi4LiteVirtual32bitWriteAndReadSeq::type_id::create("axi4LiteVirtual32bitWriteAndReadSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4Lite32bitWriteAndReadTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtual32bitWriteAndReadSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

