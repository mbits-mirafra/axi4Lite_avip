`ifndef MASTERVIPSLAVEIPVIRTUALWRITESEQ_INCLUDED_
`define MASTERVIPSLAVEIPVIRTUALWRITESEQ_INCLUDED_

class MasterVIPSlaveIPVirtualWriteSeq extends MasterVIPSlaveIPVirtualBaseSeq;
  `uvm_object_utils(MasterVIPSlaveIPVirtualWriteSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
 
  extern function new(string name = "MasterVIPSlaveIPVirtualWriteSeq");
  extern task body();
endclass : MasterVIPSlaveIPVirtualWriteSeq

function MasterVIPSlaveIPVirtualWriteSeq::new(string name = "MasterVIPSlaveIPVirtualWriteSeq");
  super.new(name);
endfunction : new

task MasterVIPSlaveIPVirtualWriteSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start MasterVIPSlaveIPVirtualWriteSeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalidSeq < delayForWvalidSeq;
                                                              wdataSeq dist {32'hffff_ffff:/4, 32'haaaa_aaaa:/4, [0:$]:/2};
                                                              wstrbSeq dist {4'b1111:/4, [0:$]:/6};}
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside MasterVIPSlaveIPVirtualWriteSeq")
  end

  axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);

 endtask : body

`endif

