`ifndef AXI4LITEMASTERWRITEINTERFACE_INCLUDED_
`define AXI4LITEMASTERWRITEINTERFACE_INCLUDED_

import Axi4LiteWriteMasterGlobalPkg::*;
interface Axi4LiteMasterWriteInterface(input aclk, input aresetn);

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

endinterface: Axi4LiteMasterWriteInterface 

`endif
