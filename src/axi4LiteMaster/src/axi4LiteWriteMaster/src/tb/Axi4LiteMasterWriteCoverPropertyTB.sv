`ifndef AXI4LITEMASTERWRITECOVERPROPERTYTB_INCLUDED_
`define AXI4LITEMASTERWRITECOVERPROPERTYTB_INCLUDED_

`include "uvm_macros.svh"
import uvm_pkg::*;
import Axi4LiteWriteMasterGlobalPkg::*;

module Axi4LiteMasterWriteCoverPropertyTB;
  bit aclk;
  bit aresetn;
  //Write Address Channels Signals
  logic awvalid;
  logic [ADDRESS_WIDTH-1:0] awaddr;
  logic awready;
  //Write Data Channel Signals
  logic wvalid;
  logic [DATA_WIDTH-1:0] wdata;
  logic wready;
  //Write Response Channel
  logic bvalid;
  logic bready;

  
  string name = "AXI4LITE_COVERPROPERTY_TB";

  initial begin
    `uvm_info(name,$sformatf("TEST_BENCH_FOR_AXI4LITE_COVERPROPERTY"),UVM_LOW);
  end
  always #10 aclk = ~aclk;

  Axi4LiteMasterWriteCoverProperty Axi4LiteMasterWriteCoverPropertys(.aclk(aclk),
                                                                    .aresetn(aresetn),
                                                                    .awvalid(awvalid),
                                                                    .awready(awready),
                                                                    .awaddr(awaddr),
                                                                    .wvalid(wvalid),
                                                                    .wdata(wdata),
                                                                    .wready(wready),
                                                                    .bvalid(bvalid),
                                                                    .bready(bready));

  initial begin
    #3000;
    $finish;
  end

  initial begin
    When_awvalidIsAsserted_Then_awaddrIsNotUnknown();
    When_wvalidIsAsserted_Then_wdataIsNotUnknown();
    When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious2ClkAwaddrIsUnknown();
    When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious2ClkWdataIsUnknown();
  end

  task When_awvalidIsAsserted_Then_awaddrIsNotUnknown();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrIsNotUnknown Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awaddr <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrIsNotUnknown Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_wdataIsNotUnknown();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrIsNotUnknown Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wdata <= 32'bx;
      repeat(2) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata <= 32'h2222_3333;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wdataIsNotUnknown Task Ended"),UVM_NONE);
  endtask

  task When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious2ClkAwaddrIsUnknown();
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious2ClkAwaddrIsUnknown Task started"),UVM_NONE);
      awvalid <= 1'b0;
      awaddr <= 32'bx;
      repeat(3) begin
      @(posedge aclk);
      end
      awvalid <= 1'b1;
      awaddr <= 32'h1122_3344;
    `uvm_info(name,$sformatf("When_awvalidIsAsserted_Then_awaddrIsNotUnknownAndPrevious2ClkAwaddrIsUnknown Task Ended"),UVM_NONE);
  endtask

  task When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious2ClkWdataIsUnknown();
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious2ClkWdataIsUnknown Task started"),UVM_NONE);
      wvalid <= 1'b0;
      wdata <= 32'bx;
      repeat(3) begin
      @(posedge aclk);
      end
      wvalid <= 1'b1;
      wdata <= 32'h2222_3333;
    `uvm_info(name,$sformatf("When_wvalidIsAsserted_Then_wdataIsNotUnknownAndPrevious2ClkWdataIsUnknown Task Ended"),UVM_NONE);
  endtask

  endmodule : Axi4LiteMasterWriteCoverPropertyTB

`endif


