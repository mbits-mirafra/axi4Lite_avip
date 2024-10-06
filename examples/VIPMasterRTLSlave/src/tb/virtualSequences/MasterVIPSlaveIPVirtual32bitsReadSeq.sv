`ifndef MASTERVIPSLAVEIPVIRTUAL32BITSREADSEQ_INCLUDED_
`define MASTERVIPSLAVEIPVIRTUAL32BITSREADSEQ_INCLUDED_

class MasterVIPSlaveIPVirtual32bitsReadSeq extends MasterVIPSlaveIPVirtualBaseSeq;
  `uvm_object_utils(MasterVIPSlaveIPVirtual32bitsReadSeq)

  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
 
  extern function new(string name = "MasterVIPSlaveIPVirtual32bitsReadSeq");
  extern task body();
endclass : MasterVIPSlaveIPVirtual32bitsReadSeq

function MasterVIPSlaveIPVirtual32bitsReadSeq::new(string name = "MasterVIPSlaveIPVirtual32bitsReadSeq");
  super.new(name);
endfunction : new

task MasterVIPSlaveIPVirtual32bitsReadSeq::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start MasterVIPSlaveIPVirtual32bitsReadSeq"), UVM_NONE); 

   repeat(10) begin 

    if(!axi4LiteMasterRead32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
    end
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer); 
  end

 endtask : body

`endif

