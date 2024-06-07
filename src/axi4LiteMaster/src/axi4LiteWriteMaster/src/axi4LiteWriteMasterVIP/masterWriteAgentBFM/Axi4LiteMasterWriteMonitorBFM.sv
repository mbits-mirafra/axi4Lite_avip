`ifndef AXI4LITEMASTERWRITEMONITORBFM_INCLUDED_
`define AXI4LITEMASTERWRITEMONITORBFM_INCLUDED_

interface Axi4LiteMasterWriteMonitorBFM(input bit aclk, 
                                        input bit aresetn,
                                        //Write Address Channel Signals
                                        input  awvalid,
                                        input  awready,
                                        //Write Data Channel Signals
                                        input  wvalid,
                                        input  wready,
                                        //Write Response Channel Signals
                                        input  bvalid,
                                        input  bready
                                      );  

  import uvm_pkg::*;
  import axi4LiteWriteMasterGlobalPkg::*;
  `include "uvm_macros.svh" 
  
  import Axi4LiteMasterWritePkg::Axi4LiteMasterWriteMonitorProxy;  
 
  Axi4LiteMasterWriteMonitorProxy axi4LiteMasterWriteMonitorProxy;
  
  task waitForAresetn();
    @(negedge aresetn);
    `uvm_info("FROM MASTER MON BFM",$sformatf("SYSTEM RESET DETECTED"),UVM_HIGH) 
    @(posedge aresetn);
    `uvm_info("FROM MASTER MON BFM",$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
  endtask : waitForAresetn

  task writeAddressChannelSampleTask(input axi4LiteWriteTransferConfigStruct masterWriteConfigStruct,
                                     output axi4LiteWriteTransferPacketStruct masterWritePacketStruct
                                    );
    `uvm_info("FROM MASTER WRITE MONITOR BFM",$sformatf("from axi4Lite master write address sample task"),UVM_HIGH)

    `uvm_info("FROM MASTER WRITE MONITOR BFM",$sformatf("after awvalid & awready asserted from master write address channel task masterWritePacketStruct=%p ",masterWritePacketStruct),UVM_HIGH)
  endtask : writeAddressChannelSampleTask

  task writeDataChannelSampleTask(input axi4LiteWriteTransferConfigStruct masterWriteConfigStruct,
                                     output axi4LiteWriteTransferPacketStruct masterWritePacketStruct
                                    );
    `uvm_info("FROM MASTER WRITE MONITOR BFM",$sformatf("from axi4Lite master write data sample task"),UVM_HIGH)
    `uvm_info("FROM MASTER WRITE MONITOR BFM",$sformatf("after wvalid & wready asserted from master write data channel task masterWritePacketStruct=%p ",masterWritePacketStruct),UVM_HIGH)
  endtask : writeDataChannelSampleTask

  task writeResponseChannelSampleTask(input axi4LiteWriteTransferConfigStruct masterWriteConfigStruct,
                                      output axi4LiteWriteTransferPacketStruct masterWritePacketStruct
                                     );
    `uvm_info("FROM MASTER WRITE MONITOR BFM",$sformatf("from axi4Lite master write response sample task"),UVM_HIGH)

    `uvm_info("FROM MASTER WRITE MONITOR BFM",$sformatf("after bvalid & bready asserted from master write response channel task masterWritePacketStruct=%p ",masterWritePacketStruct),UVM_HIGH)
  endtask : writeResponseChannelSampleTask 

endinterface : Axi4LiteMasterWriteMonitorBFM

`endif
