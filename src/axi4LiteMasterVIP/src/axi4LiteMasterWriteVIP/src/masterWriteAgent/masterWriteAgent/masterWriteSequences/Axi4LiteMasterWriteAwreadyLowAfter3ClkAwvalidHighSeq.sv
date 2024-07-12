`ifndef AXI4LITEMASTERWRITEAWREADYLOWAFTER3CLKAWVALIDHIGHSEQ_INCLUDED_
`define AXI4LITEMASTERWRITEAWREADYLOWAFTER3CLKAWVALIDHIGHSEQ_INCLUDED_

class Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq extends Axi4LiteMasterWriteBaseSeq;
  `uvm_object_utils(Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForAwvalid;

  // GopalS: constraint delayForAwvalid_c {soft delayForAwvalid <= MAX_DELAY_WVALID;}

  extern function new(string name = "Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq");
  extern task body();
endclass : Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq

function Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq::new(string name = "Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterWriteAwreadyLowAfter3ClkAwvalidHighSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize() with {delayForAwvalid == this.delayForAwvalid;})begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
    req.print();
  finish_item(req);

endtask:body
  
`endif


