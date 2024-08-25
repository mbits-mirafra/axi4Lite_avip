`ifndef AXI4LITEMASTERBASETEST_INCLUDED_
`define AXI4LITEMASTERBASETEST_INCLUDED_

class Axi4LiteBaseTest extends uvm_test;
  `uvm_component_utils(Axi4LiteBaseTest)

  Axi4LiteVirtualBaseSeq axi4LiteVirtualBaseSeq;
  Axi4LiteEnv axi4LiteEnv;
  Axi4LiteEnvConfig axi4LiteEnvConfig;

  extern function new(string name = "Axi4LiteBaseTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void setupAxi4LiteEnvConfig();
  extern virtual function void setupAxi4LiteMasterEnvConfig();
  extern virtual function void setupAxi4LiteWriteMasterEnvConfig();
  extern virtual function void setupAxi4LiteMasterWriteAgentConfig();
  extern virtual function void setupAxi4LiteReadMasterEnvConfig();
  extern virtual function void setupAxi4LiteMasterReadAgentConfig();
  extern virtual function void setupAxi4LiteSlaveEnvConfig();
  extern virtual function void setupAxi4LiteWriteSlaveEnvConfig();
  extern virtual function void setupAxi4LiteSlaveWriteAgentConfig();
  extern virtual function void setupAxi4LiteReadSlaveEnvConfig();
  extern virtual function void setupAxi4LiteSlaveReadAgentConfig();
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteBaseTest

function Axi4LiteBaseTest::new(string name = "Axi4LiteBaseTest", uvm_component parent = null);
  super.new(name, parent);
endfunction : new


function void Axi4LiteBaseTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteEnv = Axi4LiteEnv::type_id::create("axi4LiteEnv",this);
  setupAxi4LiteEnvConfig();
endfunction : build_phase

function void Axi4LiteBaseTest::setupAxi4LiteEnvConfig();
 axi4LiteEnvConfig = Axi4LiteEnvConfig::type_id::create("axi4LiteEnvConfig",this);

 axi4LiteEnvConfig.hasVirtualSequencer = 1;
 axi4LiteEnvConfig.hasScoreboard = 1;

 setupAxi4LiteMasterEnvConfig();
 setupAxi4LiteSlaveEnvConfig();

 uvm_config_db#(Axi4LiteEnvConfig)::set(this, "*", "Axi4LiteEnvConfig",
                                                   axi4LiteEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_ENV_CONFIG\n%s", 
                axi4LiteEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteEnvConfig

function void Axi4LiteBaseTest::setupAxi4LiteMasterEnvConfig();
 axi4LiteEnvConfig.axi4LiteMasterEnvConfig = Axi4LiteMasterEnvConfig::type_id::create("axi4LiteMasterEnvConfig",this);

 axi4LiteEnvConfig.axi4LiteMasterEnvConfig.hasMasterVirtualSequencer = 1;

 setupAxi4LiteWriteMasterEnvConfig();
 setupAxi4LiteReadMasterEnvConfig();

 uvm_config_db#(Axi4LiteMasterEnvConfig)::set(this, "*", "Axi4LiteMasterEnvConfig",
                                                   axi4LiteEnvConfig.axi4LiteMasterEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_ENV_CONFIG\n%s", 
                axi4LiteEnvConfig.axi4LiteMasterEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteMasterEnvConfig

function void Axi4LiteBaseTest::setupAxi4LiteSlaveEnvConfig();
 axi4LiteEnvConfig.axi4LiteSlaveEnvConfig = Axi4LiteSlaveEnvConfig::type_id::create("axi4LiteSlaveEnvConfig",this);

 axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.hasSlaveVirtualSequencer = 1;

 setupAxi4LiteWriteSlaveEnvConfig();
 setupAxi4LiteReadSlaveEnvConfig();

 uvm_config_db#(Axi4LiteSlaveEnvConfig)::set(this, "*", "Axi4LiteSlaveEnvConfig",
                                                   axi4LiteEnvConfig.axi4LiteSlaveEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_ENV_CONFIG\n%s", 
                axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteSlaveEnvConfig

function void Axi4LiteBaseTest::setupAxi4LiteWriteMasterEnvConfig();
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig = Axi4LiteWriteMasterEnvConfig::type_id::create("axi4LiteWriteMasterEnvConfig",this);
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.no_of_masters = NO_OF_WRITEMASTERS;
  setupAxi4LiteMasterWriteAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin 
   uvm_config_db#(Axi4LiteMasterWriteAgentConfig)::set( this, "*", $sformatf("Axi4LiteMasterWriteAgentConfig[%0d]", i),
          axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].sprint()),UVM_LOW);
  end

  uvm_config_db#(Axi4LiteWriteMasterEnvConfig)::set(this, "*", "Axi4LiteWriteMasterEnvConfig",
                                                   axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_MASTER_ENV_CONFIG\n%s", 
                axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteWriteMasterEnvConfig

function void Axi4LiteBaseTest::setupAxi4LiteMasterWriteAgentConfig();
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig = new[axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.no_of_masters];
  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i]) begin
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i] = Axi4LiteMasterWriteAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteMasterWriteAgentConfig[%0d]",i));

  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].hasCoverage = 1;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].defaultStateReady = Axi4LiteWriteMasterGlobalPkg::DEFAULT_READY;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].minAddressRange = Axi4LiteWriteMasterGlobalPkg::MIN_ADDRESS;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxAddressRange = Axi4LiteWriteMasterGlobalPkg::MAX_ADDRESS;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxDelayForAwready = Axi4LiteMasterWriteAssertCoverParameter::MAX_DELAY_READY;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxDelayForWready = Axi4LiteMasterWriteAssertCoverParameter::MAX_DELAY_READY;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxDelayForBvalid = Axi4LiteMasterWriteAssertCoverParameter::MAX_DELAY_BVALID;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].toggleReady = 0;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].enableOutstandingTransaction = 0;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].maxLimitOfOutstandingTx = Axi4LiteWriteMasterGlobalPkg::MAXLIMITOF_OUTSTANDINGTX;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteWriteMasterEnvConfig.axi4LiteMasterWriteAgentConfig[i].noOfOutstandingTx = 3;

  end
endfunction : setupAxi4LiteMasterWriteAgentConfig
 
function void Axi4LiteBaseTest::setupAxi4LiteReadMasterEnvConfig();
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig = Axi4LiteReadMasterEnvConfig::type_id::create("axi4LiteReadMasterEnvConfig",this);
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.no_of_masters = NO_OF_WRITEMASTERS;
  setupAxi4LiteMasterReadAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
    uvm_config_db#(Axi4LiteMasterReadAgentConfig)::set( this, "*", $sformatf("Axi4LiteMasterReadAgentConfig[%0d]", i),
          axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].sprint()),UVM_LOW);
  end

 uvm_config_db#(Axi4LiteReadMasterEnvConfig)::set(this, "*", "Axi4LiteReadMasterEnvConfig",
                                                   axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_MASTER_ENV_CONFIG\n%s", 
                axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteReadMasterEnvConfig

function void Axi4LiteBaseTest::setupAxi4LiteMasterReadAgentConfig();
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig = new[axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.no_of_masters];
  foreach(axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i] = Axi4LiteMasterReadAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteMasterReadAgentConfig[%0d]",i));

  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].hasCoverage = 1;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].defaultStateReady = Axi4LiteReadMasterGlobalPkg::DEFAULT_READY;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].minAddressRange = Axi4LiteReadMasterGlobalPkg::MIN_ADDRESS;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].maxAddressRange = Axi4LiteReadMasterGlobalPkg::MAX_ADDRESS;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].maxDelayForArready = Axi4LiteMasterReadAssertCoverParameter::MAX_DELAY_READY;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].maxDelayForRvalid = Axi4LiteMasterReadAssertCoverParameter::MAX_DELAY_RVALID;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].toggleReady = 0;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].enableOutstandingTransaction = 0;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].maxLimitOfOutstandingTx = Axi4LiteReadMasterGlobalPkg::MAXLIMITOF_OUTSTANDINGTX;
  axi4LiteEnvConfig.axi4LiteMasterEnvConfig.axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].noOfOutstandingTx = 3;

 end
endfunction : setupAxi4LiteMasterReadAgentConfig

function void Axi4LiteBaseTest::setupAxi4LiteWriteSlaveEnvConfig();
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig = Axi4LiteWriteSlaveEnvConfig::type_id::create("axi4LiteWriteSlaveEnvConfig",this);
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.no_of_slaves = NO_OF_WRITESLAVES;
  setupAxi4LiteSlaveWriteAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
    uvm_config_db#(Axi4LiteSlaveWriteAgentConfig)::set( this, "*", $sformatf("Axi4LiteSlaveWriteAgentConfig[%0d]", i),
          axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]);
     `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].sprint()),UVM_LOW);
  end

  uvm_config_db#(Axi4LiteWriteSlaveEnvConfig)::set(this, "*", "Axi4LiteWriteSlaveEnvConfig",
                                                   axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_SLAVE_ENV_CONFIG\n%s", 
                axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteWriteSlaveEnvConfig

