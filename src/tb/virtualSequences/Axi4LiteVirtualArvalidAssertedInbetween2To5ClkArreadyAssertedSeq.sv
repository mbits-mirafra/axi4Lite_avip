`ifndef AXI4LITEVIRTUALARVALIDASSERTEDINBETWEEN2TO5CLKARREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALARVALIDASSERTEDINBETWEEN2TO5CLKARREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq extends Axi4LiteVirtual32bitReadDataSeq;
  `uvm_object_utils(Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq

function Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq::new(string name = "Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {delayForArvalidSeq == 4;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq delayForArvalidSeq :%0d", axi4LiteMasterRead32bitsTransferSeq.delayForArvalidSeq),UVM_LOW);

   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForArreadySeq == 2;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualArvalidAssertedInbetween2To5ClkArreadyAssertedSeq delayForArreadySeq :%0d", axi4LiteSlaveRead32bitsTransferSeq.delayForArreadySeq),UVM_LOW);

  fork
    axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

