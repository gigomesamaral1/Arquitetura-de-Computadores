; ****************************************************************************************************************************************************************************
; ****************************************************************************************************************************************************************************
; *
; * PROJETO AC 2018-19 (versão final)
; * 
; *	
; * GRUPO 20:
; *    ADRIANA MARQUES   196721
; *    GIOVANNA AMARAL   194793
; *   
; *
; * 
; *

; ****************************************************************************************************************************************************************************
; * Constantes
; ****************************************************************************************************************************************************************************	
DEFINE_RED                EQU            6000H                   ; endereco de comando para definir a cor vermelha
DEFINE_GREEN              EQU            6002H                   ; endereco de comando para definir a cor verde
DEFINE_BLUE               EQU            6004H                   ; endereco de comando para definir a cor azul
OPACIDADE                 EQU            6006H                   
BACKGROUND                EQU            600EH                   ; endereco do comando para definir o ecra de fundo
SOUND                     EQU            6012H                   ; endereco do comando para definir o som
DISPLAYS 				  EQU 			 0A000H  				 ; endereço dos displays de 7 segmentos (periférico POUT-1)
TEC_LIN  				  EQU 			 0C000H 				 ; endereço das linhas do teclado (periférico POUT-2)
TEC_COL  				  EQU  	       	 0E000H   				 ; endereço das colunas do teclado (periférico PIN)
LINHA    				  EQU			 1      				 ; linha a testar (4ª linha, 1000b)
POUT1                     EQU            0A000H                  ; periferico de saida de 8 bits
POUT2                     EQU            0C000H                  ; periferico de saida de 8 bits
PIN                       EQU            0E000H                  ; periferico de entrada de 8 bits
LINHAI                    EQU            0001H					 ; primeira linha varrida do teclado
SP_inicial                EQU            03000H
NAVE_PRIN_X               EQU            3						 ; dimensao X da nave principal
NAVE_PRIN_Y               EQU            5 						 ; dimensao Y da nave principal
NAVE_SECUN_X              EQU            5						 ; dimensao X da nave secundaria 1
NAVE_SECUN_Y              EQU            4 						 ; dimensao Y da nave secundaria 1
NAVE_SECUN_2_X            EQU            5						 ; dimensao X da nave secundaria 2 e 3
NAVE_SECUN_2_Y            EQU            5						 ; dimensao Y da nave secundaria 2 e 3
BALA_XY                   EQU            1
FIM_OUTPUT                EQU            8000H
GAME_X                    EQU            23						 ; dimensao X do GAME OVER
GAME_Y                    EQU            5						 ; dimensao Y do GAME OVER
N_LINHAS                  EQU            28          			 ; numero de linhas que as naves inimigas descem até ao fim do ecra
TABLE                                    0200H					 

OBJ:
                          WORD           0H

NAVE_PRINCIPAL:                                                  ; tamanho da nave principal
                          STRING         0 , 1 , 0               
						  STRING         0 , 1 , 0 
						  STRING         1 , 1 , 1
						  STRING         1 , 1 , 1
						  STRING         1 , 1 , 1
COORD_NAVE_PRIN:          STRING         35 , 24 				 ; coordenadas da nave principal
MASCARA_PIXEIS:           STRING         01H , 02H , 04H , 08H , 10H , 20H , 40H , 80H            

NAVE_SECUNDARIA:                                                  ; tamanho da nave secundaria 1
                          STRING         0 , 0 , 1 , 0 , 0               
						  STRING         1 , 0 , 1 , 0 , 1 
						  STRING         0 , 1 , 1 , 1 , 0
						  STRING         0 , 0 , 1 , 0 , 0
COORD_NAVE_SECUN:         STRING         29 , 4 				  ; coordenadas da nave secundaria 1 

NAVE_SECUNDARIA_2:        STRING         1 , 0 , 0 , 0 , 0        ; tamanho da nave secundaria 2            
						  STRING         0 , 1 , 0 , 1 , 0 
						  STRING         0 , 0 , 1 , 1 , 0
						  STRING         0 , 1 , 1 , 1 , 0
						  STRING         0 , 0 , 0 , 0 , 1
