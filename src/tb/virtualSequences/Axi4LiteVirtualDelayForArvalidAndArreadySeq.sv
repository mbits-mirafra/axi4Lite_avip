`ifndef AXI4LITEVIRTUALDELAYFORARVALIDANDARREADYSEQ_INCLUDED_
`define AXI4LITEVIRTUALDELAYFORARVALIDANDARREADYSEQ_INCLUDED_

class Axi4LiteVirtualDelayForArvalidAndArreadySeq extends Axi4LiteVirtual32bitReadDataSeq;
  `uvm_object_utils(Axi4LiteVirtualDelayForArvalidAndArreadySeq)

  extern function new(string name = "Axi4LiteVirtualDelayForArvalidAndArreadySeq");
  extern task body();
endclass : Axi4LiteVirtualDelayForArvalidAndArreadySeq

function Axi4LiteVirtualDelayForArvalidAndArreadySeq::new(string name = "Axi4LiteVirtualDelayForArvalidAndArreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualDelayForArvalidAndArreadySeq::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq  = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualDelayForArvalidAndArreadySeq"), UVM_NONE); 

   if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {delayForArvalidSeq == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForArvalidAndArreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForArvalidAndArreadySeq delayForArvalidSeq :%0d", axi4LiteMasterRead32bitsTransferSeq.delayForArvalidSeq),UVM_LOW);

   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForArreadySeq == 10;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForArvalidAndArreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForArvalidAndArreadySeq delayForArreadySeq :%0d", axi4LiteSlaveRead32bitsTransferSeq.delayForArreadySeq),UVM_LOW);

  fork
        axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join


 endtask : body

`endif

