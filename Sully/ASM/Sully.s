section .data
args db "/bin/gcc",0
file db "SullyX.s", 0
db "-o",0
db "Sully",0
db 0
s db "section .data%cfile db %cGraceX.s%c, 0%cs db %c%s%c%c"
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
	mov [file+5], byte '5'
	mov rax,2
	mov rdi,file
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
	mov rsi, r12
	mov rdi, args
	mov rdx, r13
	mov rax, 59
	syscall 	;execve
	add rsp, 64

quit:
	pop r13
	pop r12
	mov rdi,0
	call exit

child:
	mov rsi, [args]
	mov rdi, rsi
	mov rdx, r13
	mov rax, 59
	syscall
	jmp quit
