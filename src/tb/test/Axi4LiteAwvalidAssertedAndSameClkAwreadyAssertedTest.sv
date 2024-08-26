`ifndef AXI4LITEAWVALIDASSERTEDANDSAMECLKAWREADYASSERTEDTEST_INCLUDED_
`define AXI4LITEAWVALIDASSERTEDANDSAMECLKAWREADYASSERTEDTEST_INCLUDED_

class Axi4LiteAwvalidAssertedAndSameClkAwreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteAwvalidAssertedAndSameClkAwreadyAssertedTest)

  Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteAwvalidAssertedAndSameClkAwreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);
endclass : Axi4LiteAwvalidAssertedAndSameClkAwreadyAssertedTest

function Axi4LiteAwvalidAssertedAndSameClkAwreadyAssertedTest::new(string name = "Axi4LiteAwvalidAssertedAndSameClkAwreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteAwvalidAssertedAndSameClkAwreadyAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = 1;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteAwvalidAssertedAndSameClkAwreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq=Axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq::type_id::create("axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteAwvalidAssertedAndSameClkAwreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualAwvalidAssertedAndSameClkAwreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

