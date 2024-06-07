`ifndef AXI4LITEWRITEMASTERGLOBALPKG_INCLUDED
`define AXI4LITEWRITEMASTERGLOBALPKG_INCLUDED

package axi4LiteWriteMasterGlobalPkg;

  parameter bit MASTER_AGENT_ACTIVE = 1;

  parameter int NO_OF_MASTERS = 1;

  parameter int ADDRESS_WIDTH = 32;

  parameter int DATA_WIDTH = 32;

  typedef enum bit {
    BIG_ENDIAN    = 1'b0,
    LITTLE_ENDIAN = 1'b1
  } endianEnum;

 
  typedef enum bit [1:0] {
    WRITE_OKAY   = 2'b00,
    WRITE_EXOKAY = 2'b01,
    WRITE_SLVERR = 2'b10,
    WRITE_DECERR = 2'b11
  } brespEnum;

  typedef enum bit {
    WRITE = 1,
  } transactionTypeEnum;

  typedef enum bit[1:0] {
    BLOCKING_WRITE      = 2'b00, 
    NON_BLOCKING_WRITE  = 2'b10, 
  }transferTypeEnum;

endpackage : axi4LiteWriteMasterGlobalPkg
`endif

