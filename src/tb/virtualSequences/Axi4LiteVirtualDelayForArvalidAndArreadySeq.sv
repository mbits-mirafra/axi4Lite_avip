
`ifndef AXI4LITEVIRTUALDELAYFORARVALIDANDARREADYSEQ_INCLUDED_
`define AXI4LITEVIRTUALDELAYFORARVALIDANDARREADYSEQ_INCLUDED_

class Axi4LiteVirtualDelayForArvalidAndArreadySeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualDelayForArvalidAndArreadySeq)

  Axi4LiteMasterReadDelayForArvalidSeq axi4LiteMasterReadDelayForArvalidSeq;
  Axi4LiteSlaveReadDelayForArreadySeq axi4LiteSlaveReadDelayForArreadySeq;

  extern function new(string name = "Axi4LiteVirtualDelayForArvalidAndArreadySeq");
  extern task body();
endclass : Axi4LiteVirtualDelayForArvalidAndArreadySeq

function Axi4LiteVirtualDelayForArvalidAndArreadySeq::new(string name = "Axi4LiteVirtualDelayForArvalidAndArreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualDelayForArvalidAndArreadySeq::body();
  axi4LiteMasterReadDelayForArvalidSeq = Axi4LiteMasterReadDelayForArvalidSeq::type_id::create("axi4LiteMasterReadDelayForArvalidSeq");
  axi4LiteSlaveReadDelayForArreadySeq  = Axi4LiteSlaveReadDelayForArreadySeq::type_id::create("axi4LiteSlaveReadDelayForArreadySeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualDelayForArvalidAndArreadySeq"), UVM_NONE); 

   if(!axi4LiteMasterReadDelayForArvalidSeq.randomize() with {delayForArvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForArvalidAndArreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForArvalidAndArreadySeq delayForArvalid :%0d", axi4LiteMasterReadDelayForArvalidSeq.delayForArvalid),UVM_LOW);

   if(!axi4LiteSlaveReadDelayForArreadySeq.randomize() with {delayForArready == 10;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForArvalidAndArreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForArvalidAndArreadySeq delayForArready :%0d", axi4LiteSlaveReadDelayForArreadySeq.delayForArready),UVM_LOW);

  fork
        axi4LiteSlaveReadDelayForArreadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
        axi4LiteMasterReadDelayForArvalidSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join


 endtask : body

`endif

