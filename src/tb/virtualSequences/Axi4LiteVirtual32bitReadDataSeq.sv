`ifndef AXI4LITEVIRTUAL32BITREADDATASEQ_INCLUDED_
`define AXI4LITEVIRTUAL32BITREADDATASEQ_INCLUDED_

class Axi4LiteVirtual32bitReadDataSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtual32bitReadDataSeq)

  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtual32bitReadDataSeq");
  extern task body();
endclass : Axi4LiteVirtual32bitReadDataSeq

function Axi4LiteVirtual32bitReadDataSeq::new(string name = "Axi4LiteVirtual32bitReadDataSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtual32bitReadDataSeq::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtual32bitReadDataSeq"), UVM_NONE); 

   if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with { arprot == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitReadDataSeq")
  end

   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtual32bitReadDataSeq")
  end

  fork
    axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

