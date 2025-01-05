module master #(parameter DATA_WIDTH = 32,
             parameter ADDRESS_WIDTH = 32)(

		input clk,    // Clock
		input rst_n,  // Asynchronous reset active low
        input wr_en,
        input rd_en,
        
		// Address write channel
		   input  awready,
		   output reg awvalid,
		   output reg [ADDRESS_WIDTH-1:0]awaddr,

		// Data write channel
		   input  wready,
		   output reg wvalid,
		   output reg [(DATA_WIDTH/8)-1:0]wstrb,
		   output reg [DATA_WIDTH-1:0]wdata,

		// Write response channel
		   input [1:0] bresp,
		   input  bvalid,
		   output reg bready,

		// Read address channel
		   input  arready,
		   output reg [ADDRESS_WIDTH-1:0]araddr,
		   output reg arvalid,

		// read data channel
		   input  [DATA_WIDTH-1:0]rdata,
		   input  rvalid,
		   input [1:0] rresp,
		   output reg rready,

		// user signals 
			input   [ADDRESS_WIDTH-1:0] awaddr_in,
			input	[(DATA_WIDTH/8)-1:0]   wstrb_in,
			input	[DATA_WIDTH-1:0]	wdata_in,
			input	[ADDRESS_WIDTH-1:0] araddr_in,
			output	reg [DATA_WIDTH-1:0] data_out,
			output  reg [1:0]bresp_out,
			output  [1:0]rresp_out
	   );

    //***************************Memory****************************
    assign rresp_out = rresp;
    assign bresp_out = bresp;
    
    //***************************Write addresss channel******************************
    localparam WA_IDLE_M = 2'b00, WA_VALID_M = 2'b01, WA_ADDR_M = 2'b10, WA_WAIT_M = 2'b11;
    reg [1:0] WA_PRESENT_STATE_M;
    reg [1:0] WA_NEXT_STATE_M;

    //****************************Write address channel********************************
    	//State register
	    always @(posedge clk or negedge rst_n) begin
	    	if(~rst_n) begin
	    		WA_PRESENT_STATE_M <= WA_IDLE_M;
	    	end else begin
	    		WA_PRESENT_STATE_M <= WA_NEXT_STATE_M;
	    	end
	    end

	//Next state logic
	always @* begin
		case (WA_PRESENT_STATE_M)

			WA_IDLE_M : if(wr_en)
			                WA_NEXT_STATE_M = WA_VALID_M;
			            else
			                WA_NEXT_STATE_M = WA_IDLE_M;

			WA_VALID_M:	if((awaddr_in >= 32'h00000000) && (awaddr_in < 32'hffffffff))
							WA_NEXT_STATE_M = WA_ADDR_M;
						else
							WA_NEXT_STATE_M = WA_VALID_M;

			WA_ADDR_M :	if(awready)
							WA_NEXT_STATE_M = WA_WAIT_M;
						else
							WA_NEXT_STATE_M = WA_ADDR_M;

			WA_WAIT_M :	if(awvalid && awready)
							WA_NEXT_STATE_M = WA_IDLE_M;
						else 
							WA_NEXT_STATE_M = WA_WAIT_M;

			default : 		WA_NEXT_STATE_M = WA_IDLE_M;
		endcase
	end

	//output logic
	always @(posedge clk or negedge rst_n) begin
		if (~rst_n) begin
			awvalid <= 1'b0;
            awaddr <= 'b0;
		end else case (WA_NEXT_STATE_M)

				WA_IDLE_M :	awvalid <= 1'b0;

				WA_VALID_M: awvalid <= 1'b0;
                             
				WA_ADDR_M : begin awvalid <= 1'b1;
							awaddr <= awaddr_in; end
				
				WA_WAIT_M : awvalid <= 1'b0 ;

				default	  :	begin awvalid <= 1'b0;
                                  awaddr <= awaddr;
                            end
			endcase
		end

	//************************Write data channel*****************************
	localparam W_IDLE_M = 2'b00, W_START_M = 2'b01, W_WAIT_M = 2'b10, W_TRAN_M = 2'b11;
	reg [1:0] W_PRESENT_STATE_M;
    reg [1:0] W_NEXT_STATE_M;

    //State register
	always @(posedge clk or negedge rst_n) begin
	  	if(~rst_n) begin
	   		W_PRESENT_STATE_M <= W_IDLE_M;
	   	end else begin
	   		W_PRESENT_STATE_M<= W_NEXT_STATE_M;
	   	end
	end

	//Next state logic
	always @* begin
		case (W_PRESENT_STATE_M)
			
			W_IDLE_M : if(~rst_n)
						W_NEXT_STATE_M = W_IDLE_M;
					else
						W_NEXT_STATE_M = W_START_M;

			W_START_M: if(awvalid && awready)
						W_NEXT_STATE_M = W_WAIT_M;
					else
						W_NEXT_STATE_M = W_START_M;

			W_WAIT_M : if(wready)
						W_NEXT_STATE_M = W_TRAN_M;
					else
						W_NEXT_STATE_M = W_WAIT_M;

			W_TRAN_M : if(wvalid && wready)
						W_NEXT_STATE_M = W_TRAN_M;
					else
						W_NEXT_STATE_M = W_IDLE_M;

			default :	W_NEXT_STATE_M = W_IDLE_M;
		endcase
	end

	//output logic
	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin

			wvalid  <= 1'b0;
            wdata <= 'b0;
            wstrb <= 'b0;
		end else begin

			case (W_PRESENT_STATE_M)
			
				W_IDLE_M : wvalid  <= 1'b0;

				W_START_M: wvalid  <= 1'b0;
							
				W_WAIT_M : begin
							wvalid  <= 1'b1;
							wstrb <= wstrb_in;
							wdata <= wdata_in;
						   end

				W_TRAN_M : wvalid  <= 1'b0;

				default  : begin wvalid  <= 1'b0;
				                 wstrb <= wstrb;
				                 wdata <= wdata;
                           end
			endcase
		end		
	end


	//*************************Write response channel****************************
	localparam B_IDLE_M = 2'b00, B_START_M = 2'b01, B_READY_M = 2'b10;
	reg [1:0] B_PRESENT_STATE_M;
	reg [1:0] B_NEXT_STATE_M;

	//State Register
	always_ff @(posedge clk or negedge rst_n) begin
	 	if(~rst_n) begin
	 		B_PRESENT_STATE_M <= B_IDLE_M;
	 	end else begin
	 		B_PRESENT_STATE_M <= B_NEXT_STATE_M;
	 	end
	 end 

	//Next state logic
	always @* begin
	 	
	 	case (B_PRESENT_STATE_M)
	 		
	 		B_IDLE_M : if(~rst_n)
	 						B_NEXT_STATE_M = B_IDLE_M;
	 					else
	 						B_NEXT_STATE_M = B_START_M;

	 		B_START_M: if(wvalid && wready)
	 						B_NEXT_STATE_M = B_READY_M;
	 					else
	 						B_NEXT_STATE_M = B_START_M;

	 		B_READY_M: 	if(bvalid && bready)
	 						B_NEXT_STATE_M = B_READY_M;
	 					else
	 						B_NEXT_STATE_M = B_IDLE_M;

	 		default  : B_NEXT_STATE_M = B_IDLE_M;
	 	endcase
	end

	//output logic 
	always @(posedge clk or negedge rst_n) begin

		if (~rst_n) begin

			bready <= 1'b0;

		end else case (B_PRESENT_STATE_M)

			B_IDLE_M : bready <= 1'b0;

			B_START_M: bready <= 1'b0;

			B_READY_M: bready <= 1'b1;

			default  : bready <= 1'b0;

		endcase
	end

	//***************************Read address channel******************************
	localparam RA_IDLE_M = 2'b00, RA_START_M = 2'b01, RA_VALID_M = 2'b10, RA_READY_M = 2'b11;
	reg [1:0] RA_PRESENT_STATE_M;
	reg [1:0] RA_NEXT_STATE_M;

	//State Register
	always_ff @(posedge clk or negedge rst_n) begin
	 	if(~rst_n) begin
	 		RA_PRESENT_STATE_M <= RA_IDLE_M;
	 	end else begin
	 		RA_PRESENT_STATE_M <= RA_NEXT_STATE_M;
	 	end
	 end

	 //Next state logic
	 always @* begin
	 	case (RA_PRESENT_STATE_M)
	 	    RA_IDLE_M :	if(rd_en)
			                RA_NEXT_STATE_M = RA_START_M;
			            else
			                RA_NEXT_STATE_M = RA_IDLE_M;

	 		RA_START_M: if((araddr_in > 32'h00000000) && (araddr_in < 32'hffffffff))
	 						RA_NEXT_STATE_M = RA_VALID_M;
	 					else
	 						RA_NEXT_STATE_M = RA_START_M; 
	 							 		
            RA_VALID_M: if(arready)
	 						RA_NEXT_STATE_M = RA_READY_M;
	 					else
	 						RA_NEXT_STATE_M = RA_VALID_M;
	 		
	 		RA_READY_M: if(!(arvalid && arready))
	 						RA_NEXT_STATE_M = RA_READY_M;
	 					else
	 						RA_NEXT_STATE_M = RA_IDLE_M;

	 		default   : 	RA_NEXT_STATE_M = RA_IDLE_M;
	 	endcase
	 end

	 //output logic
	 always@(posedge clk or negedge rst_n) begin
	 	if (~rst_n) begin

	 		arvalid <= 1'b0;
	 		araddr <= 'b0;

	 	end else case (RA_PRESENT_STATE_M)
	 		
	 		RA_IDLE_M : arvalid <= 1'b0;

	 		RA_START_M: arvalid <= 1'b0;

	 		RA_VALID_M: begin 
	 		             if(arvalid && arready)arvalid <= 1'b0;
	 		             else arvalid <= 1'b1;
                         araddr <= araddr_in;
                        end 
            RA_READY_M: arvalid <= 1'b0;
                      
	 		default : begin arvalid <= 1'b0;
	 		                araddr <= araddr;
	 		          end
	 	endcase
	 end


	 //***************************Read data channel********************************
	 localparam R_IDLE_M = 2'b00, R_START_M = 2'b01, R_READY_M = 2'b10, R_TRAN_M = 2'b11;
	 reg [1:0] R_PRESENT_STATE_M;
	 reg [1:0] R_NEXT_STATE_M;

	 //State Register
	 always @(posedge clk or negedge rst_n) begin
	 	if(~rst_n) begin
	 		R_PRESENT_STATE_M <= R_IDLE_M;
	 	end else begin
	 		R_PRESENT_STATE_M <= R_NEXT_STATE_M;
	 	end
	 end

	 //Next state logic
	 always@* begin
	 	case (R_PRESENT_STATE_M)
	 		R_IDLE_M : if(~rst_n)
	 						R_NEXT_STATE_M = R_IDLE_M;
	 					else
	 						R_NEXT_STATE_M = R_READY_M;

	 		R_START_M: if(arready && arvalid)
	 						R_NEXT_STATE_M = R_READY_M;
	 					else
	 						R_NEXT_STATE_M = R_START_M;

	 		R_READY_M: if(rready)
	 						R_NEXT_STATE_M = R_TRAN_M;
	 					else
	 						R_NEXT_STATE_M = R_READY_M;

	 		R_TRAN_M : if(!(rvalid && rready))
	 						R_NEXT_STATE_M = R_IDLE_M;
	 					else
	 						R_NEXT_STATE_M = R_TRAN_M;

	 		default  : 		R_NEXT_STATE_M = R_IDLE_M;
	 	endcase
	 end

	 //output logic
	 always_ff @(posedge clk or negedge rst_n) begin
	 	if (~rst_n) begin

	 		rready <= 1'b0;
	 		data_out <= 'b0;

	 	end else case (R_PRESENT_STATE_M)
	 		
	 		R_IDLE_M : rready <= 1'b0;

	 		R_START_M: rready <= 1'b0;

	 		R_READY_M: rready <= 1'b1;

	 		R_TRAN_M : begin
	 					rready <= 1'b0;
	 					data_out<= rdata;
	 				   end

	 		default  : begin rready <= 1'b0;
	 		                 data_out <= data_out; 
	 		           end
	 	endcase
	 end
	 
endmodule : master

