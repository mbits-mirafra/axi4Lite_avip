`ifndef AXI4LITESLAVEBASETEST_INCLUDED_
`define AXI4LITESLAVEBASETEST_INCLUDED_

class Axi4LiteSlaveBaseTest extends uvm_test;
  `uvm_component_utils(Axi4LiteSlaveBaseTest)

  Axi4LiteSlaveVirtualBaseSeq axi4LiteSlaveVirtualBaseSeq;
  Axi4LiteSlaveEnv axi4LiteSlaveEnv;
  Axi4LiteSlaveEnvConfig axi4LiteSlaveEnvConfig;

  extern function new(string name = "Axi4LiteSlaveBaseTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void setupAxi4LiteSlaveEnvConfig();
  extern virtual function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual function void setupAxi4LiteSlaveReadAgentConfig();
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveBaseTest

function Axi4LiteSlaveBaseTest::new(string name = "Axi4LiteSlaveBaseTest", uvm_component parent = null);
  super.new(name, parent);
endfunction : new


function void Axi4LiteSlaveBaseTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteSlaveEnv = Axi4LiteSlaveEnv::type_id::create("axi4LiteSlaveEnv",this);
  setupAxi4LiteSlaveEnvConfig();
endfunction : build_phase

function void Axi4LiteSlaveBaseTest::setupAxi4LiteSlaveEnvConfig();
 axi4LiteSlaveEnvConfig = Axi4LiteSlaveEnvConfig::type_id::create("axi4LiteSlaveEnvConfig",this);
 axi4LiteSlaveEnvConfig.noOfWriteSlaves = NO_OF_WRITESLAVES;
 axi4LiteSlaveEnvConfig.noOfReadSlaves = NO_OF_READSLAVES;
 setupAxi4LiteSlaveWriteAgentConfig();
 setupAxi4LiteSlaveReadAgentConfig();

 uvm_config_db#(Axi4LiteSlaveEnvConfig)::set(this, "*", "Axi4LiteSlaveEnvConfig",
                                                   axi4LiteSlaveEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_ENV_CONFIG\n%s", 
                axi4LiteSlaveEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteSlaveEnvConfig

function void Axi4LiteSlaveBaseTest::setupAxi4LiteSlaveWriteAgentConfig();
  axi4LiteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig = new[axi4LiteSlaveEnvConfig.noOfWriteSlaves];
  foreach(axi4LiteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
  axi4LiteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i] = Axi4LiteSlaveWriteAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteSlaveWriteAgentConfig[%0d]",i));

  axi4LiteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].hasCoverage = 1;

   uvm_config_db#(Axi4LiteSlaveWriteAgentConfig)::set( this, "*", $sformatf("Axi4LiteSlaveWriteAgentConfig[%0d]", i),
          axi4LiteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].sprint()),UVM_LOW);
  end
endfunction
 
function void Axi4LiteSlaveBaseTest::setupAxi4LiteSlaveReadAgentConfig();
  axi4LiteSlaveEnvConfig.axi4LiteSlaveReadAgentConfig = new[axi4LiteSlaveEnvConfig.noOfReadSlaves];
  foreach(axi4LiteSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin
  axi4LiteSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i] = Axi4LiteSlaveReadAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteSlaveReadAgentConfig[%0d]",i));

  axi4LiteSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].hasCoverage = 1;

   uvm_config_db#(Axi4LiteSlaveReadAgentConfig)::set( this, "*", $sformatf("Axi4LiteSlaveReadAgentConfig[%0d]", i),
          axi4LiteSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_READ_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].sprint()),UVM_LOW);
  end
endfunction

function void Axi4LiteSlaveBaseTest::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  uvm_test_done.set_drain_time(this,10ns);
endfunction : end_of_elaboration_phase


task Axi4LiteSlaveBaseTest::run_phase(uvm_phase phase);
  phase.raise_objection(this, "Axi4LiteSlaveBaseTest");

  `uvm_info(get_type_name(), $sformatf("Inside BASE_TEST"), UVM_NONE);
   super.run_phase(phase);
   //axi4LiteSlaveWriteBaseSeq.start(axi4LiteSlaveEnv.axi4LiteWriteSlaveAgent.axi4LiteSlaveWriteSequencer);
  #10;
  `uvm_info(get_type_name(), $sformatf("Done BASE_TEST"), UVM_NONE);
  phase.drop_objection(this);

endtask : run_phase

`endif

