
`ifndef AXI4LITESLAVEWRITEDELAYFORAWREADYSEQ_INCLUDED_
`define AXI4LITESLAVEWRITEDELAYFORAWREADYSEQ_INCLUDED_

class Axi4LiteSlaveWriteDelayForAwreadySeq extends Axi4LiteSlaveWriteBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveWriteDelayForAwreadySeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForAwready;

  // GopalS: constraint delayForAwready_c {soft delayForAwready <= MAX_DELAY_WVALID;}

  extern function new(string name = "Axi4LiteSlaveWriteDelayForAwreadySeq");
  extern task body();
endclass : Axi4LiteSlaveWriteDelayForAwreadySeq

function Axi4LiteSlaveWriteDelayForAwreadySeq::new(string name = "Axi4LiteSlaveWriteDelayForAwreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveWriteDelayForAwreadySeq::body();
  req = Axi4LiteSlaveWriteTransaction::type_id::create();
  super.body();
  start_item(req);
  if(!req.randomize() with {delayForAwready == this.delayForAwready;})begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
    req.print();
  finish_item(req);

endtask:body
  
`endif


