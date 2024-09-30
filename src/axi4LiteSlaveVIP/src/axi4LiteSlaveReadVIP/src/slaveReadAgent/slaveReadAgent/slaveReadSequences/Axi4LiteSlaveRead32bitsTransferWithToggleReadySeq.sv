`ifndef AXI4LITESLAVEREAD32BITSTRANSFERWITHTOGGLEREADYSEQ_INCLUDED_
`define AXI4LITESLAVEREAD32BITSTRANSFERWITHTOGGLEREADYSEQ_INCLUDED_

class Axi4LiteSlaveRead32bitsTransferWithToggleReadySeq extends Axi4LiteSlaveReadBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveRead32bitsTransferWithToggleReadySeq)
 
  rand bit [DATA_WIDTH-1:0] rdataSeq;
  rand bit [DELAY_WIDTH-1:0] delayForArreadySeq;
  rand bit [DELAY_WIDTH-1:0] delayForRvalidSeq;
  rand int repeatToggleArreadySeq;

  constraint delayForArreadySeq_c {soft delayForArreadySeq  < MAX_DELAY_READY;}
  constraint delayForRvalidSeq_c {soft delayForRvalidSeq < MAX_DELAY_RVALID;}
  constraint repeatToggleArreadySeq_c {soft repeatToggleArreadySeq inside {[1:15]};}

  extern function new(string name = "Axi4LiteSlaveRead32bitsTransferWithToggleReadySeq");
  extern task body();
endclass : Axi4LiteSlaveRead32bitsTransferWithToggleReadySeq

function Axi4LiteSlaveRead32bitsTransferWithToggleReadySeq::new(string name = "Axi4LiteSlaveRead32bitsTransferWithToggleReadySeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveRead32bitsTransferWithToggleReadySeq::body();
  super.body();
  start_item(req);
  if(!req.randomize() with {delayForArready == delayForArreadySeq;
                            delayForRvalid == delayForRvalidSeq;
                            repeatToggleArready == repeatToggleArreadySeq;
                            rdata == rdataSeq;
                          }) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.print();
  finish_item(req);

endtask:body
  
`endif


