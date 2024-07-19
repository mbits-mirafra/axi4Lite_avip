`ifndef AXI4LITEMASTERREAD32BITSTRANSFERSEQ_INCLUDED_
`define AXI4LITEMASTERREAD32BITSTRANSFERSEQ_INCLUDED_

class Axi4LiteMasterRead32bitsTransferSeq extends Axi4LiteMasterReadBaseSeq;
  `uvm_object_utils(Axi4LiteMasterRead32bitsTransferSeq)
 
  rand bit [ADDRESS_WIDTH-1:0] araddr;
  rand arprotEnum arprot;
  rand bit [DELAY_WIDTH-1:0] delayForArvalid;
  rand bit [DELAY_WIDTH-1:0] delayForRready;

  constraint araddr_c {soft araddr <= MAX_ADDRESS;}
  constraint delayForArvalid_c {soft delayForArvalid <= MAX_DELAY_RVALID;}
  constraint delayForRready_c {soft delayForRready  <= MAX_DELAY_READY;}

  extern function new(string name = "Axi4LiteMasterRead32bitsTransferSeq");
  extern task body();
endclass : Axi4LiteMasterRead32bitsTransferSeq

function Axi4LiteMasterRead32bitsTransferSeq::new(string name = "Axi4LiteMasterRead32bitsTransferSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterRead32bitsTransferSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.araddr = this.araddr;
  req.arprot = this.arprot;
  req.delayForArvalid = this.delayForArvalid;
  req.delayForRready = this.delayForRready;
  req.print();
  finish_item(req);

endtask:body
  
`endif


