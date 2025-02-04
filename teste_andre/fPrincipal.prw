#INCLUDE "TOTVS.CH"

User Function fPrincipal()
    Local aArea     := GetArea()
    Local nValor    := 10
    Local nSalario  := 2000
    Local aValores  := {}
    
    aValores := fDivide(nValor, nSalario)
    nValorDid := aValores[1]
    nSalaDivd := aValores[2]

    FwAlertInfo( "O Valor dividido �: " + cValToChar(nVlrDividido), "Mensagem")

    FwAlertInfo( "O Valor �: " + cValToChar(nValor), "Mensagem")

    fSecund(@nValor)

    FwAlertInfo( "O Valor �: " + cValToChar(nValor), "Mensagem")

    U_fSecund()

    RestArea(aArea)

Return


Static Function fSecund( nValor )

    nValor := nValor + 10

Return

Static Function fDivide( nValor, nRecebimento )
    Local nRet := 0

    nRet := nValor / 2

    nRecebimento := (nRecebimento * 10) / 100

    aRet := { nRet,nRecebimento }

Return aRet
