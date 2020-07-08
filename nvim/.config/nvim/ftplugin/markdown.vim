setlocal spell

augroup filetype_markdown
  autocmd!
  autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
augroup END
