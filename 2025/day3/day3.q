// day3.q
// Advent of Code 2025
// Day 3



//
// @desc Part 1: Compute the sum of the largest 2 digit number that can be built from left to right order in each row.
//
// @param x {symbol} Filename of the input.
//
func1:{
    f:2#'idesc each  r:"J"$/:/:read0 x; / Find 2 largest elements
    f:?[f[;0]=-1+count first r;f[;1];f[;0]]; / If the first element is the last element, return the second element
    sum "J"$ raze each string each (r@'f),'max each (1+f) _' r / Drop everything after first number, join with max of each row and sum
    }



//
// @desc Part 2: Compute the sum of the largest number that can be built from n numbers from left to right order in each row.
//
// @param x {symbol} Filename of the input.
// @param y {long} Number of digits to consider.
//
func2:{[x;y]
    r:"J"$/:/:read0 x; 
    //
    // Index of descending order, then build masks of candidate indices, by how many numbers 
    // are left to the right of it (every time you choose a number, you only have n-1 numbers left).
    // n in this case is 12, given by the problem statement.
    //
    ix:id@'/:where each'(count[first r]-reverse til y)>\:id:idesc each r; 
    n:r@'{[x;y]first l where x<l:y}\[0N;]each flip ix; / Lamda function: find first number in the descending order array that is smaller than the previous number
    sum "J"$ raze each string each n
    }
