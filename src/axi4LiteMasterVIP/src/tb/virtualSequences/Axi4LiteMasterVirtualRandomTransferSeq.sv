`ifndef AXI4LITEMASTERVIRTUALRANDOMTRANSFERSEQ_INCLUDED_
`define AXI4LITEMASTERVIRTUALRANDOMTRANSFERSEQ_INCLUDED_

class Axi4LiteMasterVirtualRandomTransferSeq extends Axi4LiteMasterVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteMasterVirtualRandomTransferSeq)

  Axi4LiteMasterWriteRandomTransferSeq axi4LiteMasterWriteRandomTransferSeq;
  
  Axi4LiteMasterReadRandomTransferSeq axi4LiteMasterReadRandomTransferSeq;

  extern function new(string name = "Axi4LiteMasterVirtualRandomTransferSeq");
  extern task body();
endclass : Axi4LiteMasterVirtualRandomTransferSeq

function Axi4LiteMasterVirtualRandomTransferSeq::new(string name = "Axi4LiteMasterVirtualRandomTransferSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterVirtualRandomTransferSeq::body();
  axi4LiteMasterWriteRandomTransferSeq = Axi4LiteMasterWriteRandomTransferSeq::type_id::create("axi4LiteMasterWriteRandomTransferSeq");

  axi4LiteMasterReadRandomTransferSeq = Axi4LiteMasterReadRandomTransferSeq::type_id::create("axi4LiteMasterReadRandomTransferSeq");

  `uvm_info(get_type_name(), $sformatf("DEBUG_MSHA :: Insdie Axi4LiteMasterVirtualRandomTransferSeq"), UVM_NONE); 

  fork 
    begin: T1_MASTER_WRITE
      repeat(1) begin
        axi4LiteMasterWriteRandomTransferSeq.start(p_sequencer.axi4LiteMasterWriteSequencer);
      end
    end
    begin: T2_MASTER_READ
      repeat(1) begin
        axi4LiteMasterReadRandomTransferSeq.start(p_sequencer.axi4LiteMasterReadSequencer);
      end
    end
  join_none
 endtask : body

`endif

