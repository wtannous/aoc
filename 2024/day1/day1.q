// Problem 1 - AOC 2024 
// William Tannous

// examples
l1: 3 4 2 1 3 3
l2: 4 3 5 3 9 3


//
// @desc Problem 1: Total difference between both lists.
//
// @param x  {long} First list of location IDs.
// @param y  {long} Second list of location IDs 
//
prob:{sum abs (-). asc each(x;y)}


// Compute answer
prob . ll:("J J";5 3 5)0:`:input


//
// @desc Part 2: Similarity score.
//
// @param x  {long} First list of location IDs.
// @param y  {long} Second list of location IDs 
//
sim:{sum x*x#count each group y}

sim . ll