`ifndef AXI4LITEVIRTUALBACKTOBACKTRANSFERSWITHOUTDELAYSEQ_INCLUDED_
`define AXI4LITEVIRTUALBACKTOBACKTRANSFERSWITHOUTDELAYSEQ_INCLUDED_

class Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq");
  extern task body();
endclass : Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq

function Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq::new(string name = "Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");


  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq"), UVM_NONE); 

  fork
    begin : SLAVE_WRITE_SEQ
      forever begin 
        if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForAwreadySeq == 0;
                                                                  delayForWreadySeq  == 0;
                                                                  delayForBvalidSeq  == 0;
                                                                 }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq")
        end
          `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq delayForAwreadySeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForAwreadySeq),UVM_LOW);

        axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
      end
    end
 
  begin : SLAVE_READ_SEQ
    forever begin 
        if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForArreadySeq == 0;
                                                                 delayForRvalidSeq == 0;
                                                                }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq")
        end
          axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    end
  end
join_none

   fork 
    repeat(2) begin : MASTER_READ_SEQ
      if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {arprotSeq == 1;
                                                                delayForArvalidSeq == 0;
                                                                delayForRreadySeq == 0;
                                                               }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq")
      end
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
  repeat(2) begin : MASTER_WRITE_SEQ
     if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalidSeq == 0;
                                                                delayForWvalidSeq  == 0;
                                                                delayForBreadySeq  == 0;
                                                               }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq")
     end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq delayForAwvalidSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForAwvalidSeq),UVM_LOW);

     axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
   end
 join
 
 endtask : body

`endif

