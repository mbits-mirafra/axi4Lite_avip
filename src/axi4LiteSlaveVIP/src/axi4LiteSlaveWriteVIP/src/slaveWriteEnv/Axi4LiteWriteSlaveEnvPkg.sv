`ifndef AXI4LITEWRITESLAVEENVPKG_INCLUDED_
`define AXI4LITEWRITESLAVEENVPKG_INCLUDED_

package Axi4LiteWriteSlaveEnvPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import Axi4LiteWriteSlaveGlobalPkg::*;
  import Axi4LiteSlaveWritePkg::*;
  
  `include "Axi4LiteWriteSlaveEnvConfig.sv"
  `include "Axi4LiteWriteSlaveEnv.sv"

endpackage : Axi4LiteWriteSlaveEnvPkg

`endif
