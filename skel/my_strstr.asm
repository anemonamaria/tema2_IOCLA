%include "io.mac"

section .text
    global my_strstr
    extern printf

section .data
    substr_index dd 0   ; imi declar o variabila in care sa retin pentru fiecare iteratie 
                        ; ultimul index la care am ajuns in string

my_strstr:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edi, [ebp + 8]      ; substr_index
    mov     esi, [ebp + 12]     ; haystack
    mov     ebx, [ebp + 16]     ; needle
    mov     ecx, [ebp + 20]     ; haystack_len
    mov     edx, [ebp + 24]     ; needle_len
    ;; DO NOT MODIFY

    ;; TO DO: Implement my_strstr
    push    ecx                 ; introducem in stiva
    push    edx                 ; introducem in stiva lungimea lui needle 
    mov     eax, 0
    cmp     ecx, edx            ; daca lungimea stringului este mai mica decat 
    jl      nu_a_fost_gasit     ; a substringului este clar ca nu se va gasi in el
    mov     eax, 0
label:
    mov     eax, [esi + ecx -1]    
    cmp     al, byte [ebx + edx -1]    ; comparam caracter cu caracter
    je      next_chars          ; daca s-au gasit aceleasi caractere trecem la urmatoarele
    jne     next_char           ; daca nu il gasim trecem la urmatorul caracter din haystack
next_char:
    ; in aceasta functie ne intoarceem la urmatoarea pozitie de la care am 
    ; inceput verificarea ambelor string-uri
    mov      eax, 0
    mov     [edi], eax
    dec     ecx
    sub     ecx, edx
    pop     edx
    push    edx                 ; haystack_len - 1 - edx + needle_len
    add     ecx, edx            ; trecem la urmatorul element din haystack dupa formula de mai sus
    cmp     ecx, 0              ; verificam daca este ultimul caracter din string
    jg      label               ; daca nu e, putem sa ne reintoarcem la verificare
    je      exit                ; iesim din loop
next_chars:
    ; in aceasta functie trecem la urmatoarele caractere in ambele string-uri
    mov     [edi], ecx          ; daca gasim caractere egale, retinem in edi primul index
    dec     ecx                 ; trecem la urmatorul caracter din haystack
    dec     edx                 ; trecem la urmatorul caracter din needle
    cmp     edx, 0              ; daca am ajuns la finalul string-ului needle vom retine
    jg      label               ; aparitia intr-o variabila pe care in final o vom returna
    je      prima_aparitie
    pop     edx
    push    edx
    jmp     label
prima_aparitie:                 ; parrcurgand sirurile de la coada la cap, cu fiecare 
    mov     [substr_index], ecx ; verificare a needle_len ne vom afla mai
    jmp     label               ; aproape de inceputul sirului 
exit:
    mov     eax, [substr_index]
    cmp     eax, 0              ; vedem daca a fost gasit macar un sir complet
    je      nu_a_fost_gasit
    jmp     return
nu_a_fost_gasit:
    inc     eax
    pop     edx
    pop     ecx
    push    ecx
    push    edx
    add     eax, ecx            ; daca nu am gasit sirul, returnam haystack_len+1
return:                         ; se incheie programul
    pop     edx
    pop     ecx
    mov     [edi], eax
    mov     eax, 0
    mov     [substr_index], eax
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
