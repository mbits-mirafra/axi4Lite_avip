`ifndef AXI4LITEWRITEMASTERGLOBALPKG_INCLUDED
`define AXI4LITEWRITEMASTERGLOBALPKG_INCLUDED

package Axi4LiteWriteMasterGlobalPkg;

  parameter bit MASTER_AGENT_ACTIVE = 1;

  parameter int NO_OF_WRITEMASTERS = 1;

  parameter int ADDRESS_WIDTH = 32;

  parameter int DATA_WIDTH = 32;

  parameter int DELAY_WIDTH = 5;

  parameter int MIN_ADDRESS = 00;
  parameter int MAX_ADDRESS = 8'hff;

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

  typedef enum bit [2:0] {
    WRITE_NORMAL_SECURE_DATA               = 3'b000,
    WRITE_NORMAL_SECURE_INSTRUCTION        = 3'b001,
    WRITE_NORMAL_NONSECURE_DATA            = 3'b010,
    WRITE_NORMAL_NONSECURE_INSTRUCTION     = 3'b011,
    WRITE_PRIVILEGED_SECURE_DATA           = 3'b100,
    WRITE_PRIVILEGED_SECURE_INSTRUCTION    = 3'b101,
    WRITE_PRIVILEGED_NONSECURE_DATA        = 3'b110,
    WRITE_PRIVILEGED_NONSECURE_INSTRUCTION = 3'b111
  } awprotEnum;

  typedef struct {
    //Write Address Channel Signals
    bit [ADDRESS_WIDTH-1:0]  awaddr;
    bit [2:0]                awprot;
    //Write Data Channel Signals
    bit [DATA_WIDTH-1:0]     wdata;
    bit [(DATA_WIDTH/8)-1:0] wstrb;
    //Write Response Channel Signals
    bit [1:0] bresp;

    int waitCounterForAwready;
    int waitCounterForWready;
    int waitCounterForBvalid;
    bit [DELAY_WIDTH-1:0] delayForWvalid;
    bit [DELAY_WIDTH-1:0] delayForBready;
    
  } axi4LiteWriteMasterTransferPacketStruct;

  typedef struct {
    bit [ADDRESS_WIDTH-1:0] minAddressRange;
    bit [ADDRESS_WIDTH-1:0] maxAddressRange;
    int maxDelayForAwready;
    int maxDelayForWready;
    int maxDelayForBvalid;

  } axi4LiteWriteMasterTransferCfgStruct;

endpackage : Axi4LiteWriteMasterGlobalPkg
`endif

