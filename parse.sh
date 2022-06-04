#!/usr/bin/env bash

set -e

function usage
{
    echo "usage: `basename $0` -d 删除内容 -p 关闭端口"
    echo "   ";
    echo "  -d  | --delete file         : deleted content";
    echo "  -p  | --delete port         : close port";
    echo "  -D  | --directory location  : directory location";
}

function parse_args
{
  while [ "$1" != "" ]; do
      case "$1" in
          -d  | --delete )               deletefile="$2";;
          -p  | --port   )               deleteport="$2";;
          -D  | --dir    )               dir="$2";;
      esac
      shift
  done

  if [[ -z "${deletefile}" ]]; then
     echo -e "should set -d\n"
     usage
     exit;
  fi

  if [[ -z "${deleteport}" ]]; then
      deleteport="0"
  fi

  if [[ -z "${dir}" ]]; then
      dir="/ccd/data/script/tengine"
  fi
  echo "${deletefile}"
  echo "${deleteport}"
  echo "${dir}"
}


function run {
parse_args "$@";
}
run "$@";

