RAMStart        EQU     $0040           ; Starting location of RAM
ROMStart        EQU     $8000           ; Starting location of ROM (FLASH)
ResetVector     EQU     $FFFE           ; Reset vector address

                ORG     Resetvector
                FDB     MAIN

                ORG     RAMStart
A_Data          FCB     $01,$11,$18,$19,$10 ; Array A
B_Data          FCB     $00,$00,$00,$00,$00 ; Array B initialized with zeros

MAIN            LDA     #$00             ; Load AC with 0 (initialize i)
                LDX     #$00             ; Load X with 0 (i-th element)

LOOP            CMPX    #5               ; Compare X with 5
                BGE     DONE             ; If X >= 5, branch to DONE

                LDA     A_Data,X         ; Load A with A[X]
                INCA                    ; Increment A
                STA     B_Data,X         ; Store A in B[X]

                INCX                     ; Increment X (i)
                BRA     LOOP             ; Repeat the loop

DONE            RTS                     ; Return from subroutine

