;   initial
Data    DCD     21, 10, 8, 1, 5, 7, 11, 6, 8
        
MAIN    
    LDR     R0, =Data       ;   Load address data
    MOV     R1, #0          ;   low = 0
    MOV     R2, #8          ;   high = 8 (index 0-8)
    BL      QUICKSORT       ;   call quicksort
        
STOP    B       STOP

; PARTITION Function
; Input: R0 = array base, R1 = low, R2 = high
; Output: R0 = pivot index

PARTITION
	STMFD   SP!, {R4-R8, LR}    ;   push to stack

;   R3 = position pivot
	LSL     R3, R2, #2  ;   LSL -> Shift 2 bit -> multiple 2
                        ;   R3 = high * 4
    ADD     R3, R0, R3  ;   memory = base + index

;   R4 = pivot = arr[high]
    LDR     R4, [R3]    ;   load data from index high

;   R5 = i = low - 1
    SUB     R5, R1, #1

;   R6 = j = low (loop counter)
    MOV     R6, R1

PART_LOOP
;   j < high
    CMP     R6, R2      
    BGE     PART_END    ;   BGE -> Branch if greater than or equal
                        ;   if >= -> PART_END

;   load arr[j]
    LSL     R7, R6, #2  ;   R7 = j * 4
    ADD     R7, R7, R0  ;   memory = base + index
    LDR     R8, [R7]    ;   load data from index j

;   arr[j] <= pivot
    CMP     R8, R4
    BGT     PART_SKIP   ;   BGT -> Branch if greater than
                        ;   if > -> PART_SKIP

    ADD     R5, R5, #1  ;   i++

;   load array[i]
    LSL     R7, R5, #2  ;   R7 = i * 4
    ADD     R7, R7, R0  ;   memory = base + index

;   load array[j]
    LSL     R8, R6, #2  ;   R8 = j * 4
    ADD     R8, R8, R0  ;   memory = base + index

;   swap(array[i], array[j])
    LDR     R3, [R7]    ;   load from memory R7 to keep in R3
    LDR     R12, [R8]   ;   load from memory R8 to keep in R12
    STR     R12, [R7]   ;   store from R12 to keep in [R7]
    STR     R3, [R8]    ;   store from R3 to keep in [R8]

;   PART_SKIP = (array[j] > pivot)
PART_SKIP
    ADD     R6, R6, #1  ;   j++
    B       PART_LOOP   ;   back to loop

;   PART_END = (j >= high)
PART_END

;   load array[i + 1]
    ADD     R5, R5, #1  ;   i + 1   
    LSL     R7, R5, #2  ;   R7 = (i + 1) * 4
    ADD     R7, R7, R0  ;   memory = base + index

;   load array[high]
    LSL     R8, R2, #2  ;   R8 = high * 4
    ADD     R8, R8, R0  ;   memory = base + index

;   swap(array[i + 1], array[high])    
    LDR     R3, [R7]    ;   load from memory R7 to keep in R3
    LDR     R12, [R8]   ;   load from memory R8 to keep in R12
    STR     R12, [R7]   ;   store from R12 to keep in [R7]
    STR     R3, [R8]    ;   store from R3 to keep in [R8]

    MOV     R0, R5      ;   R0 = i + 1
    LDMFD   SP!, {R4-R8, PC}    ;   return pivot index

; QUICKSORT Function
; Input: R0 = array base, R1 = low, R2 = high
QUICKSORT
    STMFD   SP!, {R4-R6, LR}

;   low < high
    CMP     R1, R2  
    BGE     QS_END      ;   BGE -> Branch if greater or equal
                        ;   if > -> QS_END 

;   backup value 
    MOV     R4, R0      ;   R4 = array base
    MOV     R5, R1      ;   R5 = low
    MOV     R6, R2      ;   R6 = high
        
;   call partition
    BL      PARTITION   

;   pivot_index = partition(array, low, high)
    MOV     R3, R0      ;   R3 = R0 = pivot_index return from partition

;   quicksort(array, low, pivot_index - 1)
    MOV     R0, R4      ; R0 = array base (backup value)
    MOV     R1, R5      ; R1 = low (backup value)
    SUB     R2, R3, #1  ; R2 = pivot_index - 1
    BL      QUICKSORT   ; call quicksort

;   quicksort(array, pivot_index + 1, high)
    MOV     R0, R4      ; R0 = array base (backup value)
    ADD     R1, R3, #1  ; R1 = low (backup value) + 1
    MOV     R2, R6      ; R2 = high (backup value)
    BL      QUICKSORT   ; call quicksort

;   if low <= high
QS_END
    LDMFD   SP!, {R4-R6, PC}    ; restore และ return
    END 







    



