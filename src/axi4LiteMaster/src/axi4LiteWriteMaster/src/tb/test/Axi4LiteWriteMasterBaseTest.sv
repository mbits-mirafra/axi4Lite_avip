`ifndef AXI4LITEWRITEMASTERBASETEST_INCLUDED_
`define AXI4LITEWRITEMASTERBASETEST_INCLUDED_

class Axi4LiteWriteMasterBaseTest extends uvm_test;
  `uvm_component_utils(Axi4LiteWriteMasterBaseTest)

  extern function new(string name = "Axi4LiteWriteMasterBaseTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void setupAxi4LiteWriteMasterEnvConfig();
  extern virtual function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteWriteMasterBaseTest

function Axi4LiteWriteMasterBaseTest::new(string name = "Axi4LiteWriteMasterBaseTest", uvm_component parent = null);
  super.new(name, parent);
endfunction : new


function void Axi4LiteWriteMasterBaseTest::build_phase(uvm_phase phase);
  super.build_phase(phase);

endfunction : build_phase




function void Axi4LiteWriteMasterBaseTest::setupAxi4LiteWriteMasterEnvConfig();

endfunction : setupAxi4LiteWriteMasterEnvConfig

function void Axi4LiteWriteMasterBaseTest::setupAxi4LiteMasterWriteAgentConfig();

endfunction


function void Axi4LiteWriteMasterBaseTest::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  uvm_test_done.set_drain_time(this, 3000ns);
endfunction : end_of_elaboration_phase


task Axi4LiteWriteMasterBaseTest::run_phase(uvm_phase phase);

  phase.raise_objection(this, "Axi4LiteWriteMasterBaseTest");

  `uvm_info(get_type_name(), $sformatf("Inside BASE_TEST"), UVM_NONE);
  super.run_phase(phase);
  #100;
  `uvm_info(get_type_name(), $sformatf("Done BASE_TEST"), UVM_NONE);
  phase.drop_objection(this);

endtask : run_phase

`endif

