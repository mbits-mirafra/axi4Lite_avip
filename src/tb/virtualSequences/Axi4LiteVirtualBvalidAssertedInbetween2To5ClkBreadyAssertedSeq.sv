`ifndef AXI4LITEVIRTUALBVALIDASSERTEDINBETWEEN2TO5CLKBREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALBVALIDASSERTEDINBETWEEN2TO5CLKBREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq extends Axi4LiteVirtual32bitWriteDataSeq;
  `uvm_object_utils(Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq

function Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq::new(string name = "Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForBreadySeq == 3;
                                                              delayForAwvalidSeq == 2;
                                                              delayForWvalidSeq == 3;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq delayForBreadySeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForBreadySeq),UVM_LOW);

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalidSeq == 5;
                                                             delayForAwreadySeq == 2;
                                                             delayForWreadySeq == 3;
                                                           }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq delayForBvalidSeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForBvalidSeq),UVM_LOW);

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

