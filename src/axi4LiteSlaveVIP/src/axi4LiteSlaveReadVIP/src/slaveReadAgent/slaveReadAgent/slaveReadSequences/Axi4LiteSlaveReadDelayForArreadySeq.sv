`ifndef AXI4LITESLAVEREADDELAYFORARREADYSEQ_INCLUDED_
`define AXI4LITESLAVEREADDELAYFORARREADYSEQ_INCLUDED_

class Axi4LiteSlaveReadDelayForArreadySeq extends Axi4LiteSlaveReadBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveReadDelayForArreadySeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForArready;

  constraint delayForArready_c {soft delayForArready <= MAX_DELAY_READY;}

  extern function new(string name = "Axi4LiteSlaveReadDelayForArreadySeq");
  extern task body();
endclass : Axi4LiteSlaveReadDelayForArreadySeq

function Axi4LiteSlaveReadDelayForArreadySeq::new(string name = "Axi4LiteSlaveReadDelayForArreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveReadDelayForArreadySeq::body();
  req = Axi4LiteSlaveReadTransaction::type_id::create();
  super.body();
  start_item(req);
  if(!req.randomize())begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.delayForArready = this.delayForArready; 
    req.print();
  finish_item(req);

endtask:body
  
`endif


