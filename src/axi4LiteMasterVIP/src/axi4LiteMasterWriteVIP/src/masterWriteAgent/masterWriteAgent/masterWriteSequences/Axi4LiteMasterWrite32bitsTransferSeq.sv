
`ifndef AXI4LITEMASTERWRITE32BITSTRANSFERSEQ_INCLUDED_
`define AXI4LITEMASTERWRITE32BITSTRANSFERSEQ_INCLUDED_

class Axi4LiteMasterWrite32bitsTransferSeq extends Axi4LiteMasterWriteBaseSeq;
  `uvm_object_utils(Axi4LiteMasterWrite32bitsTransferSeq)
 
  rand bit [ADDRESS_WIDTH-1:0] awaddr;
  rand awprotEnum awprot;
  rand bit [DATA_WIDTH-1:0] wdata;
  rand bit [(DATA_WIDTH/8)-1:0] wstrb;
  
  constraint awaddr_c {soft awaddr <= MAX_ADDRESS;}

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
  req.print();
  finish_item(req);

endtask:body
  
`endif


