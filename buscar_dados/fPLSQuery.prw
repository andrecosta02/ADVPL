#INCLUDE "TOTVS.CH"

User Function fBuscaFecham()
    Local cQuery    := ''
    Local aRet      := {}
    Local cAlias    := "SA1"
    
    cQuery := " SELECT * "                                                        + CRLF
    cQuery += " FROM " + RetSqlName(cAlias) + " SA1 "                           + CRLF
    cQuery += " WHERE "                                                         + CRLF
    cQuery += "     D_E_L_E_T_ = '' "                                           + CRLF
    cQuery += "     AND A1_FILIAL = '"+xFilial("SA1")+"' "                     + CRLF
    cQuery += " GROUP BY A1_FILIAL, A1_CLIENT "       + CRLF
	PLSQuery(cQuery, cAlias)
	DbSelectArea(cAlias)
	(cAlias)->(DbGoTop())

    While (cAlias)->(!Eof())
        AADD(aRet, (cAlias)->ZR3_NUMLOT)
        (cAlias)->(DbSkip())
    End

Return aRet

