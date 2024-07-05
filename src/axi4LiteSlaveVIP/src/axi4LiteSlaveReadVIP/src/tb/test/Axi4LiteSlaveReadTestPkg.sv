`ifndef AXI4LITESLAVEREADTESTPKG_INCLUDED_
`define AXI4LITESLAVEREADTESTPKG_INCLUDED_

package Axi4LiteSlaveReadTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteReadSlaveGlobalPkg::*;
  import Axi4LiteSlaveReadAssertCoverParameter::*;
  import Axi4LiteSlaveReadPkg::*;
  import Axi4LiteReadSlaveEnvPkg::*;

  import Axi4LiteSlaveReadSeqPkg::*;

  //including base_test for testing
  `include "Axi4LiteSlaveReadBaseTest.sv"
  `include "Axi4LiteSlaveReadRandomTransferTest.sv"

endpackage : Axi4LiteSlaveReadTestPkg

`endif
