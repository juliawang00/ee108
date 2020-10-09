a) Tristan Abarca, Troy Lawrence, Julia Wang

b) Notes to the TA:

Methodology:
Our implementation for floating point adder follows this sequence. We first get the largest exponent of the two inputs
via bigger_number_first. Then we find the difference between the two exponents. This is important to know how many times we
need to bitshift bOut (the lower exponent number) to the right (shifter), namely, difference times. Now both numbers are at the same base
and can be added using the adder module. Lastly we have to deal with the carry. If there was a carry, then we shift the sum to the right one
and put a 1'b1 at the front and increment the exponent by one. This gives us the sum of the floating points, with one exception.

Saturation:
If there is a carry of one and incrementing the exponent overflows the exponent, then we know we have reached saturation, and we return all 1s.


c) Testing Strategy:

We first made sure each of our submodules was thoroughly tested.

For bigger_number_first, we compare two exponents. This leads to three cases either expA is bigger than expB, less than or equal.
We do not have to worry about negative numbers.

For shifter, we are comparing bitshifting in two directions. This leads to six cases, we shift to the right or left a random number of
times, 5 times (where five is max), or zero times. This would account for a random shift, a complete shift to leave us with all zeros,
or a zero shift to leave the number the same.
For adder, we are comparing addition of five-bit numbers and their carry outs. This leads to at least five cases (we have six). We can
add random numbers that have no carry out, or random numbers with a carry out. Then we can add a number with zero to return the same number.
We can add zero with zero. And we can add the max numbers (31 and 31).

For float_add, we are testing floating point addition. This leads to numerous tests. Same exponents with no carry, same exponents with carry,
different exponents no carry, different exponents with carry, adding to zero, adding zeros, max numbers addition (saturation), random numbers 
leading to saturation, biggest numbers leading to max representation.

One bug we caught in the process was that we were not adding to the exponent in the case of carrying. We were simply shifting the mantissa 
and adding.

d) We shift the input with the smaller exponent to the right as opposed to shifting the input with the larger exponent to the left because
we want to keep the MSB after we add and drop the LSB. If we add a number that is much larger to a number that is much smaller, we will
ultimately lose precision in regards to the smaller number in order to account for the value of the larger number.
