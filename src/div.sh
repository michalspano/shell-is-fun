#!bin/bash

# Print all numbers divisible by k until n
function print_divisible_numbers {
    local k=$1
    local n=$2
    local i=1
    while [ $i -le $n ]; do
        if [ $(($i % $k)) -eq 0 ]; then
            echo $i
        fi
        i=$(($i + 1))
    done
}

# Check if 2 command-line arguments are given
# otherwise exit program
if [ $# -ne 2 ]; then
    echo "Usage: $0 <k> <n>"
    exit 1
fi

print_divisible_numbers $1 $2

