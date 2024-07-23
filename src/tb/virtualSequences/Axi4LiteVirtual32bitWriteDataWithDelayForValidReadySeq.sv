`ifndef AXI4LITEVIRTUAL32BITWRITEDATAWITHDELAYFORVALIDREADYSEQ_INCLUDED_
`define AXI4LITEVIRTUAL32BITWRITEDATAWITHDELAYFORVALIDREADYSEQ_INCLUDED_

class Axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq");
  extern task body();
endclass : Axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq

function Axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq::new(string name = "Axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {awprot == 1;
                                                              delayForAwvalid == 2;
                                                              delayForWvalid == 4;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq")
  end

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalid == 2;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitWriteDataWithDelayForValidReadySeq")
  end

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

