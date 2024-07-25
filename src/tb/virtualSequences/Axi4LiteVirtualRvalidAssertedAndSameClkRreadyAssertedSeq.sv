`ifndef AXI4LITEVIRTUALRVALIDASSERTEDANDSAMECLKRREADYASSERTEDSEQ_INCLUDED_
`define AXI4LITEVIRTUALRVALIDASSERTEDANDSAMECLKRREADYASSERTEDSEQ_INCLUDED_

class Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq extends Axi4LiteVirtual32bitReadDataSeq;
  `uvm_object_utils(Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq)

  extern function new(string name = "Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq");
  extern task body();
endclass : Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq

function Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq::new(string name = "Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq"), UVM_NONE); 

   if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {delayForRreadySeq == 0;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq delayForRreadySeq :%0d", axi4LiteMasterRead32bitsTransferSeq.delayForRreadySeq),UVM_LOW);

   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForRvalidSeq == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq delayForRvalidSeq :%0d", axi4LiteSlaveRead32bitsTransferSeq.delayForRvalidSeq),UVM_LOW);

  fork
    axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

