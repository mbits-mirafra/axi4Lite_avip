`ifndef AXI4LITEVIRTUALARVALIDASSERTEDINBETWEEN2TO5CLKARREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALARVALIDASSERTEDINBETWEEN2TO5CLKARREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq extends Axi4LiteVirtualDelayForArvalidAndArreadySeq;
  `uvm_object_utils(Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq

function Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq::new(string name = "Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq::body();
  axi4LiteMasterReadDelayForArvalidSeq = Axi4LiteMasterReadDelayForArvalidSeq::type_id::create("axi4LiteMasterReadDelayForArvalidSeq");
  axi4LiteSlaveReadDelayForArreadySeq = Axi4LiteSlaveReadDelayForArreadySeq::type_id::create("axi4LiteSlaveReadDelayForArreadySeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterReadDelayForArvalidSeq.randomize() with {delayForArvalid == 4;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq delayForArvalid :%0d", axi4LiteMasterReadDelayForArvalidSeq.delayForArvalid),UVM_LOW);

   if(!axi4LiteSlaveReadDelayForArreadySeq.randomize() with {delayForArready == 2;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq delayForArready :%0d", axi4LiteSlaveReadDelayForArreadySeq.delayForArready),UVM_LOW);

  fork
    axi4LiteSlaveReadDelayForArreadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterReadDelayForArvalidSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

