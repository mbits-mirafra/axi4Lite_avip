`ifndef AXI4LITESLAVEWRITEDRIVERBFM_INCLUDED_
`define AXI4LITESLAVEWRITEDRIVERBFM_INCLUDED_

import Axi4LiteWriteSlaveGlobalPkg::*;

interface Axi4LiteSlaveWriteDriverBFM(input      aclk, 
                                      input      aresetn,
                                      //WriteAddressChannel
                                      input                     awvalid ,
                                      output reg                awready ,
                                      input [ADDRESS_WIDTH-1:0] awaddr,
                                      input               [2:0] awprot,

                                      //WriteDataChannel
                                      input                      wvalid ,
                                      output reg	               wready ,
                                      input     [DATA_WIDTH-1:0] wdata,
                                      input [(DATA_WIDTH/8)-1:0] wstrb,
      
                                      //Write Response Channel
                                      output reg                 bvalid ,
                                      input		                   bready,
                                      output reg           [1:0] bresp
                                    ); 
   import uvm_pkg::*;
  `include "uvm_macros.svh" 

  import Axi4LiteSlaveWritePkg::Axi4LiteSlaveWriteDriverProxy;

  string name = "Axi4LiteSlaveWriteDriverBFM"; 
  
  Axi4LiteSlaveWriteDriverProxy axi4LiteSlaveWriteDriverProxy;

  initial begin
    `uvm_info("axi4 slave driver bfm",$sformatf("AXI4 SLAVE DRIVER BFM"),UVM_LOW);
  end

  task waitForAresetn();
    @(negedge aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET ACTIVATED"),UVM_HIGH)
      bvalid <= 1'b0;
     @(posedge aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET DE-ACTIVATED"),UVM_HIGH)
  endtask : waitForAresetn 

task writeAddressChannelTask(input axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct, 
                             inout axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct
                             );
  `uvm_info(name,$sformatf("WRITE_ADDRESS_CHANNEL_TASK_STARTED"),UVM_HIGH)
  `uvm_info(name,$sformatf("WRITE_ADDRESS_CHANNEL_TASK_ENDED"),UVM_HIGH)
endtask :writeAddressChannelTask


task writeDataChannelTask(input axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct, 
                          inout axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct
                         );
  
  `uvm_info(name,$sformatf("WRITE_DATA_CHANNEL_TASK_STARTED"),UVM_HIGH)
   `uvm_info(name,$sformatf("WRITE_DATA_CHANNEL_TASK_ENDED"),UVM_HIGH)
endtask :writeDataChannelTask


task writeResponseChannelTask(input axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct, 
                              inout axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct
                             );
  `uvm_info(name,$sformatf("WRITE_RESPONSE_CHANNEL_TASK_STARTED"),UVM_HIGH)
   `uvm_info(name,$sformatf("WRITE_RESPONSE_CHANNEL_TASK_ENDED"),UVM_HIGH)
endtask : writeResponseChannelTask


endinterface : Axi4LiteSlaveWriteDriverBFM

`endif

