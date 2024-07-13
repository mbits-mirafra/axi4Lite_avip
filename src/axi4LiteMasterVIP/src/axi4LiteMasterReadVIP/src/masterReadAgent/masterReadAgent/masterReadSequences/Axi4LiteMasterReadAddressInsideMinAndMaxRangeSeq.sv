`ifndef AXI4LITEMASTERREADADDRESSINSIDEMINANDMAXRANGESEQ_INCLUDED_
`define AXI4LITEMASTERREADADDRESSINSIDEMINANDMAXRANGESEQ_INCLUDED_

class Axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq extends Axi4LiteMasterReadBaseSeq;
  `uvm_object_utils(Axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq)
 
  rand bit [ADDRESS_WIDTH-1:0] araddr;

  constraint araddrRange_c {soft araddr inside {[MIN_ADDRESS:MAX_ADDRESS]};}

  extern function new(string name = "Axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq");
  extern task body();
endclass : Axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq

function Axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq::new(string name = "Axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterReadAddressInsideMinAndMaxRangeSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.araddr = this.araddr;
    req.print();
  finish_item(req);

endtask:body
  
`endif


