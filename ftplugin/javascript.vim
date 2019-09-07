" Go to file implementation for JavaScript
" Author: Gerald <i@gerald.top>

if !exists('*s:GotoJavaScriptFile')
  fu s:GotoJavaScriptFile()
    let cfile = expand('<cfile>')
    let dirname = expand('%:p:h')

    if cfile =~ '^\.'
      let cfile = dirname . '/' . cfile
    elseif cfile =~ '^#/'
      let cfile = expand('src') . strpart(cfile, 1)
    endif

    for suffix in ['', '.js', '/index.js']
      let fullpath = cfile . suffix
      if filereadable(fullpath)
        exe 'tabe ' . fullpath
        return
      endif
    endfor

    if exists('*SearchFile')
      call SearchFile(cfile)
    else
      echo 'File not found: ' . cfile
    endif
  endf
en

nmap <buffer> gf :call <SID>GotoJavaScriptFile()<CR>
