`ifndef AXI4LITEMASTERWRITEDELAYFORAWVALIDSEQ_INCLUDED_
`define AXI4LITEMASTERWRITEDELAYFORAWVALIDSEQ_INCLUDED_

class Axi4LiteMasterWriteDelayForAwvalidSeq extends Axi4LiteMasterWriteBaseSeq;
  `uvm_object_utils(Axi4LiteMasterWriteDelayForAwvalidSeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForAwvalid;

  constraint delayForAwvalid_c {soft delayForAwvalid <= MAX_DELAY_WVALID;}

  extern function new(string name = "Axi4LiteMasterWriteDelayForAwvalidSeq");
  extern task body();
endclass : Axi4LiteMasterWriteDelayForAwvalidSeq

function Axi4LiteMasterWriteDelayForAwvalidSeq::new(string name = "Axi4LiteMasterWriteDelayForAwvalidSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterWriteDelayForAwvalidSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.delayForAwvalid = this.delayForAwvalid;
    req.print();
  finish_item(req);

endtask:body
  
`endif


