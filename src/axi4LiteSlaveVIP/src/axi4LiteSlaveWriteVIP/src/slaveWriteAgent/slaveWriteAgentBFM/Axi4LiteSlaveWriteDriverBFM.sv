`ifndef AXI4LITESLAVEWRITEDRIVERBFM_INCLUDED_
`define AXI4LITESLAVEWRITEDRIVERBFM_INCLUDED_

import Axi4LiteWriteSlaveGlobalPkg::*;

interface Axi4LiteSlaveWriteDriverBFM(input      aclk, 
                                      input      aresetn,
                                      //WriteAddressChannel
                                      input                           awvalid,
                                      output reg                      awready,
                                      input       [ADDRESS_WIDTH-1:0] awaddr,
                                      input                     [2:0] awprot,
                                      //WriteDataChannel
                                      input                           wvalid,
                                      output reg    	                wready,
                                      input          [DATA_WIDTH-1:0] wdata,
                                      input      [(DATA_WIDTH/8)-1:0] wstrb,
                                      //Write Response Channel
                                      output reg                      bvalid,
                                      input		                        bready,
                                      output reg                [1:0] bresp
                                    ); 
  import uvm_pkg::*;
  import Axi4LiteSlaveWriteAssertCoverParameter::*;
  import Axi4LiteSlaveWritePkg::Axi4LiteSlaveWriteDriverProxy;
  `include "uvm_macros.svh" 

  string name = "Axi4LiteSlaveWriteDriverBFM"; 

  Axi4LiteSlaveWriteDriverProxy axi4LiteSlaveWriteDriverProxy;

  initial begin
    `uvm_info("axi4 slave driver bfm",$sformatf("AXI4 SLAVE DRIVER BFM"),UVM_LOW);
  end

  task waitForAresetn(input axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct);
    @(negedge aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET DETECTED"),UVM_HIGH)
    bvalid   <= 1'b0;
    awready  <= slaveWriteConfigStruct.defaultStateReady;
    wready   <= slaveWriteConfigStruct.defaultStateReady;
    @(posedge aresetn);
    `uvm_info(name,$sformatf("SYSTEM RESET DEACTIVATED"),UVM_HIGH)
  endtask : waitForAresetn 

task writeAddressChannelTask(input axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct, 
                             inout axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct
                             );
  `uvm_info(name,$sformatf("SLAVE_WRITE_ADDRESS_CHANNEL_TASK_STARTED"),UVM_HIGH)
  do begin
    @(posedge aclk);
  end while(awvalid !== 1);

  `uvm_info(name , $sformatf("After while loop awvalid asserted "),UVM_HIGH)

  //FIXME
  //What if user given the delayForAwready as 0
  repeat(slaveWritePacketStruct.delayForAwready-1) begin 
    @(posedge aclk);
  end

  awready <= 1'b1;
  slaveWritePacketStruct.awaddr <= awaddr;
  slaveWritePacketStruct.awprot <= awprot;
  
  @(posedge aclk);
  awready <= slaveWriteConfigStruct.defaultStateReady;

  `uvm_info(name,$sformatf("SLAVE_WRITE_ADDRESS_CHANNEL_TASK_ENDED"),UVM_HIGH)
endtask : writeAddressChannelTask


task writeDataChannelTask(input axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct, 
                          inout axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct
                         );
   `uvm_info(name,$sformatf("SLAVE_WRITE_DATA_CHANNEL_TASK_STARTED"),UVM_HIGH)
    do begin
      @(posedge aclk);
      slaveWritePacketStruct.waitCounterForWvalid++;
      if(slaveWritePacketStruct.waitCounterForWvalid > slaveWriteConfigStruct.maxDelayForWvalid) begin
        `uvm_error (name, $sformatf ("wvalid count comparisions are failed"));
      end 
    end while(wvalid !== 1);

    `uvm_info(name , $sformatf("After while loop wvalid asserted "),UVM_HIGH)

    //FIXME
    //What if user given the delayForWready as 0
    repeat(slaveWritePacketStruct.delayForWready-1) begin 
      @(posedge aclk);
    end
    wready <= 1'b1;
    slaveWritePacketStruct.wdata <= wdata;
    slaveWritePacketStruct.wstrb <= wstrb;
 
    @(posedge aclk);
    wready <= slaveWriteConfigStruct.defaultStateReady;

    `uvm_info(name,$sformatf("SLAVE_WRITE_DATA_CHANNEL_TASK_ENDED"),UVM_HIGH)
endtask :writeDataChannelTask


task writeResponseChannelTask(input axi4LiteWriteSlaveTransferCfgStruct slaveWriteConfigStruct, 
                              inout axi4LiteWriteSlaveTransferPacketStruct slaveWritePacketStruct
                             );
  `uvm_info(name,$sformatf("SLAVE_WRITE_RESPONSE_CHANNEL_TASK_STARTED"),UVM_HIGH)
  //FIXME
  //What if user given the delayForBvalid as 0
  repeat(slaveWritePacketStruct.delayForBvalid-1) begin
    @(posedge aclk);
  end
  bvalid <= 1'b1;
  bresp  <= slaveWritePacketStruct.bresp;

  do begin
    @(posedge aclk);
    slaveWritePacketStruct.waitCounterForBready++;
    if(slaveWritePacketStruct.waitCounterForBready > slaveWriteConfigStruct.maxDelayForBready) begin
      `uvm_error (name, $sformatf ("bready count comparisions are failed"));
    end
  end while(bready === 0); 
  
  bvalid <= 1'b0;

  `uvm_info(name,$sformatf("SLAVE_WRITE_RESPONSE_CHANNEL_TASK_ENDED"),UVM_HIGH)
endtask : writeResponseChannelTask

endinterface : Axi4LiteSlaveWriteDriverBFM

`endif

