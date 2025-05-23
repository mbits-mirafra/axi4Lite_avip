`ifndef AXI4LITEVIRTUAL32BITWRITEANDREADSAMEADDRESSANDDATASEQ_INCLUDED_
`define AXI4LITEVIRTUAL32BITWRITEANDREADSAMEADDRESSANDDATASEQ_INCLUDED_

class Axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq");
  extern task body();
endclass : Axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq

function Axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq::new(string name = "Axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq"), UVM_NONE); 

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
                                                                  rdataSeq == 'h1243_DBCA;}) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq")
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
                                                              awaddrSeq == 'h1002_1006;
                                                              wdataSeq  == 'h1243_DBCA;
                                                              if(Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH == 64) {
                                                              wstrbSeq == 'hff;}
                                                              else if(Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH == 32) {
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
                                                                  araddrSeq == 'h1002_1006;
                                                                  }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitWriteAndReadSameAddressAndDataSeq")
      end
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
   end
 join

 endtask : body

`endif


