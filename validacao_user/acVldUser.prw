#include 'PROTHEUS.CH'

/*
{Protheus.doc} smVldUser()

    - Objetivo:     Validar usuario e senha, e retornar .T., caso correto.

    - Tipo rotina:  Tela de Validação de usuário
    
    - Autor:        Andre Costa
    - Data:         11/02/2025
*/

User Function acVldUser()
	Local aArea     := GetArea()
	Local aPergs    := {}
	Local lRet      := .F.

	aAdd(aPergs, {1, "Usuario:",    Space(TAMSX3("AK_LOGIN")[1]),	"",		".T.", "", ".T.", 80, .T.})
	aAdd(aPergs, {1, "Senha:",      Space(20),                  	"@*",   ".T.", "", ".T.", 80, .T.})
	If ParamBox(aPergs, "Informe o Usuario e Senha")
		cGetUsr := Alltrim(MV_PAR01)
		cGetPsw := Alltrim(MV_PAR02)

		if RpcSetEnv(cEmpAnt, cFilAnt, cGetUsr, cGetPsw)
			RpcClearEnv()
			lRet := .T.
		endIf
	EndIf

	RestArea(aArea)
Return lRet

