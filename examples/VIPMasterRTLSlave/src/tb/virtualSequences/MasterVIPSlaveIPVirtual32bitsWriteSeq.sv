`ifndef MASTERVIPSLAVEIPVIRTUAL32BITSWRITESEQ_INCLUDED_
`define MASTERVIPSLAVEIPVIRTUAL32BITSWRITESEQ_INCLUDED_

class MasterVIPSlaveIPVirtual32bitsWriteSeq extends MasterVIPSlaveIPVirtualBaseSeq;
  `uvm_object_utils(MasterVIPSlaveIPVirtual32bitsWriteSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
 
  extern function new(string name = "MasterVIPSlaveIPVirtual32bitsWriteSeq");
  extern task body();
endclass : MasterVIPSlaveIPVirtual32bitsWriteSeq

function MasterVIPSlaveIPVirtual32bitsWriteSeq::new(string name = "MasterVIPSlaveIPVirtual32bitsWriteSeq");
  super.new(name);
endfunction : new

task MasterVIPSlaveIPVirtual32bitsWriteSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start MasterVIPSlaveIPVirtual32bitsWriteSeq"), UVM_NONE); 

   repeat(10) begin 
    if(!axi4LiteMasterWrite32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed")
    end

    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer); 
  end

 endtask : body

`endif

