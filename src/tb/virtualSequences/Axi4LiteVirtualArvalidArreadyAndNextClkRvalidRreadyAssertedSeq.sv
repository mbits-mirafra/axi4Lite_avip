`ifndef AXI4LITEVIRTUALARVALIDARREADYANDNEXTCLKRVALIDRREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALARVALIDARREADYANDNEXTCLKRVALIDRREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq extends Axi4LiteVirtual32bitReadDataSeq;
  `uvm_object_utils(Axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq

function Axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq::new(string name = "Axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {arprotSeq == 1;
                                                             delayForArvalidSeq == 1;
                                                             delayForRreadySeq == 0;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq")
  end

   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForRvalidSeq == 0;
                                                            delayForArreadySeq == 0;
                                                          }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualArvalidArreadyAndNextClkRvalidRreadyAssertedSeq")
  end

  fork
    axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

