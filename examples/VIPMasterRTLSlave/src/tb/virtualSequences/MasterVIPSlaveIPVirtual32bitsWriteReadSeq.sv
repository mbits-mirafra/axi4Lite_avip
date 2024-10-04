`ifndef MASTERVIPSLAVEIPVIRTUAL32BITSWRITEREADSEQ_INCLUDED_
`define MASTERVIPSLAVEIPVIRTUAL32BITSWRITEREADSEQ_INCLUDED_

class MasterVIPSlaveIPVirtual32bitsWriteReadSeq extends MasterVIPSlaveIPVirtualBaseSeq;
  `uvm_object_utils(MasterVIPSlaveIPVirtual32bitsWriteReadSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
 
  extern function new(string name = "MasterVIPSlaveIPVirtual32bitsWriteReadSeq");
  extern task body();
endclass : MasterVIPSlaveIPVirtual32bitsWriteReadSeq

function MasterVIPSlaveIPVirtual32bitsWriteReadSeq::new(string name = "MasterVIPSlaveIPVirtual32bitsWriteReadSeq");
  super.new(name);
endfunction : new

task MasterVIPSlaveIPVirtual32bitsWriteReadSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start MasterVIPSlaveIPVirtual32bitsWriteReadSeq"), UVM_NONE); 

   repeat(10) begin 
    if(!axi4LiteMasterWrite32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
    end

    if(!axi4LiteMasterRead32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
    end
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer); 
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer); 
  end

 endtask : body

`endif

