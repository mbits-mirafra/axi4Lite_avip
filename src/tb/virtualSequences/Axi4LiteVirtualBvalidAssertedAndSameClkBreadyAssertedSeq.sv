`ifndef AXI4LITEVIRTUALBVALIDASSERTEDANDSAMECLKBREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALBVALIDASSERTEDANDSAMECLKBREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq extends Axi4LiteVirtualDelayForBvalidAndBreadySeq;
  `uvm_object_utils(Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq

function Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq::new(string name = "Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq::body();
  axi4LiteMasterWriteDelayForBreadySeq = Axi4LiteMasterWriteDelayForBreadySeq::type_id::create("axi4LiteMasterWriteDelayForBreadySeq");
  axi4LiteSlaveWriteDelayForBvalidSeq = Axi4LiteSlaveWriteDelayForBvalidSeq::type_id::create("axi4LiteSlaveWriteDelayForBvalidSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWriteDelayForBreadySeq.randomize() with {delayForBready == 0;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq delayForBready :%0d", axi4LiteMasterWriteDelayForBreadySeq.delayForBready),UVM_LOW);

   if(!axi4LiteSlaveWriteDelayForBvalidSeq.randomize() with {delayForBvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBvalidAssertedAndSameClkBreadyAssertedSeq delayForBvalid :%0d", axi4LiteSlaveWriteDelayForBvalidSeq.delayForBvalid),UVM_LOW);

  fork
    axi4LiteSlaveWriteDelayForBvalidSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWriteDelayForBreadySeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

