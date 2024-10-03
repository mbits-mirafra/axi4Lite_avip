`ifndef AXI4LITEVIRTUALADDRESSOUTSIDEMINANDMAXRANGESEQ_INCLUDED_
`define AXI4LITEVIRTUALADDRESSOUTSIDEMINANDMAXRANGESEQ_INCLUDED_

class Axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq");
  extern task body();
endclass : Axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq

function Axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq::new(string name = "Axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq"), UVM_NONE); 

   fork
   begin : SLAVE_WRITE_SEQ
     forever begin
          if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalidSeq == 1; 
                                                                    delayForAwreadySeq == 0;
                                                                    delayForWreadySeq == 0;
                                                                    }) begin
             `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitWriteDataSeq")
          end
          axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
      end
    end
  begin : SLAVE_READ_SEQ
    forever begin
        if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with { delayForArreadySeq == 0;
                                                                  delayForRvalidSeq == 0;
                                                                }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq")
        end
        axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    end
  end
  join_none


  fork
    begin: MASTER_WRITE_SEQ
      repeat(1) begin
          if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {awaddrSeq > 16'hffff;
                                                                     awprotSeq == 1;
                                                                     delayForAwvalidSeq == 1;
                                                                     delayForWvalidSeq  == 3;
                                                                   }) begin
            `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitWriteDataSeq")
        end
        axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
      end 
    end
  begin: MASTER_READ_SEQ
      repeat(1) begin
        if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {araddrSeq > 16'hffff;
                                                                  arprotSeq == 1;
                                                                  delayForArvalidSeq == 2;
                                                                  delayForRreadySeq == 0;
                                                                 }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAddressOutsideMinAndMaxRangeSeq")
      end
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
   end
 join

 endtask : body

`endif


