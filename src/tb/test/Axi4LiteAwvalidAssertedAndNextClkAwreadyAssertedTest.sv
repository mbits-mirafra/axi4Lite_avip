`ifndef AXI4LITEAWVALIDASSERTEDANDNEXTCLKAWREADYASSERTEDTEST_INCLUDED_
`define AXI4LITEAWVALIDASSERTEDANDNEXTCLKAWREADYASSERTEDTEST_INCLUDED_

class Axi4LiteAwvalidAssertedAndNextClkAwreadyAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteAwvalidAssertedAndNextClkAwreadyAssertedTest)

  Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq;
  
  extern function new(string name = "Axi4LiteAwvalidAssertedAndNextClkAwreadyAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteAwvalidAssertedAndNextClkAwreadyAssertedTest

function Axi4LiteAwvalidAssertedAndNextClkAwreadyAssertedTest::new(string name = "Axi4LiteAwvalidAssertedAndNextClkAwreadyAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteAwvalidAssertedAndNextClkAwreadyAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteAwvalidAssertedAndNextClkAwreadyAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq=Axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq::type_id::create("axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteAwvalidAssertedAndNextClkAwreadyAssertedTest"),UVM_LOW);
  phase.raise_objection(this);
  axi4LiteVirtualAwvalidAssertedAndNextClkAwreadyAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

