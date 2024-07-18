`ifndef AXI4LITEVIRTUALWVALIDASSERTEDANDSAMECLKWREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALWVALIDASSERTEDANDSAMECLKWREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq extends Axi4LiteVirtualDelayForWvalidAndWreadySeq;
  `uvm_object_utils(Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq

function Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq::new(string name = "Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq::body();
  axi4LiteMasterWriteDelayForWvalidSeq = Axi4LiteMasterWriteDelayForWvalidSeq::type_id::create("axi4LiteMasterWriteDelayForWvalidSeq");
  axi4LiteSlaveWriteDelayForWreadySeq = Axi4LiteSlaveWriteDelayForWreadySeq::type_id::create("axi4LiteSlaveWriteDelayForWreadySeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWriteDelayForWvalidSeq.randomize() with {delayForWvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq delayForWvalid :%0d", axi4LiteMasterWriteDelayForWvalidSeq.delayForWvalid),UVM_LOW);

   if(!axi4LiteSlaveWriteDelayForWreadySeq.randomize() with {delayForWready == 0;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq delayForWready :%0d", axi4LiteSlaveWriteDelayForWreadySeq.delayForWready),UVM_LOW);

  fork
    axi4LiteSlaveWriteDelayForWreadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWriteDelayForWvalidSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

