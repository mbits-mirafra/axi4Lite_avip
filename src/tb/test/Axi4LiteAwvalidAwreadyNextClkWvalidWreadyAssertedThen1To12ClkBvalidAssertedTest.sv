`ifndef AXI4LITEAWVALIDAWREADYNEXTCLKWVALIDWREADYASSERTEDTHEN1TO12CLKBVALIDASSERTEDTEST_INCLUDED_
`define AXI4LITEAWVALIDAWREADYNEXTCLKWVALIDWREADYASSERTEDTHEN1TO12CLKBVALIDASSERTEDTEST_INCLUDED_

class Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedTest)

  Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedSeq axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedSeq;
  
  extern function new(string name = "Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedTest

function Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedTest::new(string name = "Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedSeq=Axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedSeq::type_id::create("axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualAwvalidAwreadyNextClkWvalidWreadyAssertedThen1To12ClkBvalidAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

