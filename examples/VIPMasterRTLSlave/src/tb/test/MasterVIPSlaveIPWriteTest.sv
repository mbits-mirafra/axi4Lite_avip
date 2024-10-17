`ifndef MASTERVIPSLAVEIPWRITETEST_INCLUDED_
`define MASTERVIPSLAVEIPWRITETEST_INCLUDED_

class MasterVIPSlaveIPWriteTest extends MasterVIPSlaveIPBaseTest;
  `uvm_component_utils(MasterVIPSlaveIPWriteTest)

  MasterVIPSlaveIPVirtualWriteSeq masterVIPSlaveIPVirtualWriteSeq;
  
  extern function new(string name = "MasterVIPSlaveIPWriteTest", uvm_component parent = null);
  extern virtual task run_phase(uvm_phase phase);

endclass : MasterVIPSlaveIPWriteTest

function MasterVIPSlaveIPWriteTest::new(string name = "MasterVIPSlaveIPWriteTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

task MasterVIPSlaveIPWriteTest::run_phase(uvm_phase phase);

  masterVIPSlaveIPVirtualWriteSeq=MasterVIPSlaveIPVirtualWriteSeq::type_id::create("masterVIPSlaveIPVirtualWriteSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase MasterVIPSlaveIPWriteTest"),UVM_LOW);
    phase.raise_objection(this);
  repeat(10) begin
     masterVIPSlaveIPVirtualWriteSeq.start(masterVIPSlaveIPEnv.masterVIPSlaveIPVirtualSequencer);
     #10;
    end
  phase.drop_objection(this);

endtask : run_phase

`endif

