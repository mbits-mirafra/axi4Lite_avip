`ifndef SLAVEVIPMASTERIPVIRTUALWRITESEQ_INCLUDED_
`define SLAVEVIPMASTERIPVIRTUALWRITESEQ_INCLUDED_

class SlaveVIPMasterIPVirtualWriteSeq extends SlaveVIPMasterIPVirtualBaseSeq;
  `uvm_object_utils(SlaveVIPMasterIPVirtualWriteSeq)

  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  MasterRTLWrite32bitsSeq masterRTLWrite32bitsSeq;
 
  extern function new(string name = "SlaveVIPMasterIPVirtualWriteSeq");
  extern task body();
endclass : SlaveVIPMasterIPVirtualWriteSeq

function SlaveVIPMasterIPVirtualWriteSeq::new(string name = "SlaveVIPMasterIPVirtualWriteSeq");
  super.new(name);
endfunction : new

task SlaveVIPMasterIPVirtualWriteSeq::body();
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
  masterRTLWrite32bitsSeq = MasterRTLWrite32bitsSeq::type_id::create("masterRTLWrite32bitsSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start SlaveVIPMasterIPVirtualWriteSeq"), UVM_NONE); 

   if(!masterRTLWrite32bitsSeq.randomize() with {writeEnableSeq == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside SlaveVIPMasterIPVirtualWriteSeq")
  end

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside SlaveVIPMasterIPVirtualWriteSeq")
  end

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    masterRTLWrite32bitsSeq.start(p_sequencer.masterRTLSequencer);
  join

 endtask : body

`endif

