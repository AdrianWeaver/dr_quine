section .data		;mandatory comment
s db "section .data		;mandatory comment%cs db %c%s%c%csection .text%cextern printf%c%macro magic,0%cmov rdi,s%cmov rsi,10%cmov rdx,34%cmov r8,s%cmov r9,34%cmov rcx,10		;last newline after string%cpush rbp		;here%cws:push 10%cloop ws%cmov rcx,s%cxor rax,rax%ccall printf%cmov rcx,26%csa:pop rax%cloop sa%cpop rbp%cmov rdi,0%ccall exit%c%endmacro%c%cglobal obfuscated%cobfuscated:%c	magic"
section .text
extern printf
extern exit
%macro magic 0
mov rdi,s
mov rsi,10
mov rdx,34
mov r8,s
mov r9,34
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
call exit
%endmacro

global obfuscated
obfuscated:
	magic
