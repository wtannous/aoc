// day5.q
// 2025 Advent of Code
// Day 5


i:`ranges`ingredients!input@/:where each((<;>)@\:til count input)@'first where ""~/:input:read0`:test.txt; / Parse input
p1:sum any(within/:[;"J"$"-"vs'i`ranges])"J"$i`ingredients;

ranges:ranges iasc ranges:"J"$"-"vs'i`ranges; / Sort ranges

//
// @desc Count the number of unique numbers in the ranges given. Given the ranges are sorted in ascending order
// based on the starting number of the range.   
//
// @param x {list[2]}   (Running count;Max number encountered during search).
// @param y {list[2]}   The current range.
//
p2:{[x;y]
    d:1+y[1]-y 0; / Calculate numbers in range inclusively
    $[x[1]<y[0]; / If we're not overlapping with a previous range (looking at the start of the range and the max number encountered so far)
        (x[0]+d;x[1]|y 1); / Add the numbers in the range to the running count, update max number encountered
        (x[0]+0|y[1]-x 1;x[1]|y 1)] / If we're overlapping, add new numbers to the running count (i.e. larger than the max number encountered), update max number encountered
    }/[0 0;ranges]

p2:first p2;

