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

    integer read_outstanding_count = 0;
    integer write_outstanding_count = 0;

  integer index;
  reg [31:0] local_rdata[5];

	always @(posedge clk) begin
    local_rdata[0] <= 32'h0000_0000;
    local_rdata[1] <= 32'haaaa_aaaa;
    local_rdata[2] <= 32'hffff_ffff;
    local_rdata[3] <= 32'h00cd_aabb;
    local_rdata[4] <= 32'h8976_22e4;
	  index <= $urandom_range(0, 4); //read data from memory
  end



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
               if(awaddr <= 'habc0034) begin
                 wr_success <= 0;
               end
               else begin
                   wr_success <= 1;
                 end
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
							W_NEXT_STATE_S = W_TRAN_S;
						else
							W_NEXT_STATE_S = W_IDLE_S;

			W_TRAN_S:	if(wvalid)
							W_NEXT_STATE_S = W_READY_S;
						else
							W_NEXT_STATE_S = W_TRAN_S;

			W_READY_S:	W_NEXT_STATE_S = W_IDLE_S;

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

				W_TRAN_S : begin 
                   wready <= 1'b0;
                  //   for (int i = 0; i < (DATA_WIDTH/8) ; i++) begin
                  //     if(wstrb[i])
                  //       slave_mem[awaddr_reg][(i*8)+:8] <= wdata[i*8+:8];  
                  //     end
//								 if (wstrb[0])
//								    	slave_mem[awaddr_reg][7:0] <= wdata[7:0];

//								 if (wstrb[1])
//								    	slave_mem[awaddr_reg][15:8] <= wdata[15:8];

//								 if (wstrb[2])
//								    	slave_mem[awaddr_reg][23:16] <= wdata[23:16];
		
//								 if (wstrb[3])
//								    	slave_mem[awaddr_reg][31:24] <= wdata[31:24];
					             end

        W_READY_S: begin
                      for (int i = 0; i < (DATA_WIDTH/8) ; i++) begin
                        if(wstrb[i])
                          slave_mem[awaddr_reg][(i*8)+:8] <= wdata[i*8+:8];  
                        end
                       wready <= 1'b1;
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

			B_IDLE_S: if(wready || write_outstanding_count)
						B_NEXT_STATE_S = B_START_S;
					  else
					  	B_NEXT_STATE_S = B_IDLE_S;

			B_START_S:  B_NEXT_STATE_S = B_READY_S;

			B_READY_S:  if(!bready)
                    B_NEXT_STATE_S = B_READY_S;
                  else
                    B_NEXT_STATE_S = B_IDLE_S;

			//default :   B_NEXT_STATE_S = B_IDLE_S;

		endcase
	end

	//output logic 
	always@(posedge clk or negedge rst_n)
	begin
	   if (~rst_n)
		begin
			bvalid <= 1'b0;
			bresp  <= 2'b00;
			// wr_success <= 'b0;
		end else
		case (B_PRESENT_STATE_S)
			B_IDLE_S:	begin
							bvalid <= 1'b0;
						end

			B_START_S:	begin
							bvalid <= 1'b1;
               // if(bvalid && bready)
               //   wr_success <= 1'b1;
               case(wr_success)
                   1'b1 : bresp  <= 2'b00;
                   1'b0 : bresp  <= 2'b10;
                   default: bresp <= 2'b00;
               endcase
						end

			B_READY_S:	begin
							// bvalid <= 1'b0;
						end 

		//	default : 	begin
		//					bvalid <= 1'b0;
		//					bresp <= 2'b00;
		//					wr_success <= wr_success;
		//				end
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
              //read_outstanding_count <= read_outstanding_count + 1;
              if(araddr <= 'h5bc0034) begin
                 rd_success <= 0;
               end
               else begin
                   rd_success <= 1;
                 end
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
							R_NEXT_STATE_S = R_TRAN_S;
						else
							R_NEXT_STATE_S = R_IDLE_S;

			R_TRAN_S:  R_NEXT_STATE_S = R_READY_S;

			R_READY_S: if(!rready)
						R_NEXT_STATE_S = R_READY_S;
					else
						R_NEXT_STATE_S = R_IDLE_S;


			//default  :  R_NEXT_STATE_S = R_IDLE_S;
			
		endcase
	end

	//output logic
	always @(posedge clk or negedge rst_n) begin
       if (~rst_n)
		begin
			rvalid <= 1'b0;
			rdata <= 'b0;
			// rd_success <= 1'b0;
			rresp <= 2'b00;
		end else
		case (R_PRESENT_STATE_S)
      R_IDLE_S : begin
                  rvalid <= 1'b0;
                end

			R_TRAN_S: begin 
			         rvalid <= 1'b1;
			                 
					     // rdata[31:0] <= slave_mem[araddr]; //read data from memory
					     rdata[31:0] <= local_rdata[index]; //read data from memory

					       case(rd_success)
					           1'b1 : rresp  <= 2'b00;
					           1'b0 : rresp  <= 2'b10;
					           default: rresp <= 2'b00;
					       endcase
					   end
					   
       R_READY_S: begin
                   if(rready)
                     rvalid = 0;
                    // read_outstanding_count <= read_outstanding_count - 1;
                  end

		//	default  : begin rvalid <= 1'b0;
		//	                 rdata <= 'b0;
		//	                 //rd_success <= rd_success;
		//	                 rresp <= rresp; end
		endcase
	end

  always @(posedge clk) begin
    if(arvalid && arready)
      read_outstanding_count <= read_outstanding_count + 1;

    if(rvalid && rready)
      read_outstanding_count <= read_outstanding_count - 1;
  end

  always @(posedge clk) begin
    if(wvalid && wready)
      write_outstanding_count <= write_outstanding_count + 1;

    if(bvalid && bready)
      write_outstanding_count <= write_outstanding_count - 1;
  end

endmodule : slave