COOR_NAVE_SECUN_2:        STRING         4 , 3					  ; coordenadas da nave secundaria 2

NAVE_SECUNDARIA_3:        STRING         0 , 0 , 0 , 0 , 1     	  ; tamanho da nave secundaria 3          
						  STRING         0 , 1 , 0 , 1 , 0 
						  STRING         0 , 1 , 1 , 0 , 0
						  STRING         0 , 1 , 1 , 1 , 0
						  STRING         1 , 0 , 0 , 0 , 0
						  
COOR_NAVE_SECUN_3:        STRING         51 , 3                   ; coordenadas da nave secundaria 3

GAME:                     STRING         1 , 1 , 1 , 1 , 1 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 1 , 1 , 1 , 1 , 1    ; tamanho do GAME
                          STRING         1 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 1 , 0 , 0 , 1 , 1 , 0 , 1 , 1 , 0 , 1 , 0 , 0 , 0 , 0
                          STRING         1 , 0 , 1 , 1 , 1 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 1 , 0 , 1 , 0 , 1 , 0 , 1 , 1 , 1 , 0 , 0
						  STRING         1 , 0 , 0 , 0 , 1 , 0 , 1 , 1 , 1 , 1 , 1 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 1 , 0 , 0 , 0 , 0
						  STRING         1 , 1 , 1 , 1 , 1 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 1 , 1 , 1 , 1 , 1
						  
COOR_GAME:                STRING         7 , 12 				   ; coordenadas do GAME


OVER:                     STRING         1 , 1 , 1 , 1 , 1 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 1 , 1 , 1 , 1 , 1 , 0 , 1 , 1 , 1 , 1 , 0   ; tamanho do OVER
                          STRING         1 , 0 , 0 , 0 , 1 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1   
                          STRING         1 , 0 , 0 , 0 , 1 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 1 , 1 , 1 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 0
						  STRING         1 , 0 , 0 , 0 , 1 , 0 , 0 , 1 , 0 , 1 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1
						  STRING         1 , 1 , 1 , 1 , 1 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1 , 1 , 1 , 1 , 1 , 0 , 1 , 0 , 0 , 0 , 1  
						  
COOR_OVER:                STRING         33 , 12				    ; coordenadas do OVER
						   
BALA:                      STRING         1
			
COORD_BALA:               STRING         36, 23




; ****************************************************************************************************************************************************************************
; * Código
; ****************************************************************************************************************************************************************************
PLACE                     0000H 

CICLO_PRINCIPAL:      
						MOV	BTE, interrup      
                        MOV SP , SP_inicial
													
						CALL altera_background                      ; coloca um Backgroud
						CALL toca_som								; toca o som
						
						MOV R0 , 1									; ativa o desenha pixel para 1
						
					
						CALL AZUL                                   ; chama a funcao que coloca os pixeis a azul
						CALL DESENHA_PRIN							; chama a funcao que desenha a nave principal
						CALL VERMELHO								; chama a funcao que coloca os pixeis a vermelho
						CALL DESENHA_SECUN							; chama a funcao que desenha a nave secundaria 1
						CALL DESENHA_SECUN2							; chama a funcao que desenha a nave secundaria 2
						CALL DESENHA_SECUN3							; chama a funcao que desenha a nave secundaria 2
						
						EI0
						EI1
						CALL PRETO
						CALL DESENHA_BALA
						CALL ROTINA_INT0
						CALL ROTINA_INT1
						CALL GAME_OVER
						
FIM: 
                        CALL FIM 									; acaba o programa
						
; ****************************************************************************************************************************************************************************
; calcula o endereco dos pixeis
; recebe: R5 -> coluna 
;         R6 -> linha
; destroi:  R5 , R6
; retorna:  R6 -> endereco , R1 -> posicao dentro do endereco 
; ****************************************************************************************************************************************************************************

CALCULA_ENDERECO:      												
                        PUSH R5
                        MOV R4 , 8        							                                      
					    MUL R6, R4
						MOV R1 , R5 
					    DIV R5,R4
						MOD R1 , R4
					    ADD R6, R5  
					    MOV R8 , 8000H
					    ADD R6 , R8
						POP R5
    					RET 
						
