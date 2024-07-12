`ifndef AXI4LITESLAVEWRITEDELAYFORWREADYSEQ_INCLUDED_
`define AXI4LITESLAVEWRITEDELAYFORWREADYSEQ_INCLUDED_

class Axi4LiteSlaveWriteDelayForWreadySeq extends Axi4LiteSlaveWriteBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveWriteDelayForWreadySeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForWready;

  constraint delayForWready_c {soft delayForWready <= MAX_DELAY_READY;}

  extern function new(string name = "Axi4LiteSlaveWriteDelayForWreadySeq");
  extern task body();
endclass : Axi4LiteSlaveWriteDelayForWreadySeq

function Axi4LiteSlaveWriteDelayForWreadySeq::new(string name = "Axi4LiteSlaveWriteDelayForWreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveWriteDelayForWreadySeq::body();
  req = Axi4LiteSlaveWriteTransaction::type_id::create();
  super.body();
  start_item(req);
  if(!req.randomize())begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.delayForWready = this.delayForWready; 
    req.print();
  finish_item(req);

endtask:body
  
`endif


