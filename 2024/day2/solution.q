// Problem 2 - AOC 2024 
// William Tannous

/
So, a report only counts as safe if both of the following are true:

The levels are either all increasing or all decreasing. AND
Any two adjacent levels differ by at least one and at most three.
\

l:(7 6 4 2 1;
    1 2 7 8 9;
    9 7 6 2 1;
    1 3 2 4 5;
    8 6 4 4 1;
    1 3 6 7 9)


//
// @desc Calculates the number of safe reports
//
// @param x {long[][]} List of reports.
//
countSafe:{d:1_'deltas'[x];sum all'[abs'[d]within 1 3]&all'[0>d]|all'[0<d]}


// execute
countSafe ll:"J"$" " vs/: read0`:input


//
// @desc Composes a boolean vector with `0`'s at the specified positions.
//
// @param x {int}			Specifies the length of the result vector.
// @param y {int[]}			Specifies the positions of the result to be set to `0`.
//
// @return {boolean[]}		A boolean vector of the given length, with specified positions having
//							the value `0` and all others having the value `1`.
//
falseAt:{@[x#1b;y;:;0b]}


//
// @desc PART 2: Count safe reports with dampening. Removing one of the values makes it safe.
//
// @param x {long[][]} List of reports.
//
countSafe2:{
    cnt:sum b:isReportSafe each x;
    x@:where not b; / Subset for dampening checks

    //
    // Brute force create all combinations of reports where 1 value is removed
    // and see if the any of the combinations have safe report.
    //
    ce:count each x;
    cnt+sum any each isReportSafe''[x@/:/:'where''[falseAt''[ce;til each ce]]]
    }


//
// @desc Given a report, determines whether it is safe.
//
isReportSafe:{
    d:1_deltas x;
    all[abs[d]within 1 3]&all[0>d]|all 0<d
    }
