`ifndef AXI4LITEMASTERREADCOVERAGE_INCLUDED_
`define AXI4LITEMASTERREADCOVERAGE_INCLUDED_

class Axi4LiteMasterReadCoverage extends uvm_subscriber#(Axi4LiteMasterReadTransaction);
  `uvm_component_utils(Axi4LiteMasterReadCoverage)

  Axi4LiteMasterReadAgentConfig axi4LiteMasterReadAgentConfig;

  bit [ADDRESS_WIDTH-1:0] maxAddressRangeCov;
  bit [ADDRESS_WIDTH-1:0] minAddressRangeCov;

  covergroup axi4LiteMasterReadCovergroup with function sample (Axi4LiteMasterReadAgentConfig cfg, Axi4LiteMasterReadTransaction packet);
    option.per_instance = 1;

   DEFAULTRREADY_CP : coverpoint cfg.defaultStateRready {
   option.comment                                   = "defaultStateRready value";
   bins DEFAULT_RREADY_LOW                          = {0}; 
   bins DEFAULT_RREADY_HIGH                         = {1}; 
   }
   
   TOGGLE_RREADY_CP : coverpoint cfg.toggleRready  {
   option.comment                                   = "toggleRready value";
   bins TOGGLE_RREADY_LOW                           = {0};
   bins TOGGLE_RREADY_HIGH                          = {1};
   }

   ENABLE_OUTSTANDINGTX_CP : coverpoint cfg.enableOutstandingTransaction {
   option.comment                                   = "enableOutstandingTransaction value";
   bins DISABLE_OUTSTANDING_TX                      = {0};
   bins ENABLE_OUTSTANDING_TX                       = {1};
   }

   NUMBER_OF_OUTSTANDING_TX_CP : coverpoint cfg.noOfOutstandingTx {
   option.comment                                  = "cfg.noOfOutstandingTx value";
   bins NUMBER_OF_OUTSTANDING_TX                   = {[1:10]};
   }

    READADDR_CP : coverpoint packet.araddr {
    option.comment                                  = "readAddress value";
    bins READ_ADDRRANGE                             = {[minAddressRangeCov : maxAddressRangeCov]};
    bins READ_EVENADDR                              = {[minAddressRangeCov : maxAddressRangeCov]} with (item %2 == 0);
    bins READ_ODDADDR                               = {[minAddressRangeCov : maxAddressRangeCov]} with (item %2 == 1);
    bins READ_MODEOF4ADDR                           = {[minAddressRangeCov : maxAddressRangeCov]} with (item %4 == 0);
    bins READ_ADDROUTOFRANGE                        = {[maxAddressRangeCov+1:$]};
   }

    READDATA_CP : coverpoint packet.rdata {
    option.comment                                  = "readDATA value";
    bins READ_DATAMAX                               = {32'hFFFF_FFFF};
    bins READ_DATAZERO                              = {32'h0000_0000};
    bins READ_DATATOGGLE                            = {32'hAAAA_AAAA};
    bins READ_ANYDATA                               = {[1:$]};
  }

   RRESP_CP : coverpoint packet.rresp {
   option.comment                                  = "Read Response values";
   bins READ_OKAY                                  = {2'b00};
   illegal_bins READ_EXOKAY                        = {2'b01};
   bins READ_SLVERR                                = {2'b10};
   illegal_bins READ_DECERR                        = {2'b11};
  }

   ARPROT_CP : coverpoint packet.arprot {
   option.comment                                   = "Read Address Protection Values" ;
   bins DATA_SECURE_UNPRIVILEGED                    = {READ_DATA_SECURE_UNPRIVILEGED};  
	 bins DATA_SECURE_PRIVILEGED                      = {READ_DATA_SECURE_PRIVILEGED};  
	 bins DATA_NONSECURE_UNPRIVILEGED                 = {READ_DATA_NONSECURE_UNPRIVILEGED};  
	 bins DATA_NONSECURE_PRIVILEGED                   = {READ_DATA_NONSECURE_PRIVILEGED};  
	 illegal_bins INSTRUCTION_SECURE_UNPRIVILEGED     = {READ_INSTRUCTION_SECURE_UNPRIVILEGED};  
	 illegal_bins INSTRUCTION_SECURE_PRIVILEGED       = {READ_INSTRUCTION_SECURE_PRIVILEGED};  
	 illegal_bins INSTRUCTION_NONSECURE_UNPRIVILEGED  = {READ_INSTRUCTION_NONSECURE_UNPRIVILEGED};  
	 illegal_bins INSTRUCTION_NONSECURE_PRIVILEGED    = {READ_INSTRUCTION_NONSECURE_PRIVILEGED};  
  }

   ARPROT_CP_X_RRESP_CP      : cross ARPROT_CP, RRESP_CP{
   ignore_bins b1 = (( binsof(ARPROT_CP.DATA_SECURE_UNPRIVILEGED) || binsof(ARPROT_CP.DATA_SECURE_PRIVILEGED) ||
                       binsof(ARPROT_CP.DATA_NONSECURE_UNPRIVILEGED) || binsof(ARPROT_CP.DATA_NONSECURE_PRIVILEGED))
                       && binsof (RRESP_CP.READ_SLVERR));

  }
  READDATA_CP_X_RRESP_CP    : cross READDATA_CP, RRESP_CP{
  ignore_bins b1 = (( binsof(READDATA_CP.READ_DATAMAX) || binsof(READDATA_CP.READ_DATAZERO) || 
                       binsof(READDATA_CP.READ_DATATOGGLE) || binsof(READDATA_CP.READ_ANYDATA)) 
                       && binsof(RRESP_CP.READ_SLVERR));
  }
  
  ARADDR_CP_X_BRESP_CP      : cross READADDR_CP,RRESP_CP{
  ignore_bins b1 = binsof(READADDR_CP.READ_ADDROUTOFRANGE) && binsof (RRESP_CP.READ_OKAY);
  ignore_bins b2 = ((binsof(READADDR_CP.READ_ADDRRANGE) || binsof(READADDR_CP.READ_EVENADDR) || 
                        binsof(READADDR_CP.READ_ODDADDR) || binsof(READADDR_CP.READ_MODEOF4ADDR)) 
                        && binsof (RRESP_CP.READ_SLVERR));
  }
  endgroup: axi4LiteMasterReadCovergroup

  extern function new(string name = "Axi4LiteMasterReadCoverage", uvm_component parent = null);
  extern virtual function void write(Axi4LiteMasterReadTransaction t);
  extern virtual function void start_of_simulation_phase(uvm_phase phase);
  extern virtual function void report_phase(uvm_phase phase);

endclass : Axi4LiteMasterReadCoverage

function Axi4LiteMasterReadCoverage::new(string name = "Axi4LiteMasterReadCoverage",
                                 uvm_component parent = null);
  super.new(name, parent);
  axi4LiteMasterReadCovergroup =new();
endfunction : new

function void Axi4LiteMasterReadCoverage::write(Axi4LiteMasterReadTransaction t);
 `uvm_info(get_type_name(),$sformatf("Before calling SAMPLE METHOD"),UVM_HIGH);
  `uvm_info("SWAMY Tx print", $sformatf("\nAXI4LITE_MASTER_TX\n%s",
                 t.sprint()),UVM_LOW);
 axi4LiteMasterReadCovergroup.sample(axi4LiteMasterReadAgentConfig, t);

  `uvm_info(get_type_name(),"After calling SAMPLE METHOD",UVM_HIGH);
endfunction: write

 function void Axi4LiteMasterReadCoverage::start_of_simulation_phase(uvm_phase phase);
   uvm_config_db#(Axi4LiteMasterReadAgentConfig)::get(null, "*", "Axi4LiteMasterReadAgentConfig",axi4LiteMasterReadAgentConfig);
    `uvm_info(get_type_name(), $sformatf("\nAXI4LITE_MASTER_READ_AGENT_CONFIG\n%s",
                 axi4LiteMasterReadAgentConfig.sprint()),UVM_LOW);
   minAddressRangeCov = axi4LiteMasterReadAgentConfig.minAddressRange;
   maxAddressRangeCov = axi4LiteMasterReadAgentConfig.maxAddressRange;
 endfunction: start_of_simulation_phase

function void Axi4LiteMasterReadCoverage::report_phase(uvm_phase phase);
 `uvm_info(get_type_name(),$sformatf("AXI4LITE Master Read Agent Coverage = %0.2f %%", axi4LiteMasterReadCovergroup.get_coverage()), UVM_NONE);
endfunction: report_phase

`endif

