%include "io.mac"

section .text
    global otp
    extern printf

my_return:
    popa
    leave
    ret

otp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the One Time Pad cipher

    mov     eax, ecx              ; numarul de iteratii 
    dec     eax
    label:
    
    mov     bl, [esi + eax ]        ; mutam prima locatie din plaintext intr-un registru
    xor     bl, [edi + eax ]        ; efectuam xor intre locatia din plaintext si locatia
                                    ; din key
    mov     [edx + eax], bl         ; retinem ce am obtinut intr-o locatie din ciphertext
    dec     eax
    
    cmp     eax, -1                 ; verificam daca eax a ajuns la numarul de iteratii
    jne     label                   ; necesar

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY