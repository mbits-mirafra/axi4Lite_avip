`ifndef AXI4LITEVIRTUALAWVALIDASSERTEDANDSAMECLKAWREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALAWVALIDASSERTEDANDSAMECLKAWREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq extends Axi4LiteVirtual32bitWriteDataSeq;
  `uvm_object_utils(Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq

function Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq::new(string name = "Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalidSeq == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq delayForAwvalidSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForAwvalidSeq),UVM_LOW);

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForAwreadySeq == 0;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq delayForAwreadySeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForAwreadySeq),UVM_LOW);

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

