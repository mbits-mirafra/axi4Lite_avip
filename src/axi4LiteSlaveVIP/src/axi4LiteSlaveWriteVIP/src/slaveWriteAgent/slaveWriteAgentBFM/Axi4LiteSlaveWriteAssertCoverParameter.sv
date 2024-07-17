`ifndef AXI4LITESLAVEWRITEASSERTCOVERPARAMETER_INCLUDED
`define AXI4LITESLAVEWRITEASSERTCOVERPARAMETER_INCLUDED

package Axi4LiteSlaveWriteAssertCoverParameter;

  parameter int MAX_DELAY_READY = 16;
  parameter int MAX_DELAY_VALID = 16;
  parameter int MAX_DELAY_WVALID = 10;
  parameter int MAX_DELAY_BVALID = 12;

  parameter int MAX_DELAY_AWADDR = 10;
  parameter int DELAY_FOR_SECOND_TRANSFER = 16;

endpackage : Axi4LiteSlaveWriteAssertCoverParameter
`endif
