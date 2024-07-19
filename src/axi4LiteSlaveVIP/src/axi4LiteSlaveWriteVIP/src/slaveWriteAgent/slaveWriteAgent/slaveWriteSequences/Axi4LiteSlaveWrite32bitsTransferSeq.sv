`ifndef AXI4LITESLAVEWRITE32BITSTRANSFERSEQ_INCLUDED_
`define AXI4LITESLAVEWRITE32BITSTRANSFERSEQ_INCLUDED_

class Axi4LiteSlaveWrite32bitsTransferSeq extends Axi4LiteSlaveWriteBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveWrite32bitsTransferSeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForAwready;
  rand bit [DELAY_WIDTH-1:0] delayForWready;
  rand bit [DELAY_WIDTH-1:0] delayForBvalid;

  constraint delayForAwready_c {soft delayForAwready <= MAX_DELAY_WVALID;}
  constraint delayForWready_c {soft delayForWready <= MAX_DELAY_WVALID;}
  constraint delayForBvalid_c {soft delayForBvalid  <= MAX_DELAY_READY;}

  extern function new(string name = "Axi4LiteSlaveWrite32bitsTransferSeq");
  extern task body();
endclass : Axi4LiteSlaveWrite32bitsTransferSeq

function Axi4LiteSlaveWrite32bitsTransferSeq::new(string name = "Axi4LiteSlaveWrite32bitsTransferSeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveWrite32bitsTransferSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.delayForAwready = this.delayForAwready;
  req.delayForWready = this.delayForWready;
  req.delayForBvalid = this.delayForBvalid;
  req.print();
  finish_item(req);

endtask:body
  
`endif


