
`ifndef AXI4LITEMASTERREADDELAYFORARVALIDSEQ_INCLUDED_
`define AXI4LITEMASTERREADDELAYFORARVALIDSEQ_INCLUDED_

class Axi4LiteMasterReadDelayForArvalidSeq extends Axi4LiteMasterReadBaseSeq;
  `uvm_object_utils(Axi4LiteMasterReadDelayForArvalidSeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForArvalid;

  constraint delayForArvalid_c {soft delayForArvalid  <= MAX_DELAY_RVALID;}

  extern function new(string name = "Axi4LiteMasterReadDelayForArvalidSeq");
  extern task body();
endclass : Axi4LiteMasterReadDelayForArvalidSeq

function Axi4LiteMasterReadDelayForArvalidSeq::new(string name = "Axi4LiteMasterReadDelayForArvalidSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterReadDelayForArvalidSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize())begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
    req.delayForArvalid = this.delayForArvalid;
    req.print();
  finish_item(req);

endtask:body
  
`endif


