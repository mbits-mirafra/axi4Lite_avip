`ifndef AXI4LITEVIRTUALDELAYFORWVALIDANDWREADYSEQ_INCLUDED_
`define AXI4LITEVIRTUALDELAYFORWVALIDANDWREADYSEQ_INCLUDED_

class Axi4LiteVirtualDelayForWvalidAndWreadySeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualDelayForWvalidAndWreadySeq)

  Axi4LiteMasterWriteDelayForWvalidSeq axi4LiteMasterWriteDelayForWvalidSeq;
  Axi4LiteSlaveWriteDelayForWreadySeq axi4LiteSlaveWriteDelayForWreadySeq;

  extern function new(string name = "Axi4LiteVirtualDelayForWvalidAndWreadySeq");
  extern task body();
endclass : Axi4LiteVirtualDelayForWvalidAndWreadySeq

function Axi4LiteVirtualDelayForWvalidAndWreadySeq::new(string name = "Axi4LiteVirtualDelayForWvalidAndWreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualDelayForWvalidAndWreadySeq::body();
  axi4LiteMasterWriteDelayForWvalidSeq = Axi4LiteMasterWriteDelayForWvalidSeq::type_id::create("axi4LiteMasterWriteDelayForWvalidSeq");
  axi4LiteSlaveWriteDelayForWreadySeq = Axi4LiteSlaveWriteDelayForWreadySeq::type_id::create("axi4LiteSlaveWriteDelayForWreadySeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualDelayForWvalidAndWreadySeq"), UVM_NONE); 

   if(!axi4LiteMasterWriteDelayForWvalidSeq.randomize() with {delayForWvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForWvalidAndWreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForWvalidAndWreadySeq delayForWvalid :%0d", axi4LiteMasterWriteDelayForWvalidSeq.delayForWvalid),UVM_LOW);

   if(!axi4LiteSlaveWriteDelayForWreadySeq.randomize() with {delayForWready == 1;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForWvalidAndWreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForWvalidAndWreadySeq delayForWready :%0d", axi4LiteSlaveWriteDelayForWreadySeq.delayForWready),UVM_LOW);

  fork
    axi4LiteSlaveWriteDelayForWreadySeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWriteDelayForWvalidSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

