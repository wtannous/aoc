// day1.q
// Advent of Code 2025
// Day 1


START:50;

//
// @desc Calculate the number of times the position of the lock stops at 0.
//
// @param x {symbol} File path to the input file.
//
solve:{[x]
 r:read0 x;
 dir:`$1#'r; / direction
 distance:"J"$1_'r; / distance
 distance[where dir=`L]:neg distance[where dir=`L]; / Set negative distance for left turns
 sum 0=sums[START,distance]mod 100
 }

solve`:test.txt


// Part 2

//
// @desc Calculate the number of times the position wraps crosses 0.
//
// @param x {symbol} File path to the input file.
//
solve2:{[x]
 r:read0 x;
 dir:`$1#'r; / direction
 distance:"J"$1_'r; / distance
 distance[where dir=`L]:neg distance[where dir=`L]; / Set negative distance for left turns
 pos:sums[START,distance]; / Position on a scale
 ts:raze[(-1_pos)+(abs[distance]div distance)*til each abs distance]; / Build series of intermediary positions based off starting positions after movements
 sum 0=(ts mod 100) / Mod 100 to take into account wrap around
 }


t:solve2`:test.txt


