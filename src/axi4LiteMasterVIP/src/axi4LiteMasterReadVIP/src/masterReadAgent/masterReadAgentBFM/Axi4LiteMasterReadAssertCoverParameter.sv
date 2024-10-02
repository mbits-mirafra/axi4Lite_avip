`ifndef AXI4LITEMASTERREADASSERTCOVERPARAMETER_INCLUDED
`define AXI4LITEMASTERREADASSERTCOVERPARAMETER_INCLUDED

package Axi4LiteMasterReadAssertCoverParameter;

  parameter int MAX_DELAY_READY = 16;
  parameter int MAX_DELAY_VALID = 16;
  parameter int MAX_DELAY_RVALID = 10;
  parameter int MAX_DELAY_ARADDR = 10;
  parameter int MAX_DELAY_RREADY = 16;

  parameter int MAX_DELAY_ARVALID = 10;
  parameter int DELAY_FOR_SECOND_TRANSFER = 16;

endpackage : Axi4LiteMasterReadAssertCoverParameter
`endif
