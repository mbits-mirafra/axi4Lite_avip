`ifndef AXI4LITEVIRTUALREADSEQ_INCLUDED_
`define AXI4LITEVIRTUALREADSEQ_INCLUDED_

class Axi4LiteVirtualReadSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualReadSeq)

  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtualReadSeq");
  extern task body();
endclass : Axi4LiteVirtualReadSeq

function Axi4LiteVirtualReadSeq::new(string name = "Axi4LiteVirtualReadSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualReadSeq::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualReadSeq"), UVM_NONE); 

   if(!axi4LiteMasterRead32bitsTransferSeq.randomize()) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualReadSeq")
  end

   if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {rdataSeq dist {32'hffff_ffff:/3, 32'haaaa_aaaa:/3, 32'h0000_0000:/1, [0:$]:/3};
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualReadSeq")
  end

  fork
    axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
    axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
  join

 endtask : body

`endif

