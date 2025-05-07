 module slave #( parameter DATA_WIDTH = 32,
                 parameter ADDRESS_WIDTH = 32 )(
             
		input clk,    // Clock
		input rst_n,  // Asynchronous reset active low
	
		// Address write channel
		   output reg awready,
		   input  awvalid,
		   input  [ADDRESS_WIDTH-1:0]awaddr,

		// Data write channel
		   output reg wready,
		   input  wvalid,
		   input  [(DATA_WIDTH/8)-1:0]wstrb,
		   input  [DATA_WIDTH-1:0]wdata,

		// Write response channel
		   output reg [1:0] bresp,
		   output reg bvalid,
		   input  bready,

		// Read address channel
		   output reg arready,
		   input  [ADDRESS_WIDTH-1:0]araddr,
		   input  arvalid,

		// read data channel
		   output reg [DATA_WIDTH-1:0]rdata,
		   output reg [1:0]rresp,
		   output reg rvalid,
		   input  rready
	);
        
//***********************memory***********************
    (*ram_style="block"*) reg [31:0] slave_mem[7:0];
	reg [ADDRESS_WIDTH-1:0] awaddr_reg;
	reg [ADDRESS_WIDTH-1:0] araddr_reg;
    reg wr_success;
    reg rd_success;
//**************write address channel*****************
	localparam WA_IDLE_S = 2'b00, WA_START_S = 2'b01, WA_READY_S = 2'b10;
	reg [1:0] WA_PRESENT_STATE_S;
	reg [1:0] WA_NEXT_STATE_S;

	//State register
	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			WA_PRESENT_STATE_S <= WA_IDLE_S;
		end else begin
			WA_PRESENT_STATE_S <= WA_NEXT_STATE_S;
		end
	end

	//Next state logic
	always@* begin
        case (WA_PRESENT_STATE_S)
    
            WA_IDLE_S : if (awvalid)
                            WA_NEXT_STATE_S = WA_START_S;
                        else
                            WA_NEXT_STATE_S = WA_IDLE_S;
    
            WA_START_S: 	WA_NEXT_STATE_S = WA_READY_S;
    
            WA_READY_S: 	WA_NEXT_STATE_S = WA_IDLE_S;
    
            default   :		WA_NEXT_STATE_S = WA_IDLE_S;
        endcase
	end

	//output logic
	always @(posedge clk or negedge rst_n) begin
		if (~rst_n) begin
			awready <= 1'b0;
			awaddr_reg <= 'b0; end
		else begin
			case (WA_PRESENT_STATE_S)
				WA_IDLE_S : awready <= 1'b0;

				WA_START_S: begin 
							 awready <= 1'b1;
							 awaddr_reg <= awaddr; //storing write address in temp memory
							end

				WA_READY_S: awready <= 1'b0;

				default   : begin awready <= 1'b0;
				                  awaddr_reg <= awaddr_reg; end
			endcase
		end
	end

