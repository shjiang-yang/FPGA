# LED_display实现  

## GIST  
- PWM (pulse width modulation)  
  ```verilog
  reg [3:0] PWM_input;
  reg [4:0] PMW;
  reg PWM_output;
  always @(posedge clk) PWM <= PWM + PWM_input;
  assign PWM_output = PWM[4];
  ```

  