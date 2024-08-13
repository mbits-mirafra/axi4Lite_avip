`ifndef AXI4LITEVIRTUAL32BITWRITEANDREADRANDOMADDRESSANDDATASEQ_INCLUDED_
`define AXI4LITEVIRTUAL32BITWRITEANDREADRANDOMADDRESSANDDATASEQ_INCLUDED_

class Axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq");
  extern task body();
endclass : Axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq

function Axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq::new(string name = "Axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq"), UVM_NONE); 

   fork
   begin : SLAVE_WRITE_SEQ
     forever begin
          if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalidSeq == 1; 
                                                                    delayForAwreadySeq == 0;
                                                                    delayForWreadySeq == 0;
                                                                    }) begin
             `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitWriteDataSeq")
          end
          axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
      end
    end
  begin : SLAVE_READ_SEQ
    forever begin
        if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with { delayForArreadySeq == 0;
                                                                  delayForRvalidSeq == 0;
                                                                }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq")
        end
          axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    end
  end
  join_none


  fork
    begin: MASTER_WRITE_SEQ
      repeat(1) begin
          if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {awprotSeq == 1;
                                                              delayForAwvalidSeq == 1;
                                                              delayForWvalidSeq  == 3;
                                                              if(Axi4LiteMasterWritePkg::DATA_WIDTH == 64) {
                                                              wstrbSeq == 'hff;}
                                                              else if(Axi4LiteMasterWritePkg::DATA_WIDTH == 32) {
                                                              wstrbSeq == 'hf;} 
                                                            }) begin
            `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitWriteDataSeq")
        end
        axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
      end 
    end
  begin: MASTER_READ_SEQ
      repeat(1) begin
        if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {arprotSeq == 1;
                                                                  delayForArvalidSeq == 2;
                                                                  delayForRreadySeq == 0;
                                                                  }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitWriteAndReadRandomAddressAndDataSeq")
      end
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
   end
 join

 endtask : body

`endif


