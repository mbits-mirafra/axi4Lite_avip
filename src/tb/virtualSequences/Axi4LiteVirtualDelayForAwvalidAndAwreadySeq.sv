`ifndef AXI4LITEVIRTUALDELAYFORAWVALIDANDAWREADYSEQ_INCLUDED_
`define AXI4LITEVIRTUALDELAYFORAWVALIDANDAWREADYSEQ_INCLUDED_

class Axi4LiteVirtualDelayForAwvalidAndAwreadySeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualDelayForAwvalidAndAwreadySeq)

  Axi4LiteMasterWriteDelayForAwvalidSeq axi4LiteMasterWriteDelayForAwvalidSeq;
  Axi4LiteSlaveWriteDelayForAwreadySeq axi4LiteSlaveWriteDelayForAwreadySeq;

  extern function new(string name = "Axi4LiteVirtualDelayForAwvalidAndAwreadySeq");
  extern task body();
endclass : Axi4LiteVirtualDelayForAwvalidAndAwreadySeq

function Axi4LiteVirtualDelayForAwvalidAndAwreadySeq::new(string name = "Axi4LiteVirtualDelayForAwvalidAndAwreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualDelayForAwvalidAndAwreadySeq::body();
  axi4LiteMasterWriteDelayForAwvalidSeq = Axi4LiteMasterWriteDelayForAwvalidSeq::type_id::create("axi4LiteMasterWriteDelayForAwvalidSeq");
  axi4LiteSlaveWriteDelayForAwreadySeq = Axi4LiteSlaveWriteDelayForAwreadySeq::type_id::create("axi4LiteSlaveWriteDelayForAwreadySeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualDelayForAwvalidAndAwreadySeq"), UVM_NONE); 

   if(!axi4LiteMasterWriteDelayForAwvalidSeq.randomize() with {delayForAwvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForAwvalidAndAwreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForAwvalidAndAwreadySeq delayForAwvalid :%0d", axi4LiteMasterWriteDelayForAwvalidSeq.delayForAwvalid),UVM_LOW);

   if(!axi4LiteSlaveWriteDelayForAwreadySeq.randomize() with {delayForAwready == 10;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForAwvalidAndAwreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForAwvalidAndAwreadySeq delayForAwready :%0d", axi4LiteSlaveWriteDelayForAwreadySeq.delayForAwready),UVM_LOW);

  fork
    axi4LiteSlaveWriteDelayForAwreadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWriteDelayForAwvalidSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

