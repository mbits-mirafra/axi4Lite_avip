`ifndef MASTERVIPSLAVEIPVIRTUALREADSEQ_INCLUDED_
`define MASTERVIPSLAVEIPVIRTUALREADSEQ_INCLUDED_

class MasterVIPSlaveIPVirtualReadSeq extends MasterVIPSlaveIPVirtualBaseSeq;
  `uvm_object_utils(MasterVIPSlaveIPVirtualReadSeq)

  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq; 
  extern function new(string name = "MasterVIPSlaveIPVirtualReadSeq");
  extern task body();
endclass : MasterVIPSlaveIPVirtualReadSeq

function MasterVIPSlaveIPVirtualReadSeq::new(string name = "MasterVIPSlaveIPVirtualReadSeq");
  super.new(name);
endfunction : new

task MasterVIPSlaveIPVirtualReadSeq::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start MasterVIPSlaveIPVirtualReadSeq"), UVM_NONE); 

    if(!axi4LiteMasterRead32bitsTransferSeq.randomize())begin
       `uvm_error(get_type_name(), "Randomization failed")
    end
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer); 
  

 endtask : body

`endif

