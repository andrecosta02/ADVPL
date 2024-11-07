#include "Totvs.ch"

Public nPublicVar := 10 // Public: Acessível globalmente enquanto o sistema estiver ativo
Default nDefaultVar := 15 // Default: Acessível globalmente sem necessidade de declaração explícita

User Function fDeclaracoes()
    Local aArea         := GetArea()
    Local nLocalVar     := 20   // Local:   Existe apenas dentro do escopo da função onde foi declarada
    Private nPrivateVar := 30   // Private: Só é visível no módulo atual (arquivo)
    Static nStaticVar   := 0    // Static:  Preserva seu valor entre chamadas consecutivas da função
    nStaticVar += 1

    // Exibindo valores das variáveis
    FwAlertInfo("Variável Local (nLocalVar): " + cValToChar(nLocalVar), "Mensagem")
    FwAlertInfo("Variável Private (nPrivateVar): " + cValToChar(nPrivateVar), "Mensagem")
    FwAlertInfo("Variável Static (nStaticVar): " + cValToChar(nStaticVar), "Mensagem")
    FwAlertInfo("Variável Public (nPublicVar): " + cValToChar(nPublicVar), "Mensagem")
    FwAlertInfo("Variável Default (nDefaultVar): " + cValToChar(nDefaultVar), "Mensagem")

    // Alterando as variáveis Public e Default (o valor será mantido fora desta função)
    nPublicVar += 5
    nDefaultVar += 5

    AnotherFunction()

    RestArea(aArea)
Return

Static Function AnotherFunction()

    // Chama a mesma variável Static, que irá manter seu valor
    Static nStaticVar := 10
    nStaticVar += 2

    // A variável Default pode ser usada sem ser redeclarada aqui
    nDefaultVar += 3

    FwAlertInfo("Variável Static dentro de AnotherFunction (nStaticVar): " + cValToChar(nStaticVar), "Mensagem")
    FwAlertInfo("Variável Default dentro de AnotherFunction (nDefaultVar): " + cValToChar(nDefaultVar), "Mensagem")

Return
