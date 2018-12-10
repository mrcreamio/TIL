include irvine32.inc
Employee STRUCT
	IdNum BYTE "000000000"
	LastName BYTE 30 DUP(0)
	Years WORD 0
	SalaryHistory DWORD 0 ,0 ,0 ,0
Employee ENDS
.data
	message1 byte "Enter Employee's data. In the order ID, Last Name, Years Worked and salary history",0
	message2 byte "Employee's Record, In the order ID, Last Name, Years Worked and salary history", 0
	person1 Employee<>
.code
main PROC
	mov edx, offset message1
	call writestring
	call crlf
	xor eax,eax
	;Enter ID
	mov edx, offset person1.IdNum
	mov ecx, (sizeof person1.IdNum)
	call readstring
	;Enter LastName
	mov edx, offset person1.LastName
	mov ecx, (sizeof person1.LastName)

	call readstring
	;Enter Years Worked
	call readint
	mov person1.Years, ax
	;Enter Salary History
	mov cx, 4
	mov esi, offset person1.SalaryHistory
	L1:
	call readint
	mov DWORD PTR [esi], eax
	add esi,4
	Loop L1
	mov edx, offset message2
	call writestring
	call crlf
	;Show Id
	mov edx, offset person1.IdNum
	call writestring
	call crlf
	;Show LastName
	mov edx, offset person1.LastName
	call writestring
	call crlf
	;Show Years worked
	mov ax, person1.years
	call writedec
	call crlf
	;Show Salary history
	mov cx, 4
	mov esi, offset person1.SalaryHistory
	L2:
	mov eax, [esi]
	call writedec
	call crlf
	add esi,4
	Loop L2
exit
main ENDP
end main
