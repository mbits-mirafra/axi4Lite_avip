`ifndef AXI4LITEVIRTUALMASTERSUPPORTANDSLAVENOTSUPPORTREADOUTSTANDINGTRANSACTION_INCLUDED_
`define AXI4LITEVIRTUALMASTERSUPPORTANDSLAVENOTSUPPORTREADOUTSTANDINGTRANSACTION_INCLUDED_

class Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction)

  Axi4LiteMasterRead32bitsTransferSeq axi4LiteMasterRead32bitsTransferSeq;
  Axi4LiteSlaveRead32bitsTransferSeq axi4LiteSlaveRead32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction");
  extern task body();
endclass : Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction

function Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction::new(string name = "Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction");
  super.new(name);
endfunction : new

task Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction"), UVM_NONE); 


  fork
    begin : SLAVE_READ_SEQ
      if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForArreadySeq == 0;
                                                               delayForRvalidSeq == 1;
                                                              }) begin
        `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction")
      end
      axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);


      if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForArreadySeq == 2;
                                                               delayForRvalidSeq == 0;
                                                              }) begin
        `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction")
      end
      axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);


      if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForArreadySeq == 0;
                                                               delayForRvalidSeq == 0;
                                                              }) begin
        `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction")
      end
      axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);

    end
  join_none


  fork
  begin: MASTER_READ_SEQ
      repeat(2) begin
        if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {arprotSeq == 1;
                                                                  delayForArvalidSeq == 0;
                                                                  delayForRreadySeq == 0;
                                                                  }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction")
      end
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end

        if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {arprotSeq == 1;
                                                                  delayForArvalidSeq == 0;
                                                                  delayForRreadySeq == 1;
                                                                  }) begin
       `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualMasterSupportAndSlaveNotSupportReadOutstandingTransaction")
      end
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
   end
 join

 endtask : body

`endif

