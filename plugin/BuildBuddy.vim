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

command! -nargs=* BuildBuddy let $mkpath = SetMkfile() | Make <args> -C $mkpath

fun! SetYcmfile()
  let fileYcm = ".ycm_extra_conf.py"
  let pathYcm = "./"
  let depth = 1
  while depth < 4
    if filereadable(pathYcm . fileYcm)
      return pathYcm . fileYcm
    endif

    let depth += 1
    let pathYcm = "../" . pathYcm
  endwhile
  return "~/.vim/" . fileYcm
endf

let g:ycm_global_ycm_extra_conf = SetYcmfile()
