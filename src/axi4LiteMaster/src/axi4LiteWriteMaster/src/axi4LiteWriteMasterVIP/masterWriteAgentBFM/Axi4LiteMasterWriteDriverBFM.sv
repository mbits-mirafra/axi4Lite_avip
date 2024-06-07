`ifndef AXI4LITEMASTERWRITEDRIVERBFM_INCLUDED_
`define AXI4LITEMASTERWRITEDRIVERBFM_INCLUDED_

interface Axi4LiteMasterWriteDriverBFM(input bit  aclk, 
                                       input bit  aresetn,
                                       //Write Address Channel Signals
                                       output reg                     awvalid,
                                       input    	                    awready,
                                       //Write Data Channel Signals
                                       output reg                      wvalid,
                                       input                           wready,
                                       //Write Response Channel Signals
                                       input            bvalid,
                                       output	reg       bready
                                      );  
  
  import uvm_pkg::*;
  import axi4LiteWriteMasterGlobalPkg::*;
  `include "uvm_macros.svh" 

import Axi4LiteMasterWritePkg::Axi4LiteMasterWriteDriverProxy; 

  string name = "Axi4LiteMasterWriteDriverBFM"; 

  Axi4LiteMasterWriteDriverProxy axi4LiteMasterWriteDriverProxy;

  initial begin
    `uvm_info(name,$sformatf(name),UVM_LOW)
  end

  task waitForAresetn();

  endtask : waitForAresetn

  task writeAddressChannelTask(input axi4LiteWriteTransferConfigStruct masterWriteConfigStruct, 
                               inout axi4LiteWriteTransferPacketStruct masterWritePacketStruct
                              );
    `uvm_info(name,$sformatf("WRITE_ADDRESS_CHANNEL_TASK_STARTED"),UVM_HIGH)
    `uvm_info(name,$sformatf("WRITE_ADDRESS_CHANNEL_TASK_ENDED"),UVM_HIGH)
  endtask : writeAddressChannelTask

  task writeDataChannelTask(input axi4LiteWriteTransferConfigStruct masterWriteConfigStruct, 
                            inout axi4LiteWriteTransferPacketStruct masterWritePacketStruct
                           );
    `uvm_info(name,$sformatf("WRITE_DATA_CHANNEL_TASK_STARTED"),UVM_HIGH)
    `uvm_info(name,$sformatf("WRITE_DATA_CHANNEL_TASK_ENDED"),UVM_HIGH)
  endtask : writeDataChannelTask

  task writeResponseChannelTask(input axi4LiteWriteTransferConfigStruct masterWriteConfigStruct, 
                                inout axi4LiteWriteTransferPacketStruct masterWritePacketStruct
                               );
    `uvm_info(name,$sformatf("WRITE_RESPONSE_CHANNEL_TASK_STARTED"),UVM_HIGH)
    `uvm_info(name,$sformatf("WRITE_RESPONSE_CHANNEL_TASK_ENDED"),UVM_HIGH)
  endtask : writeResponseChannelTask

endinterface : Axi4LiteMasterWriteDriverBFM

`endif

