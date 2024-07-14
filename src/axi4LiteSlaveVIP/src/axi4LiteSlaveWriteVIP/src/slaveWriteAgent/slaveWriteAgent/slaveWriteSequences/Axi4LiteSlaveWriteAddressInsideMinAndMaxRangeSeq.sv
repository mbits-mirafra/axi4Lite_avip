`ifndef AXI4LITESLAVEWRITEADDRESSINSIDEMINANDMAXRANGESEQ_INCLUDED_
`define AXI4LITESLAVEWRITEADDRESSINSIDEMINANDMAXRANGESEQ_INCLUDED_

class Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq extends Axi4LiteSlaveWriteBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq)
 
  extern function new(string name = "Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq");
  extern task body();
endclass : Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq

function Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq::new(string name = "Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveWriteAddressInsideMinAndMaxRangeSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
    req.print();
  finish_item(req);

endtask:body
  
`endif


