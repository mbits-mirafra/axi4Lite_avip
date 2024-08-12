`ifndef AXI4LITEVIRTUALDELAYFORBVALIDANDBREADYSEQ_INCLUDED_
`define AXI4LITEVIRTUALDELAYFORBVALIDANDBREADYSEQ_INCLUDED_

class Axi4LiteVirtualDelayForBvalidAndBreadySeq extends Axi4LiteVirtual32bitWriteDataSeq;
  `uvm_object_utils(Axi4LiteVirtualDelayForBvalidAndBreadySeq)

  extern function new(string name = "Axi4LiteVirtualDelayForBvalidAndBreadySeq");
  extern task body();
endclass : Axi4LiteVirtualDelayForBvalidAndBreadySeq

function Axi4LiteVirtualDelayForBvalidAndBreadySeq::new(string name = "Axi4LiteVirtualDelayForBvalidAndBreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualDelayForBvalidAndBreadySeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualDelayForBvalidAndBreadySeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForBreadySeq == 10;
                                                              delayForAwvalidSeq == 2;
                                                              delayForWvalidSeq == 4;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForBvalidAndBreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForBvalidAndBreadySeq delayForBreadySeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForBreadySeq),UVM_LOW);

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalidSeq == 3;
                                                             delayForAwreadySeq == 1;
                                                             delayForWreadySeq == 1;
                                                           }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForBvalidAndBreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForBvalidAndBreadySeq delayForBvalidSeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForBvalidSeq),UVM_LOW);

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

