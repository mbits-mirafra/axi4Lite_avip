`ifndef AXI4LITEMASTERREADMONITORBFM_INCLUDED_
`define AXI4LITEMASTERREADMONITORBFM_INCLUDED_

interface Axi4LiteMasterReadMonitorBFM( input bit aclk, 
                                        input bit aresetn,
                                        //Read Address Channel Signals
                                        input  arvalid,
                                        input  arready,
                                        //Read Data Channel Signals
                                        input  rvalid,
                                        input  rready
                                      );  

  import uvm_pkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
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

    `uvm_info("FROM MASTER READ MONITOR BFM",$sformatf("after arvalid & arready asserted from master read address channel task masterReadPacketStruct=%p ",masterReadPacketStruct),UVM_HIGH)
  endtask : readAddressChannelSampleTask

  task readDataChannelSampleTask(input axi4LiteReadMasterTransferCfgStruct masterReadConfigStruct,
                                     output axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct
                                    );
    `uvm_info("FROM MASTER READ MONITOR BFM",$sformatf("from axi4Lite master read data sample task"),UVM_HIGH)
    `uvm_info("FROM MASTER READ MONITOR BFM",$sformatf("after rvalid & rready asserted from master read data channel task masterReadPacketStruct=%p ",masterReadPacketStruct),UVM_HIGH)
  endtask : readDataChannelSampleTask

  task readResponseChannelSampleTask(input axi4LiteReadMasterTransferCfgStruct masterReadConfigStruct,
                                      output axi4LiteReadMasterTransferPacketStruct masterReadPacketStruct
                                     );
    `uvm_info("FROM MASTER READ MONITOR BFM",$sformatf("from axi4Lite master read response sample task"),UVM_HIGH)

    `uvm_info("FROM MASTER READ MONITOR BFM",$sformatf("after bvalid & bready asserted from master read response channel task masterReadPacketStruct=%p ",masterReadPacketStruct),UVM_HIGH)
  endtask : readResponseChannelSampleTask 

endinterface : Axi4LiteMasterReadMonitorBFM

`endif
