`ifndef AXI4LITESLAVEREADDELAYFORRVALIDSEQ_INCLUDED_
`define AXI4LITESLAVEREADDELAYFORRVALIDSEQ_INCLUDED_

class Axi4LiteSlaveReadDelayForRvalidSeq extends Axi4LiteSlaveReadBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveReadDelayForRvalidSeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForRvalid;

  constraint delayForRvalid_c {soft delayForRvalid <= MAX_DELAY_RVALID;}

  extern function new(string name = "Axi4LiteSlaveReadDelayForRvalidSeq");
  extern task body();
endclass : Axi4LiteSlaveReadDelayForRvalidSeq

function Axi4LiteSlaveReadDelayForRvalidSeq::new(string name = "Axi4LiteSlaveReadDelayForRvalidSeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveReadDelayForRvalidSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize())begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.delayForRvalid = this.delayForRvalid; 
    req.print();
  finish_item(req);

endtask:body
  
`endif


