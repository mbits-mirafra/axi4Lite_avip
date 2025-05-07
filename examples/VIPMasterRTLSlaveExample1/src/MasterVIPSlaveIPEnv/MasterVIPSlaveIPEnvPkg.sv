`ifndef MASTERVIPSLAVEIPENVPKG_INCLUDED_
`define MASTERVIPSLAVEIPENVPKG_INCLUDED_

package MasterVIPSlaveIPEnvPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteSlaveReadPkg::*;
  import Axi4LiteMasterEnvPkg::*;
  import Axi4LiteSlaveEnvPkg::*;
  import Axi4LiteMasterVirtualSeqrPkg::*;
  import Axi4LiteSlaveVirtualSeqrPkg::*;

  `include "MasterVIPSlaveIPEnvConfig.sv"
  `include "MasterVIPSlaveIPVirtualSequencer.sv"
  `include "MasterVIPSlaveIPScoreboard.sv"
  `include "MasterVIPSlaveIPEnv.sv"

endpackage : MasterVIPSlaveIPEnvPkg

`endif
