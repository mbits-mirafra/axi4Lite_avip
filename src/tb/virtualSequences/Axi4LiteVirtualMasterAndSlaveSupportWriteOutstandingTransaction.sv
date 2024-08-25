`ifndef AXI4LITEVIRTUALMASTERANDSLAVESUPPORTWRITEOUTSTANDINGTRANSACTION_INCLUDED_
`define AXI4LITEVIRTUALMASTERANDSLAVESUPPORTWRITEOUTSTANDINGTRANSACTION_INCLUDED_

class Axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction");
  extern task body();
endclass : Axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction

function Axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction::new(string name = "Axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction");
  super.new(name);
endfunction : new

task Axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction"), UVM_NONE); 


   fork
   begin : SLAVE_WRITE_SEQ
     forever begin
          if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalidSeq == 5; 
                                                                    delayForAwreadySeq == 0;
                                                                    delayForWreadySeq == 0;
                                                                    }) begin
             `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction")
          end
          axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
      end
    end
  join_none


  fork
    begin: MASTER_WRITE_SEQ
      repeat(3) begin
          if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {awprotSeq == 1;
                                                                     delayForAwvalidSeq == 0;
                                                                     delayForWvalidSeq  == 0;
                                                                     delayForBreadySeq  == 0;
                                                                    }) begin
            `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterAndSlaveSupportWriteOutstandingTransaction")
        end
        axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
      end 
    end
 join

 endtask : body

`endif

