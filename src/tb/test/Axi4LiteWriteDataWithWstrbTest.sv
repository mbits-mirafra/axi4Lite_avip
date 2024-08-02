`ifndef AXI4LITEWRITEDATAWITHWSTRBTEST_INCLUDED_
`define AXI4LITEWRITEDATAWITHWSTRBTEST_INCLUDED_

class Axi4LiteWriteDataWithWstrbTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteWriteDataWithWstrbTest)

  Axi4LiteVirtualWriteDataWithWstrbSeq axi4LiteVirtualWriteDataWithWstrbSeq;
  
  extern function new(string name = "Axi4LiteWriteDataWithWstrbTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteWriteDataWithWstrbTest

function Axi4LiteWriteDataWithWstrbTest::new(string name = "Axi4LiteWriteDataWithWstrbTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteWriteDataWithWstrbTest::run_phase(uvm_phase phase);

  axi4LiteVirtualWriteDataWithWstrbSeq=Axi4LiteVirtualWriteDataWithWstrbSeq::type_id::create("axi4LiteVirtualWriteDataWithWstrbSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteWriteDataWithWstrbTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualWriteDataWithWstrbSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

