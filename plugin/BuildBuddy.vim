" Do some fancy :make Makefile searching.  Search for Makefile in parent
" directories up to 4 deep, either as Makefile or build/Makefile
fun! SetMkfile()
  let filemk = "Makefile"
  let pathmk = "./"
  let depth = 1
  while depth < 4
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

command! -nargs=* Make let $mkpath = SetMkfile() | make <args> -C $mkpath | cwindow 10
