# 4-bit ALU — SystemVerilog Design & Verification

## What it does
RTL implementation of an 8-operation 4-bit ALU verified using a SystemVerilog testbench with PASS/FAIL checking.

## Operations supported
| Op code | Operation |
|---------|-----------|
| 3'b000  | NOP       |
| 3'b001  | ADD       |
| 3'b010  | SUB       |
| 3'b011  | AND       |
| 3'b100  | OR        |
| 3'b101  | NOT A     |
| 3'b110  | NOT B     |
| 3'b111  | DEFAULT   |

## Verification highlights
- 10 directed test cases covering all operations
- Edge cases: zero inputs, max values (4'hF)
- PASS/FAIL checking with $display
- Simulated on EDA Playground using Aldec Riviera-PRO

## Files
| File | Description |
|------|-------------|
| alu.sv | RTL design — combinational ALU using always_comb |
| tb_alu.sv | SystemVerilog testbench with task-based checking |

## Simulation result
All 10 test cases passed:
PASS: NOP    | A=3 B=1 | result=0
PASS: ADD    | A=3 B=1 | result=4
PASS: SUB    | A=3 B=1 | result=2
PASS: AND    | A=3 B=1 | result=1
PASS: OR     | A=3 B=1 | result=3
PASS: NOT A  | A=3 B=1 | result=12
PASS: NOT B  | A=3 B=1 | result=14
PASS: DEFAULT| A=3 B=1 | result=0
PASS: ADD zero | A=0 B=0 | result=0
PASS: AND max  | A=15 B=15 | result=15

## Waveform
![Waveform](waveform(binary).png)

## Tools used
- Language: SystemVerilog
- Simulator: Aldec Riviera-PRO (EDA Playground)
- EDA Playground link: [Run simulation](https://edaplayground.com/x/GzHc)
