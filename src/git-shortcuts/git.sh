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
        [cC][+-][pP])
            ID="Commit&Push"
            DECORATOR $ID
            COMMIT_PUSH $2
            ;;
        # Detect a&c&p aka add-commit-push
        [aA][+-][cC][+-][pP])
            ID="Add&Commit&Push"
            DECORATOR $ID
            ADD_ALL
            COMMIT_PUSH $2
            ;;
        # Detect rename commit
        [rR] | [rR][eE][nN][aA][mM][eE])
            ID="Rename commit"
            DECORATOR $ID
            RENAME_COMMIT $2
            ;;
        # Detect config method
        [cC][oO][nN] | [cC][oO][nN][fF][iI][gG])
            ID="Config"
            DECORATOR $ID
            CONFIG
            ;;
        # Detect untrack file option
        [uU][nN] | [uU][nN][tT][rR][aA][cC][kK])
            ID="Untrack"
            DECORATOR $ID
            UNTRACK $2
            ;;

        # Detect revert last commit
        [rR][eE][vV] | [rR][eE][vV][eE][rR][tT])
            ID="Revert"
            DECORATOR $ID
            REVERT
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

# Add all existing changes to staging area
function ADD_ALL()
{
    git add .
}

# Rename commit, ... 'git commit -amend -m' ...
function RENAME_COMMIT()
{
    # Detect missing commit msg
    if [ {"$1" != ' ' ] && [ "$1" != '' ]
    then
        # Proceed further - valid msg exists
        git commit --amend -m "$1"
    else
        # Abort the process
        echo "Usage: ./git.sh r 'RENAME_MSG'"
    fi
}

# Check global git config
function CONFIG()
{
    # Opens configs and their locations in vim (by default)
    git config --list --show-origin
}

# Create function to untrack file(s)
function UNTRACK()
{
    # Detect if empty specified path
    if [ "$1" == '' ] || [ "$1" == ' ' ]
    then
        # Abort the process
        echo "Usage: ./git.sh un 'UNTRACK_FILE(S)'"
    
    # Detect if path refers to a local directory
    elif [ -d "$1" ]
    then
        git rm -r --cached "$1"

    # Detect if path refers to a local file
    else
        git rm --cached "$1"
    fi
}

# Create a function to revert the latest commit
function REVERT()
{
    # Resets the latest commit
    git reset HEAD~
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