; ****************************************************************************************************************************************************************************
; recebe:  R9 -> coordenadas R10 -> dimensoes
;         
; destroi:  
; retorna: 
; ****************************************************************************************************************************************************************************						


DESENHA_OBJETO:
                MOVB R5 , [R9]                    ; R5 = coordenada_x
				ADD R9 , 1						  ; adiciona 1 
				MOVB R6 , [R9]				      ; R6 coordenada_y
				SUB R9 , 1						  ; subtrai 1
				MOV R1 , R7
                
				

PROXIMO_PIXEL:
                MOVB R3, [R10]
                SUB R1 , 1                        ; subtrai 1 a dimensao x
				JN PROXIMA_LINHA                  ; se for negativo salta para PROXIMA_LINHA
				AND R3 , R3                       ; compara 
				JZ PREPARA_PROXIMO                ; se for 0 salta para PREPARA_PROXIMO
				PUSH R1				; 
				PUSH R6
				CALL CALCULA_ENDERECO             ; chama CALCULA_ENDERECO
				AND R0 , R0                       ; ve se R0 esta a 0 ou a 1
				JNZ desenha                       ; se nao for 0 salta para desenha
				CALL APAGA_PIXEL                  ; chama a funcao APAGA_PIXEL
				JMP next                          ; salta para next
desenha:
				CALL DESENHA_PIXEL                ; chama DESENHA_PIXEL
next:
				POP R6
				POP R1                            ;

PREPARA_PROXIMO:
                ADD R5 , 1                        ; adiciona 1 a coordenada_x
                ADD R10 , 1                       ; adiciona 1 a NAVE_PRINCIPAL
                MOVB R3, [R10]  		          ; move o interior de R10 (dimensoes) para valor do pixel		
				JMP PROXIMO_PIXEL                 ; salta para PROXIMO_PIXEL


				
				
PROXIMA_LINHA: 
                ADD R6 , 1                        ; adiciona 1 a coordenada_y
                SUB R2 , 1                        ; subtrai 1 a dimensao y da nave
				JZ FIM_OBJETO                     ; se 0, salta para FIM_OBJETO
				MOVB R5 , [R9]                    ; atualiza o valor das coordenada_x
				MOV R1 , R7                       ; move NAVE_PRIN_X para dimensoes x da nave
				JMP PROXIMO_PIXEL                 ; salta para PROXIMO_PIXEL
FIM_OBJETO:   
                RET 
				
; ****************************************************************************************************************************************************************************
; recebe:  R6 -> endereco
;          R1 -> posicao dentro do endereco
;         
; destroi:  
; retorna: 
; ****************************************************************************************************************************************************************************						
		
DESENHA_PIXEL:
               PUSH R2 
			   PUSH R3 
               MOVB R2 , [R6]                      ; move o interior de endereco para R2
               MOV R3 , MASCARA_PIXEIS             ; coloca MASCARA_PIXEIS em R3
			   ADD R3 , R1                         ; adiciona R1 e R3
			   MOVB R1 , [R3]                      ; coloca o interior de R3 em R1
               OR R2 , R1 
               MOVB [R6] , R2			   
               POP R3 			   
               POP R2
               RET 

APAGA_PIXEL:
               PUSH R2 
			   PUSH R3 
               MOVB R2 , [R6]                      ; move o interior de endereco para R2
               MOV R3 , MASCARA_PIXEIS             ; coloca MASCARA_PIXEIS em R3
			   ADD R3 , R1                         ; adiciona R1 e R3
			   MOVB R1 , [R3]                      ; coloca o interior de R3 em R1
               XOR R2 , R1 
               MOVB [R6] , R2	                   		   
               POP R3 			   
               POP R2
               RET 
			   
