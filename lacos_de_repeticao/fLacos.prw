#include "TOTVS.CH"

User Function fLacos()
    Local aArea := GetArea()
    Local nI    := 1
    
    
    
    aEmployees := { ;
        { "João Silva",     "1990-03-15", 3500.00, "Analista de Sistemas",  cToD("2015-06-10") }, ;
        { "Maria Souza",    "1988-07-22", 4200.00, "Desenvolvedora",        cToD("2017-01-15") }, ;
        { "Carlos Lima",    "1995-11-10", 2900.00, "Suporte Técnico",       cToD("2019-10-05") }, ;
        { "Ana Costa",      "1992-02-28", 3800.00, "Gerente de Projetos",   cToD("2016-08-22") }, ;
        { "Pedro Rocha",    "1985-05-30", 4500.00, "Administrador",         cToD("2013-03-12") }, ;
        { "Luisa Gonçalves","1993-09-25", 3100.00, "Desenvolvedora",        cToD("2020-05-18") }, ;
        { "Ricardo Melo",   "1989-12-05", 3700.00, "Analista de Dados",     cToD("2014-11-03") }, ;
        { "Fernanda Torres","1994-04-14", 2800.00, "Designer Gráfico",      cToD("2018-04-22") }, ;
        { "Bruno Martins",  "1991-06-19", 3300.00, "Coordenador de TI",     cToD("2017-09-08") }, ;
        { "Camila Santos",  "1987-08-09", 3900.00, "Consultora",            cToD("2016-12-20") } ;
    }

    aSays := {}
    For nI := 1 To Len(aEmployees)
        aAdd(aSays, "Funcionário " + cValToChar(nI) + ":")
        aAdd(aSays, "Nome: " + aEmployees[nI][1])
        aAdd(aSays, "Data de Nascimento: " + aEmployees[nI][2])
        aAdd(aSays, "Salário: " + Transform(aEmployees[nI][3], "@E 999,999.99"))
        aAdd(aSays, "Cargo: " + aEmployees[nI][4])
        aAdd(aSays, "Data de Admissão: " + dToC(aEmployees[nI][5]))
        aAdd(aSays, "------------------------------------------------")
        aAdd(aSays, " ")

    Next nI

    aButtons := {}
    aAdd(aButtons, { 1, .T., {|| lOk := .T., FechaBatch() }} )
    aAdd(aButtons, { 2, .T., {|| lOk := .F., FechaBatch() }} )

    //Chama a tela principal
    FormBatch("Informações Funcionarios", aSays, aButtons)


    // aColors := { "Azul", "Verde", "Vermelho", "Amarelo", "Roxo", "Laranja" }

    // For nI := 1 To Len(aColors)
    //     ConOut("Cor Favorita " + Ltrim(Str(nI)) + ": " + aColors[nI])
    // Next

    RestArea(aArea)
Return
