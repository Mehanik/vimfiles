"Author: Nachum Kanovsky
"Email: nkanovsky yahoo com
"Version: 1.1

if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

augroup filetypedetect
  au! BufRead,BufNewFile *.v,*.vh,*.sv,*.svh setfiletype systemverilog
augroup END

" Let the matchit plugin know what items can be matched.
let b:match_ignorecase=0
let b:match_words=
      \ '\<begin\>:\<end\>,' .
      \ '\<if\>:\<else\>,' .
      \ '\<module\>:\<endmodule\>,' .
      \ '\<class\>:\<endclass\>,' .
      \ '\<program\>:\<endprogram\>,' .
      \ '\<clocking\>:\<endclocking\>,' .
      \ '\<property\>:\<endproperty\>,' .
      \ '\<sequence\>:\<endsequence\>,' .
      \ '\<package\>:\<endpackage\>,' .
      \ '\<covergroup\>:\<endgroup\>,' .
      \ '\<primitive\>:\<endprimitive\>,' .
      \ '\<specify\>:\<endspecify\>,' .
      \ '\<generate\>:\<endgenerate\>,' .
      \ '\<interface\>:\<endinterface\>,' .
      \ '\<function\>:\<endfunction\>,' .
      \ '\<task\>:\<endtask\>,' .
      \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
      \ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
      \ '`ifdef\>:`else\>:`endif\>,' .
      \ '\<generate\>:\<endgenerate\>'
