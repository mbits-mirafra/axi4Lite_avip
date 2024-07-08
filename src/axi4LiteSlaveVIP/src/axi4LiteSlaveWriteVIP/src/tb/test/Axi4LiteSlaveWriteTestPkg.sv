`ifndef AXI4LITESLAVETEWRITESTPKG_INCLUDED_
`define AXI4LITESLAVETEWRITESTPKG_INCLUDED_

package Axi4LiteSlaveWriteTestPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteSlaveGlobalPkg::*;
  import Axi4LiteSlaveWriteAssertCoverParameter::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteWriteSlaveEnvPkg::*;

  import Axi4LiteSlaveWriteSeqPkg::*;

  //including base_test for testing
  `include "Axi4LiteSlaveWriteBaseTest.sv"
  `include "Axi4LiteSlaveWriteRandomTransferTest.sv"
  `include "Axi4LiteSlaveWriteDelayForAwreadyTest.sv"

endpackage : Axi4LiteSlaveWriteTestPkg

`endif
