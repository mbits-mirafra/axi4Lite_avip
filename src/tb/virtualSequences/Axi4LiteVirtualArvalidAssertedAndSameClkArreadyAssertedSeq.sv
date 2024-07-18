`ifndef AXI4LITEVIRTUALARVALIDASSERTEDANDSAMECLKARREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALARVALIDASSERTEDANDSAMECLKARREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq extends Axi4LiteVirtualDelayForArvalidAndArreadySeq;
  `uvm_object_utils(Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq

function Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq::new(string name = "Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq::body();
  axi4LiteMasterReadDelayForArvalidSeq = Axi4LiteMasterReadDelayForArvalidSeq::type_id::create("axi4LiteMasterReadDelayForArvalidSeq");
  axi4LiteSlaveReadDelayForArreadySeq = Axi4LiteSlaveReadDelayForArreadySeq::type_id::create("axi4LiteSlaveReadDelayForArreadySeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterReadDelayForArvalidSeq.randomize() with {delayForArvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq delayForArvalid :%0d", axi4LiteMasterReadDelayForArvalidSeq.delayForArvalid),UVM_LOW);

   if(!axi4LiteSlaveReadDelayForArreadySeq.randomize() with {delayForArready == 0;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq delayForArready :%0d", axi4LiteSlaveReadDelayForArreadySeq.delayForArready),UVM_LOW);

  fork
    axi4LiteSlaveReadDelayForArreadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterReadDelayForArvalidSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

