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
  import Axi4LiteSlaveReadAssertCoverParameter::*; 
  `include "uvm_macros.svh" 

  import Axi4LiteSlaveReadPkg::Axi4LiteSlaveReadDriverProxy;

  string name = "Axi4LiteSlaveReadDriverBFM"; 

  Axi4LiteSlaveReadDriverProxy axi4LiteSlaveReadDriverProxy;
 
  initial begin
    `uvm_info("axi4 slave driver bfm",$sformatf("AXI4 SLAVE DRIVER BFM"),UVM_LOW);
  end

   task waitForAresetn(input axi4LiteReadSlaveTransferCfgStruct slaveReadConfigStruct);
    @(negedge aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET ACTIVATED"),UVM_HIGH)
     arready  <= slaveReadConfigStruct.defaultStateReady;
     rvalid   <= 0;
    @(posedge aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET DE-ACTIVATED"),UVM_HIGH)
  endtask : waitForAresetn 
 
  initial begin
    `uvm_info(name,$sformatf(name),UVM_LOW)
  end

  task readAddressChannelTask(input axi4LiteReadSlaveTransferCfgStruct slaveReadConfigStruct, 
                              inout axi4LiteReadSlaveTransferPacketStruct slaveReadPacketStruct
                              );
    `uvm_info(name,$sformatf("SLAVE_READ_ADDRESS_CHANNEL_TASK_STARTED"),UVM_HIGH)
    do begin
      @(posedge aclk);
    end while(arvalid === 0);

    `uvm_info(name , $sformatf("After while loop arvalid asserted"),UVM_HIGH)

    //FIXME
    //What if user given the delayForArready as 0
     repeat(slaveReadPacketStruct.delayForArready-1) begin 
      @(posedge aclk);
    end
    arready <= 1'b1;
   
    slaveReadPacketStruct.araddr <= araddr;
    slaveReadPacketStruct.arprot <= arprot;
    @(posedge aclk);
    arready  <= slaveReadConfigStruct.defaultStateReady;

    `uvm_info(name,$sformatf("SLAVE_READ_ADDRESS_CHANNEL_TASK_ENDED"),UVM_HIGH)
  endtask : readAddressChannelTask

  
task readDataChannelTask(input axi4LiteReadSlaveTransferCfgStruct slaveReadConfigStruct, 
                         inout axi4LiteReadSlaveTransferPacketStruct slaveReadPacketStruct
                        );
   `uvm_info(name,$sformatf("SLAVE_READ_DATA_CHANNEL_TASK_STARTED"),UVM_HIGH)
   
    do begin
      @(posedge aclk);
      `uvm_info("FROM SLAVE READ DRIVER BFM",$sformatf("Inside read data channel waiting for arvalid and arready"),UVM_HIGH)
    end
    while(arvalid!==1 || arready!==1);
     `uvm_info("FROM SLAVE READ DRIVER BFM",$sformatf("After read data channel asserted arvalid and arready"),UVM_HIGH)

     //FIXME
     //What if user given the delayForRvalid as 0
     repeat(slaveReadPacketStruct.delayForRvalid-1) begin 
      @(posedge aclk);
     end
      rvalid <= 1'b1;
      rdata  <= slaveReadPacketStruct.rdata;
   
     do begin
       @(posedge aclk);
       slaveReadPacketStruct.waitCounterForRready++;
       if(slaveReadPacketStruct.waitCounterForRready > slaveReadConfigStruct.maxDelayForRready) begin
         `uvm_error (name, $sformatf ("rready count comparisions are failed"));
       end
    end while(rready === 0);
 
    rvalid <= 1'b0;
   `uvm_info(name,$sformatf("SLAVE_READ_DATA_CHANNEL_TASK_ENDED"),UVM_HIGH)
 endtask : readDataChannelTask
 

 endinterface : Axi4LiteSlaveReadDriverBFM

`endif

