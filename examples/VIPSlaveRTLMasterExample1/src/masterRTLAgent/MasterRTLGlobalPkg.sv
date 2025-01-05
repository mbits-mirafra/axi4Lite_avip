`ifndef MASTERRTLGLOBALPKG_INCLUDED
`define MASTERRTLGLOBALPKG_INCLUDED

package MasterRTLGlobalPkg;

  parameter bit AGENT_ACTIVE = 1;

  `define ADDRESS_WIDTH 32
  parameter int ADDRESS_WIDTH = `ADDRESS_WIDTH;

  `define DATA_WIDTH 32
  parameter int DATA_WIDTH = `DATA_WIDTH;

  parameter bit[`ADDRESS_WIDTH:0] MIN_ADDRESS = {`ADDRESS_WIDTH{1'b0}};
  parameter bit[`ADDRESS_WIDTH:0] MAX_ADDRESS = {`ADDRESS_WIDTH{1'b1}};
 
  parameter bit HAS_COVERAGE = 1;

  typedef enum bit {
    WRITE = 1
  } transactionTypeEnum;

  typedef enum logic [2:0] {
    WRITE_DATA_SECURE_UNPRIVILEGED            = 3'b000,  
	  WRITE_DATA_SECURE_PRIVILEGED              = 3'b001,  
	  WRITE_DATA_NONSECURE_UNPRIVILEGED         = 3'b010,  
	  WRITE_DATA_NONSECURE_PRIVILEGED           = 3'b011,  
	  WRITE_INSTRUCTION_SECURE_UNPRIVILEGED     = 3'b100,  
	  WRITE_INSTRUCTION_SECURE_PRIVILEGED       = 3'b101,  
	  WRITE_INSTRUCTION_NONSECURE_UNPRIVILEGED  = 3'b110,  
	  WRITE_INSTRUCTION_NONSECURE_PRIVILEGED    = 3'b111  
  }awprotEnum;

endpackage : MasterRTLGlobalPkg
`endif

