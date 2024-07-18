`ifndef AXI4LITEWVALIDASSERTEDANDNEXTCLKWREADYASSERTEDTEST_INCLUDED_
`define AXI4LITEWVALIDASSERTEDANDNEXTCLKWREADYASSERTEDTEST_INCLUDED_

class Axi4LiteWvalidAssertedAndNextClkWreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteWvalidAssertedAndNextClkWreadyAssertedTest)

  Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteWvalidAssertedAndNextClkWreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual task run_phase(uvm_phase phase);


endclass : Axi4LiteWvalidAssertedAndNextClkWreadyAssertedTest

function Axi4LiteWvalidAssertedAndNextClkWreadyAssertedTest::new(string name = "Axi4LiteWvalidAssertedAndNextClkWreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteWvalidAssertedAndNextClkWreadyAssertedTest::setupAxi4LiteSlaveWriteAgentConfig();
  super.setupAxi4LiteSlaveWriteAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

task Axi4LiteWvalidAssertedAndNextClkWreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq=Axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq::type_id::create("axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteWvalidAssertedAndNextClkWreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualWvalidAssertedAndNextClkWreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

