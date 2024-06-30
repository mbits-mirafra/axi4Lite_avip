`ifndef AXI4LITEMASTERREADRANDOMTRANSFERSEQ_INCLUDED_
`define AXI4LITEMASTERREADRANDOMTRANSFERSEQ_INCLUDED_

class Axi4LiteMasterReadRandomTransferSeq extends Axi4LiteMasterReadBaseSeq;
  `uvm_object_utils(Axi4LiteMasterReadRandomTransferSeq)

  extern function new(string name = "Axi4LiteMasterReadRandomTransferSeq");
  extern task body();
endclass : Axi4LiteMasterReadRandomTransferSeq

function Axi4LiteMasterReadRandomTransferSeq::new(string name = "Axi4LiteMasterReadRandomTransferSeq");
  super.new(name);
endfunction : new


task Axi4LiteMasterReadRandomTransferSeq::body();
  super.body();

  `uvm_info(get_type_name(),$sformatf("Inside body before start_item Axi4LiteMasterReadRandomTransferSeq"),UVM_LOW);
  start_item(req);
  `uvm_info(get_type_name(),$sformatf("Inside body after start_item Axi4LiteMasterReadRandomTransferSeq"),UVM_LOW);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  `uvm_info(get_type_name(),$sformatf("Inside body after randomize Axi4LiteMasterReadRandomTransferSeq"),UVM_LOW);
  
    req.print();
  finish_item(req);

endtask:body
  
`endif


