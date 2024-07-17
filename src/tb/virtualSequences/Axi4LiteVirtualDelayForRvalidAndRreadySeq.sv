`ifndef AXI4LITEVIRTUALDELAYFORRVALIDANDRREADYSEQ_INCLUDED_
`define AXI4LITEVIRTUALDELAYFORRVALIDANDRREADYSEQ_INCLUDED_

class Axi4LiteVirtualDelayForRvalidAndRreadySeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualDelayForRvalidAndRreadySeq)

  Axi4LiteMasterReadDelayForRreadySeq axi4LiteMasterReadDelayForRreadySeq;
  Axi4LiteSlaveReadDelayForRvalidSeq axi4LiteSlaveReadDelayForRvalidSeq;

  extern function new(string name = "Axi4LiteVirtualDelayForRvalidAndRreadySeq");
  extern task body();
endclass : Axi4LiteVirtualDelayForRvalidAndRreadySeq

function Axi4LiteVirtualDelayForRvalidAndRreadySeq::new(string name = "Axi4LiteVirtualDelayForRvalidAndRreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualDelayForRvalidAndRreadySeq::body();
  axi4LiteMasterReadDelayForRreadySeq = Axi4LiteMasterReadDelayForRreadySeq::type_id::create("axi4LiteMasterReadDelayForRreadySeq");
  axi4LiteSlaveReadDelayForRvalidSeq = Axi4LiteSlaveReadDelayForRvalidSeq::type_id::create("axi4LiteSlaveReadDelayForRvalidSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualDelayForRvalidAndRreadySeq"), UVM_NONE); 

   if(!axi4LiteMasterReadDelayForRreadySeq.randomize() with {delayForRready == 10;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForRvalidAndRreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForRvalidAndRreadySeq delayForRready :%0d", axi4LiteMasterReadDelayForRreadySeq.delayForRready),UVM_LOW);

   if(!axi4LiteSlaveReadDelayForRvalidSeq.randomize() with {delayForRvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForRvalidAndRreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForRvalidAndRreadySeq delayForRvalid :%0d", axi4LiteSlaveReadDelayForRvalidSeq.delayForRvalid),UVM_LOW);

  fork
    axi4LiteSlaveReadDelayForRvalidSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterReadDelayForRreadySeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

