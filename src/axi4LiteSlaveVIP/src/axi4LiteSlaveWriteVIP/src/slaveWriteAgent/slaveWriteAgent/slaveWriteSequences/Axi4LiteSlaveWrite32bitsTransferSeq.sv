`ifndef AXI4LITESLAVEWRITE32BITSTRANSFERSEQ_INCLUDED_
`define AXI4LITESLAVEWRITE32BITSTRANSFERSEQ_INCLUDED_

class Axi4LiteSlaveWrite32bitsTransferSeq extends Axi4LiteSlaveWriteBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveWrite32bitsTransferSeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForAwreadySeq;
  rand bit [DELAY_WIDTH-1:0] delayForWreadySeq;
  rand bit [DELAY_WIDTH-1:0] delayForBvalidSeq;

  constraint delayForAwreadySeq_c {soft delayForAwreadySeq < MAX_DELAY_READY;}
  constraint delayForWreadySeq_c {soft delayForWreadySeq < MAX_DELAY_READY;}
  constraint delayForBvalidSeq_c {soft delayForBvalidSeq  < MAX_DELAY_BVALID;}

  extern function new(string name = "Axi4LiteSlaveWrite32bitsTransferSeq");
  extern task body();
endclass : Axi4LiteSlaveWrite32bitsTransferSeq

function Axi4LiteSlaveWrite32bitsTransferSeq::new(string name = "Axi4LiteSlaveWrite32bitsTransferSeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveWrite32bitsTransferSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize() with {delayForAwready == delayForAwreadySeq;
                            delayForWready == delayForWreadySeq;
                            delayForBvalid == delayForBvalidSeq;}) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.print();
  finish_item(req);

endtask:body
  
`endif


