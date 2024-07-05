
`ifndef AXI4LITEMASTERWRITEDELAYFORWVALIDSEQ_INCLUDED_
`define AXI4LITEMASTERWRITEDELAYFORWVALIDSEQ_INCLUDED_

class Axi4LiteMasterWriteDelayForWvalidSeq extends Axi4LiteMasterWriteBaseSeq;
  `uvm_object_utils(Axi4LiteMasterWriteDelayForWvalidSeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForWvalid;

  // GopalS: constraint delayForWvalid_c {soft delayForWvalid <= MAX_DELAY_WVALID;}

  extern function new(string name = "Axi4LiteMasterWriteDelayForWvalidSeq");
  extern task body();
endclass : Axi4LiteMasterWriteDelayForWvalidSeq

function Axi4LiteMasterWriteDelayForWvalidSeq::new(string name = "Axi4LiteMasterWriteDelayForWvalidSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterWriteDelayForWvalidSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize() with {delayForWvalid == this.delayForWvalid;})begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
    req.print();
  finish_item(req);

endtask:body
  
`endif


