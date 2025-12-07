// day6.q
// 2025 Advent of Code
// Day 6


//
// @desc Calculate the sum of evaluated expressions parsed from the file (Part 1).
//
// @param x {symbol} File path to read.
//
p1:{[x] sum eval each parse each(last each r)sv'-1_'r:flip r@'where each not ""~/:/:r:" "vs/:read0 x}

p1[`test.txt]

//
// @desc Calculate the sum of evaluated expressions using an alternative parsing method (Part 2).
//
// @param x {symbol} File path to read.
//
p2:{[x]
    lines:read0 x;
    o:o where" "<>o:last lines;
    n:-1_lines;
    w:where(count[n]#" ")~/:ff:flip n;
    sum eval each parse each o sv' fff@'where each 0<count''[fff:rtrim each ltrim each(0,w)_ff]
 }

p2[`test.txt]
