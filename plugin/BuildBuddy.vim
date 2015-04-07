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

function! SetMakeprg()
  if !empty($NUMBER_OF_PROCESSORS)
    " this works on Windows and provides a convenient override mechanism otherwise
    let n = $NUMBER_OF_PROCESSORS + 0
  elseif filereadable('/proc/cpuinfo')
    " this works on most Linux systems
    let n = system("grep -c '^processor' /proc/cpuinfo")
  elseif executable('/usr/sbin/psrinfo')
    " this works on Solaris
    let n = system('/usr/sbin/psrinfo -p')
  else
    " default to single process if we can't figure it out automatically
    let n = 1
  endif
  let &makeprg = 'make' . (n > 1 ? (' -j'.(n + 1)) : '')
endfunction
call SetMakeprg()

command! -nargs=* BuildBuddy let $mkpath = SetMkfile() | Make <args> -C $mkpath