function void Axi4LiteBaseTest::setupAxi4LiteSlaveWriteAgentConfig();
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig = new[axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.no_of_slaves];
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i]) begin
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i] = Axi4LiteSlaveWriteAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteSlaveWriteAgentConfig[%0d]",i));

 axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
 axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].hasCoverage = 1;
 axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].defaultStateReady = Axi4LiteWriteSlaveGlobalPkg::DEFAULT_READY;
 axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].minAddressRange = Axi4LiteWriteSlaveGlobalPkg::MIN_ADDRESS;
 axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].maxAddressRange = Axi4LiteWriteSlaveGlobalPkg::MAX_ADDRESS;
 axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].maxDelayForWvalid = Axi4LiteSlaveWriteAssertCoverParameter::MAX_DELAY_WVALID;
 axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].maxDelayForBready = Axi4LiteSlaveWriteAssertCoverParameter::MAX_DELAY_READY;
 axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteWriteSlaveEnvConfig.axi4LiteSlaveWriteAgentConfig[i].toggleReady = 0;

  end
endfunction : setupAxi4LiteSlaveWriteAgentConfig
 
function void Axi4LiteBaseTest::setupAxi4LiteReadSlaveEnvConfig();
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig = Axi4LiteReadSlaveEnvConfig::type_id::create("axi4LiteReadSlaveEnvConfig",this);
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.no_of_slaves = NO_OF_READSLAVES;
  setupAxi4LiteSlaveReadAgentConfig();

  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin 
    uvm_config_db#(Axi4LiteSlaveReadAgentConfig)::set( this, "*", $sformatf("Axi4LiteSlaveReadAgentConfig[%0d]", i),
          axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_SLAVE_WRITE_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].sprint()),UVM_LOW);
  end

   uvm_config_db#(Axi4LiteReadSlaveEnvConfig)::set(this, "*", "Axi4LiteReadSlaveEnvConfig",
                                                   axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_WRITE_SLAVE_ENV_CONFIG\n%s", 
                axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteReadSlaveEnvConfig

