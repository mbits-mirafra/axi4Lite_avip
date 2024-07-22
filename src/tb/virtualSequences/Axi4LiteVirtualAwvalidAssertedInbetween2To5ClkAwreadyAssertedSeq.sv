`ifndef AXI4LITEVIRTUALAWVALIDASSERTEDINBETWEEN2TO5CLKAWREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALAWVALIDASSERTEDINBETWEEN2TO5CLKAWREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq extends Axi4LiteVirtualDelayForAwvalidAndAwreadySeq;
  `uvm_object_utils(Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq

function Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq::new(string name = "Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq::body();
  axi4LiteMasterWriteDelayForAwvalidSeq = Axi4LiteMasterWriteDelayForAwvalidSeq::type_id::create("axi4LiteMasterWriteDelayForAwvalidSeq");
  axi4LiteSlaveWriteDelayForAwreadySeq = Axi4LiteSlaveWriteDelayForAwreadySeq::type_id::create("axi4LiteSlaveWriteDelayForAwreadySeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWriteDelayForAwvalidSeq.randomize() with {delayForAwvalid == 6;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq delayForAwvalid :%0d", axi4LiteMasterWriteDelayForAwvalidSeq.delayForAwvalid),UVM_LOW);

   if(!axi4LiteSlaveWriteDelayForAwreadySeq.randomize() with {delayForAwready == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq delayForAwready :%0d", axi4LiteSlaveWriteDelayForAwreadySeq.delayForAwready),UVM_LOW);

  fork
    axi4LiteSlaveWriteDelayForAwreadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWriteDelayForAwvalidSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

