`ifndef AXI4LITEVIRTUALMASTERSUPPORTANDSLAVENOTSUPPORTWRITEOUTSTANDINGTRANSACTION_INCLUDED_
`define AXI4LITEVIRTUALMASTERSUPPORTANDSLAVENOTSUPPORTWRITEOUTSTANDINGTRANSACTION_INCLUDED_

class Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction");
  extern task body();
endclass : Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction

function Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction::new(string name = "Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction");
  super.new(name);
endfunction : new

task Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction"), UVM_NONE); 


   fork
     begin : SLAVE_WRITE_SEQ
       if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalidSeq == 1; 
                                                                 delayForAwreadySeq == 0;
                                                                 delayForWreadySeq == 0;
                                                                }) begin
         `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction")
       end
       axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);


       if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalidSeq == 0; 
                                                                 delayForAwreadySeq == 2;
                                                                 delayForWreadySeq == 0;
                                                                }) begin
         `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction")
       end
       axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);


       if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalidSeq == 0; 
                                                                 delayForAwreadySeq == 0;
                                                                 delayForWreadySeq == 0;
                                                                }) begin
         `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction")
       end
       axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
     end
  join_none


  fork
    begin: MASTER_WRITE_SEQ
      repeat(2) begin
        if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {awprotSeq == 1;
                                                                   delayForAwvalidSeq == 0;
                                                                   delayForWvalidSeq  == 0;
                                                                   delayForBreadySeq  == 0;
                                                                  }) begin
           `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction")
        end
        axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
      end

        if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {awprotSeq == 1;
                                                                   delayForAwvalidSeq == 0;
                                                                   delayForWvalidSeq  == 0;
                                                                   delayForBreadySeq  == 1;
                                                                  }) begin
           `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterSupportAndSlaveNotSupportWriteOutstandingTransaction")
        end
        axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
    end
 join

 endtask : body

`endif

