include irvine32.inc
mputchar MACRO char
	mov eax, char
	call WriteChar
	call crlf
ENDM
mReadStr MACRO varName, size
	push ecx
	push edx
	mov edx,OFFSET varName
	mov ecx, size
	call ReadString
	pop edx
	pop ecx
ENDM
mWriteStr MACRO string
	mov edx, OFFSET string
	call WriteString
	call crlf
ENDM
.data
msg BYTE ?
.code
main PROC
mputchar 'A'
mReadStr msg,50
mWriteStr msg
exit
main ENDP
END main
