section .data
cc db "/bin/nasm",0
arg1 db "SullyX.s", 0
arg2 db "-felf64",0
arg3 db ";",0
arg4 db "/bin/clang", 0
arg5 db "SullyX.o", 0
arg6 db "-lc",0
arg7 db "-o",0
arg8 db "Sully",0
argptr dq cc,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,0
exeptr dq arg8
s db "section .data%cfile db %cGraceX.s%c, 0%cs db %c%s%c%c"
pattern db "%s\n"

section .text
global main
extern dprintf
extern printf
extern waitpid
extern exit

main:
	push r12
	push r13
	mov r12, rsi
	mov r13, rdx
	mov [arg1+5], byte '5'
	mov [arg5+5], byte '5'
	mov rax,2
	mov rdi,arg1
	mov rsi,01101o
	mov rdx,0640o
	syscall ;open
	cmp rax,0
	js quit
	mov rax, 57
	syscall ;fork
	cmp rax, 0
	js quit
	cmp rax, 0
	je child
	sub rsp, 64
	mov rdi, rax
	mov rsi, rsp
	mov rdx, 0
	call waitpid ;waitpid
	mov rcx, arg8
	mov rsi, exeptr
	mov rdi, rcx
	mov rdx, r13
	mov rax, 59
	syscall 	;execve execution
	add rsp, 64

quit:
	pop r13
	pop r12
	mov rdi,0
	call exit

child:
	mov rsi,cc 
	mov rdi,argptr
	mov rdx,r13
	mov rax,59
	syscall ;execve compilation
	jmp quit
