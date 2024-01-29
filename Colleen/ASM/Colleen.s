section .data;comment one
s db "section .data;comment one%cs db %c%s%c%csection .text%cextern printf,exit%cglobal main%cmain:;comment two%cmov rdi,s%cmov rsi,10%cmov rdx,34%cmov r8,34%cmov r9,10%cmov rcx,26%cpush rbp%cws:push 10%cloop ws%cmov rcx,s%cxor rax,rax%ccall printf%cmov rcx,26%csa:pop rax%cloop sa%cpop rbp%cmov rdi,0%cjmp finish%cfinish:%ccall exit%csection .bss"
section .text
extern printf,exit
global main
main:;comment two
mov rdi,s
mov rsi,10
mov rdx,34
mov r8,34
mov r9,10
mov rcx,26
push rbp
ws:push 10
loop ws
mov rcx,s
xor rax,rax
call printf
mov rcx,26
sa:pop rax
loop sa
pop rbp
mov rdi,0
jmp finish
finish:
call exit
section .bss