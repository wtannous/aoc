// day2.q
// Advent of Code 2025
// Day 2


// Part 1


// v for version
findBadIDs:{[x;v]
    s:"J"$"-" vs/:","vs first read0 x;
    r:s[;0]+til each 1+s[;1]-s[;0];
    sum sum each (findBadInRange;findBadInRange2)[v]each r
    }

findBadInRange:{[r]
    c:count each s:string each r;
    w:where not c mod 2;
    r[w] where (~/)each (0,/:c[w] div 2)_'s[w]
    }


findBadInRange2:{[r]
    c:count each s:string each r;
    tt:t@'where each 0=c mod' t:til each c;
    r where any each {all first[x]~/:x}each'((til each' c div tt)*''tt)_\:'s
    }

findBadIDs[`:test.txt]each 0 1