`ifndef AXI4LITEMASTERWRITEMONITORBFM_INCLUDED_
`define AXI4LITEMASTERWRITEMONITORBFM_INCLUDED_

 import Axi4LiteWriteMasterGlobalPkg::*;

interface Axi4LiteMasterWriteMonitorBFM(input bit aclk, 
                                        input bit aresetn,
                                        //Write Address Channel Signals
                                        input                      awvalid,
                                        input                      awready,
                                       	input  [ADDRESS_WIDTH-1:0] awaddr,
                                       	input                [2:0] awprot,
                                        //Write Data Channel Signals
                                        input                      wvalid,
                                        input                      wready,
                                        input     [DATA_WIDTH-1:0] wdata,
                                        input [(DATA_WIDTH/8)-1:0] wstrb,
                                        //Write Response Channel Signals
                                        input                      bvalid,
                                        input                      bready,
                                        input                [1:0] bresp
                                       );  

  import uvm_pkg::*;
  `include "uvm_macros.svh" 
  
  import Axi4LiteMasterWritePkg::Axi4LiteMasterWriteMonitorProxy;  
 
  Axi4LiteMasterWriteMonitorProxy axi4LiteMasterWriteMonitorProxy;
  
  task waitForAresetn();
    @(negedge aresetn);
    `uvm_info("FROM MASTER MON BFM",$sformatf("SYSTEM RESET DETECTED"),UVM_HIGH) 
    @(posedge aresetn);
    `uvm_info("FROM MASTER MON BFM",$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
  endtask : waitForAresetn

  task writeAddressChannelSampleTask(input axi4LiteWriteMasterTransferCfgStruct masterWriteConfigStruct,
                                     output axi4LiteWriteMasterTransferPacketStruct masterWritePacketStruct
                                    );
    `uvm_info("FROM MASTER WRITE MONITOR BFM",$sformatf("from axi4Lite master write address sample task"),UVM_HIGH)

    do begin
      @(posedge aclk);
      `uvm_info("FROM MASTER WRITE MONITOT BFM",$sformatf("Inside address channel while loop......"),UVM_HIGH)
    end while(awvalid!==1 || awready!==1);
      `uvm_info("FROM MASTER WRITE MONITOT BFM",$sformatf("After address channel while loop......"),UVM_HIGH)
      
    masterWritePacketStruct.awaddr  = awaddr;
    masterWritePacketStruct.awprot  = awprot;

    `uvm_info("FROM MASTER WRITE MONITOR BFM",$sformatf("after awvalid & awready asserted from master write address channel task masterWritePacketStruct=%p ",masterWritePacketStruct),UVM_HIGH)
  endtask : writeAddressChannelSampleTask

  task writeDataChannelSampleTask(input axi4LiteWriteMasterTransferCfgStruct masterWriteConfigStruct,
                                     output axi4LiteWriteMasterTransferPacketStruct masterWritePacketStruct
                                    );
    `uvm_info("FROM MASTER WRITE MONITOR BFM",$sformatf("from axi4Lite master write data sample task"),UVM_HIGH)

    do begin
      @(posedge aclk);
      `uvm_info("FROM MASTER WRITE MONITOT BFM",$sformatf("Inside data channel while loop......"),UVM_HIGH)
    end while(wvalid!==1 || wready!==1);
      `uvm_info("FROM MASTER WRITE MONITOT BFM",$sformatf("After data channel while loop......"),UVM_HIGH)
      
    masterWritePacketStruct.wdata  = wdata;
    masterWritePacketStruct.wstrb  = wstrb;

    `uvm_info("FROM MASTER WRITE MONITOR BFM",$sformatf("after wvalid & wready asserted from master write data channel task masterWritePacketStruct=%p ",masterWritePacketStruct),UVM_HIGH)
  endtask : writeDataChannelSampleTask

  task writeResponseChannelSampleTask(input axi4LiteWriteMasterTransferCfgStruct masterWriteConfigStruct,
                                      output axi4LiteWriteMasterTransferPacketStruct masterWritePacketStruct
                                     );
    `uvm_info("FROM MASTER WRITE MONITOR BFM",$sformatf("from axi4Lite master write response sample task"),UVM_HIGH)

    do begin
      @(posedge aclk);
      `uvm_info("FROM MASTER WRITE MONITOT BFM",$sformatf("Inside response channel while loop......"),UVM_HIGH)
    end while(bvalid!==1 || bready!==1);    
      `uvm_info("FROM MASTER WRITE MONITOT BFM",$sformatf("After response channel while loop......"),UVM_HIGH)
      
    masterWritePacketStruct.bresp  = bresp;

    `uvm_info("FROM MASTER WRITE MONITOR BFM",$sformatf("after bvalid & bready asserted from master write response channel task masterWritePacketStruct=%p ",masterWritePacketStruct),UVM_HIGH)
  endtask : writeResponseChannelSampleTask 

endinterface : Axi4LiteMasterWriteMonitorBFM

`endif
