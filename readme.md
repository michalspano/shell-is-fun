# Shell Programming - 'shell-is-fun'

[![Stargazers][stars-shield]][stars-url]

The main objective of this repositery is to share fun shell projects and encourage others to try __shell scripting__ on their own.

## Installation
Execute commands below!

```Shell
$ git clone https://github.com/michalspano/shell-is-fun.git
```

[__Zip download__][ZIP]

### Bourne shell
- File extension `.sh`
- About [__Bourne shell__][WIKI_LINK]

## Execute .sh files
### 1.
```Shell
$ sh $FILE_PATH
```

**OR**

### 2.
```Shell
$ chmod +x $FILE_PATH
```

```Shell
$ ./$FILE_PATH
```

`$FILE_PATH` represents desired __location__ on the local storage of the shell script, i.e. the __path__.
<br><br>
__KEEP IN MIND:__ 
- [option 1](#1.) will be used in the course
- To keep it simple, it will be assumed (in the instruction commands) that the source file is present within the _working directory_. Otherwise _relative path_ of the source file is requiered.
- Every tool has its respective __directory__.

## Contents

### File Reader
Read content from __.txt__ files _in a split second_!

```Shell
$ sh core.sh $READ_FROM_FILE_PATH
```

### Git Shortcuts
Do you want to speed up your git workflow? Use these handy shortcuts to do so!

__NOTE:__ provided command line arguments, i.e. _methods_ are __not case sensitive__.

### Formatted git log
Automatically remaps `git log` to `git log --oneline --all --graph`

```Shell
$ sh git.sh log
```

### Automated git commit & push
Seamlessly commits and pushes changes to a local repositery in a single command.

```Shell
$ sh git.sh c-p $COMMIT_MESSAGE
```

__NOTE:__ it will be assued that the remote is already __specified__ and changes (to be commited) have been __added__ to the __staging area__.

<!-- LINK REFS -->
[WIKI_LINK]: https://en.wikipedia.org/wiki/Bourne_shell
[stars-shield]: https://img.shields.io/github/stars/michalspano/shell-is-fun.svg?style=for-the-badge
[stars-url]: https://github.com/michalspano/shell-is-fun/stargazers
[ZIP]: https://github.com/michalspano/shell-is-fun/archive/refs/heads/main.zip
