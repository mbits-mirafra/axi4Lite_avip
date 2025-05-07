`ifndef MASTERRTLINTERFACE_INCLUDED_
`define MASTERRTLINTERFACE_INCLUDED_

import MasterRTLGlobalPkg::*;

interface MasterRTLInterface(input aclk, input aresetn);

  logic writeEnable;
  logic readEnable;
  logic  [ADDRESS_WIDTH-1:0] awaddr;
  logic                [2:0] awprot;
  logic     [DATA_WIDTH-1:0] wdata;
  logic [(DATA_WIDTH/8)-1:0] wstrb;

  logic  [ADDRESS_WIDTH-1:0] araddr;
  logic                [2:0] arprot;

endinterface: MasterRTLInterface 

`endif
