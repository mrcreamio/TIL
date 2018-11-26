include irvine32.inc

.data
.code
main proc
    
    xor eax, eax
    mov al,40h
    call writebin
    call crlf
    ror al,1
    call writebin
    call crlf
    ror al,1
    call writebin
    call crlf
    ror al,1
    call writebin
    call crlf


exit
main endp
end main
