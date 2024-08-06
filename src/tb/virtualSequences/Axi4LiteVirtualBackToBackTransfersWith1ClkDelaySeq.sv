`ifndef AXI4LITEVIRTUALBACKTOBACKTRANSFERSWITH1CLKDELAYSEQ_INCLUDED_
`define AXI4LITEVIRTUALBACKTOBACKTRANSFERSWITH1CLKDELAYSEQ_INCLUDED_

class Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq extends Axi4LiteVirtualBackToBackTransfersWithoutDelaySeq;
  `uvm_object_utils(Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq)

  extern function new(string name = "Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq");
  extern task body();
endclass : Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq

function Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq::new(string name = "Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq"), UVM_NONE); 


  fork
    begin : SLAVE_WRITE_SEQ
      forever begin 
        if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForAwreadySeq == 0;
                                                                  delayForWreadySeq  == 0;
                                                                  delayForBvalidSeq  == 1;
                                                                 }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq")
        end
         axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
      end
    end

    begin : SLAVE_READ_SEQ
      forever begin 
        if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForArreadySeq == 0;
                                                                 delayForRvalidSeq == 1;
                                                                }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq")
        end
          axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
      end
    end
 join_none

  fork 
   repeat(2) begin : MASTER_WRITE_SEQ
     if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalidSeq == 1;
                                                                delayForWvalidSeq  == 1;
                                                                delayForBreadySeq  == 0;
                                                               }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq")
     end
     axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
   end  

   repeat(2) begin : MASTER_READ_SEQ
      if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {arprotSeq == 1;
                                                                delayForArvalidSeq == 1;
                                                                delayForRreadySeq == 0;
                                                               }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq")
      end
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
 join

 endtask : body

`endif

