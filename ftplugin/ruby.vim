function! ruby#format()
  if !exists('g:rubyfmt_on_save')
    return
  endif

  let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
  execute "%!" . s:path . "/rubyfmt.rb"

  if v:shell_error == 1
    let format_error = join(getline(1,'$'), "\n")
    undo
    echo format_error
  endif
endfunction

function! ruby#toggle_format_on_save()
  if exists('g:rubyfmt_on_save')
    unlet g:rubyfmt_on_save
    echo "rubyfmt on save disabled"
  else
    let g:rubyfmt_on_save = 1
    echo "rubyfmt on save enabled"
  endif
endfunction

let g:rubyfmt_on_save = 1

autocmd BufWritePre <buffer> call ruby#format()
command RubyfmtToggle call ruby#toggle_format_on_save()
