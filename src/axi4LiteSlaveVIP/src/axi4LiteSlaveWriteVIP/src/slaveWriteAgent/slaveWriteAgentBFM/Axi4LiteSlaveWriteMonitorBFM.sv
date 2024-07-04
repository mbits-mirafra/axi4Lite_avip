`ifndef AXI4LITESLAVEWRITEMONITORBFM_INCLUDED_
`define AXI4LITESLAVEWRITEMONITORBFM_INCLUDED_

import Axi4LiteWriteSlaveGlobalPkg::*;

interface Axi4LiteSlaveWriteMonitorBFM(input bit aclk, 
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
  
  import Axi4LiteSlaveWritePkg::Axi4LiteSlaveWriteMonitorProxy; 
 
  Axi4LiteSlaveWriteMonitorProxy axi4LiteSlaveWriteMonitorProxy;
  
  int validDelayCounter;

  task waitForAresetn();
    @(negedge aresetn);
    `uvm_info("FROM SLAVE MON BFM",$sformatf("SYSTEM RESET DETECTED"),UVM_HIGH)
    @(posedge aresetn);
    `uvm_info("FROM SLAVE MON BFM",$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
  endtask : waitForAresetn

  task writeAddressChannelSampleTask(input axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct,
                               output axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct);
    `uvm_info("FROM SLAVE WRITE MONITOR BFM",$sformatf("from axi4Lite slave write address sample task"),UVM_HIGH)

    @(posedge aclk);
    while(awvalid!==1 || awready!==1)begin
      @(posedge aclk);
      `uvm_info("FROM SLAVE WRITE MONITOT BFM",$sformatf("Inside address channel while loop......"),UVM_HIGH)
    end    
      `uvm_info("FROM SLAVE WRITE MONITOT BFM",$sformatf("After address channel while loop......"),UVM_HIGH)
      
    slaveWritePacketStruct.awaddr  = awaddr;
    slaveWritePacketStruct.awprot  = awprot;

    `uvm_info("FROM SLAVE WRITE MONITOR BFM",$sformatf("after awvalid & awready asserted from slave write address channel task slaveWritePacketStruct=%p ",slaveWritePacketStruct),UVM_HIGH)
 
  endtask : writeAddressChannelSampleTask 

task writeDataChannelSampleTask(input axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct,
                              output axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct);

`uvm_info("FROM SLAVE WRITE MONITOR BFM",$sformatf("from axi4Lite slave write data sample task"),UVM_HIGH)

    @(posedge aclk);
    while(wvalid!==1 || wready!==1)begin
      @(posedge aclk);
      `uvm_info("FROM SLAVE WRITE MONITOT BFM",$sformatf("Inside data channel while loop......"),UVM_HIGH)
    end    
      `uvm_info("FROM SLAVE WRITE MONITOT BFM",$sformatf("After data channel while loop......"),UVM_HIGH)
      
    slaveWritePacketStruct.wdata  = wdata;
    slaveWritePacketStruct.wstrb  = wstrb;

    `uvm_info("FROM SLAVE WRITE MONITOR BFM",$sformatf("after wvalid & wready asserted from slave write data channel task slaveWritePacketStruct=%p ",slaveWritePacketStruct),UVM_HIGH)  

endtask : writeDataChannelSampleTask 

  
task writeResponseChannelSampleTask(input axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct,
                                      output axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct
                                    );
`uvm_info("FROM SLAVE WRITE MONITOR BFM",$sformatf("from axi4Lite slave write response sample task"),UVM_HIGH)

    @(posedge aclk);
    while(bvalid!==1 || bready!==1)begin
      @(posedge aclk);
      `uvm_info("FROM SLAVE WRITE MONITOT BFM",$sformatf("Inside response channel while loop......"),UVM_HIGH)
    end    
      `uvm_info("FROM SLAVE WRITE MONITOT BFM",$sformatf("After response channel while loop......"),UVM_HIGH)
      
    slaveWritePacketStruct.bresp  = bresp;

    `uvm_info("FROM SLAVE WRITE MONITOR BFM",$sformatf("after bvalid & bready asserted from slave write response channel task slaveWritePacketStruct=%p ",slaveWritePacketStruct),UVM_HIGH)
  endtask : writeResponseChannelSampleTask 

endinterface : Axi4LiteSlaveWriteMonitorBFM

`endif
