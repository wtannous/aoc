// Problem 3 - AOC 2024 
// William Tannous


// Example
str:"xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"


//
// @desc PART 1.
// The approach below is to look for mult( and then subsequently look for the suffix ).
// Once this is done, we split on the "," delimiter and attempt to cast the resulting
// 2-element long list. If one of the values is 0N, we assume a non valid number was
// provided in between the ().
// 
// @param {str} Corrupted computer operation.
//
uncorrupt:{[str]
    l:")"vs/:1_"mul(" vs str; / Look for first instance of mul( and split the list, subsequenty splits those lists on the ending )
    sum prd each r where not any each  null r:"J"$ll where 1<count each ll:","vs/: first each l where 1<count each l
    }

// part 1 answer
sum uncorrupt each read0`:input