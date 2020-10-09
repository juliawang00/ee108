Tristan Abarca, Troy Lawrence, Julia Wang

Testing Strategy:

We shift the input with the smaller exponent to the right as opposed to shifting the input with the larger exponent to the left because
we want to keep the MSB after we add and drop the LSB. If we add a number that is much larger to a number that is much smaller, we will
ultimately loss precision in regards to the smaller number in order to account for the value of the larger number.
