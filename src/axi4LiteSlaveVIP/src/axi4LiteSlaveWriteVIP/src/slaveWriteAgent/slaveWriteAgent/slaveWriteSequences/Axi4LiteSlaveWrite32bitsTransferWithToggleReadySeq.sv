`ifndef AXI4LITESLAVEWRITE32BITSTRANSFERWITHTOGGLEREADYSEQ_INCLUDED_
`define AXI4LITESLAVEWRITE32BITSTRANSFERWITHTOGGLEREADYSEQ_INCLUDED_

class Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq extends Axi4LiteSlaveWriteBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForAwreadySeq;
  rand bit [DELAY_WIDTH-1:0] delayForWreadySeq;
  rand bit [DELAY_WIDTH-1:0] delayForBvalidSeq;
  rand int repeatToggleAwreadySeq;
  rand int repeatToggleWreadySeq;

  constraint delayForAwreadySeq_c {soft delayForAwreadySeq < MAX_DELAY_READY;}
  constraint delayForWreadySeq_c {soft delayForWreadySeq < MAX_DELAY_READY;}
  constraint delayForBvalidSeq_c {soft delayForBvalidSeq  < MAX_DELAY_BVALID;}
  constraint repeatToggleAwreadySeq_c {soft repeatToggleAwreadySeq  inside {[1:10]};}
  constraint repeatToggleWreadySeq_c {soft repeatToggleWreadySeq  inside {[1:10]};}

  extern function new(string name = "Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq");
  extern task body();
endclass : Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq

function Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq::new(string name = "Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveWrite32bitsTransferWithToggleReadySeq::body();
  super.body();
  start_item(req);
  if(!req.randomize() with {delayForAwready == delayForAwreadySeq;
                            delayForWready == delayForWreadySeq;
                            delayForBvalid == delayForBvalidSeq;
                            repeatToggleAwready == repeatToggleAwreadySeq; 
                            repeatToggleWready == repeatToggleWreadySeq;}) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.print();
  finish_item(req);

endtask:body
  
`endif


