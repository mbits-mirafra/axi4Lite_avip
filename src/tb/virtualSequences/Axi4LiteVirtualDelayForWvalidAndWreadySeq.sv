`ifndef AXI4LITEVIRTUALDELAYFORWVALIDANDWREADYSEQ_INCLUDED_
`define AXI4LITEVIRTUALDELAYFORWVALIDANDWREADYSEQ_INCLUDED_

class Axi4LiteVirtualDelayForWvalidAndWreadySeq extends Axi4LiteVirtual32bitWriteDataSeq;
  `uvm_object_utils(Axi4LiteVirtualDelayForWvalidAndWreadySeq)

  extern function new(string name = "Axi4LiteVirtualDelayForWvalidAndWreadySeq");
  extern task body();
endclass : Axi4LiteVirtualDelayForWvalidAndWreadySeq

function Axi4LiteVirtualDelayForWvalidAndWreadySeq::new(string name = "Axi4LiteVirtualDelayForWvalidAndWreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualDelayForWvalidAndWreadySeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualDelayForWvalidAndWreadySeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForWvalidSeq == 3;
                                                              delayForAwvalidSeq == 1;
                                                             }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForWvalidAndWreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForWvalidAndWreadySeq delayForWvalidSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForWvalidSeq),UVM_LOW);

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForWreadySeq == 7;
                                                             delayForAwreadySeq == 2;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForWvalidAndWreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForWvalidAndWreadySeq delayForWreadySeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForWreadySeq),UVM_LOW);

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

