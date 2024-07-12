`ifndef AXI4LITEMASTERREADDELAYFORRREADYSEQ_INCLUDED_
`define AXI4LITEMASTERREADDELAYFORRREADYSEQ_INCLUDED_

class Axi4LiteMasterReadDelayForRreadySeq extends Axi4LiteMasterReadBaseSeq;
  `uvm_object_utils(Axi4LiteMasterReadDelayForRreadySeq)
 
  rand bit [DELAY_WIDTH-1:0] delayForRready;

  constraint delayForRready_c {soft delayForRready  <= MAX_DELAY_READY;}

  extern function new(string name = "Axi4LiteMasterReadDelayForRreadySeq");
  extern task body();
endclass : Axi4LiteMasterReadDelayForRreadySeq

function Axi4LiteMasterReadDelayForRreadySeq::new(string name = "Axi4LiteMasterReadDelayForRreadySeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterReadDelayForRreadySeq::body();
  super.body();
  start_item(req);
  if(!req.randomize())begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
    req.delayForRready = this.delayForRready;
    req.print();
  finish_item(req);

endtask:body
  
`endif


