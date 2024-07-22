`ifndef AXI4LITEVIRTUALWVALIDASSERTEDINBETWEEN2TO5CLKWREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALWVALIDASSERTEDINBETWEEN2TO5CLKWREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq extends Axi4LiteVirtualDelayForWvalidAndWreadySeq;
  `uvm_object_utils(Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq

function Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq::new(string name = "Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq::body();
  axi4LiteMasterWriteDelayForWvalidSeq = Axi4LiteMasterWriteDelayForWvalidSeq::type_id::create("axi4LiteMasterWriteDelayForWvalidSeq");
  axi4LiteSlaveWriteDelayForWreadySeq = Axi4LiteSlaveWriteDelayForWreadySeq::type_id::create("axi4LiteSlaveWriteDelayForWreadySeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWriteDelayForWvalidSeq.randomize() with {delayForWvalid == 6;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq delayForWvalid :%0d", axi4LiteMasterWriteDelayForWvalidSeq.delayForWvalid),UVM_LOW);

   if(!axi4LiteSlaveWriteDelayForWreadySeq.randomize() with {delayForWready == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq delayForWready :%0d", axi4LiteSlaveWriteDelayForWreadySeq.delayForWready),UVM_LOW);

  fork
    axi4LiteSlaveWriteDelayForWreadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWriteDelayForWvalidSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

