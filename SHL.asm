include irvine32.inc

.data

.code

main proc

    xor eax,eax
    mov al, 10001111b
    call writebin
    call crlf
    shl al, 1
    call writebin

exit

main endp

end main
