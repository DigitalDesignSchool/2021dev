# Entity: template_multiram
## Diagram
![Diagram](template_multiram.svg "Diagram")
## Description
 Template module for multibank memory  
![alt text](wavedrom_q9td0.svg "title") 
## Generics and ports
### Table 1.1 Generics
| Generic name | Type | Value | Description           |
| ------------ | ---- | ----- | --------------------- |
| na           |      | 16    |  Width of address bus |
| nd           |      | 16    |  Width of data bus    |
### Table 1.2 Ports
| Port name | Direction | Type          | Description                |
| --------- | --------- | ------------- | -------------------------- |
| clk       | input     | wire          | clock                      |
| reset_n   | input     | wire          | 0 - async reset            |
| r0_addr   | input     | wire [na-1:0] | address for read           |
| r0_avalid | input     | wire          | 1 - request for read       |
| r0_aready | output    | wire          | 1 - ready for read         |
| r0_data   | output    | wire [nd-1:0] | data from memory           |
| r0_dvalid | output    | wire          | 1 - valid data from memory |
| w0_addr   | input     | wire [na-1:0] | address for write          |
| w0_data   | input     | wire [na-1:0] | data for write             |
| w0_valid  | input     | wire          | 1 - request for write      |
| w0_ready  | output    | wire          | 1 - ready for write        |
| r1_addr   | input     | wire [na-1:0] | address for read           |
| r1_avalid | input     | wire          | 1 - request for read       |
| r1_aready | output    | wire          | 1 - ready for read         |
| r1_data   | output    | wire [nd-1:0] | data from memory           |
| r1_dvalid | output    | wire          | 1 - valid data from memory |
| w1_addr   | input     | wire [na-1:0] | address for write          |
| w1_data   | input     | wire [na-1:0] | data for write             |
| w1_valid  | input     | wire          | 1 - request for write      |
| w1_ready  | output    | wire          | 1 - ready for write        |
| r2_addr   | input     | wire [na-1:0] | address for read           |
| r2_avalid | input     | wire          | 1 - request for read       |
| r2_aready | output    | wire          | 1 - ready for read         |
| r2_data   | output    | wire [nd-1:0] | data from memory           |
| r2_dvalid | output    | wire          | 1 - valid data from memory |
| w2_addr   | input     | wire [na-1:0] | address for write          |
| w2_data   | input     | wire [na-1:0] | data for write             |
| w2_valid  | input     | wire          | 1 - request for write      |
| w2_ready  | output    | wire          | 1 - ready for write        |
