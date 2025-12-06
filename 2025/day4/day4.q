// day4.q
// Advent of Code 2025
// Day 4


// @param x {symbol} Filename of the input.
//
solve:{[x]
    r:read0 x;
    b:"@"=/:r; / bool masks of hits
    `p1`p2!(solve1[b];first(solve2/)(0;b))
    }

//
// @desc Solve Day 4 Part 1.
//
// @param x {symbol} Bool masks of paper.
//
solve1:{[b]
    c:count first b;
    r:{[pr;cr;nr]
        cr&4>sum cr=/:((-1_1 rotate cr),0b;0b,1_-1 rotate cr;pr;(-1_1 rotate pr),0b;0b,1_-1 rotate pr;nr;(-1_1 rotate nr),0b;0b,1_-1 rotate nr)
        }'[enlist[c#0b],-1_b;b;1_b,enlist c#0b];
    sum sum each r
    }


//
// @desc Solve Day 4 Part 2.
//
// @param x {list} 2 element list: (count removed; bool masks of paper).
//
solve2:{[x]
    cr:x[0];
    b:x[1];
    c:count first b;

    r:{[pr;cr;nr]
        cr&4>sum cr=/:((-1_1 rotate cr),0b;0b,1_-1 rotate cr;pr;(-1_1 rotate pr),0b;0b,1_-1 rotate pr;nr;(-1_1 rotate nr),0b;0b,1_-1 rotate nr)
        }'[enlist[c#0b],-1_b;b;1_b,enlist c#0b];
    (cr+sum sum each r;not b=r)
    }


solve each`test.txt