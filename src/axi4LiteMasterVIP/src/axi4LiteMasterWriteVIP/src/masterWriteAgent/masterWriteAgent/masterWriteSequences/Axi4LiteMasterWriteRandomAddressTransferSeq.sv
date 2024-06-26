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

  req = Axi4LiteMasterWriteTransaction::type_id::create("req"); 

  start_item(req);
  if(!req.randomize()) begin 
      `uvm_error(get_type_name(), "Randomization failed")
  end
  
    req.print();
  finish_item(req);

endtask:body
  
`endif


