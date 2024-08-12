`ifndef AXI4LITEVIRTUALWVALIDASSERTEDINBETWEEN2TO5CLKWREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALWVALIDASSERTEDINBETWEEN2TO5CLKWREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq extends Axi4LiteVirtual32bitWriteDataSeq;
  `uvm_object_utils(Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq

function Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq::new(string name = "Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForWvalidSeq == 6;
                                                              delayForAwvalidSeq == 2;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq delayForWvalidSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForWvalidSeq),UVM_LOW);

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForWreadySeq == 3;
                                                             delayForAwreadySeq == 1;
                                                           }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq delayForWreadySeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForWreadySeq),UVM_LOW);

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

