`ifndef AXI4LITEMASTERVIRTUALRANDOMWRITEREADTRANSFERSEQ_INCLUDED_
`define AXI4LITEMASTERVIRTUALRANDOMWRITEREADTRANSFERSEQ_INCLUDED_

class Axi4LiteMasterVirtualRandomWriteReadTransferSeq extends Axi4LiteMasterVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteMasterVirtualRandomWriteReadTransferSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  
  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;

  extern function new(string name = "Axi4LiteMasterVirtualRandomWriteReadTransferSeq");
  extern task body();
endclass : Axi4LiteMasterVirtualRandomWriteReadTransferSeq

function Axi4LiteMasterVirtualRandomWriteReadTransferSeq::new(string name = "Axi4LiteMasterVirtualRandomWriteReadTransferSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterVirtualRandomWriteReadTransferSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");

  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteMasterVirtualRandomWriteReadTransferSeq"), UVM_NONE); 
  fork 
    begin: T1_MASTER_WRITE
      repeat(1) begin
        axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterWriteSequencer);
      end
    end
    begin: T2_MASTER_READ
      repeat(1) begin
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterReadSequencer);
      end
    end
  join_none
 endtask : body

`endif

