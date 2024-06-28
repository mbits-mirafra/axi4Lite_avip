`ifndef AXI4LITEMASTERREADINTERFACE_INCLUDED_
`define AXI4LITEMASTERREADINTERFACE_INCLUDED_

import Axi4LiteReadMasterGlobalPkg::*;
interface Axi4LiteMasterReadInterface(input aclk, input aresetn);

  logic                     arvalid;
  logic	                    arready;
  logic [ADDRESS_WIDTH-1:0] araddr;
  logic               [2:0] arprot;
  logic                     rvalid;
  logic                   	rready;
  logic    [DATA_WIDTH-1:0] rdata;
  logic               [1:0] rresp;
 
endinterface: Axi4LiteMasterReadInterface 

`endif
