include irvine32.inc

.data
.code
main proc

    xor eax,eax
    mov	al,0F0h
    call writebin
    call crlf
    sal	al,1
    call writebin

exit
main endp
end main
