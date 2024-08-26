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
  extern virtual function void setupAxi4LiteWriteSlaveEnvConfig();
  extern virtual function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual function void setupAxi4LiteReadSlaveEnvConfig();
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

 axi4LiteSlaveEnvConfig.hasSlaveVirtualSequencer = 1;

 setupAxi4LiteWriteSlaveEnvConfig();
 setupAxi4LiteReadSlaveEnvConfig();

 uvm_config_db#(Axi4LiteSlaveEnvConfig)::set(this, "*", "Axi4LiteSlaveEnvConfig",
                                                   axi4LiteSlaveEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_ENV_CONFIG\n%s", 
                axi4LiteSlaveEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteSlaveEnvConfig

function void Axi4LiteSlaveBaseTest::setupAxi4LiteWriteSlaveEnvConfig();
  axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig = Axi4LiteWriteSlaveEnvConfig::type_id::create("axi4LiteWriteSlaveEnvConfig",this);
  axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.no_of_slaves = NO_OF_WRITESLAVES;
  setupAxi4LiteSlaveWriteAgentConfig();

  uvm_config_db#(Axi4LiteWriteSlaveEnvConfig)::set(this, "*", "Axi4LiteWriteSlaveEnvConfig",
                                                   axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_SLAVE_ENV_CONFIG\n%s", 
                axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteWriteSlaveEnvConfig

function void Axi4LiteSlaveBaseTest::setupAxi4LiteSlaveWriteAgentConfig();
  axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig = new[axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.no_of_slaves];
  foreach(axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
  axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i] = Axi4LiteSlaveWriteAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteSlaveWriteAgentConfig[%0d]",i));

  axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].hasCoverage = 1;
  axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].defaultStateReady = Axi4LiteWriteSlaveGlobalPkg::DEFAULT_READY;
  axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].minAddressRange = Axi4LiteWriteSlaveGlobalPkg::MIN_ADDRESS;
  axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].maxAddressRange = Axi4LiteWriteSlaveGlobalPkg::MAX_ADDRESS;
  axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].maxDelayForWvalid = Axi4LiteSlaveWriteAssertCoverParameter::MAX_DELAY_WVALID;
  axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].maxDelayForBready = Axi4LiteSlaveWriteAssertCoverParameter::MAX_DELAY_READY;
  axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].toggleReady   = 0;
  axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].enableOutstandingTransaction = 0;

   uvm_config_db#(Axi4LiteSlaveWriteAgentConfig)::set( this, "*", $sformatf("Axi4LiteSlaveWriteAgentConfig[%0d]", i),
          axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].sprint()),UVM_LOW);
  end
endfunction : setupAxi4LiteSlaveWriteAgentConfig
 
function void Axi4LiteSlaveBaseTest::setupAxi4LiteReadSlaveEnvConfig();
  axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig = Axi4LiteReadSlaveEnvConfig::type_id::create("axi4LiteReadSlaveEnvConfig",this);
  axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.no_of_slaves = NO_OF_READSLAVES;
  setupAxi4LiteSlaveReadAgentConfig();

  uvm_config_db#(Axi4LiteReadSlaveEnvConfig)::set(this, "*", "Axi4LiteReadSlaveEnvConfig",
                                                   axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_SLAVE_ENV_CONFIG\n%s", 
                axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteReadSlaveEnvConfig

function void Axi4LiteSlaveBaseTest::setupAxi4LiteSlaveReadAgentConfig();
  axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig = new[axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.no_of_slaves];
  foreach(axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin
  axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i] = Axi4LiteSlaveReadAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteSlaveReadAgentConfig[%0d]",i));

  axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].hasCoverage = 1;
  axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].defaultStateReady = Axi4LiteReadSlaveGlobalPkg::DEFAULT_READY;
  axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].maxDelayForRready = Axi4LiteSlaveReadAssertCoverParameter::MAX_DELAY_READY;
  axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].minAddressRange = Axi4LiteReadSlaveGlobalPkg::MIN_ADDRESS;
  axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].maxAddressRange = Axi4LiteReadSlaveGlobalPkg::MAX_ADDRESS;
  axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].toggleReady = 0;
  axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].enableOutstandingTransaction = 0;

   uvm_config_db#(Axi4LiteSlaveReadAgentConfig)::set( this, "*", $sformatf("Axi4LiteSlaveReadAgentConfig[%0d]", i),
          axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].sprint()),UVM_LOW);
  end
endfunction : setupAxi4LiteSlaveReadAgentConfig

function void Axi4LiteSlaveBaseTest::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  uvm_test_done.set_drain_time(this,3000ns);
endfunction : end_of_elaboration_phase


task Axi4LiteSlaveBaseTest::run_phase(uvm_phase phase);
  axi4LiteSlaveVirtualBaseSeq = Axi4LiteSlaveVirtualBaseSeq::type_id::create("axi4LiteSlaveVirtualBaseSeq");
  phase.raise_objection(this, "Axi4LiteSlaveBaseTest");

  `uvm_info(get_type_name(), $sformatf("Inside SLAVE_BASE_TEST"), UVM_NONE);
   super.run_phase(phase);
   axi4LiteSlaveVirtualBaseSeq.start(axi4LiteSlaveEnv.axi4LiteSlaveVirtualSequencer);
  #10;
  `uvm_info(get_type_name(), $sformatf("Done SLAVE_BASE_TEST"), UVM_NONE);
  phase.drop_objection(this);

endtask : run_phase

`endif

