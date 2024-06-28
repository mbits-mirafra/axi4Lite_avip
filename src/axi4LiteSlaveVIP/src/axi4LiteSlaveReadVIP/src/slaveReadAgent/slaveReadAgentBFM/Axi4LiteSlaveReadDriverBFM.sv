`ifndef AXI4LITESLAVEREADDRIVERBFM_INCLUDED_
`define AXI4LITESLAVEREADDRIVERBFM_INCLUDED_

import Axi4LiteReadSlaveGlobalPkg::*;

interface Axi4LiteSlaveReadDriverBFM(input bit                     aclk, 
                                     input bit                     aresetn,
                                     //Read Address Channel
                                     input                         arvalid,
                                     output reg                    arready,
                                     input     [ADDRESS_WIDTH-1:0] araddr,
                                     input                   [2:0] arprot,
                                     //Read Data Channel
                                     output reg                    rvalid,
                                     input		                     rready,   
                                     output reg   [DATA_WIDTH-1:0] rdata,
                                     output reg              [1:0] rresp
                                    );  

  import uvm_pkg::*;
  `include "uvm_macros.svh" 

  import Axi4LiteSlaveReadPkg::Axi4LiteSlaveReadDriverProxy;

  string name = "Axi4LiteSlaveReadDriverBFM"; 

  Axi4LiteSlaveReadDriverProxy axi4LiteSlaveReadDriverProxy;
 
  initial begin
    `uvm_info("axi4 slave driver bfm",$sformatf("AXI4 SLAVE DRIVER BFM"),UVM_LOW);
  end

   task waitForAresetn();
    @(negedge aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET ACTIVATED"),UVM_HIGH)
    rvalid  <= 0;
    @(posedge aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET DE-ACTIVATED"),UVM_HIGH)
  endtask : waitForAresetn 
 
  initial begin
    `uvm_info(name,$sformatf(name),UVM_LOW)
  end

  task readAddressChannelTask(input axi4LiteReadSlaveTransferCfgStruct slaveReadConfigStruct, 
                              inout axi4LiteReadSlaveTransferPacketStruct slaveReadPacketStruct
                              );
    `uvm_info(name,$sformatf("READ_ADDRESS_CHANNEL_TASK_STARTED"),UVM_HIGH)
    do begin
      @(posedge aclk);
    end while(arvalid===0);

    `uvm_info(name , $sformatf("After while loop arvalid asserted"),UVM_HIGH)

     repeat(slaveReadPacketStruct.delayForArready) begin 
      @(posedge aclk);
    end
    arready <= 1'b1;
    slaveReadPacketStruct.araddr <= araddr;
    slaveReadPacketStruct.arprot <= arprot;

    `uvm_info(name,$sformatf("READ_ADDRESS_CHANNEL_TASK_ENDED"),UVM_HIGH)
  endtask : readAddressChannelTask

  
task readDataChannelTask(input axi4LiteReadSlaveTransferCfgStruct slaveReadConfigStruct, 
                         inout axi4LiteReadSlaveTransferPacketStruct slaveReadPacketStruct
                        );
   `uvm_info(name,$sformatf("READ_DATA_CHANNEL_TASK_STARTED"),UVM_HIGH)

    `uvm_info(name,$sformatf("READ_DATA_CHANNEL_TASK_ENDED"),UVM_HIGH)
 endtask : readDataChannelTask
 

 endinterface : Axi4LiteSlaveReadDriverBFM

`endif

