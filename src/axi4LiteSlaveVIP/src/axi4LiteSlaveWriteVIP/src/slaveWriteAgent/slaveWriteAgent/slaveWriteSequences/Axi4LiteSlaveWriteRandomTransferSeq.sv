`ifndef AXI4LITESLAVEWRITERANDOMTRANSFERSEQ_INCLUDED_
`define AXI4LITESLAVEWRITERANDOMTRANSFERSEQ_INCLUDED_
 
class Axi4LiteSlaveWriteRandomTransferSeq extends Axi4LiteSlaveWriteBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveWriteRandomTransferSeq)
 
  extern function new(string name = "Axi4LiteSlaveWriteRandomTransferSeq");
  extern task body();
endclass : Axi4LiteSlaveWriteRandomTransferSeq
 
function Axi4LiteSlaveWriteRandomTransferSeq::new(string name = "Axi4LiteSlaveWriteRandomTransferSeq");
  super.new(name);
endfunction : new
 
task Axi4LiteSlaveWriteRandomTransferSeq::body();
  super.body();
 
  `uvm_info(get_type_name(),$sformatf("Inside body before start_item Axi4LiteSlaveWriteRandomTransferSeq"),UVM_LOW);
 
  start_item(req);
  `uvm_info(get_type_name(),$sformatf("Inside body after start_item Axi4LiteSlaveWriteRandomTransferSeq"),UVM_LOW);
  if(!req.randomize()) begin
    `uvm_fatal("Axi4LiteSlaveWriteRandomTransferSeq","Rand failed");
  end
 
  `uvm_info(get_type_name(), $sformatf("Inside body after randomize Axi4LiteSlaveWriteRandomTransferSeq \n%s",req.sprint()), UVM_NONE);
 
  finish_item(req);
  `uvm_info(get_type_name(), $sformatf("AFTER finish_item Axi4LiteSlaveWriteRandomTransferSeq"), UVM_NONE);
 
endtask : body
 
`endif
