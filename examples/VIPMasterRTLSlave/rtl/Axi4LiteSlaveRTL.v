module axi4_lite_slave_adaptor (
    input aclk,
    input aresetn,
    // Write Address Channel
    input [31:0] awaddr_in,
    input [2:0] awprot_in,
    input awvalid_in,
    output reg awready_out,
    // Write Data Channel
    input [31:0] wdata_in,
    input [3:0] wstrb_in,
    input wvalid_in,
    output reg wready_out,
    // Write Response Channel
    output reg [1:0] bresp_out,
    output reg bvalid_out,
    input bready_in,
    // Read Address Channel
    input [31:0] araddr_in,
    input [2:0] arprot_in,
    input arvalid_in,
    output reg arready_out,
    // Read Data Channel
    output reg [31:0] rdata_out,
    output reg [1:0] rresp_out,
    output reg rvalid_out,
    input rready_in,
    //// Input(s) for Driving Output(s) of Read Data Channel
    input [31:0] rdata_in
);

    // Write Address Channel

    reg [31:0] awaddr_save;
    
    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            awaddr_save <= 0;
            awready_out <= 1;
        end
        else begin
           awready_out <= 1;
           if (awvalid_in) begin
            awaddr_save <= awaddr_in;
           end 
        end
    end

    // Write Data Channel

    reg [31:0] wdata_save;
    reg wdata_save_indication;
    
    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            wdata_save <= 0;
            wdata_save_indication <= 0;
            wready_out <= 1;
        end
        else begin
            wready_out <= 1;
            if (wvalid_in) begin
                if (wstrb_in[0]) begin
                    wdata_save[7:0] = wdata_in[7:0];
                end
                if (wstrb_in[1]) begin
                    wdata_save[15:8] = wdata_in[15:8];
                end
                if (wstrb_in[2]) begin
                    wdata_save[23:16] = wdata_in[23:16];
                end
                if (wstrb_in[3]) begin
                    wdata_save[31:24] = wdata_in[31:24];
                end
                wdata_save_indication = 1;
            end
        end
    end

    // Write Response Channel

    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            bvalid_out <= 0;
        end
        else begin
            if (wdata_save_indication) begin
                bresp_out <= 0;
                bvalid_out <= 1;
                if (bready_in) begin
                    bvalid_out <= 0;
                end
            end
        end
    end

    // Read Address Channel

    reg [31:0] araddr_save;
    reg rdata_save_indication;
    
    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            araddr_save <= 0;
            rdata_save_indication <= 0;
            arready_out <= 1;
        end
        else begin
           arready_out <= 1;
           if (arvalid_in) begin
            araddr_save <= araddr_in;
            rdata_save_indication <= 1;
           end 
        end
    end

    // Read Data Channel

    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            rvalid_out <= 0;
        end
        else begin
            if (rdata_save_indication) begin
                rdata_out <= rdata_in;
                rvalid_out <= 1;
                if (rready_in) begin
                    rresp_out <= 0;
                    rvalid_out <= 0;
                end
            end
            else begin
                rdata_out <= 0;
            end
        end
    end
    
endmodule
