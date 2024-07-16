`ifndef AXI4LITESLAVEREADADDRESSINSIDEMINANDMAXRANGESEQ_INCLUDED_
`define AXI4LITESLAVEREADADDRESSINSIDEMINANDMAXRANGESEQ_INCLUDED_

class Axi4LiteSlaveReadAddressInsideMinAndMaxRangeSeq extends Axi4LiteSlaveReadBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveReadAddressInsideMinAndMaxRangeSeq)
 
  extern function new(string name = "Axi4LiteSlaveReadAddressInsideMinAndMaxRangeSeq");
  extern task body();
endclass : Axi4LiteSlaveReadAddressInsideMinAndMaxRangeSeq

function Axi4LiteSlaveReadAddressInsideMinAndMaxRangeSeq::new(string name = "Axi4LiteSlaveReadAddressInsideMinAndMaxRangeSeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveReadAddressInsideMinAndMaxRangeSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
    req.print();
  finish_item(req);

endtask:body
  
`endif


