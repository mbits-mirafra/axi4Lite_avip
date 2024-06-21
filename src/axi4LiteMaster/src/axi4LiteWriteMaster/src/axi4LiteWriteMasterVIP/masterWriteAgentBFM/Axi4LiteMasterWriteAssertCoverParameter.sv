`ifndef AXI4LITEMASTERWRITEASSERTCOVERPARAMETER_INCLUDED
`define AXI4LITEMASTERWRITEASSERTCOVERPARAMETER_INCLUDED

package Axi4LiteMasterWriteAssertCoverParameter;

  parameter int MAX_DELAY_READY = 16;
  parameter int MAX_DELAY_WVALID = 10;
  parameter int MAX_DELAY_BVALID = 12;

  parameter int DEFAULT_READY = 1;

endpackage : Axi4LiteMasterWriteAssertCoverParameter
`endif
