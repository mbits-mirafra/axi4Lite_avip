`ifndef AXI4LITERVALIDASSERTEDANDSAMECLKRREADYASSERTEDTEST_INCLUDED_
`define AXI4LITERVALIDASSERTEDANDSAMECLKRREADYASSERTEDTEST_INCLUDED_

class Axi4LiteRvalidAssertedAndSameClkRreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteRvalidAssertedAndSameClkRreadyAssertedTest)

  Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteRvalidAssertedAndSameClkRreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);
endclass : Axi4LiteRvalidAssertedAndSameClkRreadyAssertedTest

function Axi4LiteRvalidAssertedAndSameClkRreadyAssertedTest::new(string name = "Axi4LiteRvalidAssertedAndSameClkRreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteRvalidAssertedAndSameClkRreadyAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteReadMasterGlobalPkg::READ;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteRvalidAssertedAndSameClkRreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq=Axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq::type_id::create("axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteRvalidAssertedAndSameClkRreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualRvalidAssertedAndSameClkRreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

