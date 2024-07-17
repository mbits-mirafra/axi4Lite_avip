`ifndef AXI4LITESLAVEREADASSERTCOVERPARAMETER_INCLUDED
`define AXI4LITESLAVEREADASSERTCOVERPARAMETER_INCLUDED

package Axi4LiteSlaveReadAssertCoverParameter;

  parameter int MAX_DELAY_READY = 16;
  parameter int MAX_DELAY_VALID = 16;
  parameter int MAX_DELAY_RVALID = 10;

  parameter int DEFAULT_READY = 1;
  parameter int DELAY_FOR_SECOND_TRANSFER = 16;

endpackage : Axi4LiteSlaveReadAssertCoverParameter
`endif
