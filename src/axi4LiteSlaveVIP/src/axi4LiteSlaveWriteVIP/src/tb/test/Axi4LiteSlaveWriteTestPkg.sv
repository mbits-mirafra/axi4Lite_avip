`ifndef AXI4LITEWRITESLAVETESTPKG_INCLUDED_
`define AXI4LITEWRITESLAVETESTPKG_INCLUDED_

package Axi4LiteWriteSlaveTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteSlaveGlobalPkg::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteWriteSlaveEnvPkg::*;

  import Axi4LiteSlaveWriteSeqPkg::*;

  //including base_test for testing
  `include "Axi4LiteWriteSlaveBaseTest.sv"
  `include "Axi4LiteSlaveWriteRandomAddressTransferTest.sv"

endpackage : Axi4LiteWriteSlaveTestPkg

`endif
