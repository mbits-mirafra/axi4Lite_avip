`ifndef AXI4LITEWRITEMASTERGLOBALPKG_INCLUDED
`define AXI4LITEWRITEMASTERGLOBALPKG_INCLUDED

package Axi4LiteWriteMasterGlobalPkg;

  parameter bit MASTER_AGENT_ACTIVE = 1;

  parameter int NO_OF_WRITEMASTERS = 1;

  parameter int DELAY_WIDTH = 5;

  `define ADDRESS_WIDTH 32
  parameter int ADDRESS_WIDTH = `ADDRESS_WIDTH;

  `define DATA_WIDTH 32
  parameter int DATA_WIDTH = `DATA_WIDTH;

  `define DEFAULT_BREADY 0
  parameter int DEFAULT_BREADY = `DEFAULT_BREADY;

  parameter int MAXLIMITOF_OUTSTANDINGTX = 10;

  parameter int MIN_ADDRESS = 32'h0000_0000;
  parameter int MAX_ADDRESS = 32'hffff_ffff;

  parameter bit HAS_COVERAGE = 1;
  parameter bit TOGGLE_BREADY = 0;
  parameter bit ENABLE_OUTSTANDINGTX = 0;
  parameter bit NO_OF_OUTSTANDINGTX = 3;

  typedef enum logic [1:0] {
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
    WRITE_DATA_SECURE_UNPRIVILEGED            = 3'b000,  
	  WRITE_DATA_SECURE_PRIVILEGED              = 3'b001,  
	  WRITE_DATA_NONSECURE_UNPRIVILEGED         = 3'b010,  
	  WRITE_DATA_NONSECURE_PRIVILEGED           = 3'b011,  
	  WRITE_INSTRUCTION_SECURE_UNPRIVILEGED     = 3'b100,  
	  WRITE_INSTRUCTION_SECURE_PRIVILEGED       = 3'b101,  
	  WRITE_INSTRUCTION_NONSECURE_UNPRIVILEGED  = 3'b110,  
	  WRITE_INSTRUCTION_NONSECURE_PRIVILEGED    = 3'b111  
  }awprotEnum;

  typedef struct {
    //Write Address Channel Signals
    bit [ADDRESS_WIDTH-1:0]  awaddr;
    bit [2:0]                awprot;
    //Write Data Channel Signals
    bit [DATA_WIDTH-1:0]     wdata;
    bit [(DATA_WIDTH/8)-1:0] wstrb;
    //Write Response Channel Signals
    logic [1:0] bresp;

    int waitCounterForAwready;
    int waitCounterForWready;
    int waitCounterForBvalid;
    bit [DELAY_WIDTH-1:0] delayForAwvalid;
    bit [DELAY_WIDTH-1:0] delayForWvalid;
    bit [DELAY_WIDTH-1:0] delayForBready;
    
    int repeatToggleBready;
  } axi4LiteWriteMasterTransferPacketStruct;

  typedef struct {
    bit [ADDRESS_WIDTH-1:0] minAddressRange;
    bit [ADDRESS_WIDTH-1:0] maxAddressRange;
    int maxDelayForAwready;
    int maxDelayForWready;
    int maxDelayForBvalid;
    bit defaultStateBready;

    bit toggleBready;
  } axi4LiteWriteMasterTransferCfgStruct;

endpackage : Axi4LiteWriteMasterGlobalPkg
`endif

