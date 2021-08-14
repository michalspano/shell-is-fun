#! /bin/bash
# Read the sequence of action(s) from the user
SEQUENCE=(echo\ "Unix commands are fun :)" pwd touch\ "test.txt" ls rm\ "*.txt" ls mkdir\ "Test" ls rm\ -r\ "Test" ls)

# Define the length of the sequence
SEQUENCE_LENGTH=${#SEQUENCE[@]}

# Create a decorator function
function DECORATOR()
{
    # Delay the reading
    sleep 2.5s

    # Clear the command env.
    clear
}

# Define an initial prompt msg
function PROMPT()
{
    echo "Reading a sequence of commands!"
    DECORATOR
}

PROMPT

# Define the initial index of 0
i=0

# Iterate through the elements from the sequence
while [ $i -lt $SEQUENCE_LENGTH ]
do
    # Sequence call
    ${SEQUENCE[i]}

    # Call the decorator function
    DECORATOR

    # Increment the index value
    ((i++))
done
