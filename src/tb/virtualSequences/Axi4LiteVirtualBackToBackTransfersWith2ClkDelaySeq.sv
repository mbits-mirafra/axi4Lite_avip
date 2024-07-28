`ifndef AXI4LITEVIRTUALBACKTOBACKTRANSFERSWITH2CLKDELAYSEQ_INCLUDED_
`define AXI4LITEVIRTUALBACKTOBACKTRANSFERSWITH2CLKDELAYSEQ_INCLUDED_

class Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq extends Axi4LiteVirtual32bitWriteDataSeq;
  `uvm_object_utils(Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq)

  extern function new(string name = "Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq");
  extern task body();
endclass : Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq

function Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq::new(string name = "Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq"), UVM_NONE); 

  fork
    begin : SLAVE_SEQ_START
      repeat(2) begin 
        if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForAwreadySeq == 0;
                                                                  delayForWreadySeq  == 0;
                                                                  delayForBvalidSeq  == 2;
                                                                 }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq")
        end
          `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq delayForAwreadySeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForAwreadySeq),UVM_LOW);

        axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
      end
    end

   repeat(2) begin : MASTER_SEQ_START
     if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalidSeq == 2;
                                                                delayForWvalidSeq  == 2;
                                                                delayForBreadySeq  == 0;
                                                               }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq")
     end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBackToBackTransfersWith2ClkDelaySeq delayForAwvalidSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForAwvalidSeq),UVM_LOW);

     axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
   end
 join

 endtask : body

`endif

