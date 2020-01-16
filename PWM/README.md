# Pulse Width Modulation实现方法  

1. using a free-running counter  
  ```verilog
  always @(posedge clk) cnt <= cnt + 1'b1;
  assign PWM_out = (PWM_in < cnt);
  ```

2. using a loadable up-down counter  
  ```verilog
  assign cnt_end = cnt_dir ? cnt==4'b0000 : cnt==4'b1111;
  assign cnt_next = cnt_dir ? cnt-4'd1 : cnt+4'd1;
  always @(posedge clk) cnt <= (cnt_end ? PWM_in : cnt_next);
  always @(posedge clk) cnt_dir <= cnt_dir ^ cnt_end;
  assign PWM_out = cnt_dir;
  ```
没有用比较器。  

#### First-order sigma-delta modulator  
  ```verilog
  reg [8:0] PWM;
  reg [7:0] PWM_in;
  always @(posedge clk) PWM <= PWM[7:0] + PWM_in;
  assign PWM_out = PWM[8];
  ```
