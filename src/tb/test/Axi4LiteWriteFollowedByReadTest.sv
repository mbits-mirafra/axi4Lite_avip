`ifndef AXI4LITEWRITEFOLLOWEDBYREADTEST_INCLUDED_
`define AXI4LITEWRITEFOLLOWEDBYREADTEST_INCLUDED_

class Axi4LiteWriteFollowedByReadTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteWriteFollowedByReadTest)

  Axi4LiteVirtualWriteFollowedByReadSeq axi4LiteVirtualWriteFollowedByReadSeq;
  
  extern function new(string name = "Axi4LiteWriteFollowedByReadTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteWriteFollowedByReadTest

function Axi4LiteWriteFollowedByReadTest::new(string name = "Axi4LiteWriteFollowedByReadTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteWriteFollowedByReadTest::run_phase(uvm_phase phase);

  axi4LiteVirtualWriteFollowedByReadSeq=Axi4LiteVirtualWriteFollowedByReadSeq::type_id::create("axi4LiteVirtualWriteFollowedByReadSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteWriteFollowedByReadTest"),UVM_LOW);
    phase.raise_objection(this);
    repeat(20) begin
     axi4LiteVirtualWriteFollowedByReadSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
     #10;
    end
  phase.drop_objection(this);

endtask : run_phase

`endif

