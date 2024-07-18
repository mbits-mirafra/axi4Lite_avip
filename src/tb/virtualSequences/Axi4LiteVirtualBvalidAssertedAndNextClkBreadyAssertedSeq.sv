`ifndef AXI4LITEVIRTUALBVALIDASSERTEDANDNEXTCLKBREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALBVALIDASSERTEDANDNEXTCLKBREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq extends Axi4LiteVirtualDelayForBvalidAndBreadySeq;
  `uvm_object_utils(Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq

function Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq::new(string name = "Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq::body();
  axi4LiteMasterWriteDelayForBreadySeq = Axi4LiteMasterWriteDelayForBreadySeq::type_id::create("axi4LiteMasterWriteDelayForBreadySeq");
  axi4LiteSlaveWriteDelayForBvalidSeq = Axi4LiteSlaveWriteDelayForBvalidSeq::type_id::create("axi4LiteSlaveWriteDelayForBvalidSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWriteDelayForBreadySeq.randomize() with {delayForBready == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq delayForBready :%0d", axi4LiteMasterWriteDelayForBreadySeq.delayForBready),UVM_LOW);

   if(!axi4LiteSlaveWriteDelayForBvalidSeq.randomize() with {delayForBvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBvalidAssertedAndNextClkBreadyAssertedSeq delayForBvalid :%0d", axi4LiteSlaveWriteDelayForBvalidSeq.delayForBvalid),UVM_LOW);

  fork
    axi4LiteSlaveWriteDelayForBvalidSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWriteDelayForBreadySeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

