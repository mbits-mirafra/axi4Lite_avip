`ifndef AXI4LITEVIRTUALAWVALIDAWREADYANDWVALIDWREADYASSERTEDSAMECLKNEXTCLKBVALIDASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALAWVALIDAWREADYANDWVALIDWREADYASSERTEDSAMECLKNEXTCLKBVALIDASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq

function Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq::new(string name = "Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {awprot == 1;
                                                              delayForAwvalid == 2;
                                                              delayForWvalid == 2;
                                                              delayForBready == 1;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq")
  end

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalid == 1;
                                                             delayForAwready == 1;
                                                             delayForWready == 1;
                                                           }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq")
  end

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

