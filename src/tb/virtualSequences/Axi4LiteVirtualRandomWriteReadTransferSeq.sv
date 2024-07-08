`ifndef AXI4LITEMASTERVIRTUALRANDOMWRITEREADTRANSFERSEQ_INCLUDED_
`define AXI4LITEMASTERVIRTUALRANDOMWRITEREADTRANSFERSEQ_INCLUDED_

class Axi4LiteVirtualRandomWriteReadTransferSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualRandomWriteReadTransferSeq)

  Axi4LiteMasterWriteRandomTransferSeq axi4LiteMasterWriteRandomTransferSeq;
  Axi4LiteSlaveWriteRandomTransferSeq axi4LiteSlaveWriteRandomTransferSeq;
  
  Axi4LiteMasterReadRandomTransferSeq axi4LiteMasterReadRandomTransferSeq;
  Axi4LiteSlaveReadRandomTransferSeq axi4LiteSlaveReadRandomTransferSeq;

  extern function new(string name = "Axi4LiteVirtualRandomWriteReadTransferSeq");
  extern task body();
endclass : Axi4LiteVirtualRandomWriteReadTransferSeq

function Axi4LiteVirtualRandomWriteReadTransferSeq::new(string name = "Axi4LiteVirtualRandomWriteReadTransferSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualRandomWriteReadTransferSeq::body();
  axi4LiteMasterWriteRandomTransferSeq = Axi4LiteMasterWriteRandomTransferSeq::type_id::create("axi4LiteMasterWriteRandomTransferSeq");
  axi4LiteSlaveWriteRandomTransferSeq = Axi4LiteSlaveWriteRandomTransferSeq::type_id::create("axi4LiteSlaveWriteRandomTransferSeq");

  axi4LiteMasterReadRandomTransferSeq = Axi4LiteMasterReadRandomTransferSeq::type_id::create("axi4LiteMasterReadRandomTransferSeq");
  axi4LiteSlaveReadRandomTransferSeq = Axi4LiteSlaveReadRandomTransferSeq::type_id::create("axi4LiteSlaveReadRandomTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualRandomWriteReadTransferSeq"), UVM_NONE); 

  fork
    begin : SLAVE_WRITE
      forever begin
        axi4LiteSlaveWriteRandomTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
      end
    end
    begin : SLAVE_READ
     forever begin
       axi4LiteSlaveReadRandomTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
      end
    end
  join_none

  fork 
    begin: MASTER_WRITE
      repeat(1) begin
        axi4LiteMasterWriteRandomTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
      end
    end
    begin: MASTER_READ
      repeat(1) begin
        axi4LiteMasterReadRandomTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
      end
    end
  join_none

 endtask : body

`endif

