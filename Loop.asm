*LABEL          OPER.   OPERAND         COMMENT
*****           *****   *******         *******************************

RAMStart        EQU     $0040           ; Starting location of RAM
ROMStart        EQU     $8000           ; Starting location of ROM (FLASH)
ResetVector     EQU     $FFFE           ; Reset vextor address
LOOPMAX         EQU     $08

                ORG     Resetvector
                FDB     MAIN


                ORG     RAMStart
TEMP            RMB     1               ; Reserve 1 memory bytes



                ORG     ROMStart

                ; Add last bytes
MAIN            LDA    #$00             ; Load AC with 0; Sum
                LDX    #$0E             ; Load X with 14; Index counter


LOOP
                STX    TEMP             ; Store X to TEMP
                ADD    TEMP             ; Add TEMP to AC
                DECX                    ; Decreament X
                CPX    #LOOPMAX         ; Compare X with LOOPMAX
                BGE    LOOP             ; Branch lower (less than) to LOOP


                NOP
                NOP

