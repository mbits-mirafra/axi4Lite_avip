`ifndef AXI4LITEREADSLAVEGLOBALPKG_INCLUDED
`define AXI4LITEREADSLAVEGLOBALPKG_INCLUDED

package Axi4LiteReadSlaveGlobalPkg;

  parameter bit SLAVE_AGENT_ACTIVE = 1;

  parameter int NO_OF_READSLAVES = 1;

  `define ADDRESS_WIDTH 32
  parameter int ADDRESS_WIDTH = `ADDRESS_WIDTH;

  `define DATA_WIDTH 32
  parameter int DATA_WIDTH = `DATA_WIDTH;

  `define DEFAULT_READY 0
  parameter int DEFAULT_READY = `DEFAULT_READY;

  parameter int DELAY_WIDTH = 5;

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
    READ_DATA_SECURE_UNPRIVILEGED            = 3'b000;  
	  READ_DATA_SECURE_PRIVILEGED              = 3'b001;  
	  READ_DATA_NONSECURE_UNPRIVILEGED         = 3'b010;  
	  READ_DATA_NONSECURE_PRIVILEGED           = 3'b011;  
	  READ_INSTRUCTION_SECURE_UNPRIVILEGED     = 3'b100;  
	  READ_INSTRUCTION_SECURE_PRIVILEGED       = 3'b101;  
	  READ_INSTRUCTION_NONSECURE_UNPRIVILEGED  = 3'b110;  
	  READ_INSTRUCTION_NONSECURE_PRIVILEGED    = 3'b111;  
  } arprotEnum;

  typedef struct {
    //Read Address Channel Signals
    bit [ADDRESS_WIDTH-1:0]  araddr;
    bit [2:0]                arprot;
    bit                      arvalid;
    bit	                     arready;
    //Read Data Channel Signals
    bit [DATA_WIDTH-1:0]     rdata;
    bit [1:0]                rresp;

    int waitCounterForRready;
    bit [DELAY_WIDTH-1:0] delayForArready;
    bit [DELAY_WIDTH-1:0] delayForRvalid;
    int repeatToggleReady;

  } axi4LiteReadSlaveTransferPacketStruct;

  typedef struct {
    bit [ADDRESS_WIDTH-1:0] minAddressRange;
    bit [ADDRESS_WIDTH-1:0] maxAddressRange;
    int maxDelayForRready;
    bit defaultStateReady;
    bit toggleReady;
   } axi4LiteReadSlaveTransferCfgStruct;

endpackage : Axi4LiteReadSlaveGlobalPkg
`endif