//**************************Write data channel*******************************
	localparam W_IDLE_S = 2'b00, W_READY_S = 2'b01, W_TRAN_S = 2'b10;
	reg [1:0] W_PRESENT_STATE_S;
	reg [1:0] W_NEXT_STATE_S;

	//State register
	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			W_PRESENT_STATE_S <= W_IDLE_S;
		end else begin
			W_PRESENT_STATE_S <= W_NEXT_STATE_S;
		end
	end

	//next state logic
	always @* begin
		case(W_PRESENT_STATE_S)
			
			W_IDLE_S :	if(awready && awvalid)
							W_NEXT_STATE_S = W_READY_S;
						else
							W_NEXT_STATE_S = W_IDLE_S;

			W_READY_S:	if(wvalid)
							W_NEXT_STATE_S = W_TRAN_S;
						else
							W_NEXT_STATE_S = W_READY_S;

			W_TRAN_S:	W_NEXT_STATE_S = W_IDLE_S;

			default : 	W_NEXT_STATE_S = W_IDLE_S;
		endcase
	end

	//output logic
	always @(posedge clk or negedge rst_n) 
	begin
		if (~rst_n) begin
			wready <= 1'b0;
			//memory reset
			for (int i = 0; i < (1 << ADDRESS_WIDTH) ; i++) begin
				slave_mem[i] <= {DATA_WIDTH{1'b0}};
			end
		end else begin
			case (W_PRESENT_STATE_S)
			
				W_IDLE_S : wready <= 1'b0;

				W_READY_S: wready <= 1'b1;

				W_TRAN_S : begin wready <= 1'b0;
                                for (int i = 0; i < (DATA_WIDTH/8) ; i++) begin
                                    if(wstrb[i])
                                        slave_mem[awaddr_reg][(i*8)+:8] <= wdata[i*8+:8];  
                                end
//								 if (wstrb[0])
//								    	slave_mem[awaddr_reg][7:0] <= wdata[7:0];

//								 if (wstrb[1])
//								    	slave_mem[awaddr_reg][15:8] <= wdata[15:8];

//								 if (wstrb[2])
//								    	slave_mem[awaddr_reg][23:16] <= wdata[23:16];
		
//								 if (wstrb[3])
//								    	slave_mem[awaddr_reg][31:24] <= wdata[31:24];
					       end
				default : begin wready <= 1'b0;
				          slave_mem[awaddr_reg] <= slave_mem[awaddr_reg]; end
			endcase	
		end
	end

	//*********************Write response channel***********************
	localparam B_IDLE_S = 2'b00, B_START_S = 2'b01, B_READY_S = 2'b10;
	reg [1:0] B_PRESENT_STATE_S;
	reg [1:0] B_NEXT_STATE_S;

	//State register
	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			B_PRESENT_STATE_S <= B_IDLE_S;
		end else begin
			B_PRESENT_STATE_S <= B_NEXT_STATE_S;
		end
	end

	//Next state logic
	always @* begin
		case (B_PRESENT_STATE_S)

			B_IDLE_S: if(wready)
						B_NEXT_STATE_S = B_START_S;
					  else
					  	B_NEXT_STATE_S = B_IDLE_S;

			B_START_S:  B_NEXT_STATE_S = B_READY_S;

			B_READY_S:  B_NEXT_STATE_S = B_IDLE_S;

			default :   B_NEXT_STATE_S = B_IDLE_S;

		endcase
	end

	//output logic 
	always@(posedge clk or negedge rst_n)
	begin
	   if (~rst_n)
		begin
			bvalid <= 1'b0;
			bresp  <= 2'b00;
			wr_success <= 'b0;
		end else
		case (B_PRESENT_STATE_S)
			B_IDLE_S:	begin
							bvalid <= 1'b0;
						end

			B_START_S:	begin
							bvalid <= 1'b1;
						end

			B_READY_S:	begin
							bvalid <= 1'b0;
					      if(bvalid && bready)
					       wr_success <= 1'b1;
					       case({wr_success,rd_success})
					           2'b11 : bresp  <= 2'b00;
					           2'b01 : bresp  <= 2'b01;
					           2'b10 : bresp  <= 2'b01;
					           2'b00 : bresp  <= 2'b10;
					           default: bresp <= 2'b00;
					       endcase
						end 

			default : 	begin
							bvalid <= 1'b0;
							bresp <= 2'b00;
							wr_success <= wr_success;
						end
		endcase
		//display memory data of all location
        foreach(slave_mem[i,j])
        $display("Time=%0t wdata at slave[%0d][%0d]= [%0d]",$time,i,j,slave_mem[i][j]);
	end
	//***************************Read address channel*******************************
	localparam AR_IDLE_S = 1'b0, AR_READY_S = 1'b1;
	reg AR_PRESENT_STATE_S;
	reg AR_NEXT_STATE_S;

	//State register
	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			AR_PRESENT_STATE_S <= AR_IDLE_S;
		end else begin
			AR_PRESENT_STATE_S <= AR_NEXT_STATE_S;
		end
	end

	//Next state logic
	always@* begin
		case (AR_PRESENT_STATE_S)
			
			AR_IDLE_S: if(arvalid)
						AR_NEXT_STATE_S = AR_READY_S;
					else
						AR_NEXT_STATE_S = AR_IDLE_S;

			AR_READY_S: AR_NEXT_STATE_S = AR_IDLE_S;

			default   : AR_NEXT_STATE_S = AR_IDLE_S;

		endcase
	end

	//output logic
	always@(posedge clk or negedge rst_n) begin
	 if (~rst_n)
		begin
			arready <= 1'b0;
		end else
		case (AR_NEXT_STATE_S)
			AR_IDLE_S : begin 
			                 arready <= 1'b0;
			             end

			AR_READY_S: begin if(arvalid == 1'b1)
						begin
						  arready <= 1'b1;
						  araddr_reg <= araddr; //storing read address in temp reg.
						end else 
						  arready <= 1'b0;
					    end

			default   : arready <= 1'b0;
		endcase
	end

	//**************************Read data channel******************************
	localparam R_IDLE_S = 2'b00, R_READY_S = 2'b01, R_TRAN_S = 2'b10;
	reg [1:0] R_PRESENT_STATE_S;
	reg [1:0] R_NEXT_STATE_S;

	//State register
	always @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			R_PRESENT_STATE_S <= R_IDLE_S;
		end else begin
			R_PRESENT_STATE_S <= R_NEXT_STATE_S;
		end
	end

	//Next state logic
	always@* begin

		case(R_PRESENT_STATE_S)

			R_IDLE_S : if(arready)
							R_NEXT_STATE_S = R_READY_S;
						else
							R_NEXT_STATE_S = R_IDLE_S;

			R_READY_S: if(rready)
						R_NEXT_STATE_S = R_TRAN_S;
					else
						R_NEXT_STATE_S = R_READY_S;

			R_TRAN_S:  R_NEXT_STATE_S = R_IDLE_S;

			default  :  R_NEXT_STATE_S = R_IDLE_S;
			
		endcase
	end

	//output logic
	always @(posedge clk or negedge rst_n) begin
       if (~rst_n)
		begin
			rvalid <= 1'b0;
			rdata <= 'b0;
			rd_success <= 1'b0;
			bresp <= 2'b00;
			rresp <= 2'b00;
		end else
		case (R_PRESENT_STATE_S)
			R_IDLE_S :  rvalid <= 1'b0;

			R_READY_S: begin 
			             if(rready) begin
			                 rvalid <= 1'b1;
			                 rd_success <= 1'b1;
			                 rresp <= 2'b00; end
			             else
			                 rvalid <= 1'b0;
			                 
					     rdata[31:0] <= slave_mem[araddr]; //read data from memory

					       case({rd_success, wr_success})
					           2'b11 : bresp  <= 2'b00;
					           2'b01 : bresp  <= 2'b01;
					           2'b10 : bresp  <= 2'b01;
					           2'b00 : bresp  <= 2'b10;
					           default: bresp <= 2'b00;
					       endcase
					   end
					   
			R_TRAN_S:  rvalid <= 1'b0;

			default  : begin rvalid <= 1'b0;
			                 rdata <= 'b0;
			                 rd_success <= rd_success;
			                 rresp <= rresp; end
		endcase
	end

endmodule : slave
