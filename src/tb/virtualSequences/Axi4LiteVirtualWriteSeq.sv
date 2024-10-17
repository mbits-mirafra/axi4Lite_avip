`ifndef AXI4LITEVIRTUALWRITESEQ_INCLUDED_
`define AXI4LITEVIRTUALWRITESEQ_INCLUDED_

class Axi4LiteVirtualWriteSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualWriteSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtualWriteSeq");
  extern task body();
endclass : Axi4LiteVirtualWriteSeq

function Axi4LiteVirtualWriteSeq::new(string name = "Axi4LiteVirtualWriteSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualWriteSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualWriteSeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalidSeq < delayForWvalidSeq;
                                                              wdataSeq dist {32'hffff_ffff:/4, 32'haaaa_aaaa:/4, [0:$]:/2};
                                                              wstrbSeq dist {4'b1111:/4, [0:$]:/6};}
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWriteSeq")
  end

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWriteSeq")
  end

  fork
    axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
  join

 endtask : body

`endif

