`ifndef AXI4LITEMASTERWRITEINTERFACE_INCLUDED_
`define AXI4LITEMASTERWRITEINTERFACE_INCLUDED_

interface Axi4LiteMasterWriteInterface(input aclk, input aresetn);

  logic  awvalid;
  logic	 awready;
  logic  wvalid;
  logic	 wready;
  logic  bvalid;
  logic	 bready;

endinterface: Axi4LiteMasterWriteInterface 

`endif
