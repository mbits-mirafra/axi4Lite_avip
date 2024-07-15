`ifndef AXI4LITEMASTERWRITEWSTRBSEQ_INCLUDED_
`define AXI4LITEMASTERWRITEWSTRBSEQ_INCLUDED_

class Axi4LiteMasterWriteWstrbSeq extends Axi4LiteMasterWriteBaseSeq;
  `uvm_object_utils(Axi4LiteMasterWriteWstrbSeq)
 
  rand bit [(DATA_WIDTH/8)-1:0] wstrb;

  extern function new(string name = "Axi4LiteMasterWriteWstrbSeq");
  extern task body();
endclass : Axi4LiteMasterWriteWstrbSeq

function Axi4LiteMasterWriteWstrbSeq::new(string name = "Axi4LiteMasterWriteWstrbSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterWriteWstrbSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.wstrb = this.wstrb;
    req.print();
  finish_item(req);

endtask:body
  
`endif


