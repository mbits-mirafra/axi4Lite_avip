`ifndef AXI4LITE32BITWRITEDATAWITHDELAYFORVALIDREADYTEST_INCLUDED_
`define AXI4LITE32BITWRITEDATAWITHDELAYFORVALIDREADYTEST_INCLUDED_

class Axi4Lite32bitWriteDataWithDelayForValidReadyTest extends Axi4Lite32bitWriteDataTest;
  `uvm_component_utils(Axi4Lite32bitWriteDataWithDelayForValidReadyTest)

  Axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq;
  
  extern function new(string name = "Axi4Lite32bitWriteDataWithDelayForValidReadyTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4Lite32bitWriteDataWithDelayForValidReadyTest

function Axi4Lite32bitWriteDataWithDelayForValidReadyTest::new(string name = "Axi4Lite32bitWriteDataWithDelayForValidReadyTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4Lite32bitWriteDataWithDelayForValidReadyTest::run_phase(uvm_phase phase);

  axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq=Axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq::type_id::create("axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4Lite32bitWriteDataWithDelayForValidReadyTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

