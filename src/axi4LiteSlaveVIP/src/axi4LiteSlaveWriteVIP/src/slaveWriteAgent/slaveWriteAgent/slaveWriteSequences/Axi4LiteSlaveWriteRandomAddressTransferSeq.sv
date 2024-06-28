`ifndef AXI4LITESLAVEWRITERANDOMADDRESSTRANSFERSEQ_INCLUDED_
`define AXI4LITESLAVEWRITERANDOMADDRESSTRANSFERSEQ_INCLUDED_
 
class Axi4LiteSlaveWriteRandomAddressTransferSeq extends Axi4LiteSlaveWriteBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveWriteRandomAddressTransferSeq)
 
  extern function new(string name = "Axi4LiteSlaveWriteRandomAddressTransferSeq");
  extern task body();
endclass : Axi4LiteSlaveWriteRandomAddressTransferSeq
 
function Axi4LiteSlaveWriteRandomAddressTransferSeq::new(string name = "Axi4LiteSlaveWriteRandomAddressTransferSeq");
  super.new(name);
endfunction : new
 
task Axi4LiteSlaveWriteRandomAddressTransferSeq::body();
  super.body();
 
  req = Axi4LiteSlaveWriteTransaction::type_id::create("req");
  `uvm_info(get_type_name(), $sformatf("BEFORE start_item Axi4LiteSlaveWriteRandomAddressTransferSeq"), UVM_NONE);
 
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("Axi4LiteSlaveWriteRandomAddressTransferSeq","Rand failed");
  end
 
  `uvm_info(get_type_name(), $sformatf("Axi4LiteSlaveWriteRandomAddressTransferSeq \n%s",req.sprint()), UVM_NONE);
 
  finish_item(req);
  `uvm_info(get_type_name(), $sformatf("AFTER finish_item Axi4LiteSlaveWriteRandomAddressTransferSeq"), UVM_NONE);
 
endtask : body
 
`endif
