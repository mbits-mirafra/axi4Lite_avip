`ifndef AXI4LITEREADSLAVEGLOBALPKG_INCLUDED
`define AXI4LITEREADSLAVEGLOBALPKG_INCLUDED

package Axi4LiteReadSlaveGlobalPkg;

  parameter bit SLAVE_AGENT_ACTIVE = 1;

  parameter int NO_OF_READSLAVES = 1;

  `define ADDRESS_WIDTH 32
  parameter int ADDRESS_WIDTH = `ADDRESS_WIDTH;

  `define DATA_WIDTH 32
  parameter int DATA_WIDTH = `DATA_WIDTH;

  `define DEFAULT_ARREADY 0
  parameter int DEFAULT_ARREADY = `DEFAULT_ARREADY;

  parameter int DELAY_WIDTH = 5;

  parameter int MIN_ADDRESS = 32'h0000_0000;
  parameter int MAX_ADDRESS = 32'hffff_ffff;

  parameter bit HAS_COVERAGE = 1;
  parameter bit TOGGLE_ARREADY = 0;
  parameter bit ENABLE_OUTSTANDINGTX = 0;

  typedef enum logic [1:0] {
    READ_OKAY   = 2'b00,
    READ_EXOKAY = 2'b01,
    READ_SLVERR = 2'b10,
    READ_DECERR = 2'b11
  } rrespEnum;

  typedef enum bit {
    READ = 0
  } transactionTypeEnum;

  typedef enum logic [2:0] {
    READ_DATA_SECURE_UNPRIVILEGED            = 3'b000,  
	  READ_DATA_SECURE_PRIVILEGED              = 3'b001,  
	  READ_DATA_NONSECURE_UNPRIVILEGED         = 3'b010,  
	  READ_DATA_NONSECURE_PRIVILEGED           = 3'b011,  
	  READ_INSTRUCTION_SECURE_UNPRIVILEGED     = 3'b100,  
	  READ_INSTRUCTION_SECURE_PRIVILEGED       = 3'b101,  
	  READ_INSTRUCTION_NONSECURE_UNPRIVILEGED  = 3'b110,  
	  READ_INSTRUCTION_NONSECURE_PRIVILEGED    = 3'b111  
  } arprotEnum;

  typedef struct {
    //Read Address Channel Signals
    logic [ADDRESS_WIDTH-1:0]  araddr;
    logic [2:0]                arprot;
    logic                      arvalid;
    logic	                     arready;
    //Read Data Channel Signals
    logic [DATA_WIDTH-1:0]     rdata;
    logic [1:0]                rresp;

    int waitCounterForRready;
    bit [DELAY_WIDTH-1:0] delayForArready;
    bit [DELAY_WIDTH-1:0] delayForRvalid;
    int repeatToggleArready;

  } axi4LiteReadSlaveTransferPacketStruct;

  typedef struct {
    bit [ADDRESS_WIDTH-1:0] minAddressRange;
    bit [ADDRESS_WIDTH-1:0] maxAddressRange;
    int maxDelayForRready;
    bit defaultStateArready;
    bit toggleArready;
   } axi4LiteReadSlaveTransferCfgStruct;

endpackage : Axi4LiteReadSlaveGlobalPkg
`endif

