`ifndef AXI4LITESLAVEREAD32BITSTRANSFERSEQ_INCLUDED_
`define AXI4LITESLAVEREAD32BITSTRANSFERSEQ_INCLUDED_

class Axi4LiteSlaveRead32bitsTransferSeq extends Axi4LiteSlaveReadBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveRead32bitsTransferSeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForArready;
  rand bit [DELAY_WIDTH-1:0] delayForRvalid;

  constraint delayForArready_c {soft delayForArready  <= MAX_DELAY_READY;}
  constraint delayForRvalid_c {soft delayForRvalid <= MAX_DELAY_RVALID;}

  extern function new(string name = "Axi4LiteSlaveRead32bitsTransferSeq");
  extern task body();
endclass : Axi4LiteSlaveRead32bitsTransferSeq

function Axi4LiteSlaveRead32bitsTransferSeq::new(string name = "Axi4LiteSlaveRead32bitsTransferSeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveRead32bitsTransferSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.delayForArready = this.delayForArready;
  req.delayForRvalid = this.delayForRvalid;
  req.print();
  finish_item(req);

endtask:body
  
`endif


