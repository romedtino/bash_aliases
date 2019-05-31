######
# Description:
#   Parses a bash alias file and outputs a list of the commands found from within it.
#   For example, if your bash file contains:
#     alias moome="echo moo $@" # Adds moo to the beginning of an echo
#     alias grepy="grep -rni" # Recursive grep, case-insensitive
#   Then when passed to this function, the function will print to console the following:
#     moome - Adds moo to the beginning of an echo
#     grepy - Recursive grep, case-insensitive
#   If you add something like this to your bashrc/bash_profile
#      output_aliases /home/user/.bash_aliases
#   You should then get an output of all your aliases in your terminal every time you open one
# Input:
#   $1 - path to a file that contains bash aliases
######
output_aliases() {
  
  color_oge=`tput setaf 3`
  color_prl=`tput setaf 5`
  color_rst=`tput sgr0`
  
  echo -e "${color_prl} Available commands: ${color_rst}"
  
  message=""
  while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ "$line" = *"alias"* ]]; then
      # Found alias
      command=$(echo ${line#* } | awk -F'=' '{print $1}')
      comment=$(echo ${line} | awk -F'#' '{print $2}')
      printf "${message}${color_oge}%-15s${color_rst}-${comment}\n" $command
    fi
  done < $1
}
