`ifndef AXI4LITE32BITDATAWITHANYVALUETEST_INCLUDED_
`define AXI4LITE32BITDATAWITHANYVALUETEST_INCLUDED_

class Axi4Lite32bitDataWithAnyValueTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4Lite32bitDataWithAnyValueTest)

  Axi4LiteVirtual32bitDataWithAnyValueSeq axi4LiteVirtual32bitDataWithAnyValueSeq;
  
  extern function new(string name = "Axi4Lite32bitDataWithAnyValueTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4Lite32bitDataWithAnyValueTest

function Axi4Lite32bitDataWithAnyValueTest::new(string name = "Axi4Lite32bitDataWithAnyValueTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4Lite32bitDataWithAnyValueTest::run_phase(uvm_phase phase);

  axi4LiteVirtual32bitDataWithAnyValueSeq=Axi4LiteVirtual32bitDataWithAnyValueSeq::type_id::create("axi4LiteVirtual32bitDataWithAnyValueSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4Lite32bitDataWithAnyValueTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtual32bitDataWithAnyValueSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

