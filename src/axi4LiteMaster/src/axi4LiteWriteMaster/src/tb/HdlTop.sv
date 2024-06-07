`ifndef HDLTOP_INCLUDED_
`define HDLTOP_INCLUDED_

module HdlTop;

  import uvm_pkg::*;
  `include "uvm_macros.svh"

  bit aclk;
  bit aresetn;

  initial begin
    $display("HDL_TOP");
  end

  initial begin
    aclk = 1'b0;
    forever #10 aclk = ~aclk;
  end

  initial begin
    aresetn = 1'b1;
    #10 aresetn = 1'b0;

    repeat (1) begin
      @(posedge aclk);
    end
    aresetn = 1'b1;
  end

  Axi4LiteMasterWriteInterface axi4LiteMasterWriteInterface(.aclk(aclk),
                                                            .aresetn(aresetn));

endmodule : HdlTop

`endif

