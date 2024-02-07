section .data
recurs equ 5
cc db "/bin/nasm",0
arg1 db "Sully5.s",0
arg2 db "-felf64",0
arg3 db ";",0
arg4 db "/bin/clang",0
arg5 db "Sully5.o",0
arg6 db "-lc",0
arg7 db "-o",0
arg8 db "./Sully",0
argptr dq cc,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,0
exeptr dq arg8,0
s db "section .data%crecurs equ %d%ccc db %c/bin/nasm%c,0%carg1 db %cSully%d.s%c,0%carg2 db %c-felf64%c,0%carg3 db %c;%c,0%carg4 db %c/bin/clang%c,0%carg5 db %cSully%d.o%c,0%carg6 db %c-lc%c,0%carg7 db %c-o%c,0%carg8 db %c./Sully%c,0%cargptr dq cc,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,0%cexeptr dq arg8,0%cs db %c%s%c,0%c%csection .text%cglobal main%cextern dprintf%cextern printf%cextern waitpid%cextern exit%c%c%%macro print 0%cpush rbp%cmov rbp,rsp%cmov rdi,r12%cmov rsi,s%cmov rdx,10%c;rcx is a 34%cmov r8,10%cmov r9,34%cmov rcx,118 ;change this value%cws:push 10%cloop ws%cpush 34%cpush s%cpush 34%cpush 10%cpush 10%cpush 10%cpush 34%cpush 34%cpush 10%cpush 34%cpush 34%cpush 10%cpush 34%cpush 34%cpush 10%cpush 34%cpush r14%cpush 34%cpush 10%cpush 34%cpush 34%cpush 10%cpush 34%cpush 34%cpush 10%cpush 34%cpush 34%cpush 10%cpush 34%cpush r14%cpush 34%cpush 10%cpush 34%cmov rcx,r14%cxor rax,rax%ccall dprintf%cmov rcx,151%csa:pop rax%cloop sa%cpop rbp%c%%endmacro%c%cmain:%cxor rax,rax%ccmp rax,recurs%cjz	quit%cpush r12%cpush r13%cpush r14%cpush r15%cmov r14,recurs%csub r14,1%cmov r13,rdx%cmov rax,2%cmov rdi,arg1%cmov rsi,01101o%cmov rdx,0640o%csyscall ;open%ccmp rax,0%cjs quit%cmov r12,rax%cprint%cmov rdi,r12%cmov rax,3%csyscall%cmov rax,57%csyscall ;fork%ccmp rax,0%cjs quit%ccmp rax,0%cje child%csub rsp,64%cmov rdi,rax%cmov rsi,rsp%cmov rdx,0%ccall waitpid%cadd rsp,64%cmov rdi,arg8%cmov rsi,exeptr%cmov rdx,r13%cmov rax,59%csyscall 	;execve execution%cquit:%cpop r15%cpop r14%cpop r13%cpop r12%cmov rdi,0%ccall exit%cchild:%cmov rdi,cc%cmov rsi,argptr%cmov rdx,r13%cmov rax,59%csyscall%cjmp quit%c",0
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
mov r8,10
mov r9,34
mov rcx,118 ;change this value
ws:push 10
loop ws
push 34
push s
push 34
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
push r14
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
push r14
push 34
push 10
push 34
mov rcx,r14
xor rax,rax
call dprintf
mov rcx,151
sa:pop rax
loop sa
pop rbp
%endmacro

main:
xor rax,rax
cmp rax,recurs
jz	quit
push r12
push r13
push r14
push r15
mov r14,recurs
sub r14,1
mov r13,rdx
mov rax,2
mov rdi,arg1
mov rsi,01101o
mov rdx,0640o
syscall ;open
cmp rax,0
js quit
mov r12,rax
print
mov rdi,r12
mov rax,3
syscall
mov rax,57
syscall ;fork
cmp rax,0
js quit
cmp rax,0
je child
sub rsp,64
mov rdi,rax
mov rsi,rsp
mov rdx,0
call waitpid
add rsp,64
mov rdi,arg8
mov rsi,exeptr
mov rdx,r13
mov rax,59
syscall 	;execve execution
quit:
pop r15
pop r14
pop r13
pop r12
mov rdi,0
call exit
child:
mov rdi,cc
mov rsi,argptr
mov rdx,r13
mov rax,59
syscall
jmp quit
