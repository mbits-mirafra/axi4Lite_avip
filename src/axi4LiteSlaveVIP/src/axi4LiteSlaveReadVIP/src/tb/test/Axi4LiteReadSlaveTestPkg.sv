`ifndef AXI4LITEREADSLAVETESTPKG_INCLUDED_
`define AXI4LITEREADSLAVETESTPKG_INCLUDED_

package Axi4LiteReadSlaveTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteReadSlaveGlobalPkg::*;
  import Axi4LiteSlaveReadPkg::*;
  import Axi4LiteReadSlaveEnvPkg::*;

  import Axi4LiteSlaveReadSeqPkg::*;

  //including base_test for testing
  `include "Axi4LiteReadSlaveBaseTest.sv"
  `include "Axi4LiteSlaveReadRandomAddressTransferTest.sv"

endpackage : Axi4LiteReadSlaveTestPkg

`endif
