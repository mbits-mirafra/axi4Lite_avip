`ifndef AXI4LITEVIRTUALDELAYFORRVALIDINSIDE0TO3SEQ_INCLUDED_
`define AXI4LITEVIRTUALDELAYFORRVALIDINSIDE0TO3SEQ_INCLUDED_

class Axi4LiteVirtualDelayForRvalidInside0To3Seq extends Axi4LiteVirtual32bitReadDataSeq;
  `uvm_object_utils(Axi4LiteVirtualDelayForRvalidInside0To3Seq)

  extern function new(string name = "Axi4LiteVirtualDelayForRvalidInside0To3Seq");
  extern task body();
endclass : Axi4LiteVirtualDelayForRvalidInside0To3Seq

function Axi4LiteVirtualDelayForRvalidInside0To3Seq::new(string name = "Axi4LiteVirtualDelayForRvalidInside0To3Seq");
  super.new(name);
endfunction : new

task Axi4LiteVirtualDelayForRvalidInside0To3Seq::body();
  axi4LiteMasterRead32bitsTransferSeq = Axi4LiteMasterRead32bitsTransferSeq::type_id::create("axi4LiteMasterRead32bitsTransferSeq");
  axi4LiteSlaveRead32bitsTransferSeq = Axi4LiteSlaveRead32bitsTransferSeq::type_id::create("axi4LiteSlaveRead32bitsTransferSeq");

  `uvm_info(get_type_name(), $sformatf("Insdie Body Seq start Axi4LiteVirtualDelayForRvalidInside0To3Seq"), UVM_NONE); 

  fork
    begin : SLAVE_READ_SEQ
      forever begin
        if(!axi4LiteSlaveRead32bitsTransferSeq.randomize() with {delayForRvalidSeq inside {[0:3]};}) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForRvalidInside0To3Seq")
        end
        `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForRvalidInside0To3Seq delayForRvalidSeq :%0d", axi4LiteSlaveRead32bitsTransferSeq.delayForRvalidSeq),UVM_LOW);
       axi4LiteSlaveRead32bitsTransferSeq.start(p_sequencer.axi4LiteSlaveVirtualSequencer.axi4LiteSlaveReadSequencer);
      end
    end
  join_none

  fork
    begin: MASTER_READ_SEQ
      repeat(10) begin
        if(!axi4LiteMasterRead32bitsTransferSeq.randomize() with {delayForRreadySeq inside {[0:4]};}) begin
          `uvm_error(get_type_name(), "Randomization failed : Inside Axi4LiteVirtualDelayForRvalidInside0To3Seq")
        end
        `uvm_info(get_type_name(),$sformatf("Axi4LiteVirtualDelayForRvalidInside0To3Seq delayForRreadySeq :%0d", axi4LiteMasterRead32bitsTransferSeq.delayForRreadySeq),UVM_LOW);
        axi4LiteMasterRead32bitsTransferSeq.start(p_sequencer.axi4LiteMasterVirtualSequencer.axi4LiteMasterReadSequencer);
     end
   end
 join

 endtask : body

`endif

