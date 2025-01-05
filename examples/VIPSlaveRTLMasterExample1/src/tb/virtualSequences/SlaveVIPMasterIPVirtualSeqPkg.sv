`ifndef SLAVEVIPMASTERIPVIRTUALSEQPKG_INCLUDED_
`define SLAVEVIPMASTERIPVIRTUALSEQPKG_INCLUDED_

package SlaveVIPMasterIPVirtualSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteWriteMasterGlobalPkg::*;
  import Axi4LiteReadMasterGlobalPkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteSlaveReadPkg::*;

  import Axi4LiteMasterWriteSeqPkg::*;
  import Axi4LiteMasterReadSeqPkg::*;
  import Axi4LiteSlaveWriteSeqPkg::*;
  import Axi4LiteSlaveReadSeqPkg::*;

  import SlaveVIPMasterIPEnvPkg::*;

  `include "SlaveVIPMasterIPVirtualBaseSeq.sv"
  `include "SlaveVIPMasterIPVirtualWriteSeq.sv"
  `include "SlaveVIPMasterIPVirtualReadSeq.sv"
  `include "SlaveVIPMasterIPVirtualWriteFollowedByReadSeq.sv"
  `include "SlaveVIPMasterIPVirtualOutstandingTransactionSeq.sv"

endpackage : SlaveVIPMasterIPVirtualSeqPkg

`endif

