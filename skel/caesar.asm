%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY
    mov eax, ecx
    dec eax     ; nr de iteratii
    ; A = 65, Z = 90, a = 97, z = 122
    label:

    mov ebx, [esi + eax] ; retinem prima litera din plaintext
    ;cmp ebx, 90          ; mai mare decat Z ?
    ;jg  done
    add ebx, edi         ; efectuam rotatia cu key
    mov [edx + eax], bl ; retinem in ciphertext ce am criptat

    dec eax
    
    cmp eax, -1
    jne label

    ;; TODO: Implement the caesar cipher
    ;done:
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY