`ifndef AXI4LITEMASTERWRITERANDOMADDRESSTRANSFERSEQ_INCLUDED_
`define AXI4LITEMASTERWRITERANDOMADDRESSTRANSFERSEQ_INCLUDED_

class Axi4LiteMasterWriteRandomAddressTransferSeq extends Axi4LiteMasterWriteBaseSeq;
  `uvm_object_utils(Axi4LiteMasterWriteRandomAddressTransferSeq)

  extern function new(string name = "Axi4LiteMasterWriteRandomAddressTransferSeq");
  extern task body();
endclass : Axi4LiteMasterWriteRandomAddressTransferSeq

function Axi4LiteMasterWriteRandomAddressTransferSeq::new(string name = "Axi4LiteMasterWriteRandomAddressTransferSeq");
  super.new(name);
endfunction : new


task Axi4LiteMasterWriteRandomAddressTransferSeq::body();
  super.body();

  `uvm_info(get_type_name(),$sformatf("Inside body before start_item Axi4LiteMasterWriteRandomAddressTransferSeq"),UVM_LOW);
  start_item(req);
  `uvm_info(get_type_name(),$sformatf("Inside body after start_item Axi4LiteMasterWriteRandomAddressTransferSeq"),UVM_LOW);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  `uvm_info(get_type_name(),$sformatf("Inside body after randomize Axi4LiteMasterWriteRandomAddressTransferSeq"),UVM_LOW);
  
    req.print();
  finish_item(req);

endtask:body
  
`endif


