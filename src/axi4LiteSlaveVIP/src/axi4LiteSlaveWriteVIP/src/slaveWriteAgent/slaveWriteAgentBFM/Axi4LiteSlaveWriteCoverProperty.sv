`ifndef AXI4LITESLAVEWRITECOVERPROPERTY_INCLUDED_
`define AXI4LITESLAVEWRITECOVERPROPERTY_INCLUDED_
  import uvm_pkg::*;
  import Axi4LiteWriteSlaveGlobalPkg::*;
  import Axi4LiteSlaveWriteAssertCoverParameter::*;
  `include "uvm_macros.svh";


interface Axi4LiteSlaveWriteCoverProperty (input  aclk,
                                            input  aresetn,
                                            //Write Address Channel Signals
                                            input  awvalid,
                                            input  [ADDRESS_WIDTH-1:0] awaddr,
                                            input  awready,
                                            input  [2:0] awprot,
                                            //Write Data Channel Signals
                                            input  wvalid,
                                            input  [DATA_WIDTH-1:0] wdata,
                                            input  [(DATA_WIDTH/8)-1:0] wstrb,
                                            input  wready,
                                            //Write Response Channel
                                            input  bvalid,
                                            input  bready,
                                            input  [1:0] bresp
                                           );  

  initial begin
    
    `uvm_info("Axi4LiteSlaveWriteCoverProperty","Axi4LiteSlaveWriteCoverProperty",UVM_LOW);
  end
  

 endinterface : Axi4LiteSlaveWriteCoverProperty

`endif

