# Shell Programming aka 'shell-is-fun'

[![Stargazers][stars-shield]][stars-url]

The main objective of this repositery is to share fun shell projects and encourage others to try __shell scripting__ on their own. 

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

`$FILE_PATH` represents desired __location__ on the local storage of the shell script, aka the __path__.

__NOTE:__ [option 1](#1.) will be used in the course.

## Contents

### Git Shortcuts
Do you want to speed up your git workflow? Use these handy shortcuts to do so!
__NOTE:__ provided command line arguments a.k.a. _methods_ are __not case sensitive__.

### Formatted git log
Automatically remaps `git log` to `git log --oneline --all --graph`

```Shell
sh git.sh log
```

<!-- LINK REFS -->
[WIKI_LINK]: https://en.wikipedia.org/wiki/Bourne_shell
[stars-shield]: https://img.shields.io/github/stars/michalspano/shell-is-fun.svg?style=for-the-badge
[stars-url]: https://github.com/michalspano/shell-is-fun/stargazers
