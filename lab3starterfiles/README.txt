A) See attached JPG for bubble diagram of "one pulse" FSM. 

B) If a stray radiation hits a one hot encoded FSM and one of the bits is flipped (either to now have 2 bits on or no bits on) and the design has a case
statementwith no default entry, the result of the case statement will be undefined or undeterministic. This means that we will have no control over the data that 
comes out of the switch statement. On the other hand, if there is a default entry, the switch case will follow whatever is in the default and we will still have 
some sort of control of the output. Overall, ALWAYS USE DEFAULT CASES IN CASE STATEMENTS. 
