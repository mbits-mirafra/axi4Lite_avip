`ifndef SLAVEVIPMASTERIPVIRTUALOUTSTANDINGTRANSACTIONSEQ_INCLUDED_
`define SLAVEVIPMASTERIPVIRTUALOUTSTANDINGTRANSACTIONSEQ_INCLUDED_

class SlaveVIPMasterIPVirtualOutstandingTransactionSeq extends SlaveVIPMasterIPVirtualBaseSeq;
  `uvm_object_utils(SlaveVIPMasterIPVirtualOutstandingTransactionSeq)

  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
 
  extern function new(string name = "SlaveVIPMasterIPVirtualOutstandingTransactionSeq");
  extern task body();
endclass : SlaveVIPMasterIPVirtualOutstandingTransactionSeq

function SlaveVIPMasterIPVirtualOutstandingTransactionSeq::new(string name = "SlaveVIPMasterIPVirtualOutstandingTransactionSeq");
  super.new(name);
endfunction : new

task SlaveVIPMasterIPVirtualOutstandingTransactionSeq::body();
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start SlaveVIPMasterIPVirtualOutstandingTransactionSeq"), UVM_NONE); 


  fork
    begin : SLAVE_WRITE_SEQ
      repeat(3) begin
        if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {  delayForAwreadySeq == 0;
                                                                    delayForWreadySeq  == 0;
                                                                    delayForBvalidSeq  == 10;
                                                                }) begin
          `uvm_error(get_type_name(), "Randomization failed SlaveWrite : Inside SlaveVIPMasterIPVirtualOutstandingTransactionSeq")
        end
          axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
      end
    end
    begin: SLAVE_READ_SEQ
      repeat(3) begin
        if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with { delayForArreadySeq == 0;
                                                                  delayForRvalidSeq == 10;
                                                                  }) begin
       `uvm_error(get_type_name(), "Randomization failed SlaveRead : Inside SlaveVIPMasterIPVirtualOutstandingTransactionSeq")
      end
        axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
     end
   end
 join_none

 endtask : body

`endif

