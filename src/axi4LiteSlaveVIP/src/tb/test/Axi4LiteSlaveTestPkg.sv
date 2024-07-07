`ifndef AXI4LITESLAVETESTPKG_INCLUDED_
`define AXI4LITESLAVETESTPKG_INCLUDED_

package Axi4LiteSlaveTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteSlaveGlobalPkg::*;
  import Axi4LiteReadSlaveGlobalPkg::*;
  import Axi4LiteSlaveWriteAssertCoverParameter::*;
  import Axi4LiteSlaveReadAssertCoverParameter::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteSlaveReadPkg::*;
  import Axi4LiteWriteSlaveEnvPkg::*;
  import Axi4LiteReadSlaveEnvPkg::*;
  import Axi4LiteSlaveEnvPkg::*;

  import Axi4LiteSlaveVirtualSeqPkg::*;

  //including base_test for testing
  `include "Axi4LiteSlaveBaseTest.sv"
  `include "Axi4LiteSlaveRandomWriteReadTransferTest.sv"

endpackage : Axi4LiteSlaveTestPkg

`endif
