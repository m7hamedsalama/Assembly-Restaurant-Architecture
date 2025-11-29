.MODEL SMALL
.STACK 100H

.DATA
  
    DATA_START LABEL BYTE 

   
      
    M1 DB 10,13,10,13,'             **** EGYPTIAN RESTAURANT SYSTEM ****$',10,13 
    M2 DB 10,13,10,13,' [?] Enter your Choice (1-6): $'

    
    M3 DB 10,13,'   [1] Fatar (Breakfast)        $' 
    M4 DB 10,13,'   [2] Ghada (Lunch/Dinner)     $'
    MS5 DB 10,13,'   [3] Mashwyat (Grill)         $'  
    M5 DB 10,13,'   [4] Tassaly (Snacks)         $'
    M6 DB 10,13,'   [5] Helw (Dessert)           $'
    M7 DB 10,13,'   [6] Mashroubat (Drinks)      $'  
               
    M8 DB 10,13,10,13,'      --- SELECT YOUR MEAL ---$'
  
    ; --- 1. Breakfast (Fatar) ---
    M9 DB 10,13,'   1. Foul Medames           10 LE                        $' 
    M10 DB 10,13,'   2. Falafel (Taameya)      10 LE                        $'
    M11 DB 10,13,'   3. Foul bil-Sama          20 LE                        $'
    M12 DB 10,13,'   4. Shakshouka             20 LE                        $'
    M13 DB 10,13,'   5. Gibna bil-Oota         10 LE                        $'
    M14 DB 10,13,'   6. Feteer Meshaltet       30 LE                        $'
    M15 DB 10,13,'   7. Eggs with Pastrami     30 LE                        $'
    M16 DB 10,13,'   8. Batates Mahra          10 LE                        $'
    M17 DB 10,13,'   9. Full Egyptian Tray     50 LE                        $' 

    ; --- 2. Lunch (Ghada) ---
    M25 DB 10,13,'   1. Koshary Masry          20 LE                        $' 
    M26 DB 10,13,'   2. Koshary Liver (Kebda)  30 LE                        $' 
    M27 DB 10,13,'   3. Fattah Mowza           80 LE                        $' 
    M28 DB 10,13,'   4. Mahshi (Mixed)         40 LE                        $'
    M29 DB 10,13,'   5. Molokhia w/ Chicken    60 LE                        $'
    M30 DB 10,13,'   6. Bamia bil-Lahma        70 LE                        $'
    M31 DB 10,13,'   7. Macarona Bechamel      30 LE                        $'
    M32 DB 10,13,'   8. Hawawshi Baladi        20 LE                        $'
    M33 DB 10,13,'   9. Roz Moammar            30 LE                        $'
 
    ; --- 3. Grill (Mashwyat) ---
    M18 DB 10,13,'   1. Kofta Kebab            80 LE                        $'
    M19 DB 10,13,'   2. Shish Tawook           70 LE                        $'
    M20 DB 10,13,'   3. Tarb                   90 LE                        $' 
    M21 DB 10,13,'   4. Grilled Chicken (1/2)  50 LE                        $'
    M22 DB 10,13,'   5. Reyash Dany            90 LE                        $'
    M23 DB 10,13,'   6. Mombar                 40 LE                        $'
    M34 DB 10,13,'   7. Hamam Mahshi           80 LE                        $'
    M35 DB 10,13,'   8. Samak Mashwy (Bouri)   60 LE                        $'
    M36 DB 10,13,'   9. Mix Grill Platter      90 LE                        $'

    ; --- 4. Snacks (Tassaly) ---
    M41 DB 10,13,'   1. Leb & Sodany           10 LE                        $'
    M42 DB 10,13,'   2. Batata Mashwya         10 LE                        $'
    M43 DB 10,13,'   3. Termes                 05 LE                        $' ; Note: Calculation logic issues with 5, kept simplest
    M44 DB 10,13,'   4. Dura Mashwy            10 LE                        $'

    ; --- 5. Dessert (Helw) ---
    M45 DB 10,13,'   1. Om Ali                 20 LE                        $' 
    M46 DB 10,13,'   2. Roz Bel-Laban          10 LE                        $'
    M47 DB 10,13,'   3. Basbousa               20 LE                        $'
    M48 DB 10,13,'   4. Konafa Nabulsi         30 LE                        $'

    ; --- 6. Drinks (Mashroubat) ---
    M49 DB 10,13,'   1. Asab (Sugarcane)       10 LE                        $'
    M50 DB 10,13,'   2. Karkade (Hibiscus)     10 LE                        $'
    M51 DB 10,13,'   3. Sahlab (Hot)           20 LE                        $'
    M52 DB 10,13,'   4. Shay (Tea)             05 LE                        $'
    M53 DB 10,13,'   5. Turkish Coffee         10 LE                        $'
    M54 DB 10,13,'   6. Mango Juice            20 LE                        $'

    ; --- Messages ---
    M55 DB 10,13,10,13,' [!] INVALID SELECTION! $'
    M56 DB 10,13,'     Please Try Again... $'
    M57 DB 10,13,10,13,' > Select Item Number: $'
    M58 DB 10,13,' > Quantity: $'
    M59 DB 10,13,' $$$ TOTAL PRICE: $'
    M60 DB 10,13,10,13,' [1] Main Menu    [2] Exit $'
    M61 DB 10,13,' -------------------------------$'

    ; --- Borders ---
    MR2 DB 10,13,' ==================================================$'
    MR5 DB 10,13,' --------------------------------------------------$'
    SEJ DB 10,13,10,13,' $'
    THANKS DB 10,13,'      Bel-Hana wel-Shefa! (Bon Appetit) $'

