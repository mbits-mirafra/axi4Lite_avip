`ifndef AXI4LITEVIRTUAL32BITDATAWITHANYVALUESEQ_INCLUDED_
`define AXI4LITEVIRTUAL32BITDATAWITHANYVALUESEQ_INCLUDED_

class Axi4LiteVirtual32bitDataWithAnyValueSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtual32bitDataWithAnyValueSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtual32bitDataWithAnyValueSeq");
  extern task body();
endclass : Axi4LiteVirtual32bitDataWithAnyValueSeq

function Axi4LiteVirtual32bitDataWithAnyValueSeq::new(string name = "Axi4LiteVirtual32bitDataWithAnyValueSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtual32bitDataWithAnyValueSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtual32bitDataWithAnyValueSeq"), UVM_NONE); 


   fork
   begin : SLAVE_WRITE_SEQ
     forever begin
          if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalidSeq == 1; 
                                                                    delayForAwreadySeq == 0;
                                                                    delayForWreadySeq == 0;
                                                                    }) begin
             `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitDataWithAnyValueSeq")
          end
          axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
      end
    end
  begin : SLAVE_READ_SEQ
    forever begin
        if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with { delayForArreadySeq == 0;
                                                                  delayForRvalidSeq == 0;
                                                                  rdataSeq dist {32'hffff_ffff:/3, 32'haaaa_aaaa:/3, 32'h0000_0000:/3, [0:$]:/1};
                                                                }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitDataWithAnyValueSeq")
        end
          axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    end
  end
  join_none


  fork
    begin: MASTER_WRITE_SEQ
      repeat(20) begin
          if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {awprotSeq inside {[0:3]};
                                                                     delayForAwvalidSeq == 1;
                                                                     delayForWvalidSeq  == 2;
                                                                     delayForBreadySeq  == 1;
                                                                     wdataSeq dist {32'hffff_ffff:/3, 32'haaaa_aaaa:/3, [0:$]:/4};
                                                                    }) begin
            `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitDataWithAnyValueSeq")
        end
        axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
      end 
    end
  begin: MASTER_READ_SEQ
      repeat(20) begin
        if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {arprotSeq inside {[0:3]};
                                                                  delayForArvalidSeq == 2;
                                                                  delayForRreadySeq == 0;
                                                                  }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitDataWithAnyValueSeq")
      end
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
   end
 join

 endtask : body

`endif

