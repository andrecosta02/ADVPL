#include "Totvs.ch"

/*
{Protheus.doc} fTipos

    - Objetivo:     Demonstrar os Tipos de Variaveis 

    - Tipo rotina:  Alerts

    - Autor:        Andre Costa - 05/11/2024

*/

User Function fTipos()
    Local aArea         := GetArea()
    Local nSalario      := 5000.80                                              // Variavel Numerica
    Local nFTGS         := 8 // Porcentagem FGTS                                // Variavel Numerica
    Local cNome         := "José Victor"                                        // Variavel Caractere
    Local lAtivo        := .T.                                                  // Variavel Bollean
    Local dAdmissao     := Stod("20201105")                                     // Variavel Data
    Local aFilhos       := {"Arthur", "Lucas"}                                  // Variavel Array
    Local aSalarios     := {{3500, "2021"}, {4000, "2023"}, {5000.80, "2024"}}  // Array multi-dimensional
    Local bCalcFGTS1    := { || (nSalario * nFTGS) / 100 }                      // Bloco de Codigo
    Local bCalcFGTS2    := "(nSalario * nFTGS) / 100"                           // Bloco de Codigo em String

    Local nI := 1 // Variavel usada nos dois For

    // Identificação de Variaveis
    FwAlertInfo("A variavel 'cNome' é do tipo: " +ValType(cNome) , "Mensagem")

    FwAlertInfo("Cadastro de '" + cNome + "' está " + iif(lAtivo, "ATIVO", "INATIVO"), "Mensagem")

    FwAlertInfo("Admissão em: " + DtoC(dAdmissao), "Mensagem")

    cContent := bCalcFGTS1
    cContent := Eval(cContent)          // Executa um Bloco de Codigo
    cContent := cValToChar(cContent)    // Converte o Resultado pra Caracte
    FwAlertInfo("Calculo de FGTS R$" + cContent + " com base no salario: R$" + cValToChar(nSalario), "Mensagem")

    cContent := &bCalcFGTS2             // Usar o & para ativar o Bloco de Codigo em String
    FwAlertInfo("Calculo de FGTS R$" + cContent + " com base no salario: R$" + cValToChar(nSalario), "Mensagem")


    cMsg := "'" + cNome + "' possui dois filhos: " + CRLF
    For nI := 1 To Len(aFilhos) // Percorre o Array 'aFilhos', e prrenche a variavel 'cMsg'
        cMsg += aFilhos[nI] + CRLF
    Next nI
    FwAlertInfo(cMsg, "Mensagem")



    cMsg := "Salarios de '" + cNome + "': " + CRLF
    For nI := 1 To Len(aSalarios) // Percorre o Array 'aSalarios', e prrenche a variavel 'cMsg'
        cMsg += "R$" + cValToChar(aSalarios[nI][1]) +" em "+ aSalarios[nI][2] + CRLF
    Next nI
    FwAlertInfo(cMsg, "Mensagem")


    RestArea(aArea)
Return
