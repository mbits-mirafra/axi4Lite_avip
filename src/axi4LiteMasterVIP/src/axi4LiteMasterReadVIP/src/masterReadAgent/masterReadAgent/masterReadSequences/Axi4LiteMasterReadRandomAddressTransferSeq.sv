`ifndef AXI4LITEMASTERREADRANDOMADDRESSTRANSFERSEQ_INCLUDED_
`define AXI4LITEMASTERREADRANDOMADDRESSTRANSFERSEQ_INCLUDED_

class Axi4LiteMasterReadRandomAddressTransferSeq extends Axi4LiteMasterReadBaseSeq;
  `uvm_object_utils(Axi4LiteMasterReadRandomAddressTransferSeq)

  extern function new(string name = "Axi4LiteMasterReadRandomAddressTransferSeq");
  extern task body();
endclass : Axi4LiteMasterReadRandomAddressTransferSeq

function Axi4LiteMasterReadRandomAddressTransferSeq::new(string name = "Axi4LiteMasterReadRandomAddressTransferSeq");
  super.new(name);
endfunction : new


task Axi4LiteMasterReadRandomAddressTransferSeq::body();
  super.body();

  `uvm_info(get_type_name(),$sformatf("Inside body before start_item Axi4LiteMasterReadRandomAddressTransferSeq"),UVM_LOW);
  start_item(req);
  `uvm_info(get_type_name(),$sformatf("Inside body after start_item Axi4LiteMasterReadRandomAddressTransferSeq"),UVM_LOW);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  `uvm_info(get_type_name(),$sformatf("Inside body after randomize Axi4LiteMasterReadRandomAddressTransferSeq"),UVM_LOW);
  
    req.print();
  finish_item(req);

endtask:body
  
`endif


