`ifndef AXI4LITESLAVEENVPKG_INCLUDED_
`define AXI4LITESLAVEENVPKG_INCLUDED_

package Axi4LiteSlaveEnvPkg;
  
  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import Axi4LiteWriteSlaveGlobalPkg::*;
  import Axi4LiteReadSlaveGlobalPkg::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteSlaveReadPkg::*;
  import Axi4LiteWriteSlaveEnvPkg::*;
  import Axi4LiteReadSlaveEnvPkg::*;
  import Axi4LiteSlaveVirtualSeqrPkg::*;
  
  `include "Axi4LiteSlaveEnvConfig.sv"
  `include "Axi4LiteSlaveEnv.sv"

endpackage : Axi4LiteSlaveEnvPkg

`endif
