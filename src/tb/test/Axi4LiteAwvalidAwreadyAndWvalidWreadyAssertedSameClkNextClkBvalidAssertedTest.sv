`ifndef AXI4LITEAWVALIDAWREADYANDWVALIDWREADYASSERTEDSAMECLKNEXTCLKBVALIDASSERTEDTEST_INCLUDED_
`define AXI4LITEAWVALIDAWREADYANDWVALIDWREADYASSERTEDSAMECLKNEXTCLKBVALIDASSERTEDTEST_INCLUDED_

class Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest)

  Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq;
  
  extern function new(string name = "Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest

function Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest::new(string name = "Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest::run_phase(uvm_phase phase);

  axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq=Axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq::type_id::create("axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedTest"),UVM_LOW);
    phase.raise_objection(this);
    axi4LiteVirtualAwvalidAwreadyAndWvalidWreadyAssertedSameClkNextClkBvalidAssertedSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  phase.drop_objection(this);

endtask : run_phase

`endif

