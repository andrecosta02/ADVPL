#INCLUDE "protheus.ch"

/*
{Protheus.doc} acUsoVld()

    - Objetivo:     Exemplo de uso da fun��o acVldUser()

    - Tipo rotina:  Exemplo de Uso
    
    - Autor:        Andre Costa
    - Data:         11/02/2025
*/

User Function acUsoVld()
	Local aArea := GetArea()

	If U_acVldUser()
		FwAlertInfo("Usuario validado com sucesso", "Mensagem")
	Else
		FwAlertInfo("Usuario ou senha inv�lidos", "Mensagem")
	endIf

	RestArea(aArea)
Return
