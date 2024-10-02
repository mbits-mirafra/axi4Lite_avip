`ifndef AXI4LITESLAVEREAD32BITSTRANSFERSEQ_INCLUDED_
`define AXI4LITESLAVEREAD32BITSTRANSFERSEQ_INCLUDED_

class Axi4LiteSlaveRead32bitsTransferSeq extends Axi4LiteSlaveReadBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveRead32bitsTransferSeq)
 
  rand bit [DATA_WIDTH-1:0] rdataSeq;
  rand bit [DELAY_WIDTH-1:0] delayForArreadySeq;
  rand bit [DELAY_WIDTH-1:0] delayForRvalidSeq;

  constraint delayForArreadySeq_c {soft delayForArreadySeq  < MAX_DELAY_ARREADY;}
  constraint delayForRvalidSeq_c {soft delayForRvalidSeq < MAX_DELAY_RVALID;}

  extern function new(string name = "Axi4LiteSlaveRead32bitsTransferSeq");
  extern task body();
endclass : Axi4LiteSlaveRead32bitsTransferSeq

function Axi4LiteSlaveRead32bitsTransferSeq::new(string name = "Axi4LiteSlaveRead32bitsTransferSeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveRead32bitsTransferSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize() with {delayForArready == delayForArreadySeq;
                            delayForRvalid == delayForRvalidSeq;
                            rdata == rdataSeq;
                          }) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.print();
  finish_item(req);

endtask:body
  
`endif


