`ifndef AXI4LITEREADMASTERGLOBALPKG_INCLUDED
`define AXI4LITEREADMASTERGLOBALPKG_INCLUDED

package Axi4LiteReadMasterGlobalPkg;

  parameter bit MASTER_AGENT_ACTIVE = 1;

  parameter int NO_OF_READMASTERS = 1;

  `ifdef ADDR_WIDTH_32
    `define ADDRESS_WIDTH 32
      parameter int ADDRESS_WIDTH = `ADDRESS_WIDTH;
  `elsif ADDR_WIDTH_64
    `define ADDRESS_WIDTH 64
      parameter int ADDRESS_WIDTH = `ADDRESS_WIDTH;
  `endif

  `ifdef DATA_WIDTH_32
    `define DATA_WIDTH 32
      parameter int DATA_WIDTH = `DATA_WIDTH;
  `elsif DATA_WIDTH_64
    `define DATA_WIDTH 64
      parameter int DATA_WIDTH = `DATA_WIDTH;
  `endif

  parameter int DELAY_WIDTH = 5;

  `ifdef DEFAULT_READY_1
    `define DEFAULT_READY 1
      parameter int DEFAULT_READY = `DEFAULT_READY;
  `elsif DEFAULT_READY_0
    `define DEFAULT_READY 0
      parameter int DEFAULT_READY = `DEFAULT_READY;
  `endif

  parameter int MIN_ADDRESS = 8'h01;
  parameter int MAX_ADDRESS = 8'hff;

  typedef enum bit {
    BIG_ENDIAN    = 1'b0,
    LITTLE_ENDIAN = 1'b1
  } endianEnum;

 
  typedef enum bit [1:0] {
    READ_OKAY   = 2'b00,
    READ_EXOKAY = 2'b01,
    READ_SLVERR = 2'b10,
    READ_DECERR = 2'b11
  } rrespEnum;

  typedef enum bit {
    READ = 0
  } transactionTypeEnum;

  typedef enum bit[1:0] {
    BLOCKING_READ      = 2'b01, 
    NON_BLOCKING_READ  = 2'b11 
  }transferTypeEnum;

  typedef enum bit [2:0] {
    READ_NORMAL_SECURE_DATA               = 3'b000,
    READ_NORMAL_SECURE_INSTRUCTION        = 3'b001,
    READ_NORMAL_NONSECURE_DATA            = 3'b010,
    READ_NORMAL_NONSECURE_INSTRUCTION     = 3'b011,
    READ_PRIVILEGED_SECURE_DATA           = 3'b100,
    READ_PRIVILEGED_SECURE_INSTRUCTION    = 3'b101,
    READ_PRIVILEGED_NONSECURE_DATA        = 3'b110,
    READ_PRIVILEGED_NONSECURE_INSTRUCTION = 3'b111
  } arprotEnum;

  typedef struct {
    //Read Address Channel Signals
    bit [ADDRESS_WIDTH-1:0]  araddr;
    bit [2:0]                arprot;
    bit                      arvalid;
    bit	                     arready;
    //Read Data Channel Signals
    bit [DATA_WIDTH-1:0]     rdata;
    bit [1:0]                 rresp;

    int waitCounterForArready;
    int waitCounterForRvalid;
    bit [DELAY_WIDTH-1:0] delayForArvalid;
    bit [DELAY_WIDTH-1:0] delayForRready;
    int repeatToggleReady;
  } axi4LiteReadMasterTransferPacketStruct;

  typedef struct {
    bit [ADDRESS_WIDTH-1:0] minAddress;
    bit [ADDRESS_WIDTH-1:0] maxAddress;

    int maxDelayForArready;
    int maxDelayForRvalid;

    bit defaultStateReady;
    bit toggleReady;
  } axi4LiteReadMasterTransferCfgStruct;

endpackage : Axi4LiteReadMasterGlobalPkg
`endif

