`ifndef AXI4LITEMASTERAGENTBFM_INCLUDED_
`define AXI4LITEMASTERAGENTBFM_INCLUDED_

`define AXI4LITE_MASTERWRITEINTERFACE axi4LiteMasterInterface.axi4LiteMasterWriteInterface  
`define AXI4LITE_MASTERREADINTERFACE axi4LiteMasterInterface.axi4LiteMasterReadInterface  

module Axi4LiteMasterAgentBFM #(parameter int ADDR_WIDTH = 32,
                                parameter int DATA_WIDTH = 32
                               )
                               (Axi4LiteMasterInterface axi4LiteMasterInterface);
   
  import uvm_pkg::*;
  `include "uvm_macros.svh"
 import Axi4LiteWriteMasterGlobalPkg::*;
 import Axi4LiteReadMasterGlobalPkg::*;

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITEMASTERS; i++) begin : Axi4LiteMasterWriteAgentBFM
      Axi4LiteMasterWriteAgentBFM #(.ADDR_WIDTH(Axi4LiteWriteMasterGlobalPkg::ADDRESS_WIDTH), .DATA_WIDTH(Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH)) 
                                   axi4LiteMasterWriteAgentBFM(`AXI4LITE_MASTERWRITEINTERFACE);
    end

    for (i=0; i<NO_OF_READMASTERS; i++) begin : Axi4LiteMasterReadAgentBFM
      Axi4LiteMasterReadAgentBFM #(.ADDR_WIDTH(Axi4LiteReadMasterGlobalPkg::ADDRESS_WIDTH), .DATA_WIDTH(Axi4LiteReadMasterGlobalPkg::DATA_WIDTH)) 
                                   axi4LiteMasterReadAgentBFM(`AXI4LITE_MASTERREADINTERFACE);
    end

  endgenerate

endmodule : Axi4LiteMasterAgentBFM
`endif