DESENHA_PRIN:   
			   	MOV  R9 , COORD_NAVE_PRIN		  ; coloca COORD_NAVE_PRIN em R9
				MOVB [R6] , R2 
				MOV R2 , NAVE_PRIN_Y              ; R2 dimensao y da nave 
			    MOV R10 , NAVE_PRINCIPAL
                MOV R7 , NAVE_PRIN_X		      ; R7 dimensao x da nave 				
	            CALL DESENHA_OBJETO				  ; chama o DESENHA_OBJETO desenhando a nave principal
                RET				

DESENHA_SECUN:
				
				MOV R9 , COORD_NAVE_SECUN		  ; coloca COORD_NAVE_SECUN em R9
				MOV R2 , NAVE_SECUN_Y			  ; R2 dimensao y da nave
				MOV R7 , NAVE_SECUN_X			  ; R7 dimensao x da nave
				MOV R10 , NAVE_SECUNDARIA 
				CALL DESENHA_OBJETO				  ; chama DESENHA_OBJETO desenhando a nave secundaria 1
				RET

DESENHA_SECUN2:
                
				MOV R9 , COOR_NAVE_SECUN_2		  ; coloca COORD_NAVE_SECUN_2 em R9
				MOV R2 , NAVE_SECUN_2_Y			  ; R2 dimensao y da nave
				MOV R10 , NAVE_SECUNDARIA_2		  ; 
				MOV R7 , NAVE_SECUN_2_X			  ; R7 dimensao x da nave
				CALL DESENHA_OBJETO				  ; chama DESENHA_OBJETO desenhando a nave secundaria 2
				RET
				
DESENHA_SECUN3:
                
                MOV R9 , COOR_NAVE_SECUN_3		  ; coloca COORD_NAVE_SECUN_3 em R9
				MOV R2 , NAVE_SECUN_2_Y           ; R2 dimensao y da nave
				MOV R10 , NAVE_SECUNDARIA_3		  ; 
				MOV R7 , NAVE_SECUN_2_X			  ; R7 dimensao x da nave
				CALL DESENHA_OBJETO				  ; chama DESENHA_OBJETO desenhando a nave secundaria 3
				RET

DESENHA_BALA:
        
		       MOV R9, COORD_BALA
			   MOV R2, BALA_XY
			   MOV R10, BALA
			   MOV R7, BALA_XY
			   CALL DESENHA_OBJETO
			   RET
			   
ROTINA_INT0:
				PUSH R3
				CALL PRETO
				
MAIS_PARA_CIMA:
				CALL CONTADOR     
				MOV R0, 0
				CALL DESENHA_BALA
				MOV R1 , COORD_BALA             ; poe as coordenadas da nave secundaria 1 em R1
				ADD R1 , 1                      ; adiciona 1 a R1
				MOVB R2 , [R1]                  ; coloca o interior de R1 em R2
				SUB R2 , 1                      ; adiciona 1 a R2
				MOVB [R1] , R2                  ; coloca o interior de R2 em R10     
				MOV R3, 0                       ; numero de linhas que descem
				CMP R2, R3 						; compara R2 e R3
				JZ ACABOU						; se for 0 salta para ACABOU
				
				MOV R0 , 1 					; volta a desenhar as naves todas na nova posica			
				CALL DESENHA_BALA			; desenha a nave secundaria 3
				JMP  MAIS_PARA_CIMA			; salta para a funcao JA_MEXEU

				
ROTINA_INT1:
				PUSH R3
				CALL VERMELHO
				
