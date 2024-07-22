`ifndef AXI4LITEWVALIDASSERTEDINBETWEEN2TO5CLKWREADYASSERTEDTEST_INCLUDED_
`define AXI4LITEWVALIDASSERTEDINBETWEEN2TO5CLKWREADYASSERTEDTEST_INCLUDED_

class Axi4LiteWvalidAssertedInbetween2To5ClkWreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteWvalidAssertedInbetween2To5ClkWreadyAssertedTest)

  Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteWvalidAssertedInbetween2To5ClkWreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual task run_phase(uvm_phase phase);


endclass : Axi4LiteWvalidAssertedInbetween2To5ClkWreadyAssertedTest

function Axi4LiteWvalidAssertedInbetween2To5ClkWreadyAssertedTest::new(string name = "Axi4LiteWvalidAssertedInbetween2To5ClkWreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteWvalidAssertedInbetween2To5ClkWreadyAssertedTest::setupAxi4LiteSlaveWriteAgentConfig();
  super.setupAxi4LiteSlaveWriteAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
     axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

task Axi4LiteWvalidAssertedInbetween2To5ClkWreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq=Axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq::type_id::create("axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteWvalidAssertedInbetween2To5ClkWreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualWvalidAssertedInbetween2To5ClkWreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

