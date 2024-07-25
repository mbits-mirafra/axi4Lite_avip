`ifndef AXI4LITEVIRTUALWVALIDASSERTEDANDSAMECLKWREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALWVALIDASSERTEDANDSAMECLKWREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq extends Axi4LiteVirtual32bitWriteDataSeq;
  `uvm_object_utils(Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq

function Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq::new(string name = "Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForWvalidSeq == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq delayForWvalidSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForWvalidSeq),UVM_LOW);

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForWreadySeq == 0;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualWvalidAssertedAndSameClkWreadyAssertedSeq delayForWreadySeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForWreadySeq),UVM_LOW);

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

