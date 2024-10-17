`ifndef AXI4LITEWRITETEST_INCLUDED_
`define AXI4LITEWRITETEST_INCLUDED_

class Axi4LiteWriteTest extends Axi4LiteBaseTest;
  `uvm_component_utils(Axi4LiteWriteTest)

  Axi4LiteVirtualWriteSeq axi4LiteVirtualWriteSeq;
  
  extern function new(string name = "Axi4LiteWriteTest", uvm_component parent = null);
  extern function void setupAxi4LiteEnvConfig();
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteWriteTest

function Axi4LiteWriteTest::new(string name = "Axi4LiteWriteTest",
                                 uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void Axi4LiteWriteTest::setupAxi4LiteEnvConfig();
 super.setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig.transactionType = Axi4LiteWriteMasterGlobalPkg::WRITE;
endfunction : setupAxi4LiteEnvConfig

task Axi4LiteWriteTest::run_phase(uvm_phase phase);

  axi4LiteVirtualWriteSeq=Axi4LiteVirtualWriteSeq::type_id::create("axi4LiteVirtualWriteSeq");
  `uvm_info(get_type_name(),$sformatf("Inside run_phase Axi4LiteWriteTest"),UVM_LOW);
    phase.raise_objection(this);
    while(axi4LiteEnv.axi4LiteMasterEnv.axi4LiteWriteMasterEnv.axi4LiteMasterWriteAgent[0].axi4LiteMasterWriteCoverage.axi4LiteMasterWriteTransactionCovergroup.get_inst_coverage() < 95) begin
     axi4LiteVirtualWriteSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
     #10;
    end
  phase.drop_objection(this);

endtask : run_phase

`endif

