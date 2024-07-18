`ifndef AXI4LITEVIRTUALARVALIDASSERTEDANDNEXTCLKARREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALARVALIDASSERTEDANDNEXTCLKARREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq extends Axi4LiteVirtualDelayForArvalidAndArreadySeq;
  `uvm_object_utils(Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq

function Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq::new(string name = "Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq::body();
  axi4LiteMasterReadDelayForArvalidSeq = Axi4LiteMasterReadDelayForArvalidSeq::type_id::create("axi4LiteMasterReadDelayForArvalidSeq");
  axi4LiteSlaveReadDelayForArreadySeq = Axi4LiteSlaveReadDelayForArreadySeq::type_id::create("axi4LiteSlaveReadDelayForArreadySeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterReadDelayForArvalidSeq.randomize() with {delayForArvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq delayForArvalid :%0d", axi4LiteMasterReadDelayForArvalidSeq.delayForArvalid),UVM_LOW);

   if(!axi4LiteSlaveReadDelayForArreadySeq.randomize() with {delayForArready == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualArvalidAssertedAndNextClkArreadyAssertedSeq delayForArready :%0d", axi4LiteSlaveReadDelayForArreadySeq.delayForArready),UVM_LOW);

  fork
    axi4LiteSlaveReadDelayForArreadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterReadDelayForArvalidSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

