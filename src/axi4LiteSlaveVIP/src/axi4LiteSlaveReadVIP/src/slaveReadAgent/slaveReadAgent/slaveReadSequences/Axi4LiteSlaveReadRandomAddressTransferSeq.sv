`ifndef AXI4LITESLAVEREADRANDOMADDRESSTRANSFERSEQ_INCLUDED_
`define AXI4LITESLAVEREADRANDOMADDRESSTRANSFERSEQ_INCLUDED_
 
class Axi4LiteSlaveReadRandomAddressTransferSeq extends Axi4LiteSlaveReadBaseSeq;
  `uvm_object_utils(Axi4LiteSlaveReadRandomAddressTransferSeq)
 
  extern function new(string name = "Axi4LiteSlaveReadRandomAddressTransferSeq");
  extern task body();
endclass : Axi4LiteSlaveReadRandomAddressTransferSeq
 
function Axi4LiteSlaveReadRandomAddressTransferSeq::new(string name = "Axi4LiteSlaveReadRandomAddressTransferSeq");
  super.new(name);
endfunction : new
 
task Axi4LiteSlaveReadRandomAddressTransferSeq::body();
  super.body();

  req = Axi4LiteSlaveReadTransaction::type_id::create("req");
  `uvm_info(get_type_name(), $sformatf("BEFORE start_item Axi4LiteSlaveReadRandomAddressTransferSeq"), UVM_NONE);
 
  start_item(req);
  if(!req.randomize()) begin
    `uvm_fatal("Axi4LiteSlaveReadRandomAddressTransferSeq","Rand failed");
  end
 
  `uvm_info(get_type_name(), $sformatf("Axi4LiteSlaveReadRandomAddressTransferSeq \n%s",req.sprint()), UVM_NONE);
 
  finish_item(req);
  `uvm_info(get_type_name(), $sformatf("AFTER finish_item Axi4LiteSlaveReadRandomAddressTransferSeq"), UVM_NONE);
 
endtask : body
 
`endif
