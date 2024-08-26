`ifndef AXI4LITESLAVEREADCOVERAGE_INCLUDED_
`define AXI4LITESLAVEREADCOVERAGE_INCLUDED_

class Axi4LiteSlaveReadCoverage extends uvm_subscriber#(Axi4LiteSlaveReadTransaction);
  `uvm_component_utils(Axi4LiteSlaveReadCoverage)

   Axi4LiteSlaveReadAgentConfig axi4LiteSlaveReadAgentConfig;
  covergroup axi4LiteSlaveReadCovergroup with function sample (Axi4LiteSlaveReadAgentConfig cfg, Axi4LiteSlaveReadTransaction packet);
    option.per_instance = 1; 

    READADDR_CP : coverpoint packet.araddr {
    option.comment                                  = "readAddress value";
    bins READ_ADDRRANGE                             = {[MIN_ADDRESS:MAX_ADDRESS]};
    bins READ_EVENADDR                              = {[MIN_ADDRESS:MAX_ADDRESS]} with (item %2 == 0);
    bins READ_ODDADDR                               = {[MIN_ADDRESS:MAX_ADDRESS]} with (item %2 == 1);
    bins READ_MODEOF4ADDR                           = {[MIN_ADDRESS:MAX_ADDRESS]} with (item %4 == 0);
    bins READ_ADDROUTOFRANGE                        = {[MAX_ADDRESS+1:$]};
   }

    READDATA_CP : coverpoint packet.rdata {
    option.comment                                  = "readDATA value";
    bins READ_DATAMAX                               = {32'hFFFF_FFFF};
    bins READ_DATAZERO                             = {32'h0000_0000};
    bins READ_DATATOGGLE                           = {32'hAAAA_AAAA};
    bins READ_ANYDATA                               = {[1:$]};
   }

    RRESP_CP : coverpoint packet.rresp {
    option.comment                                  = "Read Response values";
    bins READ_OKAY                                  = {0};
    illegal_bins READ_EXOKAY                        = {1};
    bins READ_SLVERR                                = {2};
    illegal_bins READ_DECERR                        = {3};
   }

    ARPROT_CP : coverpoint packet.arprot {
    option.comment                                   = "Read Address Protection Values" ;
    bins DATA_SECURE_UNPRIVILEGED                    = {3'b000};  
	  bins DATA_SECURE_PRIVILEGED                      = {3'b001};  
	  bins DATA_NONSECURE_UNPRIVILEGED                 = {3'b010};  
	  bins DATA_NONSECURE_PRIVILEGED                   = {3'b011};  
	  illegal_bins INSTRUCTION_SECURE_UNPRIVILEGED     = {3'b100};  
	  illegal_bins INSTRUCTION_SECURE_PRIVILEGED       = {3'b101};  
	  illegal_bins INSTRUCTION_NONSECURE_UNPRIVILEGED  = {3'b110};  
	  illegal_bins INSTRUCTION_NONSECURE_PRIVILEGED    = {3'b111};  
  }
   
  ARPROT_CP_X_RRESP_CP      : cross ARPROT_CP, RRESP_CP{
  ignore_bins b1 = (( binsof(ARPROT_CP.DATA_SECURE_UNPRIVILEGED) || binsof(ARPROT_CP.DATA_SECURE_PRIVILEGED) ||
                       binsof(ARPROT_CP.DATA_NONSECURE_UNPRIVILEGED) || binsof(ARPROT_CP.DATA_NONSECURE_PRIVILEGED))
                       && binsof (RRESP_CP.READ_SLVERR));

  }
  
  READDATA_CP_X_RRESP_CP    : cross READDATA_CP, RRESP_CP{
  ignore_bins b1 = (( binsof(READDATA_CP.READ_DATAMAX) || binsof(READDATA_CP.READ_DATAZERO) || 
                       binsof(READDATA_CP.READ_DATATOGGLE)) && binsof(RRESP_CP.READ_SLVERR));
  }
  
  ARADDR_CP_X_BRESP_CP      : cross READADDR_CP,RRESP_CP{
  ignore_bins b1 = binsof(READADDR_CP.READ_ADDROUTOFRANGE) && binsof (RRESP_CP.READ_OKAY);
  ignore_bins b2 = ((binsof(READADDR_CP.READ_ADDRRANGE) || binsof(READADDR_CP.READ_EVENADDR) || 
                        binsof(READADDR_CP.READ_ODDADDR) || binsof(READADDR_CP.READ_MODEOF4ADDR)) 
                        && binsof (RRESP_CP.READ_SLVERR));
  }

  endgroup: axi4LiteSlaveReadCovergroup

  extern function new(string name = "Axi4LiteSlaveReadCoverage", uvm_component parent = null);
  extern virtual function void write(Axi4LiteSlaveReadTransaction t);
  extern virtual function void report_phase(uvm_phase phase);
endclass : Axi4LiteSlaveReadCoverage


function Axi4LiteSlaveReadCoverage::new(string name = "Axi4LiteSlaveReadCoverage",uvm_component parent = null);
  super.new(name, parent);
  axi4LiteSlaveReadCovergroup =new();
endfunction : new


function void Axi4LiteSlaveReadCoverage::write(Axi4LiteSlaveReadTransaction t);
 `uvm_info(get_type_name(),$sformatf("Before calling SAMPLE METHOD"),UVM_HIGH);

  axi4LiteSlaveReadCovergroup.sample(axi4LiteSlaveReadAgentConfig, t);

  `uvm_info(get_type_name(),"After calling SAMPLE METHOD",UVM_HIGH);

endfunction: write

function void Axi4LiteSlaveReadCoverage::report_phase(uvm_phase phase);
  `uvm_info(get_type_name(),$sformatf("AXI4 Slave Agent Coverage = %0.2f %%", axi4LiteSlaveReadCovergroup.get_coverage()), UVM_NONE);
endfunction: report_phase

`endif