MAIS_PARA_BAIXO:
				CALL CONTADOR
				MOV R0 , 0                       ; coloca o R0 a 0 com o intuito de apagar as naves
				CALL DESENHA_SECUN              ; apaga a nave secundaria 1
				CALL DESENHA_SECUN2             ; apaga a nave secundaria 2
				CALL DESENHA_SECUN3             ; apaga a nave secundaria 3
							
				MOV R1 , COORD_NAVE_SECUN       ; poe as coordenadas da nave secundaria 1 em R1
				ADD R1 , 1                      ; adiciona 1 a R1
				MOVB R2 , [R1]                  ; coloca o interior de R1 em R2
				ADD R2 , 1                      ; adiciona 1 a R2
				MOVB [R1] , R2                  ; coloca o interior de R2 em R10     
				MOV R3, N_LINHAS                ; numero de linhas que descem
				CMP R2, R3 						; compara R2 e R3
				JZ ACABOU						; se for 0 salta para ACABOU
				MOV R1, COOR_NAVE_SECUN_2		; coloca COORD_NAVE_SECUN_2 em R1
				ADD R1 , 1						; Adiciona 1 as coordenadas da nave secundaria 1, fazendo a nave descer no ecra
				MOVB R2 , [R1]
				ADD R2 , 1						; adiciona 1 em R2
				MOVB [R1] , R2
				MOV R1, COOR_NAVE_SECUN_3		; coloca COORD_NAVE_SECUN_3 em R1
				ADD R1 , 1						; adiciona 1 a COORD_NAVE_SECUN_3, fazendo a nave descer no ecra
				MOVB R2 , [R1]
				ADD R2 , 1						; adiciona 1 a R2
				MOVB [R1] , R2
				
				MOV R0 , 1 						; volta a desenhar as naves todas na nova posicao
							
				CALL DESENHA_SECUN				; desenha a nave secundaria 1
				CALL DESENHA_SECUN2				; desenha a nave secundaria 2
				CALL DESENHA_SECUN3				; desenha a nave secundaria 3
				JMP  MAIS_PARA_BAIXO			; salta para a funcao JA_MEXEU
ACABOU:              
				POP R3
	
				RET


CONTADOR:                                       ; contador 
               PUSH R1			   
			   PUSH R4
			   MOV R1 , 0
KEEP_GOING:										; desacelera o descimento das naves
               	
			   ADD R1 , 1 
			   MOV R4 , 2000H
			   CMP R4 , R1 
			   JNZ KEEP_GOING
			   POP R4
			   POP R1
		       RET 
			   
			   
			  
VERMELHO:										; funcao que coloca os pixeis a vermelho
                    
				MOV R3 , DEFINE_RED
				MOV R2 , DEFINE_GREEN
				MOV R1 , DEFINE_BLUE
				MOV R4 , 0FFH
				MOVB [R3] , R4 
				MOV R4 , 00H 
				MOVB [R2] , R4 
				MOVB [R1] , R4 
				
				RET
				
AZUL:											; funcao que coloca os pixeis a azul
              
			   MOV R3 , DEFINE_RED
			   MOV R2 , DEFINE_GREEN
	           MOV R1 , DEFINE_BLUE
			   MOV R4 , 0FFH
			   MOVB [R1] , R4 
			   MOV R4 , 90H 
			   MOVB [R2] , R4 
			   MOV R4 , 00H 
			   MOVB [R3] , R4 
			   
			   RET
			   
PRETO:											; funcao que coloca os pixeis a azul
              
			   MOV R3 , DEFINE_RED
			   MOV R2 , DEFINE_GREEN
	           MOV R1 , DEFINE_BLUE
			   MOV R4 , 00H
			   MOVB [R1] , R4 
			   MOV R4 , 00H 
			   MOVB [R2] , R4 
			   MOV R4 , 00H 
			   MOVB [R3] , R4 
			   
			   RET			
; ****************************************************************************************************************************************************************************
; * Rotina altera_background
; * Coloca uma imagem predifina no fundo do ecra
; * Argumentos: R0- numero da imagem a utilizar
; * Modifica: nada
; ****************************************************************************************************************************************************************************
altera_background:							  ; funcao que coloca um background
                   
				  
				  MOV R1 , BACKGROUND 
				  MOV [R1] , R0               ; coloca a imagem 0 no endereco do background
				  
				  
				  RET

; ****************************************************************************************************************************************************************************
; * Rotina som
; * Funcao que faz tocar um som
; * Argumentos: R0- som
; * Modifica: nada
; ****************************************************************************************************************************************************************************
toca_som:									  ; funcao que faz tocar um som
                PUSH R0
				PUSH R1 
				
				MOV R1 , SOUND 
				MOV [R1] , R0
				
				POP R1 
				POP R0
				RET


GAME_OVER:									  ; no final do jogo aparece GAME OVER no ecra 
               MOV R4 , 8000H
			   MOV R6 , 80FFH
			   MOV R3 , 0
