`ifndef MASTERVIPSLAVEIPVIRTUALWRITEFOLLOWEDBYREADSEQ_INCLUDED_
`define MASTERVIPSLAVEIPVIRTUALWRITEFOLLOWEDBYREADSEQ_INCLUDED_

class MasterVIPSlaveIPVirtualWriteFollowedByReadSeq extends MasterVIPSlaveIPVirtualBaseSeq;
  `uvm_object_utils(MasterVIPSlaveIPVirtualWriteFollowedByReadSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
 
  extern function new(string name = "MasterVIPSlaveIPVirtualWriteFollowedByReadSeq");
  extern task body();
endclass : MasterVIPSlaveIPVirtualWriteFollowedByReadSeq

function MasterVIPSlaveIPVirtualWriteFollowedByReadSeq::new(string name = "MasterVIPSlaveIPVirtualWriteFollowedByReadSeq");
  super.new(name);
endfunction : new

task MasterVIPSlaveIPVirtualWriteFollowedByReadSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start MasterVIPSlaveIPVirtualWriteFollowedByReadSeq"), UVM_NONE); 
   
  if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalidSeq < delayForWvalidSeq;
                                                              awaddrSeq == 32'hffff_abcd;
                                                              wdataSeq dist {32'hffff_ffff:/4, 32'haaaa_aaaa:/4, [0:$]:/2};
                                                              wstrbSeq dist {4'b1111:/4, [0:$]:/6};}
                                                        ) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside MasterVIPSlaveIPVirtualWriteSeq")
  end

 if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {araddrSeq == 32'hffff_abcd;})begin
      `uvm_error(get_type_name(), "Randomization failed")
  end
  fork 
    axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer); 
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer); 
  join

 endtask : body

`endif

