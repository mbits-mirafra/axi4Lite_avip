`ifndef AXI4LITEVIRTUALWVALIDASSERTEDANDNEXTCLKWREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALWVALIDASSERTEDANDNEXTCLKWREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq extends Axi4LiteVirtual32bitWriteDataSeq;
  `uvm_object_utils(Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq

function Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq::new(string name = "Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForWvalidSeq == 3;
                                                              delayForAwvalidSeq == 2;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq delayForWvalidSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForWvalidSeq),UVM_LOW);

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForWreadySeq == 1;
                                                             delayForAwreadySeq == 1;
                                                           }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq delayForWreadySeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForWreadySeq),UVM_LOW);

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

