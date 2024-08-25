`ifndef AXI4LITEVIRTUALMASTERANDSLAVENOTSUPPORTWRITEOUTSTANDINGTRANSACTION_INCLUDED_
`define AXI4LITEVIRTUALMASTERANDSLAVENOTSUPPORTWRITEOUTSTANDINGTRANSACTION_INCLUDED_

class Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction");
  extern task body();
endclass : Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction

function Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction::new(string name = "Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction");
  super.new(name);
endfunction : new

task Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction"), UVM_NONE); 


   fork
     begin : SLAVE_WRITE_SEQ
       repeat(3) begin
         if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalidSeq == 0; 
                                                                   delayForAwreadySeq == 0;
                                                                   delayForWreadySeq == 0;
                                                                  }) begin
           `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction")
         end
         axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
       end
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
           `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction")
        end
        axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
      end

        if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {awprotSeq == 1;
                                                                   delayForAwvalidSeq == 4;
                                                                   delayForWvalidSeq  == 4;
                                                                   delayForBreadySeq  == 0;
                                                                  }) begin
           `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterAndSlaveNotSupportWriteOutstandingTransaction")
        end
        axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
    end
 join
 endtask : body

`endif

