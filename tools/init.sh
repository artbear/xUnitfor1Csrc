#!/bin/bash
called_path=${0%/*}
stripped=${called_path#[^/]*}
real_path=`pwd`$stripped
dir=`dirname $0`
#echo "called path: $called_path"
#echo "stripped: $stripped"
#echo "pwd: `pwd`"
#echo "real path: $real_path"

mode=$1
if [ -z "$mode" ]; then
    mode="./lib/cf/"
fi

connstring=
USERPWD=
#connstring=--ibname /F"~/projects/onec/itil"
#USERPWD=--db-user base --db-pwd 234567890
#export RUNNER_ENV=production

pushd $dir
oscript init.os init-dev --src "$mode"
oscript init.os init-dev --dev --src "$mode"

popd 