`ifndef AXI4LITEVIRTUALRVALIDASSERTEDANDNEXTCLKRREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALRVALIDASSERTEDANDNEXTCLKRREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq extends Axi4LiteVirtualDelayForRvalidAndRreadySeq;
  `uvm_object_utils(Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq

function Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq::new(string name = "Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq::body();
  axi4LiteMasterReadDelayForRreadySeq = Axi4LiteMasterReadDelayForRreadySeq::type_id::create("axi4LiteMasterReadDelayForRreadySeq");
  axi4LiteSlaveReadDelayForRvalidSeq = Axi4LiteSlaveReadDelayForRvalidSeq::type_id::create("axi4LiteSlaveReadDelayForRvalidSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterReadDelayForRreadySeq.randomize() with {delayForRready == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq delayForRready :%0d", axi4LiteMasterReadDelayForRreadySeq.delayForRready),UVM_LOW);

   if(!axi4LiteSlaveReadDelayForRvalidSeq.randomize() with {delayForRvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualRvalidAssertedAndNextClkRreadyAssertedSeq delayForRvalid :%0d", axi4LiteSlaveReadDelayForRvalidSeq.delayForRvalid),UVM_LOW);

  fork
    axi4LiteSlaveReadDelayForRvalidSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterReadDelayForRreadySeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

