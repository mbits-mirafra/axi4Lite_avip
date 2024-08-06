`ifndef AXI4LITEVIRTUALBACKTOBACKTRANSFERSWITH3TO16CLKDELAYSEQ_INCLUDED_
`define AXI4LITEVIRTUALBACKTOBACKTRANSFERSWITH3TO16CLKDELAYSEQ_INCLUDED_

class Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq extends Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq;
  `uvm_object_utils(Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq)

  extern function new(string name = "Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq");
  extern task body();
endclass : Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq

function Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq::new(string name = "Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  fork
    begin : SLAVE_WRITE_SEQ
      forever begin 
        if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForAwreadySeq == 0;
                                                                  delayForWreadySeq  == 0;
                                                                  delayForBvalidSeq  == 4;
                                                                 }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq")
        end
         axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
      end
    end

    begin : SLAVE_READ_SEQ
      forever begin 
        if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForArreadySeq == 0;
                                                                 delayForRvalidSeq == 4;
                                                                }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq")
        end
          axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
      end
    end
 join_none

  fork 
   repeat(2) begin : MASTER_WRITE_SEQ
     if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalidSeq == 4;
                                                                delayForWvalidSeq  == 4;
                                                                delayForBreadySeq  == 0;
                                                               }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq")
     end
     axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
   end  

   repeat(2) begin : MASTER_READ_SEQ
      if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {arprotSeq == 1;
                                                                delayForArvalidSeq == 4;
                                                                delayForRreadySeq == 0;
                                                               }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith3To16ClkDelaySeq")
      end
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
 join

 endtask : body

`endif

