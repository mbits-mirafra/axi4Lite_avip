`ifndef AXI4LITEWRITESLAVEGLOBALPKG_INCLUDED
`define AXI4LITEWRITESLAVEGLOBALPKG_INCLUDED

package Axi4LiteWriteSlaveGlobalPkg;

  parameter bit SLAVE_AGENT_ACTIVE = 1;

  parameter int NO_OF_WRITESLAVES = 1;

  `define ADDRESS_WIDTH 32
  parameter int ADDRESS_WIDTH = `ADDRESS_WIDTH;

  `define DATA_WIDTH 32
  parameter int DATA_WIDTH = `DATA_WIDTH;

  `define DEFAULT_AWREADY 0
  parameter int DEFAULT_AWREADY = `DEFAULT_AWREADY;

  `define DEFAULT_WREADY 0
  parameter int DEFAULT_WREADY = `DEFAULT_WREADY;

  parameter int DELAY_WIDTH = 5;

  parameter int MIN_ADDRESS = 32'h0000_0000;
  parameter int MAX_ADDRESS = 32'hffff_ffff;

  typedef enum logic [1:0] {
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
    WRITE_DATA_SECURE_UNPRIVILEGED            = 3'b000,  
	  WRITE_DATA_SECURE_PRIVILEGED              = 3'b001,  
	  WRITE_DATA_NONSECURE_UNPRIVILEGED         = 3'b010,  
	  WRITE_DATA_NONSECURE_PRIVILEGED           = 3'b011,  
	  WRITE_INSTRUCTION_SECURE_UNPRIVILEGED     = 3'b100,  
	  WRITE_INSTRUCTION_SECURE_PRIVILEGED       = 3'b101,  
	  WRITE_INSTRUCTION_NONSECURE_UNPRIVILEGED  = 3'b110,  
	  WRITE_INSTRUCTION_NONSECURE_PRIVILEGED    = 3'b111  
  } awprotEnum;

  typedef struct {
    //Write Address Channel Signals
    bit [ADDRESS_WIDTH-1:0]  awaddr;
    bit [2:0]                awprot;
    //Write Data Channel Signals
    bit [DATA_WIDTH-1:0]     wdata;
    bit [(DATA_WIDTH/8)-1:0] wstrb;
    //Write Response Channel Signals
    logic [1:0] bresp;

    int waitCounterForWvalid;
    int waitCounterForBready;
    bit [DELAY_WIDTH-1:0] delayForAwready;
    bit [DELAY_WIDTH-1:0] delayForWready;
    bit [DELAY_WIDTH-1:0] delayForBvalid;
    int repeatToggleAwready;
    int repeatToggleWready;
  } axi4LiteWriteSlaveTransferPacketStruct;

  typedef struct {
    int maxDelayForWvalid;
    int maxDelayForBready;
    bit defaultStateAwready;
    bit defaultStateWready;

    bit [ADDRESS_WIDTH-1:0] maxAddressRange;
    bit [ADDRESS_WIDTH-1:0] minAddressRange;

    bit toggleAwready;
    bit toggleWready;

  } axi4LiteWriteSlaveTransferCfgStruct;

endpackage : Axi4LiteWriteSlaveGlobalPkg 
`endif

