#! /bin/bash
# You may read your ASCII art directly to the terminal using this script

function main()
{
    # 1. Get the PATH of the file using a user input
    read -p "Paste the path of the file: " PATH
    
    # 2. Check if the path exists
    validatePath $PATH
}

# Function to validate the user provided path
function validatePath()
{
    echo "$1"
    if [ -e "$1" ]
    then
        # Prompt the user with message and continue to read the file
        printf "$PATH exists.\n"
        READFILE $1
    else
        # Promp the user with a message and abort the reading 
        printf "$1 does not exist.\n"
    fi
}

function READFILE()
{
    # Create an index place-holder
    LINE=1

    # Create empty files to clear the space
    for _ in {1..15}
    do
        printf "\n"
    done

    # Start a while loop with the variable containing the contents from the current line
    while read -r CURRENT_LINE
        do
            # Print the content of the current line
            echo "$CURRENT_LINE"

            # Increment the line index
            ((LINE++))
    # Pass in the PATH of the input file
    done < "./$1"
    printf "\nFinished!\n"
}

main
