`ifndef AXI4LITESLAVEWRITEINTERFACE_INCLUDED_
`define AXI4LITESLAVEWRITEINTERFACE_INCLUDED_

import Axi4LiteWriteSlaveGlobalPkg::*;

interface Axi4LiteSlaveWriteInterface(input aclk, input aresetn);

  logic                      awvalid;
  logic                      awready;
  logic  [ADDRESS_WIDTH-1:0] awaddr;
  logic                [2:0] awprot;
  logic                      wvalid;
  logic                      wready;
  logic     [DATA_WIDTH-1:0] wdata;
  logic [(DATA_WIDTH/8)-1:0] wstrb;
  logic                      bvalid;
  logic                      bready;
  logic                [1:0] bresp;

endinterface: Axi4LiteSlaveWriteInterface 

`endif
