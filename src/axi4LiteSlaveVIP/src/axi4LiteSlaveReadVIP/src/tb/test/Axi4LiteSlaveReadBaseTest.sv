`ifndef AXI4LITESLAVEREADBASETEST_INCLUDED_
`define AXI4LITESLAVEREADBASETEST_INCLUDED_

class Axi4LiteSlaveReadBaseTest extends uvm_test;
  `uvm_component_utils(Axi4LiteSlaveReadBaseTest)

  Axi4LiteSlaveReadBaseSeq axi4LiteSlaveReadBaseSeq;
  Axi4LiteReadSlaveEnv axi4LiteReadSlaveEnv;
  Axi4LiteReadSlaveEnvConfig axi4LiteReadSlaveEnvConfig;

  extern function new(string name = "Axi4LiteSlaveReadBaseTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void setupAxi4LiteReadSlaveEnvConfig();
  extern virtual function void setupAxi4LiteSlaveReadAgentConfig();
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteSlaveReadBaseTest

function Axi4LiteSlaveReadBaseTest::new(string name = "Axi4LiteSlaveReadBaseTest", uvm_component parent = null);
  super.new(name, parent);
endfunction : new


function void Axi4LiteSlaveReadBaseTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteReadSlaveEnv = Axi4LiteReadSlaveEnv::type_id::create("axi4LiteReadSlaveEnv",this);
  setupAxi4LiteReadSlaveEnvConfig();
endfunction : build_phase

function void Axi4LiteSlaveReadBaseTest::setupAxi4LiteReadSlaveEnvConfig();
 axi4LiteReadSlaveEnvConfig = Axi4LiteReadSlaveEnvConfig::type_id::create("axi4LiteReadSlaveEnvConfig",this);
 axi4LiteReadSlaveEnvConfig.no_of_slaves = NO_OF_READSLAVES;
 setupAxi4LiteSlaveReadAgentConfig();

 uvm_config_db#(Axi4LiteReadSlaveEnvConfig)::set(this, "*", "Axi4LiteReadSlaveEnvConfig",
                                                   axi4LiteReadSlaveEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_READ_SLAVE_ENV_CONFIG\n%s", 
                axi4LiteReadSlaveEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteReadSlaveEnvConfig

function void Axi4LiteSlaveReadBaseTest::setupAxi4LiteSlaveReadAgentConfig();
  axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig = new[axi4LiteReadSlaveEnvConfig.no_of_slaves];
  foreach(axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin
  axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i] = Axi4LiteSlaveReadAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteSlaveReadAgentConfig[%0d]",i));

  axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].hasCoverage = 1;
  axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].defaultStateReady = 1;
  axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].maxDelayForRready = MAX_DELAY_READY;
  axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].minAddressRange = MIN_ADDRESS;
  axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].maxAddressRange = MAX_ADDRESS;
  axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].toggleReady = 0;
   uvm_config_db#(Axi4LiteSlaveReadAgentConfig)::set( this, "*", $sformatf("Axi4LiteSlaveReadAgentConfig[%0d]", i),
          axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_READ_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].sprint()),UVM_LOW);
  end
endfunction


function void Axi4LiteSlaveReadBaseTest::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  uvm_test_done.set_drain_time(this,3000ns);
endfunction : end_of_elaboration_phase


task Axi4LiteSlaveReadBaseTest::run_phase(uvm_phase phase);
  axi4LiteSlaveReadBaseSeq = Axi4LiteSlaveReadBaseSeq::type_id::create("axi4LiteSlaveReadBaseSeq",this);
  phase.raise_objection(this, "Axi4LiteSlaveReadBaseTest");

  `uvm_info(get_type_name(), $sformatf("Inside BASE_TEST"), UVM_NONE);
   super.run_phase(phase);
   axi4LiteSlaveReadBaseSeq.start(axi4LiteReadSlaveEnv.axi4LiteSlaveReadAgent[0].axi4LiteSlaveReadSequencer);
  #10;
  `uvm_info(get_type_name(), $sformatf("Done BASE_TEST"), UVM_NONE);
  phase.drop_objection(this);

endtask : run_phase

`endif

