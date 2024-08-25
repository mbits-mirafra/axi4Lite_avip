`ifndef AXI4LITEVIRTUALMASTERANDSLAVESUPPORTREADOUTSTANDINGTRANSACTION_INCLUDED_
`define AXI4LITEVIRTUALMASTERANDSLAVESUPPORTREADOUTSTANDINGTRANSACTION_INCLUDED_

class Axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction)

  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction");
  extern task body();
endclass : Axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction

function Axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction::new(string name = "Axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction");
  super.new(name);
endfunction : new

task Axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction"), UVM_NONE); 


  fork
    begin : SLAVE_READ_SEQ
      forever begin
        if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with { delayForArreadySeq == 0;
                                                                  delayForRvalidSeq == 5;
                                                                }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction")
        end
          axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
      end
    end
  join_none


  fork
    begin: MASTER_READ_SEQ
      repeat(3) begin
        if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {arprotSeq == 1;
                                                                  delayForArvalidSeq == 0;
                                                                  delayForRreadySeq == 0;
                                                                  }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterAndSlaveSupportReadOutstandingTransaction")
      end
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
   end
 join

 endtask : body

`endif

