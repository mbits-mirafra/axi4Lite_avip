`ifndef AXI4LITEVIRTUALDELAYFORBVALIDANDBREADYSEQ_INCLUDED_
`define AXI4LITEVIRTUALDELAYFORBVALIDANDBREADYSEQ_INCLUDED_

class Axi4LiteVirtualDelayForBvalidAndBreadySeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualDelayForBvalidAndBreadySeq)

  Axi4LiteMasterWriteDelayForBreadySeq axi4LiteMasterWriteDelayForBreadySeq;
  Axi4LiteSlaveWriteDelayForBvalidSeq axi4LiteSlaveWriteDelayForBvalidSeq;

  extern function new(string name = "Axi4LiteVirtualDelayForBvalidAndBreadySeq");
  extern task body();
endclass : Axi4LiteVirtualDelayForBvalidAndBreadySeq

function Axi4LiteVirtualDelayForBvalidAndBreadySeq::new(string name = "Axi4LiteVirtualDelayForBvalidAndBreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualDelayForBvalidAndBreadySeq::body();
  axi4LiteMasterWriteDelayForBreadySeq = Axi4LiteMasterWriteDelayForBreadySeq::type_id::create("axi4LiteMasterWriteDelayForBreadySeq");
  axi4LiteSlaveWriteDelayForBvalidSeq = Axi4LiteSlaveWriteDelayForBvalidSeq::type_id::create("axi4LiteSlaveWriteDelayForBvalidSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualDelayForBvalidAndBreadySeq"), UVM_NONE); 

   if(!axi4LiteMasterWriteDelayForBreadySeq.randomize() with {delayForBready == 10;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForBvalidAndBreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForBvalidAndBreadySeq delayForBready :%0d", axi4LiteMasterWriteDelayForBreadySeq.delayForBready),UVM_LOW);

   if(!axi4LiteSlaveWriteDelayForBvalidSeq.randomize() with {delayForBvalid == 3;}) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForBvalidAndBreadySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForBvalidAndBreadySeq delayForBvalid :%0d", axi4LiteSlaveWriteDelayForBvalidSeq.delayForBvalid),UVM_LOW);

  fork
    axi4LiteSlaveWriteDelayForBvalidSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWriteDelayForBreadySeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

