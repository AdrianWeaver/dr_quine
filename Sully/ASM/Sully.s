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
s db "section .data%ccc db %c/bin/nasm%c,0%carg1 db %cSullyX.s%c, 0%carg2 db %c-felf64%c,0%carg3 db %c;%c,0%carg4 db %c/bin/clang%c, 0%carg5 db %cSullyX.o%c, 0%carg6 db %c-lc%c,0%carg7 db %c-o%c,0%carg8 db %cSully%c,0%cargptr dq cc,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,0%cexeptr dq arg8%cs db %c%s%c%c%csection .text%cglobal main%cextern dprintf%cextern printf%cextern waitpid%cextern exit%c%c%%macro print 0%cpush rbp%cmov rbp,rsp%cmov rdi,r12%cmov rsi,s%cmov rdx,10%c;rcx is a 34%cmov r8,34%cmov r9,10%cmov rcx,49 ;change this value%cws:push 111%cloop ws%cpush 34%cpush s%cpush 34%cpush 10%cpush 34%cpush 34%cpush 10%cpush 10%cpush 10%cpush 10%cpush 34%cpush 34%cpush 10%cpush 34%cpush 34%cpush 10%cpush 34%cpush 34%cpush 10%cpush 34%cpush 34%cpush 10%cpush 34%cpush 34%cpush 10%cpush 34%cpush 34%cpush 10%cpush 34%cpush 34%cpush 10%cpush 34%cpush 34%cmov rcx,34%ccall dprintf%cmov rcx,144%csa:pop rax%cloop sa%c%c%%endmacro%c%cmain:%c	push r12%c	push r13%c	mov r13, rdx%c	mov [arg1+5], byte '5'%c	mov [arg5+5], byte '5'%c	mov rax,2%c	mov rdi,arg1%c	mov rsi,01101o%c	mov rdx,0640o%c	syscall ;open%c	mov r12, rax%c	cmp rax,0%c	js quit%c	mov rax, 57%c	syscall ;fork%c	cmp rax, 0%c	js quit%c	cmp rax, 0%c	je child%c	sub rsp, 64%c	mov rdi, rax%c	mov rsi, rsp%c	mov rdx, 0%c	call waitpid ;waitpid%c	mov rcx, arg8%c	mov rsi, exeptr%c	mov rdi, rcx%c	mov rdx, r13%c	mov rax, 59%c	syscall 	;execve execution%c	add rsp, 64%c	mov rdi, r12%c	mov rax, 2%c	syscall ;close fd%cquit:%c	pop r13%c	pop r12%c	mov rdi,0%c	call exit%cchild:%c	print%c	mov rsi,cc %c	mov rdi,argptr%c	mov rdx,r13%c	mov rax,59%c	syscall ;execve compilation%c	mov rdi, r12%c	mov rax, 2%c	syscall ;close fd%c	jmp quit", 0
section .text
global main
extern dprintf
extern printf
extern waitpid
extern exit

%macro print 0
push rbp
mov rbp,rsp
mov rdi,r12
mov rsi,s
mov rdx,10
;rcx is a 34
mov r8,34
mov r9,10
mov rcx,111 ;change this value
ws:push 10
loop ws
push 34
push s
push 34
push 10
push 34
push 34
push 10
push 10
push 10
push 10
push 34
push 34
push 10
push 34
push 34
push 10
push 34
push 34
push 10
push 34
push 34
push 10
push 34
push 34
push 10
push 34
push 34
push 10
push 34
push 34
push 10
push 34
push 34
mov rcx,34
call dprintf
mov rcx,144
sa:pop rax
loop sa
pop rbp
%endmacro

main:
	push r12
	push r13
	mov r13, rdx
	mov [arg1+5], byte '5'
	mov [arg5+5], byte '5'
	mov rax,2
	mov rdi,arg1
	mov rsi,01101o
	mov rdx,0640o
	syscall ;open
	mov r12, rax
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
	mov rdi, r12
	mov rax, 2
	syscall ;close fd
quit:
	pop r13
	pop r12
	mov rdi,0
	call exit
child:
	print
	mov rsi,cc 
	mov rdi,argptr
	mov rdx,r13
	mov rax,59
	syscall ;execve compilation
	mov rdi, r12
	mov rax, 2
	syscall ;close fd
	jmp quit
