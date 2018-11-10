
;Code to take input from user and display it. Use of readstring and Writestring.
INCLUDE Irvine32.inc
.data
buffer byte 50 DUP(?)
byte_count Dword ?

.code
main PROC
mov eax,white +(cyan * 16)
call SetTextColor
mov edx, OFFSET buffer
mov ecx, sizeof buffer
call readstring
mov byte_count , eax
mov edx, OFFSET buffer
call writestring
exit
main ENDP
END main
