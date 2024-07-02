`ifndef AXI4LITEMASTERWRITEDELAYFORBREADYSEQ_INCLUDED_
`define AXI4LITEMASTERWRITEDELAYFORBREADYSEQ_INCLUDED_

class Axi4LiteMasterWriteDelayForBreadySeq extends Axi4LiteMasterWriteBaseSeq;
  `uvm_object_utils(Axi4LiteMasterWriteDelayForBreadySeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForBready;

  constraint delayForBready_c {soft delayForBready  <= MAX_DELAY_READY;}

  extern function new(string name = "Axi4LiteMasterWriteDelayForBreadySeq");
  extern task body();
endclass : Axi4LiteMasterWriteDelayForBreadySeq

function Axi4LiteMasterWriteDelayForBreadySeq::new(string name = "Axi4LiteMasterWriteDelayForBreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterWriteDelayForBreadySeq::body();
  super.body();
  start_item(req);
  if(!req.randomize() with {delayForBready == this.delayForBready;})begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
    req.print();
  finish_item(req);

endtask:body
  
`endif


