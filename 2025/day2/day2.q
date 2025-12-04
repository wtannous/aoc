// day2.q
// Advent of Code 2025
// Day 2


// Part 1


// v for version
//
// @desc Find bad IDs based on version.
//
// @param x {symbol} Filename of the input.
// @param v {long} Version (0 for Part 1, 1 for Part 2).
//
findBadIDs:{[x;v]
    s:"J"$"-" vs/:","vs first read0 x;
    r:s[;0]+til each 1+s[;1]-s[;0];
    sum sum each (findBadInRange;findBadInRange2)[v]each r
    }

//
// @desc Helper for Part 1: Find bad IDs in range.
//
// @param r {list} List of ranges.
//
findBadInRange:{[r]
    c:count each s:string each r;
    w:where not c mod 2;
    r[w] where (~/)each (0,/:c[w] div 2)_'s[w]
    }


//
// @desc Helper for Part 2: Find bad IDs in range with stricter rules.
//
// @param r {list} List of ranges.
//
findBadInRange2:{[r]
    c:count each s:string each r;
    tt:t@'where each 0=c mod' t:til each c;
    r where any each {all first[x]~/:x}each'((til each' c div tt)*''tt)_\:'s
    }

findBadIDs[`:test.txt]each 0 1