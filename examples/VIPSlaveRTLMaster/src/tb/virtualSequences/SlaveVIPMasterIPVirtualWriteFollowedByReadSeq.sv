`ifndef SLAVEVIPMASTERIPVIRTUALWRITEFOLLOWEDBYREADSEQ_INCLUDED_
`define SLAVEVIPMASTERIPVIRTUALWRITEFOLLOWEDBYREADSEQ_INCLUDED_

class SlaveVIPMasterIPVirtualWriteFollowedByReadSeq extends SlaveVIPMasterIPVirtualBaseSeq;
  `uvm_object_utils(SlaveVIPMasterIPVirtualWriteFollowedByReadSeq)

  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
 
  MasterRTLWrite32bitsSeq masterRTLWrite32bitsSeq;
  MasterRTLRead32bitsSeq masterRTLRead32bitsSeq;

  extern function new(string name = "SlaveVIPMasterIPVirtualWriteFollowedByReadSeq");
  extern task body();
endclass : SlaveVIPMasterIPVirtualWriteFollowedByReadSeq

function SlaveVIPMasterIPVirtualWriteFollowedByReadSeq::new(string name = "SlaveVIPMasterIPVirtualWriteFollowedByReadSeq");
  super.new(name);
endfunction : new

task SlaveVIPMasterIPVirtualWriteFollowedByReadSeq::body();
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  masterRTLWrite32bitsSeq = MasterRTLWrite32bitsSeq::type_id::create("masterRTLWrite32bitsSeq");
  masterRTLRead32bitsSeq = MasterRTLRead32bitsSeq::type_id::create("masterRTLRead32bitsSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start SlaveVIPMasterIPVirtualWriteFollowedByReadSeq"), UVM_NONE); 
   
  if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside SlaveVIPMasterIPVirtualWriteSeq")
  end

 if(!axi4LiteSlaveRead32bitsTransferSeq.randomize())begin
      `uvm_error(get_type_name(), "Randomization failed")
  end

   if(!masterRTLWrite32bitsSeq.randomize() with {writeEnableSeq == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside SlaveVIPMasterIPVirtualWriteFollowedByReadSeq")
  end

   if(!masterRTLRead32bitsSeq.randomize() with {readEnableSeq == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside SlaveVIPMasterIPVirtualWriteFollowedByReadSeq")
  end


  fork 
  begin
    forever begin
      axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer); 
      axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer); 
    end
  end
  join_none

  fork
  begin
    masterRTLWrite32bitsSeq.start(p_sequencer.masterRTLSequencer);
    masterRTLRead32bitsSeq.start(p_sequencer.masterRTLSequencer);
  end
  join

 endtask : body

`endif

