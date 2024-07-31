`ifndef AXI4LITEMASTERWRITEASSERTCOVERPARAMETER_INCLUDED
`define AXI4LITEMASTERWRITEASSERTCOVERPARAMETER_INCLUDED

package Axi4LiteMasterWriteAssertCoverParameter;

  parameter int MAX_DELAY_READY = 16;
  parameter int MAX_DELAY_VALID = 16;
  parameter int MAX_DELAY_WVALID = 10;
  parameter int MAX_DELAY_BVALID = 12;

  parameter int MAX_DELAY_AWVALID = 10;
  parameter int DELAY_FOR_SECOND_TRANSFER = 16;

endpackage : Axi4LiteMasterWriteAssertCoverParameter
`endif
