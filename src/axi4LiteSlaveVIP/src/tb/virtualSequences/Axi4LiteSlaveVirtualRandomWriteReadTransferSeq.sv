`ifndef AXI4LITESLAVEVIRTUALRANDOMWRITEREADTRANSFERSEQ_INCLUDED_
`define AXI4LITESLAVEVIRTUALRANDOMWRITEREADTRANSFERSEQ_INCLUDED_

class Axi4LiteSlaveVirtualRandomWriteReadTransferSeq extends Axi4LiteSlaveVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveVirtualRandomWriteReadTransferSeq)

  Axi4LiteSlaveWriteRandomTransferSeq axi4LiteSlaveWriteRandomTransferSeq;
  
  Axi4LiteSlaveReadRandomTransferSeq axi4LiteSlaveReadRandomTransferSeq;

  extern function new(string name = "Axi4LiteSlaveVirtualRandomWriteReadTransferSeq");
  extern task body();
endclass : Axi4LiteSlaveVirtualRandomWriteReadTransferSeq

function Axi4LiteSlaveVirtualRandomWriteReadTransferSeq::new(string name = "Axi4LiteSlaveVirtualRandomWriteReadTransferSeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveVirtualRandomWriteReadTransferSeq::body();
  axi4LiteSlaveWriteRandomTransferSeq = Axi4LiteSlaveWriteRandomTransferSeq::type_id::create("axi4LiteSlaveWriteRandomTransferSeq");

  axi4LiteSlaveReadRandomTransferSeq = Axi4LiteSlaveReadRandomTransferSeq::type_id::create("axi4LiteSlaveReadRandomTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteSlaveVirtualRandomWriteReadTransferSeq"), UVM_NONE); 
  fork 
    begin: T1_SLAVE_WRITE
      repeat(1) begin
        axi4LiteSlaveWriteRandomTransferSeq.start(p_sequencer.axi4LiteSlaveWriteSequencer);
      end
    end
    begin: T2_SLAVE_READ
      repeat(1) begin
        axi4LiteSlaveReadRandomTransferSeq.start(p_sequencer.axi4LiteSlaveReadSequencer);
      end
    end
  join_none
 endtask : body

`endif

