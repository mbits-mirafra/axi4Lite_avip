`ifndef AXI4LITEVIRTUALBACKTOBACKTRANSFERSWITH1CLKDELAYSEQ_INCLUDED_
`define AXI4LITEVIRTUALBACKTOBACKTRANSFERSWITH1CLKDELAYSEQ_INCLUDED_

class Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq extends Axi4LiteVirtual32bitWriteDataSeq;
  `uvm_object_utils(Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq)

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


/*
  fork
     forever begin : SLAVE_SEQ_START 
        if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForAwreadySeq == 0;
                                                                  delayForWreadySeq  == 0;
                                                                  delayForBvalidSeq  == 1;
                                                                 }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq")
        end
          `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq delayForAwreadySeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForAwreadySeq),UVM_LOW);

        axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
     end
  join_none

   repeat(2) begin : MASTER_SEQ_START
     if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalidSeq == 1;
                                                                delayForWvalidSeq  == 1;
                                                                delayForBreadySeq  == 0;
                                                               }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq")
     end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq delayForAwvalidSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForAwvalidSeq),UVM_LOW);

      axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
   end
*/

  fork
    begin : SLAVE_SEQ_START
      repeat(2) begin 
        if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForAwreadySeq == 0;
                                                                  delayForWreadySeq  == 0;
                                                                  delayForBvalidSeq  == 0;
                                                                 }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq")
        end
          `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq delayForAwreadySeq :%0d", axi4LiteSlaveWrite32bitsTransferSeq.delayForAwreadySeq),UVM_LOW);

        axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
      end
    end

   repeat(2) begin : MASTER_SEQ_START
     if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {delayForAwvalidSeq == 1;
                                                                delayForWvalidSeq  == 1;
                                                                delayForBreadySeq  == 0;
                                                               }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq")
     end
       `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualBackToBackTransfersWith1ClkDelaySeq delayForAwvalidSeq :%0d", axi4LiteMasterWrite32bitsTransferSeq.delayForAwvalidSeq),UVM_LOW);

     axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
   end
 join

 endtask : body

`endif

