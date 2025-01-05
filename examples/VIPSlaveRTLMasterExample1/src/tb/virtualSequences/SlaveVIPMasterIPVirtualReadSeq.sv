`ifndef SLAVEVIPMASTERIPVIRTUALREADSEQ_INCLUDED_
`define SLAVEVIPMASTERIPVIRTUALREADSEQ_INCLUDED_

class SlaveVIPMasterIPVirtualReadSeq extends SlaveVIPMasterIPVirtualBaseSeq;
  `uvm_object_utils(SlaveVIPMasterIPVirtualReadSeq)

  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq; 
  extern function new(string name = "SlaveVIPMasterIPVirtualReadSeq");
  extern task body();
endclass : SlaveVIPMasterIPVirtualReadSeq

function SlaveVIPMasterIPVirtualReadSeq::new(string name = "SlaveVIPMasterIPVirtualReadSeq");
  super.new(name);
endfunction : new

task SlaveVIPMasterIPVirtualReadSeq::body();
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");
  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start SlaveVIPMasterIPVirtualReadSeq"), UVM_NONE); 

    if(!axi4LiteSlaveRead32bitsTransferSeq.randomize())begin
       `uvm_error(get_type_name(), "Randomization failed")
    end
    axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer); 
  

 endtask : body

`endif

