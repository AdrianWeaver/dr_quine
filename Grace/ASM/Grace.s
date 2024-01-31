section .data		;mandatory comment
file db "Grace_asm_output.txt", 0
len: equ $-file
error_msg db "There was an error in open", 10, 0
error_len: equ $-error_msg
printf_test db "This is a printf test", 10, 0
test_len: equ $-printf_test
section .text
extern printf
extern exit
global _start

%macro replace_open 0
mov	rax,2			;this is the syscall for open
mov rdi,file		;this is the file to be opened
;be aware flags and mods are octal values stored on an int
;next we need the flag it is stored on an 8 byte flag value
	;O_WRONLY defined as 1o
	;O_CREATE defined as 100o
	;we need both so... 101o
mov rsi, 0101o
;because we are using open we also need the mode arg.
	;these are the same as octal values in chmod so we want 640 here
mov rdx, 0640o
syscall
%endmacro

_start:
	mov rdi, printf_test
	call printf wrt ..plt
	replace_open	;open file and stores fd in rax
	mov rcx, rax	;saving fd
	cmp rax, 0		;checking return of open
	js error
	mov rdi, rax	;prepare a write with accurate fd
	mov rax, 1		;prepare a write syscall
	mov rsi, file	;writing from address "file"
	mov rdx, len	;for len characters
	syscall			;calling write

	
	mov rdi, rcx	;preparing to close fd
	mov rax, 3		;preparing close syscall
	syscall			;calling close

finish:
	mov rax, 60		;preparing to call exit
	mov rdi, 0		;return code 0
	syscall			;calling exit


error:
	mov rax, 1		;preparing a write error
	mov	rdi, 2		;writing on stderr
	mov rsi, error_msg	;writing error
	mov rdx, error_len	;for len of message
	syscall
	jmp finish

;trick to replace the main
;global obfuscated
;obfuscated:
;	magic