APAGA_TUDO:									  ; apaga as naves escrevendo GAME OVER no ecra
			   MOVB [R4] , R3 
			   ADD R4 , 1
			   CMP R4 , R6					  ; compara R4 com R6
			   JNZ APAGA_TUDO				  ; se nao for 0, salta para APAGA_TUDO
			   CALL VERMELHO				  ; chama a funcao que coloca os pixeis a vermelho
			   MOV R9 , COOR_GAME			  ; coloca COOR_GAME em R9
			   MOV R2 , GAME_Y				  ; coloca GAME_Y em R2
			   MOV R10 , GAME				  ; coloca GAME em R10
			   MOV R7 , GAME_X				  ; coloca GAME_X em R7
			   CALL DESENHA_OBJETO			  ; chama a funcao DESENHA_OBJETO desenhando a palavra OVER
			   MOV R9 , COOR_OVER			  ; coloca COOR_OVER em R9
			   MOV R2 , GAME_Y				  ; coloca GAME_Y em R2
			   MOV R10 , OVER				  ; coloca OVER em R10
			   MOV R7 , GAME_X			      ; coloca GAME_X em R7
			   CALL DESENHA_OBJETO			  ; chama a funcao DESENHA_OBJETO desenhando a palavra OVER
			   RET
			   
			   
			   
			   

   

mascara_tec:
                         WORD 00FH                   ;

Teclado:				
			
inicio:		
; inicializações
				MOV  R8 , mascara_tec
				MOV  R2, TEC_LIN  			 ; endereço do periférico das linhas
				MOV  R3, TEC_COL  			 ; endereço do periférico das colunas
				MOV R7, 600H
				
; corpo principal do programa
ciclo:

				MOV R4, 1 					; linhas
				MOV R5, 1					; colunas
espera_tecla:        			  		    ; neste ciclo espera-se até uma tecla ser premida
				MOV  R1, LINHAI   		    ; testar a linha 1 
CICLO_2:
				MOVB [R2], R1    		    ; escrever no periférico de saída (linhas)
				MOVB R0, [R3]     		    ; ler do periférico de entrada (colunas)
				AND  R0 , R8
				JZ   busca_proximo			; se for 0, salta para busca_proximo
CICLO_3:
				SHR  R0, 1					; vai dando SHR adicionando 1 pela esquerda (devia ser R8?)
				JZ espera_ai				; se for 0 salta para espera_ai
				ADD R2, 1					; adiciona 1 a R2
				JMP CICLO_3					; salta para CICLO_3
								
				
busca_proximo:
				SHL  R1, 1					; vai dando SHL adicionando 1 pela esquerda
				JZ   restart				; se for 0 salta para restart
				ADD R5, 1					; adiciona 1 a R5
				JMP CICLO_2					; salta para CICLO_2
				
restart:		
				MOV R1,LINHAI				; Faz reset a linha 
				MOV R4, 1					;
				MOV R5, 1					; Faz reset ao contador
				SUB R7, 1					;
				JZ espera_ai				; se for 0 salta para espera_ai
				JMP CICLO_2					; salta para CICLO_2
				
espera_ai:			
				MOVB [R2], R1     			; 
				MOVB R0, [R3]      			; 
				AND  R0 , R8
				JNZ espera_ai				; Continua neste ciclo ate deixar de ser premida a tecla
				RET
				

;Não funciona				
				
int1:
				PUSH R1
				PUSH R2
				PUSH R0
				CALL ROTINA_INT1			; chama ROTINA_INT1
				MOV R1 , 5
				CMP R0 , R1
				JZ FIM_INT1					; se for 0 salta para FIM_INT1
				CALL GAME_OVER
FIM_INT1:
				
				POP R0
				POP R2
				POP R1
				RFE 
int0:
                PUSH R1
				PUSH R2
				PUSH R0
				CALL ROTINA_INT0
				MOV R1, 5
				CMP R0, R1
				JZ FIM_INT1
				RFE
				

PLACE                   5000H

interrup:
				WORD int0 
				WORD int1


		
			 
		
		
		
		
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
						

