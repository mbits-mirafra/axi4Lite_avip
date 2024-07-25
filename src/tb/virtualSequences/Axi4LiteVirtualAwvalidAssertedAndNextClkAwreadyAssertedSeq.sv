`ifndef AXI4LITEVIRTUALAWVALIDASSERTEDANDNEXTCLKAWREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALAWVALIDASSERTEDANDNEXTCLKAWREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq extends Axi4LiteVirtual32bitWriteDataSeq;
  `uvm_object_utils(Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq

function Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq::new(string name = "Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalidSeq == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq delayForAwvalidSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForAwvalidSeq),UVM_LOW);

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForAwreadySeq == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq delayForAwreadySeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForAwreadySeq),UVM_LOW);

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

