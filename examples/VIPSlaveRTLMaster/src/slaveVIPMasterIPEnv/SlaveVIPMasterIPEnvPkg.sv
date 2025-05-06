`ifndef SLAVEVIPMASTERIPENVPKG_INCLUDED_
`define SLAVEVIPMASTERIPENVPKG_INCLUDED_

package SlaveVIPMasterIPEnvPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  import MasterRTLPkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteSlaveReadPkg::*;
  import Axi4LiteMasterEnvPkg::*;
  import Axi4LiteSlaveEnvPkg::*;
  import Axi4LiteMasterVirtualSeqrPkg::*;
  import Axi4LiteSlaveVirtualSeqrPkg::*;

  `include "SlaveVIPMasterIPEnvConfig.sv"
  `include "SlaveVIPMasterIPVirtualSequencer.sv"
  `include "SlaveVIPMasterIPScoreboard.sv"
  `include "SlaveVIPMasterIPEnv.sv"

endpackage : SlaveVIPMasterIPEnvPkg

`endif
