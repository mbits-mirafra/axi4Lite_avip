`ifndef AXI4LITEVIRTUALDELAYFORRVALIDANDRREADYSEQ_INCLUDED_
`define AXI4LITEVIRTUALDELAYFORRVALIDANDRREADYSEQ_INCLUDED_

class Axi4LiteVirtualDelayForRvalidAndRreadySeq extends Axi4LiteVirtual32bitReadDataSeq;
  `uvm_object_utils(Axi4LiteVirtualDelayForRvalidAndRreadySeq)

  extern function new(string name = "Axi4LiteVirtualDelayForRvalidAndRreadySeq");
  extern task body();
endclass : Axi4LiteVirtualDelayForRvalidAndRreadySeq

function Axi4LiteVirtualDelayForRvalidAndRreadySeq::new(string name = "Axi4LiteVirtualDelayForRvalidAndRreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualDelayForRvalidAndRreadySeq::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualDelayForRvalidAndRreadySeq"), UVM_NONE); 

   if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {delayForRreadySeq == 10;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForRvalidAndRreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForRvalidAndRreadySeq delayForRreadySeq :%0d", axi4LiteMasterRead32bitsTransferSeq.delayForRreadySeq),UVM_LOW);

   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForRvalidSeq == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForRvalidAndRreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForRvalidAndRreadySeq delayForRvalidSeq :%0d", axi4LiteSlaveRead32bitsTransferSeq.delayForRvalidSeq),UVM_LOW);

  fork
    axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

