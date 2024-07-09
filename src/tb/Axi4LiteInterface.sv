`ifndef AXI4LITEINTERFACE_INCLUDED_
`define AXI4LITEINTERFACE_INCLUDED_

import Axi4LiteWriteMasterGlobalPkg::*;

interface Axi4LiteInterface(input aclk, input aresetn);

  //Write_address_channel
  logic awvalid;
  logic	awready;
  logic  [ADDRESS_WIDTH-1:0] awaddr;
  logic                [2:0] awprot;

  //Write_data_channel
  logic wvalid;
 	logic wready;
  logic     [DATA_WIDTH-1:0] wdata;
  logic [(DATA_WIDTH/8)-1:0] wstrb;

  //Write Response Channel
  logic bvalid;
  logic bready;
  logic [1:0] bresp;
 
  //Read Address Channel
  logic arvalid;
 	logic	arready;
  logic [ADDRESS_WIDTH-1:0] araddr;
  logic               [2:0] arprot;

  //Read Data Channel
  logic rvalid;
  logic rready;
  logic [DATA_WIDTH-1:0] rdata;
  logic            [1:0] rresp;

endinterface: Axi4LiteInterface 

`endif
