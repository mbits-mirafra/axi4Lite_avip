`ifndef AXI4LITEMASTERREADMONITORBFM_INCLUDED_
`define AXI4LITEMASTERREADMONITORBFM_INCLUDED_

 import Axi4LiteReadMasterGlobalPkg::*;

interface Axi4LiteMasterReadMonitorBFM( input bit aclk, 
                                        input bit aresetn,
                                        //Read Address Channel Signals
                                        input                     arvalid,
                                        input                     arready,
                                        input [ADDRESS_WIDTH-1:0] araddr,
                                        input               [2:0] arprot,
                                        //Read Data Channel Signals
                                        input                     rvalid,
                                        input                     rready,
                                        input    [DATA_WIDTH-1:0] rdata,
                                        input               [1:0] rresp
                                      );  

  import uvm_pkg::*;
  `include "uvm_macros.svh" 
  
  import Axi4LiteMasterReadPkg::Axi4LiteMasterReadMonitorProxy;  
 
  Axi4LiteMasterReadMonitorProxy axi4LiteMasterReadMonitorProxy;
  
  task waitForAresetn();
    @(negedge aresetn);
    `uvm_info("FROM MASTER MON BFM",$sformatf("SYSTEM RESET DETECTED"),UVM_HIGH) 
    @(posedge aresetn);
    `uvm_info("FROM MASTER MON BFM",$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
  endtask : waitForAresetn

  task readAddressChannelSampleTask(input axi4LiteReadMasterTransferCfgStruct masterReadConfigStruct,
                                     output axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct
                                    );
    `uvm_info("FROM MASTER READ MONITOR BFM",$sformatf("from axi4Lite master read address sample task"),UVM_HIGH)

    @(posedge aclk);
    while(arvalid!==1 || arready!==1)begin
      @(posedge aclk);
      `uvm_info("FROM MASTER READ MONITOT BFM",$sformatf("Inside address channel while loop......"),UVM_HIGH)
    end    
      `uvm_info("FROM MASTER READ MONITOT BFM",$sformatf("After address channel while loop......"),UVM_HIGH)
      
    masterReadPacketStruct.araddr  = araddr;
    masterReadPacketStruct.arprot  = arprot;

    `uvm_info("FROM MASTER READ MONITOR BFM",$sformatf("after arvalid & arready asserted from master read address channel task masterReadPacketStruct=%p ",masterReadPacketStruct),UVM_HIGH)
  endtask : readAddressChannelSampleTask

  task readDataChannelSampleTask(input axi4LiteReadMasterTransferCfgStruct masterReadConfigStruct,
                                     output axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct
                                    );
    `uvm_info("FROM MASTER READ MONITOR BFM",$sformatf("from axi4Lite master read data sample task"),UVM_HIGH)

    @(posedge aclk);
    while(rvalid!==1 || rready!==1)begin
      @(posedge aclk);
      `uvm_info("FROM MASTER READ MONITOT BFM",$sformatf("Inside data channel while loop......"),UVM_HIGH)
    end    
      `uvm_info("FROM MASTER READ MONITOT BFM",$sformatf("After data channel while loop......"),UVM_HIGH)
      
    masterReadPacketStruct.rdata  = rdata;
    masterReadPacketStruct.rresp  = rresp;

    `uvm_info("FROM MASTER READ MONITOR BFM",$sformatf("after rvalid & rready asserted from master read data channel task masterReadPacketStruct=%p ",masterReadPacketStruct),UVM_HIGH)

  endtask : readDataChannelSampleTask

endinterface : Axi4LiteMasterReadMonitorBFM

`endif
