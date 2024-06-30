`ifndef AXI4LITEMASTERWRITERANDOMTRANSFERSEQ_INCLUDED_
`define AXI4LITEMASTERWRITERANDOMTRANSFERSEQ_INCLUDED_

class Axi4LiteMasterWriteRandomTransferSeq extends Axi4LiteMasterWriteBaseSeq;
  `uvm_object_utils(Axi4LiteMasterWriteRandomTransferSeq)

  extern function new(string name = "Axi4LiteMasterWriteRandomTransferSeq");
  extern task body();
endclass : Axi4LiteMasterWriteRandomTransferSeq

function Axi4LiteMasterWriteRandomTransferSeq::new(string name = "Axi4LiteMasterWriteRandomTransferSeq");
  super.new(name);
endfunction : new


task Axi4LiteMasterWriteRandomTransferSeq::body();
  super.body();
  `uvm_info(get_type_name(),$sformatf("Inside body before start_item Axi4LiteMasterWriteRandomTransferSeq"),UVM_LOW);
  start_item(req);
  `uvm_info(get_type_name(),$sformatf("Inside body after start_item Axi4LiteMasterWriteRandomTransferSeq"),UVM_LOW);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  `uvm_info(get_type_name(),$sformatf("Inside body after randomize Axi4LiteMasterWriteRandomTransferSeq"),UVM_LOW);
  
    req.print();
  finish_item(req);

endtask:body
  
`endif


