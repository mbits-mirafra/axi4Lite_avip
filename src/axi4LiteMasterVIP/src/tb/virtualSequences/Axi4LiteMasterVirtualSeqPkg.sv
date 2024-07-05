`ifndef AXI4LITEMASTERVIRTUALSEQPKG_INCLUDED_
`define AXI4LITEMASTERVIRTUALSEQPKG_INCLUDED_

package Axi4LiteMasterVirtualSeqPkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  import Axi4LiteMasterWritePkg::*;
  import Axi4LiteMasterReadPkg::*;

  import Axi4LiteMasterWriteSeqPkg::*;
  import Axi4LiteMasterReadSeqPkg::*;

  import Axi4LiteMasterVirtualSeqrPkg::*;

  import Axi4LiteMasterEnvPkg::*;

  `include "Axi4LiteMasterVirtualBaseSeq.sv"
  `include "Axi4LiteMasterVirtualRandomWriteReadTransferSeq.sv"

endpackage : Axi4LiteMasterVirtualSeqPkg

`endif

