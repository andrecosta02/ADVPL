#INCLUDE "TOTVS.CH"

Static Function fBuscaFecham()
    Local cQuery    := ''
    Local aRet      := {}
    Local cAlias    := "SA1"

    cQuery := " SELECT "                                                        + CRLF
    cQuery += "     A1_FILIAL, A1_NUMLOT, COUNT(A1_NUMLOT) QTD_RESID, "      + CRLF
    cQuery += "     A1_DTLANC, A1_STATUS "                                    + CRLF
    cQuery += " from " + RetSqlName(cAlias) + " ZR3 "                           + CRLF
    cQuery += " WHERE "                                                         + CRLF
    cQuery += "     D_E_L_E_T_ = '' "                                           + CRLF
    cQuery += "     AND A1_FILIAL = '"+xFilial("ZR3")+"' "                     + CRLF
    cQuery += "     AND A1_STATUS IN ('1', '2') "                              + CRLF
    cQuery += " GROUP BY A1_FILIAL, A1_NUMLOT, A1_DTLANC, A1_STATUS "       + CRLF
	PLSQuery(cQuery, cAlias)
	DbSelectArea(cAlias)
	(cAlias)->(DbGoTop())

    While (cAlias)->(!Eof())
        AADD(aRet, (cAlias)->ZR3_NUMLOT)
        (cAlias)->(DbSkip())
    End
Return aRet
