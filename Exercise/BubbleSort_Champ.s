Data    DCD     10, 12, 8, 1, 5, 7, 11, 6, 8
        MOV     R12, #8
        MOV     R1, #0
        LDR     R0, =Data
OUTER_LOOP   
        CMP     R1, R12
        BGE     END_PROG
        MOV     R2, #0

INNER_LOOP      
        SUB     R3, R12, R1
        CMP     R2, R3
        BGE     SKIP_INNER

IF_STATE  
        LSL     R4, R2, #2 
        ADD     R4, R4, R0
        LDR     R5, [R4]
        
        ADD     R9, R2, #1
        LSL     R6, R9, #2
        ADD     R6, R6, R0
        LDR     R7, [R6]

        CMP     R5, R7
        BLE     SKIP_IF

        STR     R7, [R4]
        STR     R5, [R6]

SKIP_IF
        ADD     R2, R2, #1
        B       INNER_LOOP        

SKIP_INNER
        ADD     R1, R1, #1
        B       OUTER_LOOP

END_PROG
        END

