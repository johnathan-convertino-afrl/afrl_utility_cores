////////////////////////////////////////////////////////////////////////////////
// @file    tb_helper.v
// @author  JAY CONVERTINO
// @date    2022.08.10
// @brief   SIMPLE TEST BENCH FOR HELPER FUNCTIONS
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/10 ps

module tb_helper;

  `include "util_helper_math.vh"

  localparam loop = 100;
  integer index = 0;
  integer value1 = 0;
  integer value2 = 0;
  integer count = 0;
  integer result = 0;
  
  integer fail = 0; // if set to anything other then 0, we have failed.
  
  initial
  begin
  
  // Test max function
  for(index = 0; index < loop; index = index + 1)
    begin
      #10 value1 = $random;
      #20 value2 = $random;
      #30 result = cmax(value1, value2);
      
      if(value1 > value2) begin
        if(result != value1) begin
          #10 fail = 1;
        end
      end else begin
        if(result != value2) begin
          #10 fail = 1;
        end
      end
    end
    
  if(fail > 0) begin
    $display("FAILED: cmax");
  end else begin
    $display("PASSED: cmax");
  end
  
  // Test abs function
  #10 fail = 0;
  for(index = 0; index < loop; index = index + 1)
    begin
      #10 value1 = $random;
      #20 result = abs(value1);
      
      if(value1 == result) begin
        if(value1 < 0) begin
          #10 fail = 1;
        end
      end
    end
    
  if(fail > 0) begin
    $display("FAILED: abs");
  end else begin
    $display("PASSED: abs");
  end
  
  // Test clogb2 function
  #10 fail = 0;
  for(index = 0; index < loop; index = index + 1)
    begin
      #10 value1 = $random%(1<<10);
      #20 result = clogb2(abs(value1));
      #30 count = 0;
      
      //just a different way for the being different vs the clogb2 function.
      for(value2 = 1; value2 < abs(value1); value2 = value2 << 1)
        begin
          count = count + 1;
        end
      
      if(count != result) begin
        #10 fail = 1;
      end
    end
    
  if(fail > 0) begin
    $display("FAILED: clogb2");
  end else begin
    $display("PASSED: clogb2");
  end
  
  end
endmodule
