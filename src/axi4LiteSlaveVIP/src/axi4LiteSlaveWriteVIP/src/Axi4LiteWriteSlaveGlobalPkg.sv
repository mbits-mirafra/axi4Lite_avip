`ifndef AXI4LITEWRITESLAVEGLOBALPKG_INCLUDED
`define AXI4LITEWRITESLAVEGLOBALPKG_INCLUDED

package Axi4LiteWriteSlaveGlobalPkg;

  parameter bit SLAVE_AGENT_ACTIVE = 1;

  parameter int NO_OF_WRITESLAVES = 1;

  parameter int ADDRESS_WIDTH = 32;

  parameter int DATA_WIDTH = 32;

  parameter int DELAY_WIDTH = 5;

  parameter int DEFAULT_READY = 1;

  parameter int MIN_ADDRESS = 8'h01;
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

    int waitCounterForWvalid;
    int waitCounterForBready;
    bit [DELAY_WIDTH-1:0] delayForAwready;
    bit [DELAY_WIDTH-1:0] delayForWready;
    bit [DELAY_WIDTH-1:0] delayForBvalid;
  } axi4LiteWriteSlaveTransferPacketStruct;

  typedef struct {
    int maxDelayForWvalid;
    int maxDelayForBready;
    bit defaultStateReady;

  } axi4LiteWriteSlaveTransferCfgStruct;

endpackage : Axi4LiteWriteSlaveGlobalPkg 
`endif

