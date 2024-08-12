`ifndef AXI4LITECOVERPROPERTY_INCLUDED_
`define AXI4LITECOVERPROPERTY_INCLUDED_

import Axi4LiteWriteMasterGlobalPkg::*;
import Axi4LiteReadMasterGlobalPkg::*;
import Axi4LiteWriteSlaveGlobalPkg::*;
import Axi4LiteReadSlaveGlobalPkg::*;

interface Axi4LiteCoverProperty (input aclk,
                                 input aresetn,
                                 //Write Address Channel Signals
                                 input awvalid,
                                 input [(Axi4LiteWriteMasterGlobalPkg::ADDRESS_WIDTH)-1:0] awaddr,
                                 input awready,
                                 input [2:0] awprot,
                                 //Write Data Channel Signals
                                 input wvalid,
                                 input [(Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH)-1:0] wdata,
                                 input [((Axi4LiteWriteMasterGlobalPkg::DATA_WIDTH)/8)-1:0] wstrb,
                                 input wready,
                                 //Write Response Channel
                                 input bvalid,
                                 input bready,
                                 input [1:0] bresp,
                                 //Read Address Channel Signals
                                 input arvalid,
                                 input arready,
                                 input [(Axi4LiteReadMasterGlobalPkg::ADDRESS_WIDTH)-1:0] araddr,
                                 input [2:0] arprot,
                                 //Read Data Channel Signals
                                 input rvalid,
                                 input rready,
                                 input [(Axi4LiteReadMasterGlobalPkg::DATA_WIDTH)-1:0] rdata,
                                 input [1:0] rresp
                                );  

  import uvm_pkg::*;
  `include "uvm_macros.svh";

  initial begin
    `uvm_info("Axi4LiteCoverProperty","Axi4LiteCoverProperty",UVM_LOW);
  end

  property WhenWriteAddressAndDataIsEqualToReadAddressAndData;
    @(posedge aclk) disable iff (!aresetn)
      (awvalid && awready && (!$isunknown(awaddr))) |-> 
        ##1 (arvalid && arready && (araddr == awaddr)) 
        ##1 (wvalid && wready && (!$isunknown(wdata))) 
        ##1 (rvalid && rready && (rdata == wdata));
  endproperty
  
  property WhenWriteAddressAndDataIsNotEqualToReadAddressAndData;
    @(posedge aclk) disable iff (!aresetn)
       (awvalid && awready && (!$isunknown(awaddr))) |-> 
          ##1 (arvalid && arready && (araddr !== awaddr)) 
          ##1 (wvalid && wready && (!$isunknown(wdata))) 
          ##1 (rvalid && rready && (rdata !== wdata));
  endproperty
   

  property WhenWrite64BitsAddressAndDataIsEqualToRead64BitsAddressAndData;
    @(posedge aclk) disable iff (!aresetn)
       (awvalid && awready && (!$isunknown(awaddr))) |-> 
          ##1 (arvalid && arready && (araddr == awaddr)) 
          ##1 (wvalid && wready && (wstrb == 'hff) && (!$isunknown(wdata))) 
          ##1 (rvalid && rready && (rdata == wdata));
   endproperty

   property WhenWrite64BitsAddressAndDataIsNotEqualToRead64BitsAddressAndData;
    @(posedge aclk) disable iff (!aresetn)
       (awvalid && awready && (!$isunknown(awaddr))) |-> 
          ##1 (arvalid && arready && (wstrb == 'hff) && (araddr !== awaddr)) 
          ##1 (wvalid && wready && (!$isunknown(wdata))) 
          ##1 (rvalid && rready && (rdata !== wdata));
   endproperty
 
  `ifdef ADDR_WIDTH == 32 &&  DATA_WIDTH == 32
  IFMASTERWRITE_ADDRANDDATA_ISEQUALTO_MASTERREAD_ADDRANDDATA : cover property
  (WhenWriteAddressAndDataIsEqualToReadAddressAndData)
  $info("IFMASTERWRITE_ADDRANDDATA_ISEQUALTO_MASTERREAD_ADDRANDDATA : COVERED");

  IFSLAVEWRITE_ADDRANDDATA_ISEQUALTO_SLAVEREAD_ADDRANDDATA : cover property
  (WhenWriteAddressAndDataIsEqualToReadAddressAndData)
  $info("IFSLAVEWRITE_ADDRANDDATA_ISEQUALTO_SLAVEREAD_ADDRANDDATA : COVERED");

  IFMASTERWRITE_ADDRANDDATA_ISNOTEQUALTO_MASTERREAD_ADDRANDDATA : cover property
  (WhenWriteAddressAndDataIsNotEqualToReadAddressAndData)
  $info("IFMASTERWRITE_ADDRANDDATA_ISNOTEQUALTO_MASTERREAD_ADDRANDDATA : COVERED");

  IFSLAVEWRITE_ADDRANDDATA_ISNOTEQUALTO_SLAVEREAD_ADDRANDDATA : cover property
  (WhenWriteAddressAndDataIsNotEqualToReadAddressAndData)
  $info("IFSLAVEWRITE_ADDRANDDATA_ISNOTEQUALTO_SLAVEREAD_ADDRANDDATA : COVERED");

 `elsif ADDR_WIDTH == 64 &&  DATA_WIDTH == 64

  IFMASTERWRITE_64BITSOF_ADDRANDDATA_ISEQUALTO_MASTERREAD_64BITSOF_ADDRANDDATA : cover property
  (WhenWrite64BitsAddressAndDataIsEqualToRead64BitsAddressAndData)
  $info("IFMASTERWRITE_64BITSOF_ADDRANDDATA_ISEQUALTO_MASTERREAD_64BITSOF_ADDRANDDATA : COVERED");

  IFSLAVEWRITE_64BITSOF_ADDRANDDATA_ISEQUALTO_SLAVEREAD_64BITSOF_ADDRANDDATA : cover property
  (WhenWrite64BitsAddressAndDataIsEqualToRead64BitsAddressAndData)
  $info("IFSLAVEWRITE_64BITSOF_ADDRANDDATA_ISEQUALTO_SLAVEREAD_64BITSOF_ADDRANDDATA : COVERED");

  IFMASTERWRITE_64BITSOF_ADDRANDDATA_ISNOTEQUALTO_MASTERREAD_64BITSOF_ADDRANDDATA : cover property
  (WhenWrite64BitsAddressAndDataIsNotEqualToRead64BitsAddressAndData)
  $info("IFMASTERWRITE_64BITSOF_ADDRANDDATA_ISNOTEQUALTO_MASTERREAD_64BITSOF_ADDRANDDATA : COVERED");

  IFSLAVEWRITE_64BITSOF_ADDRANDDATA_ISNOTEQUALTO_SLAVEREAD_64BITSOF_ADDRANDDATA : cover property
  (WhenWrite64BitsAddressAndDataIsNotEqualToRead64BitsAddressAndData)
  $info("IFSLAVEWRITE_64BITSOF_ADDRANDDATA_ISNOTEQUALTO_SLAVEREAD_64BITSOF_ADDRANDDATA : COVERED");
`endif

endinterface : Axi4LiteCoverProperty

`endif
