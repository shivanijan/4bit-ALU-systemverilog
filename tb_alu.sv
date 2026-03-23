// Code your testbench here
// or browse Examples
module TB();
  logic [3:0] A, B;
  logic [2:0] Op;
  logic [3:0] alu_out;

  alu a1(A, B, Op, alu_out);

  task check(
    input logic [3:0] exp_out,
    input string      op_name
  );
    #10;
    if (alu_out !== exp_out)
      $display("FAIL: %s | A=%0d B=%0d | expected=%0d got=%0d",
                op_name, A, B, exp_out, alu_out);
    else
      $display("PASS: %s | A=%0d B=%0d | result=%0d",
                op_name, A, B, alu_out);
  endtask

  initial begin
  $dumpfile("dump.vcd");    // add this line 1
  $dumpvars(0, TB);         // add this line 2
  
    $display("===== ALU Testbench Start =====");

    // 3'b000 — no operation (your original case)
    A=4'b0011; B=4'b0001; Op=3'b000; check(4'b0000, "NOP");

    // 3'b001 — ADD
    A=4'b0011; B=4'b0001; Op=3'b001; check(A+B, "ADD");

    // 3'b010 — SUB
    A=4'b0011; B=4'b0001; Op=3'b010; check(A-B, "SUB");

    // 3'b011 — AND
    A=4'b0011; B=4'b0001; Op=3'b011; check(A&B, "AND");

    // 3'b100 — OR
    A=4'b0011; B=4'b0001; Op=3'b100; check(A|B, "OR");

    // 3'b101 — NOT A
    A=4'b0011; B=4'b0001; Op=3'b101; check(~A, "NOT A");

    // 3'b110 — NOT B
    A=4'b0011; B=4'b0001; Op=3'b110; check(~B, "NOT B");

    // 3'b111 — default (zero)
    A=4'b0011; B=4'b0001; Op=3'b111; check(4'b0000, "DEFAULT");

    // Edge case — A=0, B=0
    A=4'b0000; B=4'b0000; Op=3'b001; check(4'b0000, "ADD zero");

    // Edge case — max values
    A=4'b1111; B=4'b1111; Op=3'b011; check(4'b1111, "AND max");

    $display("===== ALU Testbench End =====");
    $finish;
  end

endmodule