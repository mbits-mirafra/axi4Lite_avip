`ifndef AXI4LITEMASTERREAD32BITSTRANSFERWITHTOGGLEREADYSEQ_INCLUDED_
`define AXI4LITEMASTERREAD32BITSTRANSFERWITHTOGGLEREADYSEQ_INCLUDED_

class Axi4LiteMasterRead32bitsTransferWithToggleReadySeq extends Axi4LiteMasterReadBaseSeq;
  `uvm_object_utils(Axi4LiteMasterRead32bitsTransferWithToggleReadySeq)
 
  rand bit [ADDRESS_WIDTH-1:0] araddrSeq;
  rand arprotEnum arprotSeq;
  rand bit [DELAY_WIDTH-1:0] delayForArvalidSeq;
  rand bit [DELAY_WIDTH-1:0] delayForRreadySeq;
  rand int repeatToggleReadySeq;

  constraint araddrSeq_c {soft araddrSeq inside {[MIN_ADDRESS:MAX_ADDRESS]};}
  constraint delayForArvalidSeq_c {soft delayForArvalidSeq < MAX_DELAY_RVALID;}
  constraint delayForRreadySeq_c {soft delayForRreadySeq  < MAX_DELAY_READY;}
  constraint repeatToggleReadySeq_c {soft repeatToggleReadySeq inside {[1:15]};}

  extern function new(string name = "Axi4LiteMasterRead32bitsTransferWithToggleReadySeq");
  extern task body();
endclass : Axi4LiteMasterRead32bitsTransferWithToggleReadySeq

function Axi4LiteMasterRead32bitsTransferWithToggleReadySeq::new(string name = "Axi4LiteMasterRead32bitsTransferWithToggleReadySeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterRead32bitsTransferWithToggleReadySeq::body();
  super.body();
  start_item(req);
  if(!req.randomize() with {araddr == araddrSeq;
                            arprot == arprotSeq;
                            delayForArvalid == delayForArvalidSeq;
                            delayForRready == delayForRreadySeq;
                            repeatToggleReady == repeatToggleReadySeq;
                          }) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.print();
  finish_item(req);

endtask:body
  
`endif


