`ifndef AXI4LITEVIRTUALOUTSTANDINGTRANSACTIONSEQ_INCLUDED_
`define AXI4LITEVIRTUALOUTSTANDINGTRANSACTIONSEQ_INCLUDED_

class Axi4LiteVirtualOutstandingTransactionSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualOutstandingTransactionSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtualOutstandingTransactionSeq");
  extern task body();
endclass : Axi4LiteVirtualOutstandingTransactionSeq

function Axi4LiteVirtualOutstandingTransactionSeq::new(string name = "Axi4LiteVirtualOutstandingTransactionSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualOutstandingTransactionSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualOutstandingTransactionSeq"), UVM_NONE); 

   fork
     begin : SLAVE_WRITE_SEQ
       forever begin
         if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalidSeq == 5; 
                                                                   delayForAwreadySeq == 0;
                                                                   delayForWreadySeq == 0;
                                                                  }) begin
           `uvm_error(get_type_name(), "Randomization failed SlaveWrite: Inside Axi4LiteVirtualOutstandingTransactionSeq")
         end
         axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
       end
    end

     begin : SLAVE_READ_SEQ
       forever begin
         if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForRvalidSeq == 5; 
                                                                  delayForArreadySeq == 0;
                                                                 }) begin
           `uvm_error(get_type_name(), "Randomization failed SlaveRead: Inside Axi4LiteVirtualOutstandingTransactionSeq")
         end
         axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
       end
    end
  join_none

  fork
    begin : MASTER_WRITE_SEQ
      repeat(3) begin
        if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with { awprotSeq == 1;
                                                                    delayForAwvalidSeq == 0;
                                                                    delayForWvalidSeq  == 0;
                                                                    delayForBreadySeq  == 0;
                                                                }) begin
          `uvm_error(get_type_name(), "Randomization failed MasterWrite : Inside Axi4LiteVirtualOutstandingTransactionSeq")
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
       `uvm_error(get_type_name(), "Randomization failed MasterRead : Inside Axi4LiteVirtualOutstandingTransactionSeq")
      end
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
   end
 join_none

 endtask : body

`endif

