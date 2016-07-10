#!/bin/bash
called_path=${0%/*}
stripped=${called_path#[^/]*}
real_path=`pwd`$stripped
dir=`dirname $0`
#echo "called path: $called_path"
#echo "stripped: $stripped"
#echo "pwd: `pwd`"
#echo "real path: $real_path"

connstring="--ibname /F./build/ib"
USERPWD=
#connstring=--ibname /F"~/projects/onec/itil"
#USERPWD=--db-user base --db-pwd 234567890
#export RUNNER_ENV=production

pushd $dir
oscript runner.os xunit ./build/out/Tests/ --path "./build/out/xddTestRunner.epf" --report "./build/report.xml" $connstring $USERPWD
popd