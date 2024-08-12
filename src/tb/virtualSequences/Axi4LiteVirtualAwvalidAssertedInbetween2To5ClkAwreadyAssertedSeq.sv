`ifndef AXI4LITEVIRTUALAWVALIDASSERTEDINBETWEEN2TO5CLKAWREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALAWVALIDASSERTEDINBETWEEN2TO5CLKAWREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq extends Axi4LiteVirtual32bitWriteDataSeq;
  `uvm_object_utils(Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq

function Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq::new(string name = "Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalidSeq == 6;
                                                              delayForWvalidSeq == 8;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq delayForAwvalidSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForAwvalidSeq),UVM_LOW);

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForAwreadySeq == 3;
                                                             delayForWreadySeq == 1;
                                                           }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualAwvalidAssertedInbetween2To5ClkAwreadyAssertedSeq delayForAwreadySeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForAwreadySeq),UVM_LOW);

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

