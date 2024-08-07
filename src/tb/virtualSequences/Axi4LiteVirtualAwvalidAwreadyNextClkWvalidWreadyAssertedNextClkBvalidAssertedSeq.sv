`ifndef AXI4LITEVIRTUALAWVALIDAWREADYNEXTCLKWVALIDWREADYASSERTEDNEXTCLKBVALIDASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALAWVALIDAWREADYNEXTCLKWVALIDWREADYASSERTEDNEXTCLKBVALIDASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq extends Axi4LiteVirtual32bitWriteDataSeq;
  `uvm_object_utils(Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq

function Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq::new(string name = "Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {awprotSeq == 1;
                                                              delayForAwvalidSeq == 2;
                                                              delayForWvalidSeq == 3;
                                                              delayForBreadySeq == 0;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq")
  end

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalidSeq == 0;
                                                             delayForAwreadySeq == 0;
                                                             delayForWreadySeq == 0;
                                                           }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedNextClkBvalidAssertedSeq")
  end

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