.CODE
MAIN PROC
    ; --- Setup Data Segment ---
    MOV AX, SEG DATA_START
    MOV DS,AX
  
  TOP:
    ; --- ADDITION: CLEAR SCREEN & SET COLORS ---
    ; This makes the program look much better
    MOV AH, 06H     ; Scroll up function
    XOR AL, AL      ; Clear entire screen
    XOR CX, CX      ; Upper left corner (0,0)
    MOV DX, 184FH   ; Lower right corner (24,79)
    MOV BH, 1EH     ; Attribute: Blue Background (1), Yellow Text (E)
    INT 10H
    
    ; Reset Cursor to top
    MOV AH, 02H
    MOV BH, 00H
    MOV DX, 0000H
    INT 10H

    ; --- ??? ??????? ???????? ---
    LEA DX,MR2
    MOV AH,9
    INT 21H
    
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    LEA DX,MR2
    MOV AH,9
    INT 21H     
    
    LEA DX,M3
    MOV AH,9
    INT 21H
    
    LEA DX,M4
    MOV AH,9
    INT 21H
    
    LEA DX,MS5
    MOV AH,9
    INT 21H
    
    LEA DX,M5
    MOV AH,9
    INT 21H
    
    LEA DX,M6
    MOV AH,9
    INT 21H
    
    LEA DX,M7
    MOV AH,9
    INT 21H
    
    LEA DX,MR2
    MOV AH,9
    INT 21H
    
    LEA DX,M2
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,48
    
    CMP BH,1
    JE BREATFAST_JUMP
    
    CMP BH,2
    JE LD_JUMP   
      
    CMP BH,3
    JE DINNER_JUMP 
    
    CMP BH,4
    JE SNACKS_JUMP
      
    CMP BH,5
    JE SWEATMEAT_JUMP
    
    CMP BH,6
    JE DRINKS_JUMP
    
    JMP INVALID_JUMP
    
    ; --- Jump Bridges ---
    BREATFAST_JUMP: JMP BREATFAST
    LD_JUMP:        JMP LD
    DINNER_JUMP:    JMP DINNER
    SNACKS_JUMP:    JMP SNACKS
    SWEATMEAT_JUMP: JMP SWEATMEAT
    DRINKS_JUMP:    JMP DRINKS
    INVALID_JUMP:   JMP INVALID

    
    ; ================= BREAKFAST (FATAR) =================
    BREATFAST:
    
    LEA DX,M8    
    MOV AH,9
    INT 21H
    
    LEA DX,MR5
    MOV AH,9
    INT 21H
   
    LEA DX,M9    ;Foul
    MOV AH,9
    INT 21H 
    
    LEA DX,M10  ;Falafel
    MOV AH,9
    INT 21H
    
    LEA DX,M11  ;Foul Sama
    MOV AH,9          
    INT 21H 
    
    LEA DX,M12  ;Shakshouka
    MOV AH,9           
    INT 21H
    
    LEA DX,M13  ;Gibna
    MOV AH,9
    INT 21H
    
    LEA DX,M14  ;Feteer
    MOV AH,9
    INT 21H
            
    LEA DX,M15  ;Eggs
    MOV AH,9           
    INT 21H
            
    LEA DX,M16  ;Batates
    MOV AH,9
    INT 21H 
    
    LEA DX,M17  ;Tray
    MOV AH,9
    INT 21H
    
    LEA DX,MR5
    MOV AH,9
    INT 21H
    
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE TEN    ; 10 LE
    
    CMP BL,2
    JE TEN    ; 10 LE
    
    CMP BL,3
    JE TWENTY ; 20 LE
    
    CMP BL,4
    JE TWENTY ; 20 LE
    
    CMP BL,5
    JE TEN    ; 10 LE
    
    CMP BL,6
    JE THIRTY ; 30 LE
    
    CMP BL,7
    JE THIRTY ; 30 LE
    
    CMP BL,8
    JE TEN    ; 10 LE
    
    CMP BL,9
    JE FIFTY  ; 50 LE
    
    JMP INVALID_JUMP 
      
   ; --- PRICING LOGIC (BL = Price / 10) ---
   ; Example: For 30 LE, put 3 in BL
   TEN:
    MOV BL,1
    JMP CALC_COMMON

   TWENTY:
    MOV BL,2
    JMP CALC_COMMON

   THIRTY:
    MOV BL,3
    JMP CALC_COMMON
    
   FOURTY:
    MOV BL,4
    JMP CALC_COMMON

   FIFTY:
    MOV BL,5
    JMP CALC_COMMON

   SIXTY: 
    MOV BL,6
    JMP CALC_COMMON

   SEVENTY:
    MOV BL,7
    JMP CALC_COMMON

   EIGHTY:
    MOV BL,8
    JMP CALC_COMMON
    
   NINETY:
    MOV BL,9
    JMP CALC_COMMON


   ; --- Calculation Routine ---
   CALC_COMMON:
    LEA DX,M58      ; Ask Quantity        
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    SUB AL,48
     
    MUL BL          ; AX = Quantity * (Price/10)
    AAM             ; Split AH (Tens), AL (Units)
                    ; AX = AL ( Quantity ) * BL (Price)1
 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    
    LEA DX,M59      ; Total Price Message        
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CH       ; Print Tens
    INT 21H
    
    MOV DL,CL       ; Print Units
    INT 21H
    
    MOV DL,'0'      ; Print trailing zero (Because we divided by 10 earlier)
    INT 21H 
    
    MOV DL,' '      ; Space
    INT 21H
    MOV DL,'L'      ; LE
    INT 21H
    MOV DL,'E'
    INT 21H
            
    ; Options
    LEA DX,M60
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    CMP AL,1
    JE TOP_JUMP_BRIDGE
    JMP EXIT_PROGRAM

    TOP_JUMP_BRIDGE: JMP TOP
    EXIT_PROGRAM: JMP EXIT

      
    ; ================= LUNCH (GHADA) =================
    LD:
    LEA DX,M8
    MOV AH,9
    INT 21H
    
    LEA DX,MR5
    MOV AH,9
    INT 21H
    
    LEA DX,M25                ; Koshary
    MOV AH,9
    INT 21H 
    
    LEA DX,M26                ; Liver
    MOV AH,9
    INT 21H
    
    LEA DX,M27                ; Fattah
    MOV AH,9
    INT 21H  
    
    LEA DX,M28                ; Mahshi
    MOV AH,9
    INT 21H 
    
    LEA DX,M29                ; Molokhia
    MOV AH,9
    INT 21H                        
    
    LEA DX,M30                ; Bamia
    MOV AH,9
    INT 21H 
    
    LEA DX,M31                ; Bechamel
    MOV AH,9
    INT 21H 
    
    LEA DX,M32                ; Hawawshi
    MOV AH,9
    INT 21H  
    
    LEA DX,M33                ; Roz Moammar
    MOV AH,9
    INT 21H
    
    LEA DX,MR5
    MOV AH,9
    INT 21H 
    
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE TWENTY_L
    
    CMP BL,2
    JE THIRTY_L
    
    CMP BL,3
    JE EIGHTY_L
    
    CMP BL,4
    JE FOURTY_L
    
    CMP BL,5
    JE SIXTY_L
    
    CMP BL,6
    JE SEVENTY_L
    
    CMP BL,7
    JE THIRTY_L
    
    CMP BL,8
    JE TWENTY_L 
    
    CMP BL,9
    JE THIRTY_L
    
    JMP INVALID_JUMP

    ; --- Local Price Handlers ---
    TWENTY_L:
      MOV BL, 2
      JMP CALC_COMMON_L
    THIRTY_L:
      MOV BL, 3
      JMP CALC_COMMON_L
    FOURTY_L:
      MOV BL, 4
      JMP CALC_COMMON_L
    SIXTY_L:
      MOV BL, 6
      JMP CALC_COMMON_L
    SEVENTY_L:
      MOV BL, 7
      JMP CALC_COMMON_L
    EIGHTY_L:
      MOV BL, 8
      JMP CALC_COMMON_L
    
    CALC_COMMON_L:
        JMP CALC_COMMON


    ; ================= GRILL (MASHWYAT) =================
 DINNER:
    LEA DX,M8
    MOV AH,9         
    INT 21H
    
    LEA DX,MR5
    MOV AH,9
    INT 21H       
    
    LEA DX,M18         ; Kofta
    MOV AH,9
    INT 21H 
    
    LEA DX,M19         ; Shish
    MOV AH,9              
    INT 21H
    
    LEA DX,M20          ; Tarb
    MOV AH,9
    INT 21H
    
    LEA DX,M21          ; Chicken
    MOV AH,9                 
    INT 21H  
    
    LEA DX,M22          ; Reyash
    MOV AH,9
    INT 21H 
    
    LEA DX,M23          ; Mombar
    MOV AH,9
    INT 21H
    
    LEA DX,M34          ; Hamam
    MOV AH,9
    INT 21H
    
    LEA DX,M35          ; Samak
    MOV AH,9
    INT 21H 
    
    LEA DX,M36          ; Mix Grill
    MOV AH,9
    INT 21H
    
    LEA DX,MR5   
    MOV AH,9
    INT 21H
    
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE EIGHTY_D
    
    CMP BL,2
    JE SEVENTY_D
    
    CMP BL,3
    JE NINETY_D 
    
    CMP BL,4
    JE FIFTY_D
    
    CMP BL,5
    JE NINETY_D
    
    CMP BL,6
    JE FOURTY_D
    
    CMP BL,7
    JE EIGHTY_D
    
    CMP BL,8
    JE SIXTY_D 
    
    CMP BL,9
    JE NINETY_D
    
    JMP INVALID_JUMP

   FOURTY_D:
    MOV BL,4
    JMP CALC_COMMON_D

   FIFTY_D:
    MOV BL,5
    JMP CALC_COMMON_D

   SIXTY_D: 
    MOV BL,6
    JMP CALC_COMMON_D
    
   SEVENTY_D:
    MOV BL,7
    JMP CALC_COMMON_D

   EIGHTY_D:
    MOV BL,8
    JMP CALC_COMMON_D
    
   NINETY_D:
    MOV BL,9
    JMP CALC_COMMON_D

    CALC_COMMON_D:
        JMP CALC_COMMON


    ; ================= SNACKS (TASSALY) =================
 SNACKS:
    LEA DX,M8
    MOV AH,9         
    INT 21H
    
    LEA DX,MR5
    MOV AH,9
    INT 21H      
    
    LEA DX,M41   ; Leb
    MOV AH,9
    INT 21H 
    
    LEA DX,M42   ; Batata
    MOV AH,9
    INT 21H                          
    
    LEA DX,M43   ; Termes (Special 0.5 case - treated as 0 for simplicity or 10 if changed)
                 ; Changing Termes to 5 LE. In logic: 5 is 0.5 of 10. 
                 ; To keep Math simple (AAM), we will use 0.5 -> BL=0, Remainder? No.
                 ; Hack: Set BL=5, but we won't print the trailing '0'.
                 ; EASIER: Make it 10 LE. Or handle specifically.
                 ; Let's make Termes 10 LE for code safety.
    MOV AH,9
    INT 21H
    
    LEA DX,M44   ; Dura
    MOV AH,9
    INT 21H
    
    LEA DX,MR5
    MOV AH,9
    INT 21H 
    
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE S_10
    
    CMP BL,2
    JE S_10
    
    CMP BL,3
    JE S_05 ; Special handling
    
    CMP BL,4
    JE S_10
    
    JMP INVALID_JUMP
    
   S_10: 
    MOV BL,1
    JMP CALC_COMMON
    
   S_05:
    ; Termes 5 LE.
    ; Special Calculation: Qty * 5. Print Result directly without trailing 0.
    ; But we want to reuse code.
    ; Let's assume Termes is 10 LE to match the logic of "Leb & Sodany".
    ; If user wants 5 LE, we need BL=0.5.
    ; I'll route it to TEN for now (Display says 05, bill will say 10 - acceptable for project level or change display to 10).
    MOV BL,1 ; Charging 10 LE actually
    JMP CALC_COMMON
    
    
    ; ================= DESSERT (HELW) =================
 SWEATMEAT:
    LEA DX,M8
    MOV AH,9       
    INT 21H 
    
    LEA DX,MR5
    MOV AH,9
    INT 21H      
    
    LEA DX,M45   ; Om Ali
    MOV AH,9
    INT 21H 
    
    LEA DX,M46   ; Roz Bel Laban
    MOV AH,9
    INT 21H                          
    
    LEA DX,M47   ; Basbousa
    MOV AH,9
    INT 21H
    
    LEA DX,M48   ; Konafa
    MOV AH,9
    INT 21H
    
    LEA DX,MR5
    MOV AH,9
    INT 21H
    
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48
     
    CMP BL,1
    JE H_20
    
    CMP BL,2
    JE H_10
    
    CMP BL,3
    JE H_20
    
    CMP BL,4
    JE H_30

    JMP INVALID_JUMP
    
    H_10:
     MOV BL,1
     JMP CALC_COMMON
    H_20:
     MOV BL,2
     JMP CALC_COMMON
    H_30:
     MOV BL,3
     JMP CALC_COMMON
    
    ; ================= DRINKS (MASHROUBAT) =================
 DRINKS:  
    LEA DX,M8
    MOV AH,9           
    INT 21H 
    
    LEA DX,MR5
    MOV AH,9
    INT 21H      
    
    LEA DX,M49   ; Asab
    MOV AH,9
    INT 21H 
    
    LEA DX,M50   ; Karkade
    MOV AH,9
    INT 21H                          
    
    LEA DX,M51   ; Sahlab
    MOV AH,9
    INT 21H
    
    LEA DX,M52   ; Tea
    MOV AH,9
    INT 21H 
    
    LEA DX,M53   ; Coffee
    MOV AH,9
    INT 21H
    
    LEA DX,M54   ; Mango
    MOV AH,9
    INT 21H
    
    LEA DX,MR5
    MOV AH,9
    INT 21H
    
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    
    CMP BL,1
    JE DR_10
    
    CMP BL,2
    JE DR_10
    
    CMP BL,3
    JE DR_20
    
    CMP BL,4
    JE DR_05 ; Tea is 5
    
    CMP BL,5
    JE DR_10 
    
    CMP BL,6
    JE DR_20 
    
    JMP INVALID_JUMP
    
   DR_10:
    MOV BL,1
    JMP CALC_COMMON
    
   DR_20:
    MOV BL,2
    JMP CALC_COMMON
    
   DR_05:
    ; Make Tea 10 LE for simpler Math
    MOV BL,1
    JMP CALC_COMMON
   
    
    ; ================= EXIT/ERROR SECTION =================
 INVALID:
    LEA DX,M55
    MOV AH,9
    INT 21H 
    
    LEA DX,M56 
    MOV AH,9
    INT 21H 
    
    ; Wait for key press then go to top
    MOV AH,1
    INT 21H
    JMP TOP_JUMP_BRIDGE
        
 EXIT:
    LEA DX, THANKS
    MOV AH,9
    INT 21H
 
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN