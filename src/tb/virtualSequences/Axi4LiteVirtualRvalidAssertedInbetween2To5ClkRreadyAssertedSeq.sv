`ifndef AXI4LITEVIRTUALRVALIDASSERTEDINBETWEEN2TO5CLKRREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALRVALIDASSERTEDINBETWEEN2TO5CLKRREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq extends Axi4LiteVirtual32bitReadDataSeq;
  `uvm_object_utils(Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq

function Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq::new(string name = "Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {delayForRreadySeq == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq delayForRreadySeq :%0d", axi4LiteMasterRead32bitsTransferSeq.delayForRreadySeq),UVM_LOW);

   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForRvalidSeq == 6;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq delayForRvalidSeq :%0d", axi4LiteSlaveRead32bitsTransferSeq.delayForRvalidSeq),UVM_LOW);

  fork
    axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

