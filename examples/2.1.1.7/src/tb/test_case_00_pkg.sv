

`timescale 1 ns / 1 ns
//`default_nettype none 


package test_case_00_pkg;

import base_test_pkg::*;

class test_case_00 extends base_test;


function init_mode0;
    int ii=0;    
    test_input[ii].addr = 8'h02; test_input[ii].delay = 0;  ii++;
    test_input[ii].addr = 8'h08; test_input[ii].delay = 0;  ii++;
    test_input[ii].addr = 8'h0A; test_input[ii].delay = 0;  ii++;
    test_input[ii].addr = 8'h0D; test_input[ii].delay = 0;  ii++;

    test_input[ii].addr = 8'h02; test_input[ii].delay = 0;  ii++;
    test_input[ii].addr = 8'h08; test_input[ii].delay = 0;  ii++;
    test_input[ii].addr = 8'h0A; test_input[ii].delay = 0;  ii++;
    test_input[ii].addr = 8'h0D; test_input[ii].delay = 16;  ii++;


    test_input[ii].addr = 8'h08; test_input[ii].delay = 16;  ii++;
    test_input[ii].addr = 8'h0F; test_input[ii].delay = 16;  ii++;
    test_input[ii].addr = 8'h10; test_input[ii].delay = 16;  ii++;

    max_test_input=ii;

endfunction;

function init_mode1;
    int ii=0;    
    test_input[ii].addr = 8'h02; test_input[ii].delay = 0;  ii++;
    test_input[ii].addr = 8'h0E; test_input[ii].delay = 0;  ii++;
    test_input[ii].addr = 8'h0A; test_input[ii].delay = 0;  ii++;
    test_input[ii].addr = 8'h0D; test_input[ii].delay = 1;  ii++;

    test_input[ii].addr = 8'h02; test_input[ii].delay = 0;  ii++;
    test_input[ii].addr = 8'h0E; test_input[ii].delay = 0;  ii++;
    test_input[ii].addr = 8'h0A; test_input[ii].delay = 0;  ii++;
    test_input[ii].addr = 8'h0D; test_input[ii].delay = 16;  ii++;


    test_input[ii].addr = 8'h08; test_input[ii].delay = 16;  ii++;
    test_input[ii].addr = 8'h0F; test_input[ii].delay = 16;  ii++;

    max_test_input=ii;

endfunction;


function init_mode2;
    int ii=0;    

    test_input[ii].addr = 8'h10; test_input[ii].delay = 16;  ii++;
    test_input[ii].addr = 8'h10; test_input[ii].delay = 16;  ii++;    
    test_input[ii].addr = 8'h10; test_input[ii].delay = 16;  ii++;    
    test_input[ii].addr = 8'h10; test_input[ii].delay = 16;  ii++;    
    test_input[ii].addr = 8'h10; test_input[ii].delay = 16;  ii++;
    test_input[ii].addr = 8'h10; test_input[ii].delay = 16;  ii++;    
    test_input[ii].addr = 8'h10; test_input[ii].delay = 16;  ii++;    
    test_input[ii].addr = 8'h10; test_input[ii].delay = 16;  ii++;    
    test_input[ii].addr = 8'h10; test_input[ii].delay = 16;  ii++;
    test_input[ii].addr = 8'h10; test_input[ii].delay = 16;  ii++;    
    test_input[ii].addr = 8'h10; test_input[ii].delay = 16;  ii++;    
    test_input[ii].addr = 8'h10; test_input[ii].delay = 16;  ii++;    

    max_test_input=ii;

endfunction;


function new ( int mode );

    case( mode )
    0: init_mode0();
    1: init_mode1();
    2: init_mode2();

    endcase

    ram0_data[2] = 16'h0110;
    ram0_data[8] = 16'h0120;
    ram0_data[8'h0A] = 16'h0130;
    ram0_data[8'h0D] = 16'h0140;
    ram0_data[8'h0E] = 16'h0450;
    ram0_data[8'h0F] = 16'h0260;
    ram0_data[8'h10] = 16'h0070;


    ram1_data[8'h10] = 16'hA000;

    ram1_data[8'h20] = 16'hA100;

    ram1_data[8'h30] = 16'hA200;

    ram1_data[8'h40] = 16'hA300;


    ram1_data[8'h50] = 16'hA400;
    ram1_data[8'h51] = 16'hA401;
    ram1_data[8'h52] = 16'hA402;
    ram1_data[8'h53] = 16'hA403;


    ram1_data[8'h60] = 16'hA500;
    ram1_data[8'h61] = 16'hA501;

    ram1_data[8'h70] = 16'hA600;
    ram1_data[8'h71] = 16'hA601;
    ram1_data[8'h72] = 16'hA602;
    ram1_data[8'h73] = 16'hA603;
    ram1_data[8'h74] = 16'hA604;
    ram1_data[8'h75] = 16'hA605;
    ram1_data[8'h76] = 16'hA606;
    ram1_data[8'h77] = 16'hA607;
    ram1_data[8'h78] = 16'hA608;
    ram1_data[8'h79] = 16'hA609;
    ram1_data[8'h7A] = 16'hA60A;
    ram1_data[8'h7B] = 16'hA60B;
    ram1_data[8'h7C] = 16'hA60C;
    ram1_data[8'h7D] = 16'hA60D;
    ram1_data[8'h7E] = 16'hA60E;
    ram1_data[8'h7F] = 16'hA60F;

    create_expect_data();

endfunction

endclass

endpackage

//`default_nettype wire