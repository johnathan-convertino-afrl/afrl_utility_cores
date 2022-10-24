# AFRL Util Helper Functions
## Various reusable funtions for verilog
---

   author: Jay Convertino   
   
   date: 2022.08.10  
   
   details: Various helper funtions.   
   
   license: MIT   
   
---

![rtl_img](./rtl.png)

### IP USAGE
#### INSTRUCTIONS

##### Dependency include for fusesoc core file
``` 
  dep:
    depend:
      - AFRL:utility:helper:1.0.0
```
##### Verilog include the files needed (see src below for list of files and funtions).
```
`include "util_helper_math.vh"
```

### COMPONENTS
#### SRC

* util_helper_math.vh ... functions written in C syntax for clarification.
  * int clogb2(value) ... will return the log base 2 of the argument (value), rounded up to the nearest integer.
  * int cmax(max1, max2) ... will return the number that is the max of the arguments max1, max2.
  
#### TB

* tb_helper.v ... test all util_helper_xxx.vh functions.
  
### fusesoc

* Simulations are fixed at the moment.
