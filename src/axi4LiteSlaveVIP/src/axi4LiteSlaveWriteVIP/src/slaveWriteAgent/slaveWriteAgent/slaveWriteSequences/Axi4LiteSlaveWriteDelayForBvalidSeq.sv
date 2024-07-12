`ifndef AXI4LITESLAVEWRITEDELAYFORBVALIDSEQ_INCLUDED_
`define AXI4LITESLAVEWRITEDELAYFORBVALIDSEQ_INCLUDED_

class Axi4LiteSlaveWriteDelayForBvalidSeq extends Axi4LiteSlaveWriteBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveWriteDelayForBvalidSeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForBvalid;

  constraint delayForBvalid_c {soft delayForBvalid <= MAX_DELAY_BVALID;}

  extern function new(string name = "Axi4LiteSlaveWriteDelayForBvalidSeq");
  extern task body();
endclass : Axi4LiteSlaveWriteDelayForBvalidSeq

function Axi4LiteSlaveWriteDelayForBvalidSeq::new(string name = "Axi4LiteSlaveWriteDelayForBvalidSeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveWriteDelayForBvalidSeq::body();
  req = Axi4LiteSlaveWriteTransaction::type_id::create();
  super.body();
  start_item(req);
  if(!req.randomize())begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.delayForBvalid = this.delayForBvalid; 
    req.print();
  finish_item(req);

endtask:body
  
`endif


