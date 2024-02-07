section .rodata	;mandatory comment
file db "Grace.s", 0
s db "section .rodata	;mandatory comment%cfile db %cGrace.s%c, 0%cs db %c%s%c,0%c%csection .bss%csection .text%cextern dprintf%cextern exit%cglobal _start%c%c%%macro code 0%cmov	rax,2%cmov rdi,file%cmov rsi,01101o%cmov rdx,0640o%csyscall%ccmp rax,0%cjs quit%cpush rbx%cpush rbp%cmov rbp,rsp%cmov rbx,rax%cmov rdi,rax%cmov rsi,s%cmov rdx,10%cmov r8,34%cmov r9,10%cmov rcx,49%cws:push 10%cloop ws%cpush 34%cpush s%cpush 34%cmov rcx,34%cxor rax,rax%ccall dprintf%cmov rcx,52%csa:pop rax%cloop sa%cpop rbp%cpop rbx%cmov rax,3%cmov	rdi,rbx%csyscall%cquit:%cmov rax,60%cmov rdi,0%csyscall%c%%endmacro%c%c_start:%c	code",0

section .bss
section .text
extern dprintf
extern exit
global _start

%macro code 0
mov	rax,2
mov rdi,file
mov rsi,01101o
mov rdx,0640o
syscall
cmp rax,0
js quit
push rbx
push rbp
mov rbp,rsp
mov rbx,rax
mov rdi,rax
mov rsi,s
mov rdx,10
mov r8,34
mov r9,10
mov rcx,49
ws:push 10
loop ws
push 34
push s
push 34
mov rcx,34
xor rax,rax
call dprintf
mov rcx,52
sa:pop rax
loop sa
pop rbp
pop rbx
mov rax,3
mov	rdi,rbx
syscall
quit:
mov rax,60
mov rdi,0
syscall
%endmacro

_start:
	code