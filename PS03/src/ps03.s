Data    DCD     21, 10, 8, 1, 5, 7, 11, 6, 8
        
MAIN    
        LDR     R0, =Data
        MOV     R1, #0
        MOV     R2, #8
        BL      QUICKSORT
        
STOP    B       STOP


PARTITION
        STMFD   SP!, {R4-R8, LR}
        
        LSL     R3, R2, #2
        ADD     R3, R0, R3
        LDR     R4, [R3]
        
        SUB     R5, R1, #1
        MOV     R6, R1

PART_LOOP
        CMP     R6, R2
        BGE     PART_END
        
        LSL     R7, R6, #2
        ADD     R7, R7, R0
        LDR     R8, [R7]
        
        CMP     R8, R4
        BGT     PART_SKIP
        
        ADD     R5, R5, #1
        
        LSL     R7, R5, #2
        ADD     R7, R7, R0
        
        LSL     R8, R6, #2
        ADD     R8, R8, R0
        
        LDR     R3, [R7]
        LDR     R12, [R8]
        STR     R12, [R7]
        STR     R3, [R8]

PART_SKIP
        ADD     R6, R6, #1
        B       PART_LOOP

PART_END
        ADD     R5, R5, #1
        
        LSL     R7, R5, #2
        ADD     R7, R7, R0
        
        LSL     R8, R2, #2
        ADD     R8, R8, R0
        
        LDR     R3, [R7]
        LDR     R12, [R8]
        STR     R12, [R7]
        STR     R3, [R8]
        
        MOV     R0, R5
        LDMFD   SP!, {R4-R8, PC}


QUICKSORT
        STMFD   SP!, {R4-R6, LR}
        
        CMP     R1, R2
        BGE     QS_END
        
        MOV     R4, R0
        MOV     R5, R1
        MOV     R6, R2
        
        BL      PARTITION
        
        MOV     R3, R0
        
        MOV     R0, R4
        MOV     R1, R5
        SUB     R2, R3, #1
        BL      QUICKSORT
        
        MOV     R0, R4
        ADD     R1, R3, #1
        MOV     R2, R6
        BL      QUICKSORT

QS_END
        LDMFD   SP!, {R4-R6, PC}
        
        END