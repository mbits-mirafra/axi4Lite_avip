`ifndef AXI4LITESLAVEREADINTERFACE_INCLUDED_
`define AXI4LITESLAVEREADINTERFACE_INCLUDED_

import Axi4LiteReadSlaveGlobalPkg::*;

interface Axi4LiteSlaveReadInterface(input aclk, input aresetn);

  logic                     arvalid;
  logic	                    arready;
  logic [ADDRESS_WIDTH-1:0] araddr;
  logic               [2:0] arprot;
  logic                     rvalid;
  logic                   	rready;
  logic    [DATA_WIDTH-1:0] rdata;
  logic               [1:0] rresp;

endinterface: Axi4LiteSlaveReadInterface 

`endif
