`ifndef MASTERVIPSLAVEIPENV_INCLUDED_
`define MASTERVIPSLAVEIPENV_INCLUDED_

class MasterVIPSlaveIPEnv extends uvm_env;
  `uvm_component_utils(MasterVIPSlaveIPEnv)
  
  MasterVIPSlaveIPEnvConfig masterVIPSlaveIPEnvConfig;

  Axi4LiteMasterEnv axi4LiteMasterEnv;

  Axi4LiteMasterEnvConfig axi4LiteMasterEnvConfig;

//Axi4LiteScoreboard axi4LiteScoreboard;

  extern function new(string name = "MasterVIPSlaveIPEnv", uvm_component parent = null);
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);

endclass : MasterVIPSlaveIPEnv

function MasterVIPSlaveIPEnv::new(string name = "MasterVIPSlaveIPEnv",uvm_component parent = null);
  super.new(name, parent);
endfunction : new

function void MasterVIPSlaveIPEnv::build_phase(uvm_phase phase);
  super.build_phase(phase);
  
  if(!uvm_config_db #(MasterVIPSlaveIPEnvConfig)::get(this,"","MasterVIPSlaveIPEnvConfig",masterVIPSlaveIPEnvConfig)) begin
    `uvm_fatal("FATAL_ENV_CONFIG", $sformatf("Couldn't get the MasterVIPSlaveIPEnvConfig from config_db"))
  end

  axi4LiteMasterEnvConfig = Axi4LiteMasterEnvConfig::type_id::create("axi4LiteMasterEnvConfig");
   if(!uvm_config_db #(Axi4LiteMasterEnvConfig)::get(this,"","Axi4LiteMasterEnvConfig",axi4LiteMasterEnvConfig)) 
   `uvm_fatal("FATAL_MASTER_ENV_CONFIG","Couldn't get the Axi4LiteMasterEnvConfig from config_db")

   axi4LiteMasterEnv = Axi4LiteMasterEnv::type_id::create("axi4LiteMasterEnv",this); 

   axi4LiteMasterEnv.axi4LiteMasterEnvConfig = axi4LiteMasterEnvConfig;

/*   if(masterVIPSlaveIPEnvConfig.hasScoreboard) begin
     axi4LiteScoreboard = Axi4LiteScoreboard::type_id::create("axi4LiteScoreboard",this); 
   end
  */
endfunction : build_phase

function void MasterVIPSlaveIPEnv::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
  
/*    axi4LiteMasterEnv.axi4LiteMasterEnvWriteAddressAnalysisPort.connect(axi4LiteScoreboard.axi4LiteMasterWriteEnvAddressFIFO.analysis_export);
    axi4LiteMasterEnv.axi4LiteMasterEnvWriteDataAnalysisPort.connect(axi4LiteScoreboard.axi4LiteMasterWriteEnvDataFIFO.analysis_export);
    axi4LiteMasterEnv.axi4LiteMasterEnvWriteResponseAnalysisPort.connect(axi4LiteScoreboard.axi4LiteMasterWriteEnvResponseFIFO.analysis_export);
    axi4LiteMasterEnv.axi4LiteMasterEnvReadAddressAnalysisPort.connect(axi4LiteScoreboard.axi4LiteMasterReadEnvAddressFIFO.analysis_export);
    axi4LiteMasterEnv.axi4LiteMasterEnvReadDataAnalysisPort.connect(axi4LiteScoreboard.axi4LiteMasterReadEnvDataFIFO.analysis_export);
*/
endfunction : connect_phase

`endif

