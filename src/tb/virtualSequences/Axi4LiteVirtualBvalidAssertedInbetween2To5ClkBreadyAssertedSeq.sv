`ifndef AXI4LITEVIRTUALBVALIDASSERTEDINBETWEEN2TO5CLKBREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALBVALIDASSERTEDINBETWEEN2TO5CLKBREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq extends Axi4LiteVirtualDelayForBvalidAndBreadySeq;
  `uvm_object_utils(Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq

function Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq::new(string name = "Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq::body();
  axi4LiteMasterWriteDelayForBreadySeq = Axi4LiteMasterWriteDelayForBreadySeq::type_id::create("axi4LiteMasterWriteDelayForBreadySeq");
  axi4LiteSlaveWriteDelayForBvalidSeq = Axi4LiteSlaveWriteDelayForBvalidSeq::type_id::create("axi4LiteSlaveWriteDelayForBvalidSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWriteDelayForBreadySeq.randomize() with {delayForBready == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq delayForBready :%0d", axi4LiteMasterWriteDelayForBreadySeq.delayForBready),UVM_LOW);

   if(!axi4LiteSlaveWriteDelayForBvalidSeq.randomize() with {delayForBvalid == 5;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq delayForBvalid :%0d", axi4LiteSlaveWriteDelayForBvalidSeq.delayForBvalid),UVM_LOW);

  fork
    axi4LiteSlaveWriteDelayForBvalidSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWriteDelayForBreadySeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif
