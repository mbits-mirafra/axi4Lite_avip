`ifndef AXI4LITEMASTERWRITEADDRESSINSIDEMINANDMAXRANGESEQ_INCLUDED_
`define AXI4LITEMASTERWRITEADDRESSINSIDEMINANDMAXRANGESEQ_INCLUDED_

class Axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq extends Axi4LiteMasterWriteBaseSeq;
  `uvm_object_utils(Axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq)
 
  rand bit [ADDRESS_WIDTH-1:0] awaddr;

  constraint awaddrRange_c {soft awaddr inside {[MIN_ADDRESS:MAX_ADDRESS]};}

  extern function new(string name = "Axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq");
  extern task body();
endclass : Axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq

function Axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq::new(string name = "Axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterWriteAddressInsideMinAndMaxRangeSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize() with {awaddr == this.awaddr;})begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
    req.print();
  finish_item(req);

endtask:body
  
`endif


