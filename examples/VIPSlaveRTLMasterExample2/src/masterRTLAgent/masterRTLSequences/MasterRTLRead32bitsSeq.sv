`ifndef MASTERRTLREAD32BITSSEQ_INCLUDED_
`define MASTERRTLREAD32BITSSEQ_INCLUDED_

class MasterRTLRead32bitsSeq extends MasterRTLBaseSeq;
  `uvm_object_utils(MasterRTLRead32bitsSeq)
 
  rand bit readEnableSeq;
  rand bit [ADDRESS_WIDTH-1:0] araddrSeq;
  rand arprotEnum arprotSeq;

  constraint araddrSeq_c {soft araddrSeq inside {[MIN_ADDRESS:MAX_ADDRESS]};}
  constraint arprotSeq_c {soft arprotSeq inside {[0:3]};}

  extern function new(string name = "MasterRTLRead32bitsSeq");
  extern task body();
endclass : MasterRTLRead32bitsSeq

function MasterRTLRead32bitsSeq::new(string name = "MasterRTLRead32bitsSeq");
  super.new(name);
endfunction : new

task MasterRTLRead32bitsSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize() with {readEnable == readEnableSeq;
                            araddr == araddrSeq;
                            arprot == arprotSeq;
                          }) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.print();
  finish_item(req);

endtask:body
  
`endif


