`ifndef AXI4LITEMASTERWRITE32BITSTRANSFERSEQ_INCLUDED_
`define AXI4LITEMASTERWRITE32BITSTRANSFERSEQ_INCLUDED_

class Axi4LiteMasterWrite32bitsTransferSeq extends Axi4LiteMasterWriteBaseSeq;
  `uvm_object_utils(Axi4LiteMasterWrite32bitsTransferSeq)
 
  rand bit [ADDRESS_WIDTH-1:0] awaddrSeq;
  rand awprotEnum awprotSeq;
  rand bit [DATA_WIDTH-1:0] wdataSeq;
  rand bit [(DATA_WIDTH/8)-1:0] wstrbSeq;
  rand bit [DELAY_WIDTH-1:0] delayForAwvalidSeq;
  rand bit [DELAY_WIDTH-1:0] delayForWvalidSeq;
  rand bit [DELAY_WIDTH-1:0] delayForBreadySeq;

  constraint awaddrSeq_c {soft awaddrSeq inside {[MIN_ADDRESS:MAX_ADDRESS]};}
  constraint awprotSeq_c {soft awprotSeq inside {[0:3]};}
  constraint wstrbSeq_c {soft wstrbSeq == 4'b1111;}
  constraint delayForAwvalidSeq_c {soft delayForAwvalidSeq < MAX_DELAY_WVALID;}
  constraint delayForWvalidSeq_c {soft delayForWvalidSeq < MAX_DELAY_WVALID;}
  constraint delayForBreadySeq_c {soft delayForBreadySeq  < MAX_DELAY_READY;}

  extern function new(string name = "Axi4LiteMasterWrite32bitsTransferSeq");
  extern task body();
endclass : Axi4LiteMasterWrite32bitsTransferSeq

function Axi4LiteMasterWrite32bitsTransferSeq::new(string name = "Axi4LiteMasterWrite32bitsTransferSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterWrite32bitsTransferSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize() with {awaddr == awaddrSeq;
                            awprot == awprotSeq;
                            wdata  == wdataSeq;
                            wstrb  == wstrbSeq;
                            delayForAwvalid == delayForAwvalidSeq;
                            delayForWvalid == delayForWvalidSeq;
                            delayForBready == delayForBreadySeq;
                          }) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.print();
  finish_item(req);

endtask:body
  
`endif


