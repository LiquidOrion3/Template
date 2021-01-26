#! /usr/bin/env bash
#@printall		output available bash	
#@Author dmiller

usage()
{
  cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-f] -p param_value arg1 [arg2...]

	-h | --help	print help
	-v | --verbose	output commands verbosly
	-c | --cat 	prints out the file
	-p | --param	sets variable with param

Bash Template

EOF
  exit
}
function printall()
{
	cat $0
	exit
}

while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -v | --verbose) set -x ;;
    -c | --cat) printall ;;
    -p | --param) 
    param="${2-}"
	shift ;;
    -?*) echo "Unknown option: $1"; exit ;;
    *) break ;;
    esac
    shift
  done

##------------

script_dir=~/Documents/dev
find $script_dir -iname "*.sh" -exec sed "2q;d" {} \;
