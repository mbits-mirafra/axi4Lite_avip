`ifndef SLAVEVIPMASTERIPVIRTUALOUTSTANDINGTRANSACTIONSEQ_INCLUDED_
`define SLAVEVIPMASTERIPVIRTUALOUTSTANDINGTRANSACTIONSEQ_INCLUDED_

class SlaveVIPMasterIPVirtualOutstandingTransactionSeq extends SlaveVIPMasterIPVirtualBaseSeq;
  `uvm_object_utils(SlaveVIPMasterIPVirtualOutstandingTransactionSeq)

  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
 
  MasterRTLWrite32bitsSeq masterRTLWrite32bitsSeq;
  MasterRTLRead32bitsSeq masterRTLRead32bitsSeq;

  extern function new(string name = "SlaveVIPMasterIPVirtualOutstandingTransactionSeq");
  extern task body();
endclass : SlaveVIPMasterIPVirtualOutstandingTransactionSeq

function SlaveVIPMasterIPVirtualOutstandingTransactionSeq::new(string name = "SlaveVIPMasterIPVirtualOutstandingTransactionSeq");
  super.new(name);
endfunction : new

task SlaveVIPMasterIPVirtualOutstandingTransactionSeq::body();
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  masterRTLWrite32bitsSeq = MasterRTLWrite32bitsSeq::type_id::create("masterRTLWrite32bitsSeq");
  masterRTLRead32bitsSeq = MasterRTLRead32bitsSeq::type_id::create("masterRTLRead32bitsSeq");

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

   if(!masterRTLWrite32bitsSeq.randomize() with {writeEnableSeq == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside SlaveVIPMasterIPVirtualWriteFollowedByReadSeq")
  end

   if(!masterRTLRead32bitsSeq.randomize() with {readEnableSeq == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside SlaveVIPMasterIPVirtualWriteFollowedByReadSeq")
  end

  fork
    masterRTLWrite32bitsSeq.start(p_sequencer.masterRTLSequencer);
    masterRTLRead32bitsSeq.start(p_sequencer.masterRTLSequencer);
  join

 endtask : body

`endif

