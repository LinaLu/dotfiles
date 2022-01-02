### PATH


local loc=$(echo $PATH | sed -e $'s/:/\\\n/g' | eval "sk --header='[find:path]'")

if [[ -d $loc ]]; then
  echo "$(rg --files $loc | rev | cut -d"/" -f1 | rev)" | eval "sk --header='[find:exe] => ${loc}' >/dev/null"
  fp
fi
