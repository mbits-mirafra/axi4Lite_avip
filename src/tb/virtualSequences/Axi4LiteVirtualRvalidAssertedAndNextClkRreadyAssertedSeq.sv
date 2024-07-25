`ifndef AXI4LITEVIRTUALRVALIDASSERTEDANDNEXTCLKRREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALRVALIDASSERTEDANDNEXTCLKRREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq extends Axi4LiteVirtual32bitReadDataSeq;
  `uvm_object_utils(Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq

function Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq::new(string name = "Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {delayForRreadySeq == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq delayForRreadySeq :%0d", axi4LiteMasterRead32bitsTransferSeq.delayForRreadySeq),UVM_LOW);

   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForRvalidSeq == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq delayForRvalidSeq :%0d", axi4LiteSlaveRead32bitsTransferSeq.delayForRvalidSeq),UVM_LOW);

  fork
    axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

