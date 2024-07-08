`ifndef AXI4LITEVIRTUALSEQPKG_INCLUDED_
`define AXI4LITEVIRTUALSEQPKG_INCLUDED_

package Axi4LiteVirtualSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;
  import Axi4LiteSlaveWritePkg::*;
  import Axi4LiteSlaveReadPkg::*;

  import Axi4LiteMasterWriteSeqPkg::*;
  import Axi4LiteMasterReadSeqPkg::*;
  import Axi4LiteSlaveWriteSeqPkg::*;
  import Axi4LiteSlaveReadSeqPkg::*;

  import Axi4LiteMasterVirtualSeqrPkg::*;
  import Axi4LiteSlaveVirtualSeqrPkg::*;

  import Axi4LiteEnvPkg::*;

  `include "Axi4LiteVirtualBaseSeq.sv"
  `include "Axi4LiteVirtualRandomWriteReadTransferSeq.sv"

endpackage : Axi4LiteVirtualSeqPkg

`endif

