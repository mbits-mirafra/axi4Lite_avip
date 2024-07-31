`ifndef AXI4LITE32BITWRITEANDREADRANDOMADDRESSANDDATATEST_INCLUDED_
`define AXI4LITE32BITWRITEANDREADRANDOMADDRESSANDDATATEST_INCLUDED_

class Axi4Lite32bitWriteAndReadRandomAddressAndDataTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4Lite32bitWriteAndReadRandomAddressAndDataTest)

  Axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq;
  
  extern function new(string name = "Axi4Lite32bitWriteAndReadRandomAddressAndDataTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4Lite32bitWriteAndReadRandomAddressAndDataTest

function Axi4Lite32bitWriteAndReadRandomAddressAndDataTest::new(string name = "Axi4Lite32bitWriteAndReadRandomAddressAndDataTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4Lite32bitWriteAndReadRandomAddressAndDataTest::run_phase(uvm_phase phase);

  axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq=Axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq::type_id::create("axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4Lite32bitWriteAndReadRandomAddressAndDataTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

