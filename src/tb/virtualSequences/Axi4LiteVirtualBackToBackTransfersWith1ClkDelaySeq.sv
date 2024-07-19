`ifndef AXI4LITEVIRTUALBACKTOBACKTRANSFERSWITH1CLKDELAYSEQ_INCLUDED_
`define AXI4LITEVIRTUALBACKTOBACKTRANSFERSWITH1CLKDELAYSEQ_INCLUDED_

class Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;

  extern function new(string name = "Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq");
  extern task body();
endclass : Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq

function Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq::new(string name = "Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq"), UVM_NONE); 

   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalid == 0;
                                                              delayForWvalid  == 0;
                                                              delayForBready  == 0;
                                                             }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq delayForAwvalid :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForAwvalid),UVM_LOW);

   if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForAwready == 3;
                                                             delayForWready  == 3;
                                                             delayForBvalid  == 3;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq")
  end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq delayForAwready :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForAwready),UVM_LOW);

  fork
     forever begin : SLAVE_SEQ_START 
        axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
     end
  join_none

   repeat(2) begin : MASTER_SEQ_START
      axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
   end

 endtask : body

`endif

