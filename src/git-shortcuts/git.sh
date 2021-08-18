#! /bin/bash
# Git command shortcuts with Shell

# Receive command line arguments
IDENTIFIER=$1
MSG=$2

# Prompt user with the current git version insatlled locally
function GIT_VERSION()
{
    echo "
    ---System---
    \n" 
    git --version
}


function MAIN()
{
    # Show the current git version
    GIT_VERSION
    ID=''

    # Create a switch with the user input via command line arg
    case "$1" in
        # Detect log option
        [lL] | [lL][oO][gG])
            ID="Log"
            DECORATOR $ID 
            LOG
            ;;
        # Detect c&p aka commit-push
        [cC][_-][pP])
            ID="Commit&Push"
            DECORATOR $ID
            COMMIT_PUSH $2
            ;;
        *)
            echo "Usage: ./git.sh 'METHOD'"
            ;;
    esac
}

function LOG()
{
    # Remapping 'git log' to :
    git log --oneline --all --graph
}

# Automated commit & push at once
function COMMIT_PUSH()
{
    function COMMIT()
    {
        git commit -m "$1"
    }

    function PUSH()
    {
        git push
    }

    # Detect if commit msg exists
    # Commit msg exists (passed as 2nd command-line arg)
    if [ "$MSG" != "" ]
    then
        # Proceed further if valid msg was specified
        COMMIT $MSG
        PUSH
    # Prompt with incorrect usage
    else
        # Abort the process
        echo "Usage: ./git.sh c-p 'COMMIT_MSG'"
    fi
}

# Create a decorator function
function DECORATOR()
{
    # Print out the chosen method
    echo "Chosen method: $1"

    # Delay the shell
    sleep 0.75s

    # Clear the shell
    clear

}

MAIN $IDENTIFIER $MSG
