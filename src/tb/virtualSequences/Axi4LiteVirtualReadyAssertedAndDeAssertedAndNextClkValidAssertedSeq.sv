`ifndef AXI4LITEVIRTUALREADYASSERTEDANDDEASSERTEDANDNEXTCLKVALIDASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALREADYASSERTEDANDDEASSERTEDANDNEXTCLKVALIDASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq)

  Axi4LiteMasterWrite32bitsTransferWithToggleReadySeq axi4LiteMasterWrite32bitsTransferWithToggleReadySeq;
  Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq;
  Axi4LiteMasterRead32bitsTransferWithToggleReadySeq axi4LiteMasterRead32bitsTransferWithToggleReadySeq;
  Axi4LiteSlaveRead32bitsTransferWithToggleReadySeq axi4LiteSlaveRead32bitsTransferWithToggleReadySeq;

  extern function new(string name = "Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq

function Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq::new(string name = "Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq::body();
  axi4LiteMasterWrite32bitsTransferWithToggleReadySeq = Axi4LiteMasterWrite32bitsTransferWithToggleReadySeq::type_id::create("axi4LiteMasterWrite32bitsTransferWithToggleReadySeq");
  axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq = Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq::type_id::create("axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq");
  axi4LiteMasterRead32bitsTransferWithToggleReadySeq = Axi4LiteMasterRead32bitsTransferWithToggleReadySeq::type_id::create("axi4LiteMasterRead32bitsTransferWithToggleReadySeq");
  axi4LiteSlaveRead32bitsTransferWithToggleReadySeq = Axi4LiteSlaveRead32bitsTransferWithToggleReadySeq::type_id::create("axi4LiteSlaveRead32bitsTransferWithToggleReadySeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq"), UVM_NONE); 

   fork
   begin : SLAVE_WRITE_SEQ
     forever begin
       if(!axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq.randomize() with {delayForBvalidSeq == 3;
                                                                                delayForAwreadySeq == 1;
                                                                                delayForWreadySeq == 1;
                                                                                repeatToggleAwreadySeq == 2;
                                                                                repeatToggleWreadySeq == 2;
                                                                              }) begin
         `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq")
       end
       axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
     end
    end
  begin : SLAVE_READ_SEQ
    forever begin
      if(!axi4LiteSlaveRead32bitsTransferWithToggleReadySeq.randomize() with {delayForRvalidSeq == 3;
                                                                              repeatToggleArreadySeq == 2;
                                                                             }) begin
        `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq")
      end
       axi4LiteSlaveRead32bitsTransferWithToggleReadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    end
  end
  join_none


  fork
    begin: MASTER_WRITE_SEQ
      repeat(1) begin
        if(!axi4LiteMasterWrite32bitsTransferWithToggleReadySeq.randomize() with {awprotSeq == 1;
                                                                                  delayForAwvalidSeq == 3;
                                                                                  delayForWvalidSeq  == 3;
                                                                                  repeatToggleBreadySeq == 2;
                                                                                }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq")
       end
       axi4LiteMasterWrite32bitsTransferWithToggleReadySeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
      end 
    end
  begin: MASTER_READ_SEQ
      repeat(1) begin
        if(!axi4LiteMasterRead32bitsTransferWithToggleReadySeq.randomize() with {arprotSeq == 1;
                                                                                 delayForArvalidSeq == 3;
                                                                                 repeatToggleRreadySeq == 2;
                                                                               }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualReadyAssertedAndDeAssertedAndNextClkValidAssertedSeq")
        end
        axi4LiteMasterRead32bitsTransferWithToggleReadySeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
   end
 join

 endtask : body

`endif

