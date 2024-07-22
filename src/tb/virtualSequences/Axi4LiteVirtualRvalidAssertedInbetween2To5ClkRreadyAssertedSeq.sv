`ifndef AXI4LITEVIRTUALRVALIDASSERTEDINBETWEEN2TO5CLKRREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALRVALIDASSERTEDINBETWEEN2TO5CLKRREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq extends Axi4LiteVirtualDelayForRvalidAndRreadySeq;
  `uvm_object_utils(Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq

function Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq::new(string name = "Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq::body();
  axi4LiteMasterReadDelayForRreadySeq = Axi4LiteMasterReadDelayForRreadySeq::type_id::create("axi4LiteMasterReadDelayForRreadySeq");
  axi4LiteSlaveReadDelayForRvalidSeq = Axi4LiteSlaveReadDelayForRvalidSeq::type_id::create("axi4LiteSlaveReadDelayForRvalidSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterReadDelayForRreadySeq.randomize() with {delayForRready == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq delayForRready :%0d", axi4LiteMasterReadDelayForRreadySeq.delayForRready),UVM_LOW);

   if(!axi4LiteSlaveReadDelayForRvalidSeq.randomize() with {delayForRvalid == 6;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq delayForRvalid :%0d", axi4LiteSlaveReadDelayForRvalidSeq.delayForRvalid),UVM_LOW);

  fork
    axi4LiteSlaveReadDelayForRvalidSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterReadDelayForRreadySeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

