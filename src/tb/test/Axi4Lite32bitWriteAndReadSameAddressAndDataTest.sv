`ifndef AXI4LITE32BITWRITEANDREADSAMEADDRESSANDDATATEST_INCLUDED_
`define AXI4LITE32BITWRITEANDREADSAMEADDRESSANDDATATEST_INCLUDED_

class Axi4Lite32bitWriteAndReadSameAddressAndDataTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4Lite32bitWriteAndReadSameAddressAndDataTest)

  Axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq;
  
  extern function new(string name = "Axi4Lite32bitWriteAndReadSameAddressAndDataTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4Lite32bitWriteAndReadSameAddressAndDataTest

function Axi4Lite32bitWriteAndReadSameAddressAndDataTest::new(string name = "Axi4Lite32bitWriteAndReadSameAddressAndDataTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4Lite32bitWriteAndReadSameAddressAndDataTest::run_phase(uvm_phase phase);

  axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq=Axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq::type_id::create("axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4Lite32bitWriteAndReadSameAddressAndDataTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

