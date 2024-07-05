`ifndef AXI4LITEMASTERREADDRIVERBFM_INCLUDED_
`define AXI4LITEMASTERREADDRIVERBFM_INCLUDED_

 import Axi4LiteReadMasterGlobalPkg::*;

interface Axi4LiteMasterReadDriverBFM(input bit  aclk, 
                                       input bit  aresetn,
                                       //Read Address Channel Signals
                                       output reg                     arvalid,
                                       input    	                    arready,
                                       output reg [ADDRESS_WIDTH-1:0] araddr,
                                       output reg               [2:0] arprot,
                                       //Read Data Channel Signals
                                       input                          rvalid,
                                       output reg                     rready,
                                       input         [DATA_WIDTH-1:0] rdata,
                                       input                    [1:0] rresp
                                      );  
  
  import uvm_pkg::*;
  import Axi4LiteMasterReadAssertCoverParameter::*; 
  `include "uvm_macros.svh" 

import Axi4LiteMasterReadPkg::Axi4LiteMasterReadDriverProxy; 

  string name = "Axi4LiteMasterReadDriverBFM"; 

  Axi4LiteMasterReadDriverProxy axi4LiteMasterReadDriverProxy;

  initial begin
    `uvm_info(name,$sformatf(name),UVM_LOW)
  end

  task waitForAresetn();
    @(negedge aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET DETECTED"),UVM_HIGH)
    arvalid <= 1'b0;
    rready  <= DEFAULT_READY;
    @(posedge aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
  endtask : waitForAresetn

  task readAddressChannelTask(input axi4LiteReadMasterTransferCfgStruct masterReadConfigStruct, 
                               inout axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct
                              );
    `uvm_info(name,$sformatf("READ_ADDRESS_CHANNEL_TASK_STARTED"),UVM_HIGH)
    @(posedge aclk);
    arvalid <= 1'b1;
    araddr  <= masterReadPacketStruct.araddr;
    arprot  <= masterReadPacketStruct.arprot;

    do begin
      @(posedge aclk);
      masterReadPacketStruct.waitCounterForArready++;
      if(masterReadPacketStruct.waitCounterForArready > masterReadConfigStruct.maxDelayForArready) begin
       `uvm_error (name, $sformatf ("arready count comparisions are failed"));
    end
  end
    while(arready !== 1);

    @(posedge aclk);
    arvalid <= 1'b0;
    
    `uvm_info(name,$sformatf("READ_ADDRESS_CHANNEL_TASK_ENDED"),UVM_HIGH)
  endtask : readAddressChannelTask

  task readDataChannelTask(input axi4LiteReadMasterTransferCfgStruct masterReadConfigStruct, 
                            inout axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct
                           );
    `uvm_info(name,$sformatf("READ_DATA_CHANNEL_TASK_STARTED"),UVM_HIGH)

    do begin
      @(posedge aclk);
      `uvm_info("FROM MASTER READ DRIVER BFM",$sformatf("Inside read data channel waiting for arvalid and arready"),UVM_HIGH)
    end
    while(arvalid!==1 || arready!==1);
    `uvm_info("FROM MASTER READ DRIVER BFM",$sformatf("After read data channel asserted arvalid and arready"),UVM_HIGH)

    do begin
      @(posedge aclk);
      masterReadPacketStruct.waitCounterForRvalid++;
      if(masterReadPacketStruct.waitCounterForRvalid > masterReadConfigStruct.maxDelayForRvalid) begin
       `uvm_error (name, $sformatf ("rvalid count comparisions are failed"));
    end
  end
    while(arready === 0);
    
    `uvm_info(name , $sformatf("After while loop rvalid asserted "),UVM_HIGH)

    repeat(masterReadPacketStruct.delayForRready) begin 
      @(posedge aclk);
    end
    rready <= 1'b1;
    masterReadPacketStruct.rdata <= rdata;
    masterReadPacketStruct.rresp <= rresp;

    @(posedge aclk);
    rready <= DEFAULT_READY;

    `uvm_info(name,$sformatf("READ_DATA_CHANNEL_TASK_ENDED"),UVM_HIGH)
  endtask : readDataChannelTask

endinterface : Axi4LiteMasterReadDriverBFM

`endif

