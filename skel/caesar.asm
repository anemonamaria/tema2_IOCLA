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
    label:

    mov bl, [esi + eax] ; retinem prima litera din plaintext
    cmp bl, 'A'            ; daca e <' A' nu facem nimic
    jl do_nothing

    cmp bl, 'z'             ; daca e > 'z' nu facem nimic
    jg do_nothing

    cmp bl, 'Z'             ; daca e < 'Z' efectuam rotatia
    jle normal_rotation_upper

    cmp bl, 'a'             ; daca e > 'a' efectuam rotatia
    jge normal_rotation_lower

    jmp do_nothing          ; daca nu intra in niciunul din cazurile de mmi sus
    normal_rotation_upper: add ebx, edi         ; efectuam rotatia cu key
    cmp bl, 'Z'
    jg inverse_rotation
    jmp insert
    inverse_rotation: sub ebx, 26               ;daca e > Z ramanem la litere mari
    jmp insert
 
    normal_rotation_lower: add ebx, edi         ; efectuam rotatia cu key
    turn_back:
    cmp bl, 'z'
    jg inverse_rotation2
    cmp bl, 0 
    jl overflow
    jmp insert
    inverse_rotation2: sub ebx, 26               ;daca e > z ramanem la litere mici
    jmp insert

    insert:
    do_nothing: nop 
    mov [edx + eax], bl ; retinem in ciphertext ce am criptat
    
    dec eax
    
    cmp eax, -1
    jne label

    ;; TODO: Implement the caesar cipher

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
    overflow: add ebx, 230
    jmp turn_back