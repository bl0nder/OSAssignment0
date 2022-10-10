;NOTE: The MakeFile of this program uses yasm

global main 
default rel
extern printf
extern scanf

section .data
	newline: db "", 10, 0
	intFormat: db "%d", 0
	strFormat: db "%s", 0
	inputStrMsg: db "Enter a string (without any spaces): ", 0
	inputIntMsg: db "Enter a number: ", 0
	outputStrMsg: db "Your string is: ", 0
	outputIntMsg: db "Your number is: ", 0

section .text
main:
	push rbp	;Push base pointer onto stack 
	mov rbp, rsp

	lea rdi, [inputStrMsg]	;Load address of inputStrMsg into rdi (1st argument to printf)
	call printf wrt ..plt	;Call printf with argument stored in rdi

	;String input - no spaces
	xor eax, eax	;No floating point input so setting eax to 0
	lea rdi, [strFormat]	;1st argument to scanf (string format)
	lea rsi, [usrStr]	;2nd argument to scanf (address of variable where string will be stored)
	call scanf wrt ..plt	;Calling scanf with arguments set in rdi and rsi

	;String output
	lea rdi, [outputStrMsg]	;1st argument to printf (address of variable containing string to be printed)
	call printf wrt ..plt	;Calling printf with argument set in rdi

	lea rdi, [usrStr]	;Printing input string
	call printf wrt ..plt

	lea rdi, [newline]	;Printing newline (\n) before asking for int input
	call printf wrt ..plt

	;Clearing rdi and rsi for int input
	xor rdi, rdi
	xor rsi, rsi

	;Int input - Process followed is more or less same as that followed for string input
	lea rdi, [inputIntMsg]
	call printf wrt ..plt

	lea rdi, [intFormat]
	lea rsi, [usrInt]
	call scanf wrt ..plt

	;Int output

	lea rdi, [outputIntMsg]
	call printf wrt ..plt

	lea rdi, [intFormat]
	mov rsi, [usrInt]
	call printf wrt ..plt

	lea rdi, [newline]
	call printf wrt ..plt

	pop rbp		;Pop base pointer from stack
	sub rax, rax	;Set function return value to 0 
	ret		;Return from function

section .bss
	usrStr : resb 1000
	usrInt : resb 1000
