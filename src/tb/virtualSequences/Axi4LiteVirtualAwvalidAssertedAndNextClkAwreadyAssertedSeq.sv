`ifndef AXI4LITEVIRTUALAWVALIDASSERTEDANDNEXTCLKAWREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALAWVALIDASSERTEDANDNEXTCLKAWREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq extends Axi4LiteVirtualDelayForAwvalidAndAwreadySeq;
  `uvm_object_utils(Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq

function Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq::new(string name = "Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq::body();
  axi4LiteMasterWriteDelayForAwvalidSeq = Axi4LiteMasterWriteDelayForAwvalidSeq::type_id::create("axi4LiteMasterWriteDelayForAwvalidSeq");
  axi4LiteSlaveWriteDelayForAwreadySeq = Axi4LiteSlaveWriteDelayForAwreadySeq::type_id::create("axi4LiteSlaveWriteDelayForAwreadySeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWriteDelayForAwvalidSeq.randomize() with {delayForAwvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq delayForAwvalid :%0d", axi4LiteMasterWriteDelayForAwvalidSeq.delayForAwvalid),UVM_LOW);

   if(!axi4LiteSlaveWriteDelayForAwreadySeq.randomize() with {delayForAwready == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq delayForAwready :%0d", axi4LiteSlaveWriteDelayForAwreadySeq.delayForAwready),UVM_LOW);

  fork
    axi4LiteSlaveWriteDelayForAwreadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWriteDelayForAwvalidSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

