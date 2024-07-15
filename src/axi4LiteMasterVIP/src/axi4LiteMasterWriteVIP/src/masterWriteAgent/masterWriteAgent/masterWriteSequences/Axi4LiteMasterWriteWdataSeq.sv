`ifndef AXI4LITEMASTERWRITEWDATASEQ_INCLUDED_
`define AXI4LITEMASTERWRITEWDATASEQ_INCLUDED_

class Axi4LiteMasterWriteWdataSeq extends Axi4LiteMasterWriteBaseSeq;
  `uvm_object_utils(Axi4LiteMasterWriteWdataSeq)
 
  rand bit [DATA_WIDTH-1:0] wdata;

  extern function new(string name = "Axi4LiteMasterWriteWdataSeq");
  extern task body();
endclass : Axi4LiteMasterWriteWdataSeq

function Axi4LiteMasterWriteWdataSeq::new(string name = "Axi4LiteMasterWriteWdataSeq");
  super.new(name);
endfunction : new

task Axi4LiteMasterWriteWdataSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.wdata = this.wdata;
    req.print();
  finish_item(req);

endtask:body
  
`endif


