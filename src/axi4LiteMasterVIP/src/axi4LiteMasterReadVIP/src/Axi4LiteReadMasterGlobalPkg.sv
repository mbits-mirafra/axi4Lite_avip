`ifndef AXI4LITEREADMASTERGLOBALPKG_INCLUDED
`define AXI4LITEREADMASTERGLOBALPKG_INCLUDED

package Axi4LiteReadMasterGlobalPkg;

  parameter bit MASTER_AGENT_ACTIVE = 1;

  parameter int NO_OF_READMASTERS = 1;

  parameter int DELAY_WIDTH = 5;

  `define ADDRESS_WIDTH 32
  parameter int ADDRESS_WIDTH = `ADDRESS_WIDTH;

  `define DATA_WIDTH 32
  parameter int DATA_WIDTH = `DATA_WIDTH;

  `define DEFAULT_RREADY 0
  parameter int DEFAULT_RREADY = `DEFAULT_RREADY;

  parameter int MAXLIMITOF_OUTSTANDINGTX = 10;

  parameter bit[`ADDRESS_WIDTH:0] MIN_ADDRESS = {`ADDRESS_WIDTH{1'b0}};
  parameter bit[`ADDRESS_WIDTH:0] MAX_ADDRESS = {`ADDRESS_WIDTH{1'b1}};

  parameter bit HAS_COVERAGE = 1;
  parameter bit TOGGLE_RREADY = 0;
  parameter bit ENABLE_OUTSTANDINGTX = 0;
  parameter bit NO_OF_OUTSTANDINGTX = 3;

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

    int waitCounterForArready;
    int waitCounterForRvalid;
    bit [DELAY_WIDTH-1:0] delayForArvalid;
    bit [DELAY_WIDTH-1:0] delayForRready;
    int repeatToggleRready;
  } axi4LiteReadMasterTransferPacketStruct;

  typedef struct {
    bit [ADDRESS_WIDTH-1:0] minAddress;
    bit [ADDRESS_WIDTH-1:0] maxAddress;

    int maxDelayForArready;
    int maxDelayForRvalid;

    bit defaultStateRready;
    bit toggleRready;
  } axi4LiteReadMasterTransferCfgStruct;

endpackage : Axi4LiteReadMasterGlobalPkg
`endif

