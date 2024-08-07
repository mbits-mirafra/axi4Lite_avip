`ifndef AXI4LITEMASTERWRITECOVERAGE_INCLUDED_
`define AXI4LITEMASTERWRITECOVERAGE_INCLUDED_

class Axi4LiteMasterWriteCoverage extends uvm_subscriber#(Axi4LiteMasterWriteTransaction);
  `uvm_component_utils(Axi4LiteMasterWriteCoverage)

  Axi4LiteMasterWriteAgentConfig axi4LiteMasterWriteAgentConfig;

  covergroup axi4LiteMasterWriteCovergroup with function sample (Axi4LiteMasterWriteAgentConfig cfg, Axi4LiteMasterWriteTransaction packet);
    option.per_instance = 1;

   WRITEADDR_CP : coverpoint packet.awaddr {
   option.comment                                   = "writeAddress value";
   bins WRITE_ADDRRANGE                             = {[MIN_ADDRESS:MAX_ADDRESS]}; 
   bins WRITE_EVENADDR                              = {[MIN_ADDRESS:MAX_ADDRESS]} with (item %2 == 0);
   bins WRITE_ODDADDR                               = {[MIN_ADDRESS:MAX_ADDRESS]} with (item %2 == 1);
   bins WRITE_MODEOF4ADDR                           = {[MIN_ADDRESS:MAX_ADDRESS]} with (item %4 == 0);
   bins WRITE_ADDROUTOFRANGE                        = {[MAX_ADDRESS+1:$]};
   }

   WRITEDATA_CP : coverpoint packet.wdata {
   option.comment                                   = "writeDATA value";
   bins WRITE_DATAMAX                               = {32'hFFFF_FFFF};
   bins WRITE_DATAZERO                              = {32'h0000_0000};
   bins WRITE_DATATOGGLE1                           = {32'hAAAA_AAAA};
   bins WRITE_ANYDATA                               = {[1:$]};
   }

   WSTRB_CP : coverpoint packet.wstrb{
   option.comment                                   = "writeStrobe value";
   bins SINGLE_BIT                                  = {4'b0001, 4'b0010, 4'b0100, 4'b1000};
   bins TWO_BITS                                    = {4'b0011, 4'b0110, 4'b1100, 4'b1001, 4'b0101, 4'b1010};
   bins THREE_BITS                                  = {4'b0111, 4'b1110, 4'b1101, 4'b1011};
   bins ALL_ZEROS                                   = {4'b0000};
   bins ALL_ONES                                    = {4'b1111};
  }

   BRESP_CP : coverpoint packet.bresp {
   option.comment                                   = "Write Response values";
   bins WRITE_OKAY                                  = {0};
   illegal_bins WRITE_EXOKAY                        = {1};
   bins WRITE_SLVERR                                = {2};
   illegal_bins WRITE_DECERR                        = {3};
  }

   AWPROT_CP : coverpoint packet.awprot {
   option.comment                                   = "Write Address Protection Values" ;
   bins DATA_NONSECURE_UNPRIVILEGED                 = {3'b000};  
	 bins DATA_NONSECURE_PRIVILEGED                   = {3'b001};  
	 bins DATA_SECUREUN_PRIVILEGED                    = {3'b010};  
	 bins DATA_SECURE_PRIVILEGED                      = {3'b011};  
	 illegal_bins INSTRUCTION_NONSECURE_UNPRIVILEGED  = {3'b100};  
	 illegal_bins INSTRUCTION_NONSECURE_PRIVILEGED    = {3'b101};  
	 illegal_bins INSTRUCTION_SECURE_UNPRIVILEGED     = {3'b110};  
	 illegal_bins INSTRUCTION_SECURE_PRIVILEGED       = {3'b111};  
	}

   AWPROT_CP_X_BRESP_CP    : cross AWPROT_CP, BRESP_CP;
   WRITEDATA_CP_X_WSTRB_CP : cross WRITEDATA_CP, WSTRB_CP {
     bins b1 = binsof(WRITEDATA_CP.WRITE_DATAMAX) && binsof(WSTRB_CP.ALL_ONES);
     bins b2 = binsof(WRITEDATA_CP.WRITE_DATAZERO) && binsof(WSTRB_CP.ALL_ZEROS);
     bins b3 = binsof(WRITEDATA_CP.WRITE_DATATOGGLE1) && binsof(WSTRB_CP.ALL_ONES);
     bins b4 = binsof(WRITEDATA_CP.WRITE_ANYDATA) || binsof(WSTRB_CP.ALL_ONES)
               || binsof(WSTRB_CP.SINGLE_BIT) || binsof(WSTRB_CP.TWO_BITS) || 
               binsof(WSTRB_CP.THREE_BITS);
  }
   WRITEADDR_CP_X_BRESP_CP : cross WRITEADDR_CP,BRESP_CP {
     bins b1 = binsof(WRITEADDR_CP.WRITE_ADDROUTOFRANGE) && binsof (BRESP_CP.WRITE_SLVERR);// binsof(BRESP_CP.WRITE_SLVERR);
     bins b2 = binsof(WRITEADDR_CP.WRITE_ADDRRANGE) && binsof(BRESP_CP.WRITE_OKAY);
  }

   endgroup: axi4LiteMasterWriteCovergroup

   extern function new(string name = "Axi4LiteMasterWriteCoverage", uvm_component parent = null);
   extern virtual function void write(Axi4LiteMasterWriteTransaction t);
   extern virtual function void report_phase(uvm_phase phase);

 endclass : Axi4LiteMasterWriteCoverage

  function Axi4LiteMasterWriteCoverage::new(string name = "Axi4LiteMasterWriteCoverage",
   uvm_component parent = null);
   super.new(name, parent);
   axi4LiteMasterWriteCovergroup = new();
  `uvm_info("",$sformatf("Inside MIN_ADDRESS :%0d MAX_ADDRESS :%0d", MIN_ADDRESS,MAX_ADDRESS),UVM_LOW);
 endfunction : new


 function void Axi4LiteMasterWriteCoverage::write(Axi4LiteMasterWriteTransaction t);
   `uvm_info(get_type_name(),$sformatf("Before calling SAMPLE METHOD"),UVM_HIGH);

   axi4LiteMasterWriteCovergroup.sample(axi4LiteMasterWriteAgentConfig,t);

   `uvm_info(get_type_name(),"After calling SAMPLE METHOD",UVM_HIGH);
 endfunction: write

 function void Axi4LiteMasterWriteCoverage::report_phase(uvm_phase phase);
   `uvm_info(get_type_name(),$sformatf("AXI4LITE Master Write Agent Coverage = %0.2f %%", axi4LiteMasterWriteCovergroup.get_coverage()), UVM_NONE);
 endfunction: report_phase

`endif

