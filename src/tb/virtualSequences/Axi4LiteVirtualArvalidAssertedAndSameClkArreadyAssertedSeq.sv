`ifndef AXI4LITEVIRTUALARVALIDASSERTEDANDSAMECLKARREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALARVALIDASSERTEDANDSAMECLKARREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq extends Axi4LiteVirtual32bitReadDataSeq;
  `uvm_object_utils(Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq

function Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq::new(string name = "Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {delayForArvalidSeq == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq delayForArvalidSeq :%0d", axi4LiteMasterRead32bitsTransferSeq.delayForArvalidSeq),UVM_LOW);

   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForArreadySeq == 0;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualArvalidAssertedAndSameClkArreadyAssertedSeq delayForArreadySeq :%0d", axi4LiteSlaveRead32bitsTransferSeq.delayForArreadySeq),UVM_LOW);

  fork
    axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

