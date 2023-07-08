# FIFO-Designs
Verilog codes of Synchronous and Asynchronous FIFOs.

Synchronous FIFO :
  Depth = 8 (hence Address width = 3 bits)
  Data width = 16 bits
  Extra address bit to help distinguish between full and empty conditions
  
Asynchronous FIFO :
  Depth = 8 (hence Address width = 3 bits)
  Data width = 16 bits
  Gray code pointer for 2-flop synchronization
  Binary code pointer for addressing

"Simulation and Synthesis Techniques for Asynchronous FIFO Design" by Clifford E. Cummings, Sunburst Design, Inc. was referred for the design.
Going through the document is highly recommended.  
