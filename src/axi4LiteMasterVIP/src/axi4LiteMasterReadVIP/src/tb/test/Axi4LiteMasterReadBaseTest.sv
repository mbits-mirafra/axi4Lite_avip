`ifndef AXI4LITEMASTERREADBASETEST_INCLUDED_
`define AXI4LITEMASTERREADBASETEST_INCLUDED_

class Axi4LiteMasterReadBaseTest extends uvm_test;
  `uvm_component_utils(Axi4LiteMasterReadBaseTest)

  Axi4LiteMasterReadBaseSeq axi4LiteMasterReadBaseSeq;
  Axi4LiteReadMasterEnv axi4LiteReadMasterEnv;
  Axi4LiteReadMasterEnvConfig axi4LiteReadMasterEnvConfig;

  extern function new(string name = "Axi4LiteMasterReadBaseTest", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void setupAxi4LiteReadMasterEnvConfig();
  extern virtual function void setupAxi4LiteMasterReadAgentConfig();
  extern virtual function void end_of_elaboration_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);

endclass : Axi4LiteMasterReadBaseTest

function Axi4LiteMasterReadBaseTest::new(string name = "Axi4LiteMasterReadBaseTest", uvm_component parent = null);
  super.new(name, parent);
endfunction : new


function void Axi4LiteMasterReadBaseTest::build_phase(uvm_phase phase);
  super.build_phase(phase);
  axi4LiteReadMasterEnv = Axi4LiteReadMasterEnv::type_id::create("axi4LiteReadMasterEnv",this);
  setupAxi4LiteReadMasterEnvConfig();
endfunction : build_phase

function void Axi4LiteMasterReadBaseTest::setupAxi4LiteReadMasterEnvConfig();
 axi4LiteReadMasterEnvConfig = Axi4LiteReadMasterEnvConfig::type_id::create("axi4LiteReadMasterEnvConfig",this);
 axi4LiteReadMasterEnvConfig.no_of_masters = NO_OF_READMASTERS;
 setupAxi4LiteMasterReadAgentConfig();

 uvm_config_db#(Axi4LiteReadMasterEnvConfig)::set(this, "*", "Axi4LiteReadMasterEnvConfig",
                                                   axi4LiteReadMasterEnvConfig);
  `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_READ_MASTER_ENV_CONFIG\n%s", 
                axi4LiteReadMasterEnvConfig.sprint()),UVM_LOW);
endfunction : setupAxi4LiteReadMasterEnvConfig

function void Axi4LiteMasterReadBaseTest::setupAxi4LiteMasterReadAgentConfig();
  axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig = new[axi4LiteReadMasterEnvConfig.no_of_masters];
  foreach(axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]) begin
  axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i] = Axi4LiteMasterReadAgentConfig::type_id::create(
                                                              $sformatf("axi4LiteMasterReadAgentConfig[%0d]",i));

  axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].isActive = uvm_active_passive_enum'(UVM_ACTIVE);
  axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].hasCoverage = 1;
  axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].defaultStateReady = DEFAULT_READY;
  axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].minAddressRange = MIN_ADDRESS; 
  axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].maxAddressRange = MAX_ADDRESS;
  axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].maxDelayForArready = MAX_DELAY_READY;
  axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].maxDelayForRvalid = MAX_DELAY_RVALID;
  axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].toggleReady = 0;
  axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].enableOutstandingTransaction = 0;
  axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].maxLimitOfOutstandingTx = MAXLIMITOF_OUTSTANDINGTX;
  axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].noOfOutstandingTx = 3;

   uvm_config_db#(Axi4LiteMasterReadAgentConfig)::set( this, "*", $sformatf("Axi4LiteMasterReadAgentConfig[%0d]", i),
          axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i]);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_READ_AGENT_CONFIG[%0d]\n%s",i,
                 axi4LiteReadMasterEnvConfig.axi4LiteMasterReadAgentConfig[i].sprint()),UVM_LOW);
  end
endfunction


function void Axi4LiteMasterReadBaseTest::end_of_elaboration_phase(uvm_phase phase);
  uvm_top.print_topology();
  uvm_test_done.set_drain_time(this,1000ns);
endfunction : end_of_elaboration_phase


task Axi4LiteMasterReadBaseTest::run_phase(uvm_phase phase);
  axi4LiteMasterReadBaseSeq = Axi4LiteMasterReadBaseSeq::type_id::create("axi4LiteMasterReadBaseSeq",this);
  phase.raise_objection(this, "Axi4LiteMasterReadBaseTest");

  `uvm_info(get_type_name(), $sformatf("Inside BASE_TEST"), UVM_NONE);
   super.run_phase(phase);
   axi4LiteMasterReadBaseSeq.start(axi4LiteReadMasterEnv.axi4LiteMasterReadAgent[0].axi4LiteMasterReadSequencer);
  #10;
  `uvm_info(get_type_name(), $sformatf("Done BASE_TEST"), UVM_NONE);
  phase.drop_objection(this);

endtask : run_phase

`endif

