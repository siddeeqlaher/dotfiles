showColours() {
  for i in {0..255}; do
    print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f "
    if (( i % 6 == 3 )); then
      print
    fi
  done
  print
}

addToPath() {
  [[ -d "$1" ]] && export PATH="$1:$PATH"
}
