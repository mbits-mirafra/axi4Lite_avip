`ifndef AXI4LITEVIRTUALWRITEDATAWITHWSTRBSEQ_INCLUDED_
`define AXI4LITEVIRTUALWRITEDATAWITHWSTRBSEQ_INCLUDED_

class Axi4LiteVirtualWriteDataWithWstrbSeq extends Axi4LiteVirtualBaseSeq;
  `uvm_object_utils(Axi4LiteVirtualWriteDataWithWstrbSeq)

  Axi4LiteMasterWrite32bitsTransferSeq axi4LiteMasterWrite32bitsTransferSeq;
  Axi4LiteSlaveWrite32bitsTransferSeq axi4LiteSlaveWrite32bitsTransferSeq;
 
  extern function new(string name = "Axi4LiteVirtualWriteDataWithWstrbSeq");
  extern task body();
endclass : Axi4LiteVirtualWriteDataWithWstrbSeq

function Axi4LiteVirtualWriteDataWithWstrbSeq::new(string name = "Axi4LiteVirtualWriteDataWithWstrbSeq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualWriteDataWithWstrbSeq::body();
  axi4LiteMasterWrite32bitsTransferSeq = Axi4LiteMasterWrite32bitsTransferSeq::type_id::create("axi4LiteMasterWrite32bitsTransferSeq");
  axi4LiteSlaveWrite32bitsTransferSeq = Axi4LiteSlaveWrite32bitsTransferSeq::type_id::create("axi4LiteSlaveWrite32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualWriteDataWithWstrbSeq"), UVM_NONE); 

   fork
     begin : SLAVE_WRITE_SEQ
       forever begin
         if(!axi4LiteSlaveWrite32bitsTransferSeq.randomize() with {delayForBvalidSeq == 1;
                                                                   delayForAwreadySeq == 1;
                                                                   delayForWreadySeq == 1;
                                                                 }) begin
           `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWriteDataWithWstrbSeq")
         end
         axi4LiteSlaveWrite32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveWriteSequencer);
       end
     end
   join_none

  fork
    begin: MASTER_WRITE_SEQ
      repeat(10) begin
        if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with {awprotSeq == 1;
                                                                   delayForAwvalidSeq == 1;
                                                                   delayForWvalidSeq  == 2;
                                                                   delayForBreadySeq  == 1;
                                                                   if(Axi4LiteMasterWritePkg::DATA_WIDTH == 64) {
                                                                   wstrbSeq dist {1:/3, 2:/3, [0:14]:/2, [16:254]:/2};}
                                                                   else if(Axi4LiteMasterWritePkg::DATA_WIDTH == 32) {
                                                                   wstrbSeq dist {3:/4, 12:/4, [0:14]:/2};}
                                                                  }) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualWriteDataWithWstrbSeq")
        end
        axi4LiteMasterWrite32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer);
      end 
    end
  join

 endtask : body

`endif

