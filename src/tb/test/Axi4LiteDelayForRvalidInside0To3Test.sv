`ifndef AXI4LITEDELAYFORRVALIDINSIDE0TO3TEST_INCLUDED_
`define AXI4LITEDELAYFORRVALIDINSIDE0TO3TEST_INCLUDED_

class Axi4LiteDelayForRvalidInside0To3Test extends Axi4Lite32bitReadDataTest;
  `uvm_component_utils(Axi4LiteDelayForRvalidInside0To3Test)

  Axi4LiteVirtualDelayForRvalidInside0To3Seq axi4LiteVirtualDelayForRvalidInside0To3Seq;
  
  extern function new(string name = "Axi4LiteDelayForRvalidInside0To3Test", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteDelayForRvalidInside0To3Test

function Axi4LiteDelayForRvalidInside0To3Test::new(string name = "Axi4LiteDelayForRvalidInside0To3Test",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task Axi4LiteDelayForRvalidInside0To3Test::run_phase(uvm_phase phase);

  axi4LiteVirtualDelayForRvalidInside0To3Seq=Axi4LiteVirtualDelayForRvalidInside0To3Seq::type_id::create("axi4LiteVirtualDelayForRvalidInside0To3Seq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteDelayForRvalidInside0To3Test"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualDelayForRvalidInside0To3Seq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

