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

    ;; TODO: Implement the caesar cipher

    dec     ecx               ; nu shiftam si \n
    label:
    cmp     byte [esi + ecx], 'A'
    jb      .return             ; renunta daca e mai mic decat A

    cmp     byte [esi + ecx], 'Z'
    jbe     .shift_upper       ; se duce in cazul upper shift

    cmp     byte [esi + ecx], 'z'
    ja      .return            ; renuntam daca e mai mare decat Z

    cmp     byte [esi + ecx], 'a'    
    jae     .shift_lower       ; shifteaz daca e intre a si Z

    cmp     ecx, -1
    jne     label               ; refacem

.shift_upper:
    add byte [eax], bl      ; Shift the letter
    cmp byte [eax], 'Z'     ; Is it below or equal to 'Z'?
    jbe .return             ; If yes, finish functin

    sub byte [eax], 26      ; If not, substract 26

    jmp .return

.shift_lower:
    add byte [eax], bl      ; Shift the letter
    cmp byte [eax], 'z'     ; Is it below or equal to 'z'?
    jbe .return             ; If yes, finish functin

    sub byte [eax], 26      ; If not, substract 26

.return:
    ret

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY