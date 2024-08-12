`ifndef AXI4LITEVIRTUALREADYASSERTEDANDDEASSERTED3TIMESANDNEXTCLKVALIDASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALREADYASSERTEDANDDEASSERTED3TIMESANDNEXTCLKVALIDASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq)

  Axi4LiteMasterWrite32bitsTransferWithToggleReadySeq axi4LiteMasterWrite32bitsTransferWithToggleReadySeq;
  Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq;
  Axi4LiteMasterRead32bitsTransferWithToggleReadySeq axi4LiteMasterRead32bitsTransferWithToggleReadySeq;
  Axi4LiteSlaveRead32bitsTransferWithToggleReadySeq axi4LiteSlaveRead32bitsTransferWithToggleReadySeq;

  extern function new(string name = "Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq

function Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq::new(string name = "Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq::body();
  axi4LiteMasterWrite32bitsTransferWithToggleReadySeq = Axi4LiteMasterWrite32bitsTransferWithToggleReadySeq::type_id::create("axi4LiteMasterWrite32bitsTransferWithToggleReadySeq");
  axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq = Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq::type_id::create("axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq");
  axi4LiteMasterRead32bitsTransferWithToggleReadySeq = Axi4LiteMasterRead32bitsTransferWithToggleReadySeq::type_id::create("axi4LiteMasterRead32bitsTransferWithToggleReadySeq");
  axi4LiteSlaveRead32bitsTransferWithToggleReadySeq = Axi4LiteSlaveRead32bitsTransferWithToggleReadySeq::type_id::create("axi4LiteSlaveRead32bitsTransferWithToggleReadySeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq"), UVM_NONE); 

   fork
   begin : SLAVE_WRITE_SEQ
     forever begin
       if(!axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq.randomize() with {delayForBvalidSeq == 7;
                                                                                delayForAwreadySeq == 1;
                                                                                delayForWreadySeq == 1;
                                                                                repeatToggleReadySeq == 6;
                                                                              }) begin
         `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq")
       end
       axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
     end
    end
  begin : SLAVE_READ_SEQ
    forever begin
      if(!axi4LiteSlaveRead32bitsTransferWithToggleReadySeq.randomize() with {delayForRvalidSeq == 7;
                                                                              repeatToggleReadySeq == 6;
                                                                             }) begin
        `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq")
      end
       axi4LiteSlaveRead32bitsTransferWithToggleReadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    end
  end
  join_none


  fork
    begin: MASTER_WRITE_SEQ
      repeat(1) begin
        if(!axi4LiteMasterWrite32bitsTransferWithToggleReadySeq.randomize() with {awprotSeq == 1;
                                                                                  delayForAwvalidSeq == 7;
                                                                                  delayForWvalidSeq  == 7;
                                                                                  repeatToggleReadySeq == 6;
                                                                                }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq")
       end
       axi4LiteMasterWrite32bitsTransferWithToggleReadySeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
      end 
    end
  begin: MASTER_READ_SEQ
      repeat(1) begin
        if(!axi4LiteMasterRead32bitsTransferWithToggleReadySeq.randomize() with {arprotSeq == 1;
                                                                                 delayForArvalidSeq == 7;
                                                                                 repeatToggleReadySeq == 6;
                                                                               }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualReadyAssertedAndDeAsserted3TimesAndNextClkValidAssertedSeq")
        end
        axi4LiteMasterRead32bitsTransferWithToggleReadySeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
   end
 join

 endtask : body

`endif

