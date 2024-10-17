`ifndef AXI4LITEVIRTUALWRITEFOLLOWEDBYREADSEQ_INCLUDED_
`define AXI4LITEVIRTUALWRITEFOLLOWEDBYREADSEQ_INCLUDED_

class Axi4LiteVirtualWriteFollowedByReadSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualWriteFollowedByReadSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq; 

  extern function new(string name = "Axi4LiteVirtualWriteFollowedByReadSeq");
  extern task body();
endclass : Axi4LiteVirtualWriteFollowedByReadSeq

function Axi4LiteVirtualWriteFollowedByReadSeq::new(string name = "Axi4LiteVirtualWriteFollowedByReadSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualWriteFollowedByReadSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualWriteFollowedByReadSeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWriteFollowedByReadSeq")
  end

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWriteFollowedByReadSeq")
  end

   if(!axi4LiteMasterRead32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWriteFollowedByReadSeq")
  end

  if(!axi4LiteSlaveRead32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWriteFollowedByReadSeq")
  end

  fork
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

