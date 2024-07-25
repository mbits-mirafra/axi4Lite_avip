`ifndef AXI4LITEMASTERREAD32BITSTRANSFERSEQ_INCLUDED_
`define AXI4LITEMASTERREAD32BITSTRANSFERSEQ_INCLUDED_

class Axi4LiteMasterRead32bitsTransferSeq extends Axi4LiteMasterReadBaseSeq;
  `uvm_object_utils(Axi4LiteMasterRead32bitsTransferSeq)
 
  rand bit [ADDRESS_WIDTH-1:0] araddrSeq;
  rand arprotEnum arprotSeq;
  rand bit [DELAY_WIDTH-1:0] delayForArvalidSeq;
  rand bit [DELAY_WIDTH-1:0] delayForRreadySeq;

  constraint araddrSeq_c {soft araddrSeq inside {[MIN_ADDRESS:MAX_ADDRESS]};}
  constraint delayForArvalidSeq_c {soft delayForArvalidSeq <= MAX_DELAY_RVALID;}
  constraint delayForRreadySeq_c {soft delayForRreadySeq  <= MAX_DELAY_READY;}

  extern function new(string name = "Axi4LiteMasterRead32bitsTransferSeq");
  extern task body();
endclass : Axi4LiteMasterRead32bitsTransferSeq

function Axi4LiteMasterRead32bitsTransferSeq::new(string name = "Axi4LiteMasterRead32bitsTransferSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterRead32bitsTransferSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize() with {araddr == araddrSeq;
                            arprot == arprotSeq;
                            delayForArvalid == delayForArvalidSeq;
                            delayForRready == delayForRreadySeq;
                          }) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.print();
  finish_item(req);

endtask:body
  
`endif


