`ifndef AXI4LITEMASTERREADDRIVERBFM_INCLUDED_
`define AXI4LITEMASTERREADDRIVERBFM_INCLUDED_

interface Axi4LiteMasterReadDriverBFM(input bit  aclk, 
                                       input bit  aresetn,
                                       //Read Address Channel Signals
                                       output reg                     arvalid,
                                       input    	                    arready,
                                       //Read Data Channel Signals
                                       output reg                      rvalid,
                                       input                           rready
                                      );  
  
  import uvm_pkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  `include "uvm_macros.svh" 

import Axi4LiteMasterReadPkg::Axi4LiteMasterReadDriverProxy; 

  string name = "Axi4LiteMasterReadDriverBFM"; 

  Axi4LiteMasterReadDriverProxy axi4LiteMasterReadDriverProxy;

  initial begin
    `uvm_info(name,$sformatf(name),UVM_LOW)
  end

  task waitForAresetn();

  endtask : waitForAresetn

  task readAddressChannelTask(input axi4LiteReadMasterTransferCfgStruct masterReadConfigStruct, 
                               inout axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct
                              );
    `uvm_info(name,$sformatf("READ_ADDRESS_CHANNEL_TASK_STARTED"),UVM_HIGH)
    `uvm_info(name,$sformatf("READ_ADDRESS_CHANNEL_TASK_ENDED"),UVM_HIGH)
  endtask : readAddressChannelTask

  task readDataChannelTask(input axi4LiteReadMasterTransferCfgStruct masterReadConfigStruct, 
                            inout axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct
                           );
    `uvm_info(name,$sformatf("READ_DATA_CHANNEL_TASK_STARTED"),UVM_HIGH)
    `uvm_info(name,$sformatf("READ_DATA_CHANNEL_TASK_ENDED"),UVM_HIGH)
  endtask : readDataChannelTask

  task readResponseChannelTask(input axi4LiteReadMasterTransferCfgStruct masterReadConfigStruct, 
                                inout axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct
                               );
    `uvm_info(name,$sformatf("READ_RESPONSE_CHANNEL_TASK_STARTED"),UVM_HIGH)
    `uvm_info(name,$sformatf("READ_RESPONSE_CHANNEL_TASK_ENDED"),UVM_HIGH)
  endtask : readResponseChannelTask

endinterface : Axi4LiteMasterReadDriverBFM

`endif

