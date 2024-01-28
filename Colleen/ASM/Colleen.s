section .data
s db "section .data%cs db %c%s%c%csection .text%cextern printf,exit%cglobal main%cmain:%cmov rdi,s%cmov rsi,10%cmov rdx,34%cmov r8,34%cmov r9,10%cmov rcx,24%cpush rbp%cws:push 10%cloop ws%cmov rcx,s%cxor rax,rax%ccall printf%cmov rcx,24%csa:pop rax%cloop sa%cpop rbp%cmov rdi,0%ccall exit%csection .bss"
section .text
extern printf,exit
global main
main:
mov rdi,s
mov rsi,10
mov rdx,34
mov r8,34
mov r9,10
mov rcx,24
push rbp
ws:push 10
loop ws
mov rcx,s
xor rax,rax
call printf
mov rcx,24
sa:pop rax
loop sa
pop rbp
mov rdi,0
call exit
section .bss