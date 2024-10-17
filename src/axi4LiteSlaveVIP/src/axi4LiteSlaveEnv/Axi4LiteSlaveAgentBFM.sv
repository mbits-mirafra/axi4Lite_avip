`ifndef AXI4LITESLAVEAGENTBFM_INCLUDED_
`define AXI4LITESLAVEAGENTBFM_INCLUDED_

`define AXI4LITE_SLAVEWRITEINTERFACE axi4LiteSlaveInterface.axi4LiteSlaveWriteInterface  
`define AXI4LITE_SLAVEREADINTERFACE axi4LiteSlaveInterface.axi4LiteSlaveReadInterface  

module Axi4LiteSlaveAgentBFM #(parameter int ADDR_WIDTH = 32,
                                parameter int DATA_WIDTH = 32
                               )
                               (Axi4LiteSlaveInterface axi4LiteSlaveInterface);
   
  import uvm_pkg::*;
  `include "uvm_macros.svh"
 import Axi4LiteWriteSlaveGlobalPkg::*;
 import Axi4LiteReadSlaveGlobalPkg::*;

  genvar i;
  generate
    for (i=0; i<NO_OF_WRITESLAVES; i++) begin : Axi4LiteSlaveWriteAgentBFM
      Axi4LiteSlaveWriteAgentBFM #(.ADDR_WIDTH(Axi4LiteWriteSlaveGlobalPkg::ADDRESS_WIDTH), .DATA_WIDTH(Axi4LiteWriteSlaveGlobalPkg::DATA_WIDTH)) 
                                   axi4LiteSlaveWriteAgentBFM(`AXI4LITE_SLAVEWRITEINTERFACE);
    end

    for (i=0; i<NO_OF_READSLAVES; i++) begin : Axi4LiteSlaveReadAgentBFM
      Axi4LiteSlaveReadAgentBFM #(.ADDR_WIDTH(Axi4LiteReadSlaveGlobalPkg::ADDRESS_WIDTH), .DATA_WIDTH(Axi4LiteReadSlaveGlobalPkg::DATA_WIDTH)) 
                                   axi4LiteSlaveReadAgentBFM(`AXI4LITE_SLAVEREADINTERFACE);
    end

  endgenerate

endmodule : Axi4LiteSlaveAgentBFM
`endif
