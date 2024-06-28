`ifndef AXI4LITEREADSLAVEENVPKG_INCLUDED_
`define AXI4LITEREADSLAVEENVPKG_INCLUDED_

package Axi4LiteReadSlaveEnvPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import Axi4LiteReadSlaveGlobalPkg::*;
  import Axi4LiteSlaveReadPkg::*;
  
  `include "Axi4LiteReadSlaveEnvConfig.sv"
  `include "Axi4LiteReadSlaveEnv.sv"

endpackage : Axi4LiteReadSlaveEnvPkg

`endif
