module axi4_lite_master_adaptor (
    input aclk,
    input aresetn,
    // Write Address Channel
    output reg [31:0] awaddr_out,
    output reg [2:0] awprot_out,
    output reg awvalid_out,
    input awready_in,
    //// Input(s) for Driving Output(s) of Write Address Channel
    input [31:0] awaddr_in,
    input [2:0] awprot_in,
    // Write Data Channel
    output reg [31:0] wdata_out,
    output reg [3:0] wstrb_out,
    output reg wvalid_out,
    input wready_in,
    //// Input(s) for Driving Output(s) of Write Data Channel
    input [31:0] wdata_in,
    input [3:0] wstrb_in,
    // Write Response Channel
    input [1:0] bresp_in,
    input bvalid_in,
    output reg bready_out,
    // Read Address Channel
    output reg [31:0] araddr_out,
    output reg [2:0] arprot_out,
    output reg arvalid_out,
    input arready_in,
    //// Input(s) for Driving Output(s) of Read Address Channel
    input [31:0] araddr_in,
    input [2:0] arprot_in,
    // Read Data Channel
    input [31:0] rdata_in,
    input [1:0] rresp_in,
    input rvalid_in,
    output reg rready_out
);

    // Write Address Channel
    
    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            awvalid_out <= 0;
        end
        else begin
            awaddr_out <= awaddr_in;
            awprot_out <= awprot_in;
            if (awaddr_out) begin
                awvalid_out <= 1;
                if (awready_in) begin
                    awvalid_out <= 0;
                end
            end
        end
    end

    // Write Data Channel
    
    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            wvalid_out <= 0;
        end
        else begin
            wdata_out <= wdata_in;
            wstrb_out <= wstrb_in;
            if (wdata_out) begin
                wvalid_out <= 1;
                if (wready_in) begin
                    wvalid_out <= 0;
                end
            end
        end
    end

    // Write Response Channel

    reg [1:0] bresp_save;

    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            bready_out <= 0;
        end
        else begin
            if (wvalid_out && wready_in) begin
                bready_out <= 1;
                if (bvalid_in) begin
                    bresp_save <= bresp_in;
                    bready_out <= 0;
                end
            end
            else begin
                bready_out <= 0;
            end
        end
    end

    // Read Address Channel

    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            arvalid_out <= 0;
        end
        else begin
            araddr_out <= araddr_in;
            arprot_out <= arprot_in;
            if (araddr_out) begin
                arvalid_out <= 1;
                if (arready_in) begin
                    arvalid_out <= 0;
                end
            end
        end
    end

    // Read Data Channel

    reg [31:0] rdata_save;
    reg [1:0] rresp_save;

    always @(posedge aclk or negedge aresetn) begin
        if (!aresetn) begin
            rready_out <= 0;
            rdata_save <= 0;
        end
        else begin
            if (arvalid_out && arready_in) begin
                rready_out <= 1;
                if (rvalid_in) begin
                    rdata_save <= rdata_in;
                    rresp_save <= rresp_in;
                    rready_out <= 0;
                end 
            end
            else begin
                rready_out <= 0;
            end
        end
    end
    
endmodule
