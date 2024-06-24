`ifndef AXI4LITEWRITEMASTERENVPKG_INCLUDED_
`define AXI4LITEWRITEMASTERENVPKG_INCLUDED_

package Axi4LiteWriteMasterEnvPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteMasterWritePkg::*;
  
  `include "Axi4LiteWriteMasterEnvConfig.sv"
  `include "Axi4LiteWriteMasterEnv.sv"

endpackage : Axi4LiteWriteMasterEnvPkg

`endif
