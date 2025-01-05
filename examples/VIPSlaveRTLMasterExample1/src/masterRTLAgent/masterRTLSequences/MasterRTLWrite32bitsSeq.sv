`ifndef MASTERRTLWRITE32BITSSEQ_INCLUDED_
`define MASTERRTLWRITE32BITSSEQ_INCLUDED_

class MasterRTLWrite32bitsSeq extends MasterRTLBaseSeq;
  `uvm_object_utils(MasterRTLWrite32bitsSeq)
 
  rand bit writeEnableSeq;
  rand bit [ADDRESS_WIDTH-1:0] awaddrSeq;
  rand awprotEnum awprotSeq;
  rand bit [DATA_WIDTH-1:0] wdataSeq;
  rand bit [(DATA_WIDTH/8)-1:0] wstrbSeq;

  constraint awaddrSeq_c {soft awaddrSeq inside {[MIN_ADDRESS:MAX_ADDRESS]};}
  constraint awprotSeq_c {soft awprotSeq inside {[0:3]};}
  constraint wstrbSeq_c {soft wstrbSeq inside {[0:15]};}

  extern function new(string name = "MasterRTLWrite32bitsSeq");
  extern task body();
endclass : MasterRTLWrite32bitsSeq

function MasterRTLWrite32bitsSeq::new(string name = "MasterRTLWrite32bitsSeq");
  super.new(name);
endfunction : new

task MasterRTLWrite32bitsSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize() with {writeEnable == writeEnableSeq;
                            awaddr == awaddrSeq;
                            awprot == awprotSeq;
                            wdata  == wdataSeq;
                            wstrb  == wstrbSeq;
                          }) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.print();
  finish_item(req);

endtask:body
  
`endif


