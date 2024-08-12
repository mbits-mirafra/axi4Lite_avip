`ifndef AXI4LITEVIRTUALDELAYFORAWVALIDANDAWREADYSEQ_INCLUDED_
`define AXI4LITEVIRTUALDELAYFORAWVALIDANDAWREADYSEQ_INCLUDED_

class Axi4LiteVirtualDelayForAwvalidAndAwreadySeq extends Axi4LiteVirtual32bitWriteDataSeq;
  `uvm_object_utils(Axi4LiteVirtualDelayForAwvalidAndAwreadySeq)

  extern function new(string name = "Axi4LiteVirtualDelayForAwvalidAndAwreadySeq");
  extern task body();
endclass : Axi4LiteVirtualDelayForAwvalidAndAwreadySeq

function Axi4LiteVirtualDelayForAwvalidAndAwreadySeq::new(string name = "Axi4LiteVirtualDelayForAwvalidAndAwreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualDelayForAwvalidAndAwreadySeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualDelayForAwvalidAndAwreadySeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalidSeq == 3;
                                                              delayForWvalidSeq == 4;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForAwvalidAndAwreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForAwvalidAndAwreadySeq delayForAwvalidSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForAwvalidSeq),UVM_LOW);

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForAwreadySeq == 10;
                                                              delayForWreadySeq == 10;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForAwvalidAndAwreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForAwvalidAndAwreadySeq delayForAwreadySeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForAwreadySeq),UVM_LOW);

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

