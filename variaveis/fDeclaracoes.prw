#include "Totvs.ch"

Public nPublicVar := 10 // Public: Acess�vel globalmente enquanto o sistema estiver ativo
Default nDefaultVar := 15 // Default: Acess�vel globalmente sem necessidade de declara��o expl�cita

User Function fDeclaracoes()
    Local aArea         := GetArea()
    Local nLocalVar     := 20   // Local:   Existe apenas dentro do escopo da fun��o onde foi declarada
    Private nPrivateVar := 30   // Private: S� � vis�vel no m�dulo atual (arquivo)
    Static nStaticVar   := 0    // Static:  Preserva seu valor entre chamadas consecutivas da fun��o
    nStaticVar += 1

    // Exibindo valores das vari�veis
    FwAlertInfo("Vari�vel Local (nLocalVar): " + cValToChar(nLocalVar), "Mensagem")
    FwAlertInfo("Vari�vel Private (nPrivateVar): " + cValToChar(nPrivateVar), "Mensagem")
    FwAlertInfo("Vari�vel Static (nStaticVar): " + cValToChar(nStaticVar), "Mensagem")
    FwAlertInfo("Vari�vel Public (nPublicVar): " + cValToChar(nPublicVar), "Mensagem")
    FwAlertInfo("Vari�vel Default (nDefaultVar): " + cValToChar(nDefaultVar), "Mensagem")

    // Alterando as vari�veis Public e Default (o valor ser� mantido fora desta fun��o)
    nPublicVar += 5
    nDefaultVar += 5

    AnotherFunction()

    RestArea(aArea)
Return

Static Function AnotherFunction()

    // Chama a mesma vari�vel Static, que ir� manter seu valor
    Static nStaticVar := 10
    nStaticVar += 2

    // A vari�vel Default pode ser usada sem ser redeclarada aqui
    nDefaultVar += 3

    FwAlertInfo("Vari�vel Static dentro de AnotherFunction (nStaticVar): " + cValToChar(nStaticVar), "Mensagem")
    FwAlertInfo("Vari�vel Default dentro de AnotherFunction (nDefaultVar): " + cValToChar(nDefaultVar), "Mensagem")

Return
