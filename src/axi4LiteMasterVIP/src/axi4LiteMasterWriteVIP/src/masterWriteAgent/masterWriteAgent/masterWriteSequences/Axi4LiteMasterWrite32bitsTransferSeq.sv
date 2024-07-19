`ifndef AXI4LITEMASTERWRITE32BITSTRANSFERSEQ_INCLUDED_
`define AXI4LITEMASTERWRITE32BITSTRANSFERSEQ_INCLUDED_

class Axi4LiteMasterWrite32bitsTransferSeq extends Axi4LiteMasterWriteBaseSeq;
  `uvm_object_utils(Axi4LiteMasterWrite32bitsTransferSeq)
 
  rand bit [ADDRESS_WIDTH-1:0] awaddr;
  rand awprotEnum awprot;
  rand bit [DATA_WIDTH-1:0] wdata;
  rand bit [(DATA_WIDTH/8)-1:0] wstrb;
  rand bit [DELAY_WIDTH-1:0] delayForAwvalid;
  rand bit [DELAY_WIDTH-1:0] delayForWvalid;
  rand bit [DELAY_WIDTH-1:0] delayForBready;

  constraint awaddr_c {soft awaddr <= MAX_ADDRESS;}
  constraint wstrb_c {soft wstrb == 4'b1111;}
  constraint delayForAwvalid_c {soft delayForAwvalid <= MAX_DELAY_WVALID;}
  constraint delayForWvalid_c {soft delayForWvalid <= MAX_DELAY_WVALID;}
  constraint delayForBready_c {soft delayForBready  <= MAX_DELAY_READY;}

  extern function new(string name = "Axi4LiteMasterWrite32bitsTransferSeq");
  extern task body();
endclass : Axi4LiteMasterWrite32bitsTransferSeq

function Axi4LiteMasterWrite32bitsTransferSeq::new(string name = "Axi4LiteMasterWrite32bitsTransferSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterWrite32bitsTransferSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.awaddr = this.awaddr;
  req.awprot = this.awprot;
  req.wdata  = this.wdata;
  req.wstrb  = this.wstrb;
  req.delayForAwvalid = this.delayForAwvalid;
  req.delayForWvalid = this.delayForWvalid;
  req.delayForBready = this.delayForBready;
  req.print();
  finish_item(req);

endtask:body
  
`endif


