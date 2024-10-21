`ifndef MASTERVIPSLAVEIPVIRTUALOUTSTANDINGTRANSACTIONSEQ_INCLUDED_
`define MASTERVIPSLAVEIPVIRTUALOUTSTANDINGTRANSACTIONSEQ_INCLUDED_

class MasterVIPSlaveIPVirtualOutstandingTransactionSeq extends MasterVIPSlaveIPVirtualBaseSeq;
  `uvm_object_utils(MasterVIPSlaveIPVirtualOutstandingTransactionSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
 
  extern function new(string name = "MasterVIPSlaveIPVirtualOutstandingTransactionSeq");
  extern task body();
endclass : MasterVIPSlaveIPVirtualOutstandingTransactionSeq

function MasterVIPSlaveIPVirtualOutstandingTransactionSeq::new(string name = "MasterVIPSlaveIPVirtualOutstandingTransactionSeq");
  super.new(name);
endfunction : new

task MasterVIPSlaveIPVirtualOutstandingTransactionSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start MasterVIPSlaveIPVirtualOutstandingTransactionSeq"), UVM_NONE); 


  fork
    begin : MASTER_WRITE_SEQ
      repeat(3) begin
        if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with { awprotSeq == 1;
                                                                    delayForAwvalidSeq == 0;
                                                                    delayForWvalidSeq  == 0;
                                                                    delayForBreadySeq  == 0;
                                                                }) begin
          `uvm_error(get_type_name(), "Randomization failed MasterWrite : Inside MasterVIPSlaveIPVirtualOutstandingTransactionSeq")
        end
          axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
      end
    end
    begin: MASTER_READ_SEQ
      repeat(3) begin
        if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {arprotSeq == 1;
                                                                  delayForArvalidSeq == 0;
                                                                  delayForRreadySeq == 0;
                                                                  }) begin
       `uvm_error(get_type_name(), "Randomization failed MasterRead : Inside MasterVIPSlaveIPVirtualOutstandingTransactionSeq")
      end
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
   end
 join_none

 endtask : body

`endif

