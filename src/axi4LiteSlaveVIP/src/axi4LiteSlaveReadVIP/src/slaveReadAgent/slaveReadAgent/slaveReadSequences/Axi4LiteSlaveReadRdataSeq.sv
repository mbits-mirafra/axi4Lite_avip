`ifndef AXI4LITESLAVEREADRDATASEQ_INCLUDED_
`define AXI4LITESLAVEREADRDATASEQ_INCLUDED_

class Axi4LiteSlaveReadRdataSeq extends Axi4LiteSlaveReadBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveReadRdataSeq)
 
  rand bit [DATA_WIDTH-1:0] rdata;

  extern function new(string name = "Axi4LiteSlaveReadRdataSeq");
  extern task body();
endclass : Axi4LiteSlaveReadRdataSeq

function Axi4LiteSlaveReadRdataSeq::new(string name = "Axi4LiteSlaveReadRdataSeq");
  super.new(name);
endfunction : new

task Axi4LiteSlaveReadRdataSeq::body();
  super.body();
  start_item(req);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  req.rdata = this.rdata;
    req.print();
  finish_item(req);

endtask:body
  
`endif
