#include "Totvs.ch"

/*
{Protheus.doc} fConvrtNum

    - Objetivo:     Demonstrar os Tipos de Variaveis 

    - Tipo rotina:  Alerts

    - Autor:        Andre Costa - 05/11/2024

*/

User Function fConvrtNum()
    Local aArea         := GetArea()
    Local lGostaLer := .T.
    Local dDtNascim := sToD("19930712")
    Local nAltura   := 1.73
    Local cResult   := ""
  
    //Converte do tipo L�gico para Caractere
    cResult += "lGostaLer: "              + AllToChar(lGostaLer)            + CRLF // Converte .T. --> ".T."
  
    //Converte do tipo Data para Caractere
    cResult += "dDtNascim (YYYYMMDD): "   + AllToChar(dDtNascim, , .T.)     + CRLF // Converte 12/07/1993 --> "19930712"
    cResult += "dDtNascim (DD/MM/YYYY): " + AllToChar(dDtNascim, , .F.)     + CRLF // Converte 12/07/1993 --> "12/07/1993"
  
    //Converte do tipo Num�rico para Caractere (e passando m�scara)
    cResult += "nAltura: "                + AllToChar(nAltura)              + CRLF // Converte 1.73 --> "         2"
    cResult += "nAltura (com m�scara): "  + AllToChar(nAltura, "@E 999.99") + CRLF // Converte 1.73 --> "  1,73"
  
    //Mostra o resultado das convers�es
    FWAlertInfo(cResult, "Testes com AllToChar")

    RestArea(aArea)
Return
