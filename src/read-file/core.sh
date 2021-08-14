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
    if [ -e "$PATH" ]
    then
        # Prompt the user with message and continue to read the file
        printf "\n$PATH exists.\n"
        READFILE $PATH
    else
        # Promp the user with a message and abort the reading 
        printf "\n$PATH does not exist.\n"
    fi
}

function READFILE()
{
    # Create an index place-holder
    LINE=1

    # Create empty files to clear the space
    CLEAR

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

function CLEAR()
{
    for _ in {1..15}
    do
        printf "\n"
    done 
}

# Call the main function
main
