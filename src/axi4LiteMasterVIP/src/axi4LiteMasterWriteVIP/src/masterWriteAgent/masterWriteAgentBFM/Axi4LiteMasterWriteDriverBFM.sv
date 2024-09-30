`ifndef AXI4LITEMASTERWRITEDRIVERBFM_INCLUDED_
`define AXI4LITEMASTERWRITEDRIVERBFM_INCLUDED_

 import Axi4LiteWriteMasterGlobalPkg::*;

interface Axi4LiteMasterWriteDriverBFM(input bit  aclk, 
                                       input bit  aresetn,
                                       //Write Address Channel Signals
                                       output reg                      awvalid,
                                       input    	                     awready,
                                       output reg  [ADDRESS_WIDTH-1:0] awaddr,
                                       output reg                [2:0] awprot,
                                       //Write Data Channel Signals
                                       output reg                      wvalid,
                                       input                           wready,
                                       output reg     [DATA_WIDTH-1:0] wdata,
                                       output reg [(DATA_WIDTH/8)-1:0] wstrb,
                                       //Write Response Channel Signals
                                       input                           bvalid,
                                       output	reg                      bready,
                                       input                     [1:0] bresp
                                      );  
  
  import uvm_pkg::*;
  import Axi4LiteMasterWriteAssertCoverParameter::*; 
  `include "uvm_macros.svh" 

import Axi4LiteMasterWritePkg::Axi4LiteMasterWriteDriverProxy; 

  string name = "Axi4LiteMasterWriteDriverBFM"; 

  Axi4LiteMasterWriteDriverProxy axi4LiteMasterWriteDriverProxy;

  initial begin
    `uvm_info(name,$sformatf(name),UVM_LOW)
  end

  task waitForAresetn(input axi4LiteWriteMasterTransferCfgStruct masterWriteConfigStruct);
    @(negedge aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET DETECTED"),UVM_HIGH)
    awvalid <= 1'b0;
    wvalid  <= 1'b0;
    bready  <= masterWriteConfigStruct.defaultStateBready;
    @(posedge aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
  endtask : waitForAresetn

  task writeAddressChannelTask(input axi4LiteWriteMasterTransferCfgStruct masterWriteConfigStruct, 
                               inout axi4LiteWriteMasterTransferPacketStruct masterWritePacketStruct
                              );
    `uvm_info(name,$sformatf("MASTER_WRITE_ADDRESS_CHANNEL_TASK_STARTED"),UVM_HIGH)
    repeat(masterWritePacketStruct.delayForAwvalid) begin 
      @(posedge aclk);
    end
    awvalid <= 1'b1;
    awaddr  <= masterWritePacketStruct.awaddr;
    awprot  <= masterWritePacketStruct.awprot;

    do begin
      @(posedge aclk);
      if(masterWritePacketStruct.waitCounterForAwready > (masterWriteConfigStruct.maxDelayForAwready+1)) begin
        `uvm_error (name, $sformatf ("MASTER_WRITE_ADDRESS_CHANNEL: awvalidAwready Handshaking comparitions count are failed"));
        break;
      end
      masterWritePacketStruct.waitCounterForAwready++;
    end while(awready !== 1'b1);

    awvalid <= 1'b0;

    `uvm_info(name,$sformatf("MASTER_WRITE_ADDRESS_CHANNEL_TASK_ENDED"),UVM_HIGH)
  endtask : writeAddressChannelTask

  task writeDataChannelTask(input axi4LiteWriteMasterTransferCfgStruct masterWriteConfigStruct, 
                            inout axi4LiteWriteMasterTransferPacketStruct masterWritePacketStruct
                           );
    `uvm_info(name,$sformatf("WRITE_DATA_CHANNEL_TASK_STARTED"),UVM_HIGH)
    repeat(masterWritePacketStruct.delayForWvalid) begin 
      @(posedge aclk);
    end
    wvalid <= 1'b1;
    wdata  <= masterWritePacketStruct.wdata;
    wstrb  <= masterWritePacketStruct.wstrb;
  
    do begin 
     @(posedge aclk);
      if(masterWritePacketStruct.waitCounterForWready > (masterWriteConfigStruct.maxDelayForWready+1)) begin
        `uvm_error (name, $sformatf ("MASTER_WRITE_DATA_CHANNEL: wvalidWready Handshaking comparitions count are failed"));
        break;
      end
      masterWritePacketStruct.waitCounterForWready++;
    end while(wready !== 1'b1);

    wvalid <= 1'b0;

    `uvm_info(name,$sformatf("WRITE_DATA_CHANNEL_TASK_ENDED"),UVM_HIGH)
  endtask : writeDataChannelTask

  task writeResponseChannelTask(input axi4LiteWriteMasterTransferCfgStruct masterWriteConfigStruct, 
                                inout axi4LiteWriteMasterTransferPacketStruct masterWritePacketStruct
                               );
    `uvm_info(name,$sformatf("WRITE_RESPONSE_CHANNEL_TASK_STARTED"),UVM_HIGH)
//TODO Fix me the below code 
  if(masterWriteConfigStruct.toggleBready) begin
    repeat(masterWritePacketStruct.repeatToggleBready) begin
      if(bvalid === 1) begin
        break;
      end
      else begin
        @(posedge aclk);
        bready <= ~bready;
        if(masterWritePacketStruct.waitCounterForBvalid > (masterWriteConfigStruct.maxDelayForBvalid+1)) begin
          `uvm_error (name, $sformatf ("MASTER_WRITE_RESPONSE_CHANNEL: bvalidBready Handshaking comparitions count are failed"));
          break;
        end 
        masterWritePacketStruct.waitCounterForBvalid++;
      end
    end
  end

    @(negedge aclk);
    while(bvalid === 0) begin
      @(posedge aclk);
      if(masterWritePacketStruct.waitCounterForBvalid > (masterWriteConfigStruct.maxDelayForBvalid+1)) begin
        `uvm_error (name, $sformatf ("MASTER_WRITE_RESPONSE_CHANNEL: bvalidBready Handshaking comparitions count are failed"));
        break;
      end 
      masterWritePacketStruct.waitCounterForBvalid++;
    end

    `uvm_info(name , $sformatf("After while loop bvalid asserted "),UVM_HIGH)

    if(bvalid === 1) begin
      if(bready === 0) begin
        repeat(masterWritePacketStruct.delayForBready) begin 
          @(posedge aclk);
          bready <= 1'b0;
        end
        bready <= 1'b1;
        masterWritePacketStruct.bresp <= bresp;

        //Once the trasaction is Done it going to the default state value.
        @(posedge aclk);
        bready <= masterWriteConfigStruct.defaultStateBready;
      end
      else begin
        masterWritePacketStruct.bresp <= bresp;
        bready <= masterWriteConfigStruct.defaultStateBready;
      end
    end
    `uvm_info(name,$sformatf("WRITE_RESPONSE_CHANNEL_TASK_ENDED"),UVM_HIGH)
  endtask : writeResponseChannelTask

endinterface : Axi4LiteMasterWriteDriverBFM

`endif

