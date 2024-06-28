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
    `uvm_info("FROM SLAVE WRITE MONITOR BFM",$sformatf("from axi4Lite Slave writeAddressChannelTask"),UVM_HIGH)
    `uvm_info("FROM SLAVE WRITE MONITOR BFM",$sformatf("after while loop from axi4Lite Slave writeAddressChannel slaveWritePacketStruct=%p ",slaveWritePacketStruct),UVM_HIGH)
  endtask : writeAddressChannelSampleTask 

     task writeDataChannelSampleTask(input axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct,
                              output axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct);
    `uvm_info("FROM SLAVE WRITE MONITOR BFM",$sformatf("from axi4Lite Slave writeDataChannelTask"),UVM_HIGH)

    `uvm_info("FROM SLAVE WRITE MONITOR BFM",$sformatf("after while loop from axi4Lite Slave writeDataChannel slaveWritePacketStruct=%p ",slaveWritePacketStruct),UVM_HIGH)
  endtask : writeDataChannelSampleTask 

  
  task writeResponseChannelSampleTask(input axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct,
                                      output axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct
                                    );
    `uvm_info("FROM SLAVE WRITE MONITOR BFM",$sformatf("from axi4Lite Slave writeResponseChannelTask"),UVM_HIGH)

    `uvm_info("FROM SLAVE WRITE MONITOR BFM",$sformatf("after while loop from axi4Lite Slave writeResponseChannel slaveWritePacketStruct=%p ",slaveWritePacketStruct),UVM_HIGH)
  endtask : writeResponseChannelSampleTask 

endinterface : Axi4LiteSlaveWriteMonitorBFM

`endif
