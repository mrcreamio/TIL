include Irvine32.inc
.data
str1 DB "Input a1 value: ", 0
str2 DB "Input b1 value: ", 0
str3 DB "Input c1 value: ", 0
cond1 DB "condition I (greater than) is true",0
cond2 DB "condition II (All equal) is true", 0
cond3 DB "condition III (Less Than) is true", 0
cond4 DB "No condition is true", 0
cond5 DB "last condition ( or operator ) is true",0
a1 DD ?
b1 DD ?
c1 DD ?

.code
main proc
mov eax, 00000000
mov ebx, 00000000

mov edx, offset str1
call WriteString
call ReadInt
mov a1, eax
call crlf

mov edx, offset str2
call WriteString
call ReadInt
mov b1, eax
call crlf

mov edx, offset str3
call WriteString
call ReadInt
mov c1, eax
call crlf

mov eax, a1
cmp eax,b1
ja iff
jbe elseiff
iff:
	mov eax,b1
	cmp eax,c1
	ja iffi
	jb elseiff
	iffi:
		mov edx, offset cond1
		call writestring
		jmp exiting
elseiff:
		mov eax, a1
		cmp eax, b1
		je ifequal
		jne elseifif
		
		ifequal:
			mov eax, b1
			cmp eax,c1
			je iffequal
			jne elseifif
			iffequal:
				mov edx, offset cond2
				call writestring
				jmp exiting

elseifif:
		mov eax,a1
		cmp eax, b1
		jb below
		jae singleElse
		
		below:
			mov eax,b1
			cmp eax,c1
			jb ifbelow
			ja singleElse
			ifbelow:
				mov edx, offset cond3
				call writeString
				jmp exiting

singleElse:
		mov edx, offset cond4
		call writestring




exiting:
		mov eax, a1
		cmp eax, b1
		ja printing
		mov eax, b1
		cmp eax, c1
		ja printing
		jbe confirmExit
		printing:
				call crlf
				mov edx, offset cond5
				call writestring
				call crlf
confirmExit:
exit
main endp
end main
