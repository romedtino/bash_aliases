# bash_aliases
Simple bash quality of improvements

**output_aliases** - Output your aliases in your terminal window to easily see a list of your shortcuts
Sample ~/.bashrc
```
if [ -f ~/.aliases.bash ]; then
  . ~/.aliases.bash
fi
if [ -f ~/.output_aliases.bash ]; then
  . ~/.output_aliases.bash
fi
output_aliases ~/.aliases.bash
```
Sample ~/.aliases.bash
```
alias moome="echo moo $@" # Adds moo to the beginning of an echo
alias grepy="grep -rni" # Recursive grep, case-insensitive
```
On Terminal open
```
  Available commands:
moome - Adds moo to the beginning of an echo
grepy - Recursive grep, case-insensitive

[user@home]$ 
```
