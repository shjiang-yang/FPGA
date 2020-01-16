# Quadrature-decoder  

其真值表
![真值表](./image/quadrature-decoder.png)

## GIST  
- 如何确定方向？  
  ```verilog
  forward = A ^ B_delay;
  ```  

- 何时开始计数？  
  ```verilog
  cnt_enable = A ^ B ^ A_delay ^ B_delay;
  ```  
  