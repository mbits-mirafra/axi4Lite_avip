`ifndef AXI4LITEBVALIDASSERTEDINBETWEEN2TO5CLKBREADYASSERTEDTEST_INCLUDED_
`define AXI4LITEBVALIDASSERTEDINBETWEEN2TO5CLKBREADYASSERTEDTEST_INCLUDED_

class Axi4LiteBvalidAssertedInbetween2To5ClkBreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteBvalidAssertedInbetween2To5ClkBreadyAssertedTest)

  Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteBvalidAssertedInbetween2To5ClkBreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteBvalidAssertedInbetween2To5ClkBreadyAssertedTest

function Axi4LiteBvalidAssertedInbetween2To5ClkBreadyAssertedTest::new(string name = "Axi4LiteBvalidAssertedInbetween2To5ClkBreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteBvalidAssertedInbetween2To5ClkBreadyAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

function void Axi4LiteBvalidAssertedInbetween2To5ClkBreadyAssertedTest::setupAxi4LiteMasterWriteAgentConfig();
  super.setupAxi4LiteMasterWriteAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
   axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

task Axi4LiteBvalidAssertedInbetween2To5ClkBreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq=Axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq::type_id::create("axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteBvalidAssertedInbetween2To5ClkBreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualBvalidAssertedInbetween2To5ClkBreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

