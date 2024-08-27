`ifndef AXI4LITERVALIDASSERTEDINBETWEEN2TO5CLKRREADYASSERTEDTEST_INCLUDED_
`define AXI4LITERVALIDASSERTEDINBETWEEN2TO5CLKRREADYASSERTEDTEST_INCLUDED_

class Axi4LiteRvalidAssertedInbetween2To5ClkRreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteRvalidAssertedInbetween2To5ClkRreadyAssertedTest)

  Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteRvalidAssertedInbetween2To5ClkRreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern function void setupAxi4LiteMasterReadAgentConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteRvalidAssertedInbetween2To5ClkRreadyAssertedTest

function Axi4LiteRvalidAssertedInbetween2To5ClkRreadyAssertedTest::new(string name = "Axi4LiteRvalidAssertedInbetween2To5ClkRreadyAssertedTest",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteRvalidAssertedInbetween2To5ClkRreadyAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteReadMasterGlobalPkg::READ;
endfunction : setupAxi4LiteEnvConfig

function void Axi4LiteRvalidAssertedInbetween2To5ClkRreadyAssertedTest::setupAxi4LiteMasterReadAgentConfig();
  super.setupAxi4LiteMasterReadAgentConfig();
  
  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
   axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].defaultStateReady = 0; 
  end
endfunction

task Axi4LiteRvalidAssertedInbetween2To5ClkRreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq=Axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq::type_id::create("axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteRvalidAssertedInbetween2To5ClkRreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualRvalidAssertedInbetween2To5ClkRreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