function void Axi4LiteBaseTest::setupAxi4LiteSlaveReadAgentConfig();
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig = new[axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.no_of_slaves];
  foreach(axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i]) begin
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i] = Axi4LiteSlaveReadAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteSlaveReadAgentConfig[%0d]",i));

  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].hasCoverage = 1;
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].defaultStateReady = Axi4LiteReadSlaveGlobalPkg::DEFAULT_READY;
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].minAddressRange = Axi4LiteReadSlaveGlobalPkg::MIN_ADDRESS;
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].maxAddressRange = Axi4LiteReadSlaveGlobalPkg::MAX_ADDRESS;
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].maxDelayForRready = Axi4LiteSlaveReadAssertCoverParameter::MAX_DELAY_READY;
  axi4LiteEnvConfig.axi4LiteSlaveEnvConfig.axi4LiteReadSlaveEnvConfig.axi4LiteSlaveReadAgentConfig[i].toggleReady = 0;

  end
endfunction : setupAxi4LiteSlaveReadAgentConfig


function void Axi4LiteBaseTest::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  uvm_test_done.set_drain_time(this,3000ns);
endfunction : end_of_elaboration_phase


task Axi4LiteBaseTest::run_phase(uvm_phase phase);
  axi4LiteVirtualBaseSeq = Axi4LiteVirtualBaseSeq::type_id::create("axi4LiteVirtualBaseSeq");

  phase.raise_objection(this, "Axi4LiteBaseTest");

  `uvm_info(get_type_name(), $sformatf("Inside MASTER_BASE_TEST"), UVM_NONE);
   super.run_phase(phase);
//   axi4LiteVirtualBaseSeq.start(axi4LiteEnv.axi4LiteVirtualSequencer);
  #10;
  `uvm_info(get_type_name(), $sformatf("Done MASTER_BASE_TEST"), UVM_NONE);
  phase.drop_objection(this);

endtask : run_phase

`endif

