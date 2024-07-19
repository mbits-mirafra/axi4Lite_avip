`ifndef AXI4LITE32BITREADDATATEST_INCLUDED_
`define AXI4LITE32BITREADDATATEST_INCLUDED_

class Axi4Lite32bitReadDataTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4Lite32bitReadDataTest)

  Axi4LiteVirtual32bitReadDataSeq axi4LiteVirtual32bitReadDataSeq;
  
  extern function new(string name = "Axi4Lite32bitReadDataTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4Lite32bitReadDataTest

function Axi4Lite32bitReadDataTest::new(string name = "Axi4Lite32bitReadDataTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4Lite32bitReadDataTest::run_phase(uvm_phase phase);

  axi4LiteVirtual32bitReadDataSeq=Axi4LiteVirtual32bitReadDataSeq::type_id::create("axi4LiteVirtual32bitWriteDataSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4Lite32bitReadDataTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtual32bitReadDataSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

