#INCLUDE "TOTVS.CH"

User Function fClientTelegram()
    Local aArea     := GetArea()
    Local cChat     := SuperGetMv("ML_TLGCHAT", , ) // ID do Chat que a mensagem ser� enviada
    Local cMsg      := ""                           // Mensagem a ser enviada
    Local lHtml     := .T.                          // Define se aplicar� HTML ou MarkDown na Mensagem

    cMsg := "<pre> Teste API: " + Time() + " </pre> "
    
    lRet := U_fTelegram( cChat, cMsg, lHtml )

    If lRet
        FwAlertInfo("Mensagem Enviada com Sucesso !", "Mensagem")
    Else
        FwAlertInfo("Mensagem n�o enviada", "Aten��o")
    EndIf

    RestArea(aArea)
Return
