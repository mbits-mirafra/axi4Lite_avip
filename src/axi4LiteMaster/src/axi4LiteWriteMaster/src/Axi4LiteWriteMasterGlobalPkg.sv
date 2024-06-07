`ifndef AXI4LITEWRITEMASTERGLOBALPKG_INCLUDED
`define AXI4LITEWRITEMASTERGLOBALPKG_INCLUDED

package Axi4LiteWriteMasterGlobalPkg;

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
    WRITE = 1
  } transactionTypeEnum;

  typedef enum bit[1:0] {
    BLOCKING_WRITE      = 2'b00, 
    NON_BLOCKING_WRITE  = 2'b10 
  }transferTypeEnum;

  typedef struct {
    //Write Address Channel Signals
    bit [ADDRESS_WIDTH-1:0]  awaddr;
    bit [2:0]                awprot;
    bit                      awvalid;
    bit	                     awready;
    //Write Data Channel Signals
    bit [DATA_WIDTH-1:0]     wdata;
    bit [(DATA_WIDTH/8)-1:0] wstrb;
    //Write Response Channel Signals
    bit [1:0] bresp;
    bit       bvalid;
  } axi4LiteWriteMasterTransferPacketStruct;

  typedef struct {
    bit [ADDRESS_WIDTH-1:0] minAddress;
    bit [ADDRESS_WIDTH-1:0] maxAddress;
  } axi4LiteWriteMasterTransferCfgStruct;

endpackage : Axi4LiteWriteMasterGlobalPkg
`endif

