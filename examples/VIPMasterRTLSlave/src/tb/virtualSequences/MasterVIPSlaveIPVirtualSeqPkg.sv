`ifndef MASTERVIPSLAVEIPVIRTUALSEQPKG_INCLUDED_
`define MASTERVIPSLAVEIPVIRTUALSEQPKG_INCLUDED_

package MasterVIPSlaveIPVirtualSeqPkg;

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

  import MasterVIPSlaveIPEnvPkg::*;

  `include "MasterVIPSlaveIPVirtualBaseSeq.sv"
  `include "MasterVIPSlaveIPVirtual32bitsWriteReadSeq.sv"
  `include "MasterVIPSlaveIPVirtual32bitsWriteSeq.sv"
  `include "MasterVIPSlaveIPVirtual32bitsReadSeq.sv"
  `include "MasterVIPSlaveIPVirtualWriteSeq.sv"

endpackage : MasterVIPSlaveIPVirtualSeqPkg

`endif

