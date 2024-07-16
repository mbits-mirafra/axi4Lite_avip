`ifndef AXI4LITESLAVEREADRANDOMTRANSFERSEQ_INCLUDED_
`define AXI4LITESLAVEREADRANDOMTRANSFERSEQ_INCLUDED_
 
class Axi4LiteSlaveReadRandomTransferSeq extends Axi4LiteSlaveReadBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveReadRandomTransferSeq)
 
  extern function new(string name = "Axi4LiteSlaveReadRandomTransferSeq");
  extern task body();
endclass : Axi4LiteSlaveReadRandomTransferSeq
 
function Axi4LiteSlaveReadRandomTransferSeq::new(string name = "Axi4LiteSlaveReadRandomTransferSeq");
  super.new(name);
endfunction : new
 
task Axi4LiteSlaveReadRandomTransferSeq::body();
  super.body();

  `uvm_info(get_type_name(),$sformatf("Inside body before start_item Axi4LiteSlaveReadRandomTransferSeq"),UVM_LOW);
 
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("Axi4LiteSlaveReadRandomTransferSeq","Rand failed");
  end
 
  `uvm_info(get_type_name(), $sformatf("Inside body after Randomize Axi4LiteSlaveReadRandomTransferSeq \n%s",req.sprint()), UVM_NONE);
 
  finish_item(req);
  `uvm_info(get_type_name(), $sformatf("AFTER finish_item Axi4LiteSlaveReadRandomTransferSeq"), UVM_NONE);
 
endtask : body
 
`endif
