`ifndef MASTERVIPSLAVEIPWRITEDATAWITHWSTRBTEST_INCLUDED_
`define MASTERVIPSLAVEIPWRITEDATAWITHWSTRBTEST_INCLUDED_

class MasterVIPSlaveIPWriteDataWithWstrbTest extends MasterVIPSlaveIP32bitsWriteReadTest;
  `uvm_component_utils(MasterVIPSlaveIPWriteDataWithWstrbTest)

  extern function new(string name = "MasterVIPSlaveIPWriteDataWithWstrbTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : MasterVIPSlaveIPWriteDataWithWstrbTest

function MasterVIPSlaveIPWriteDataWithWstrbTest::new(string name = "MasterVIPSlaveIPWriteDataWithWstrbTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIPWriteDataWithWstrbTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction 

task MasterVIPSlaveIPWriteDataWithWstrbTest::run_phase(uvm_phase phase);
  `uvm_info(get_type_name(),$sformatf("Inside run_phase MasterVIPSlaveIPWriteDataWithWstrbTest"),UVM_LOW);
    
   if(!axi4LiteMasterWrite32bitsTransferSeq.randomize() with{ wdataSeq == 32'hff00_aa00;
                                                              wstrbSeq == 4'b1010;
                                                            }) begin
       `uvm_error(get_type_name(), "Randomization failed")
   end
   phase.raise_objection(this);
   axi4LiteMasterWrite32bitsTransferSeq.start(masterVIPSlaveIPEnv.axi4LiteMasterEnv.axi4LiteMasterVirtualSequencer.axi4LiteMasterWriteSequencer); 
   #10;
  phase.drop_objection(this);
  `uvm_info(get_type_name(),$sformatf("After drop_objection MasterVIPSlaveIPWriteDataWithWstrbTest"),UVM_LOW);

endtask : run_phase

`endif


