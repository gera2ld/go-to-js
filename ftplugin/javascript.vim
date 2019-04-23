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

    if exists(':FZF')
      exec 'FZF -q ' . cfile
    else
      echo 'File not found'
    endif
  endf
en

nmap <buffer> <LocalLeader>e :call <SID>GotoJavaScriptFile()<CR>
nmap <buffer> gf :call <SID>GotoJavaScriptFile()<CR>
