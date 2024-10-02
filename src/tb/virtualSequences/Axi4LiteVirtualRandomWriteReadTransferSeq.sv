`ifndef AXI4LITEMASTERVIRTUALRANDOMWRITEREADTRANSFERSEQ_INCLUDED_
`define AXI4LITEMASTERVIRTUALRANDOMWRITEREADTRANSFERSEQ_INCLUDED_

class Axi4LiteVirtualRandomWriteReadTransferSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualRandomWriteReadTransferSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
  
  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;

  extern function new(string name = "Axi4LiteVirtualRandomWriteReadTransferSeq");
  extern task body();
endclass : Axi4LiteVirtualRandomWriteReadTransferSeq

function Axi4LiteVirtualRandomWriteReadTransferSeq::new(string name = "Axi4LiteVirtualRandomWriteReadTransferSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualRandomWriteReadTransferSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualRandomWriteReadTransferSeq"), UVM_NONE); 

  fork
    begin : SLAVE_WRITE
      forever begin
        axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
      end
    end
    begin : SLAVE_READ
     forever begin
       axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
      end
    end
  join_none

  fork 
    begin: MASTER_WRITE
      repeat(10) begin
        axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
      end
    end
    begin: MASTER_READ
      repeat(10) begin
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
      end
    end
  join

 endtask : body

`endif

