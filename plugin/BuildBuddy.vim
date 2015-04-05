" Do some fancy :make Makefile searching.  Search for Makefile in parent
" directories up to 4 deep, either as Makefile or build/Makefile
fun! SetMkfile()
  let filemk = "Makefile"
  let pathmk = "./"
  let depth = 1
  while depth < 5
    if filereadable(pathmk . filemk)
      return pathmk
    elseif filereadable(pathmk . "build/" . filemk)
      return pathmk . "build/"
    endif

    let depth += 1
    let pathmk = "../" . pathmk
  endwhile
  return "."
endf

let cpuCores = system('grep -c ^processor /proc/cpuinfo')+1
command! -nargs=* BuildBuddy let $mkpath = SetMkfile() | Make <args> -C $mkpath -j$cpuCores
