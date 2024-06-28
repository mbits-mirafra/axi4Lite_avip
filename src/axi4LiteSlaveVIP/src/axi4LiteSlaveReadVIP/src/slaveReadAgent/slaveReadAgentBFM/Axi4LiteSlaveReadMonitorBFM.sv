`ifndef AXI4LITESLAVEREADMONITORBFM_INCLUDED_
`define AXI4LITESLAVEREADMONITORBFM_INCLUDED_

 import Axi4LiteReadSlaveGlobalPkg::*;

interface Axi4LiteSlaveReadMonitorBFM(input bit aclk, 
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
  
  import Axi4LiteSlaveReadPkg::Axi4LiteSlaveReadMonitorProxy;
 
  Axi4LiteSlaveReadMonitorProxy axi4LiteSlaveReadMonitorProxy;

  task waitForAresetn();
    @(negedge aresetn);
    `uvm_info("axi4LiteSlaveReadMonitorProxy",$sformatf("SYSTEM RESET DETECTED"),UVM_HIGH) 
    @(posedge aresetn);
    `uvm_info("FROM Slave MON BFM",$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
  endtask : waitForAresetn

  task readAddressChannelSampleTask(input axi4LiteReadSlaveTransferCfgStruct slaveReadConfigStruct,output axi4LiteReadSlaveTransferPacketStruct slaveReadPacketStruct);
    @(posedge aclk);
    `uvm_info("FROM SLAVE READ MONITOR BFM",$sformatf("from axi4Lite Slave readAddressChannelTask"),UVM_HIGH)

    `uvm_info("FROM SLAVE READ MONITOR BFM",$sformatf("after while loop from axi4Lite Slave readAddressChannel slaveReadPacketStruct=%p ",slaveReadPacketStruct),UVM_HIGH)
  endtask : readAddressChannelSampleTask

  task readDataChannelSampleTask(input axi4LiteReadSlaveTransferCfgStruct slaveReadConfigStruct,output axi4LiteReadSlaveTransferPacketStruct slaveReadPacketStruct);
    @(posedge aclk);
    `uvm_info("FROM SLAVE READ MONITOR BFM",$sformatf("from axi4Lite Slave readDataChannelTask"),UVM_HIGH)


    `uvm_info("FROM SLAVE READ MONITOR BFM",$sformatf("after while loop from axi4Lite Slave readDataChannel slaveReadPacketStruct=%p ",slaveReadPacketStruct),UVM_HIGH)
  endtask : readDataChannelSampleTask

endinterface : Axi4LiteSlaveReadMonitorBFM

`endif
