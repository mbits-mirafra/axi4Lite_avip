`ifndef AXI4LITEVIRTUALTOGGLEREADYSEQ_INCLUDED_
`define AXI4LITEVIRTUALTOGGLEREADYSEQ_INCLUDED_

class Axi4LiteVirtualToggleReadySeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualToggleReadySeq)

  Axi4LiteMasterWrite32bitsTransferWithToggleReadySeq axi4LiteMasterWrite32bitsTransferWithToggleReadySeq;
  Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq;
  Axi4LiteMasterRead32bitsTransferWithToggleReadySeq axi4LiteMasterRead32bitsTransferWithToggleReadySeq;
  Axi4LiteSlaveRead32bitsTransferWithToggleReadySeq axi4LiteSlaveRead32bitsTransferWithToggleReadySeq;

  extern function new(string name = "Axi4LiteVirtualToggleReadySeq");
  extern task body();
endclass : Axi4LiteVirtualToggleReadySeq

function Axi4LiteVirtualToggleReadySeq::new(string name = "Axi4LiteVirtualToggleReadySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualToggleReadySeq::body();
  axi4LiteMasterWrite32bitsTransferWithToggleReadySeq = Axi4LiteMasterWrite32bitsTransferWithToggleReadySeq::type_id::create("axi4LiteMasterWrite32bitsTransferWithToggleReadySeq");
  axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq = Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq::type_id::create("axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq");
  axi4LiteMasterRead32bitsTransferWithToggleReadySeq = Axi4LiteMasterRead32bitsTransferWithToggleReadySeq::type_id::create("axi4LiteMasterRead32bitsTransferWithToggleReadySeq");
  axi4LiteSlaveRead32bitsTransferWithToggleReadySeq = Axi4LiteSlaveRead32bitsTransferWithToggleReadySeq::type_id::create("axi4LiteSlaveRead32bitsTransferWithToggleReadySeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualToggleReadySeq"), UVM_NONE); 

   fork
   begin : SLAVE_WRITE_SEQ
     forever begin
       if(!axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq.randomize()) begin
         `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualToggleReadySeq")
       end
       axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
     end
    end
  begin : SLAVE_READ_SEQ
    forever begin
      if(!axi4LiteSlaveRead32bitsTransferWithToggleReadySeq.randomize()) begin
        `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualToggleReadySeq")
      end
       axi4LiteSlaveRead32bitsTransferWithToggleReadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    end
  end
  join_none


  fork
    begin: MASTER_WRITE_SEQ
      repeat(10) begin
        if(!axi4LiteMasterWrite32bitsTransferWithToggleReadySeq.randomize() with {awprotSeq == 1;
                                                                                }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualToggleReadySeq")
       end
       axi4LiteMasterWrite32bitsTransferWithToggleReadySeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
      end 
    end
  begin: MASTER_READ_SEQ
      repeat(10) begin
        if(!axi4LiteMasterRead32bitsTransferWithToggleReadySeq.randomize() with {arprotSeq == 1;
                                                                               }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualToggleReadySeq")
        end
        axi4LiteMasterRead32bitsTransferWithToggleReadySeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
   end
 join

 endtask : body

`endif

