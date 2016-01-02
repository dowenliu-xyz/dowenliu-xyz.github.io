#!/bin/bash
script="$0"
while [ -h "${script}" ] ; do
  ls=`ls -ld "${script}"`
  link=`expr "${ls}" : '.*-> \(.*\)$'`
  if expr "${link}" : '/.*' > /dev/null; then
    script="${link}"
  else
    script=`dirname "${script}"`/"${link}"
  fi
done
dir=`dirname "${script}"`
dir=$(cd "${dir}"; pwd)
HOME=$(cd "${dir}/.."; pwd)
cd ${HOME}
if [ -d "${HOME}/tag" ]
then
    rm -rf "${HOME}/tag"
fi
jekyll clean
jekyll b
cp -r "${HOME}/_site/tag" "${HOME}/"
