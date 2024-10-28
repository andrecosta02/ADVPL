#Include "Protheus.ch"

User Function zMiniForm()
    Local aArea         := GetArea()
    Local aPergs        := {}
    Local aOptions      := {}
    Local lErroArvq     := .F.
    Local cConteudo     := ""
    Private cArqvLog    := "\system\funcoes_zMiniForm.txt"

    If File(cArqvLog)
        nHandle := FOPEN(cArqvLog)
        If nHandle == -1
            FWAlertWarning("Arquivo '" + cArqvLog + "' não encontrado", "Alerta")
            Return
        EndIf
        cConteudo := FReadStr( nHandle, 1048476 )
        cErr := fClose(cArqvLog)
        fClose(nHandle)
        aOptions := StrTokArr(cConteudo, ";")

    else

        if !fCriaArqv("")
            FWAlertWarning("Erro ao criar arquivo de Funções", "Mensagem")
            lErroArvq := .T.
        endIf

    endIf

    aAdd(aPergs, {1, "Função:", Space(100), "", ".T.", "", ".T.", 80,  .F.})
    aAdd(aPergs, {2, "Opções: ",                    1, aOptions,                        090, ".T.", .F.})
    aAdd(aPergs, {2, "Adiciona Função à lista: ",   1, {"1=SIM", "2=NAO", "3=REMOVE"},  090, ".T.", .F.})
    If ParamBox(aPergs, "Formulas ( Custom )")
        cFunction   := Alltrim(MV_PAR01)
        cOpcao      := MV_PAR02
        cAddLista   := MV_PAR03
        
        if !Empty(cFunction) .or. !Empty(aOptions)

            if VALTYPE( cOpcao ) == "C" .and. !Empty(aOptions)
                cOpcao := AllTrim(cOpcao)
            elseIf VALTYPE( cOpcao ) == "N" .and. !Empty(aOptions)
                cOpcao := aOptions[cOpcao]
            endIf

            cAddLista   := iif( VALTYPE( cAddLista ) == "C", AllTrim(cAddLista), cValToChar(cAddLista))
            cAddLista   := iif(len(cAddLista) > 1, StrTokArr(cAddLista, "=")[1], cAddLista)

            if !Empty(cFunction) 

                If cAddLista == "1" .and. !lErroArvq
                    if ascan(aOptions, cFunction) == 0

                        cConteudo := cConteudo + cFunction + ";"
                        if fCriaArqv( cConteudo )
                            FWAlertSuccess("Função adicionada da lista", "Mensagem")
                        else
                            FWAlertInfo("Ocorreu um erro na manipilação do arquivo: " + CRLF;
                                        + cArqvLog,;
                                        "Mensagem")
                        endIf

                    else
                        FWAlertWarning("Função já existente na lista", "Mensagem")
                    endIf
                EndIf
            
                &(cFunction)

            elseIf cAddLista == "3"
                If FwAlertYesNo("Você deseja remover a função { "+cOpcao+" } da lista ?" , "Mensagem")

                    cConteudo := StrTran(cConteudo, cOpcao+";", "")
                    if fCriaArqv( cConteudo )
                        FWAlertSuccess("Função removida da lista", "Mensagem")
                    else
                        FWAlertInfo("Ocorreu um erro na manipilação do arquivo: " + CRLF;
                                    + cArqvLog,;
                                    "Mensagem")
                    endIf

                else
                    FWAlertInfo("Função não removida", "Mensagem")
                endIf

            else
                &(cOpcao)
            endIf
        else
            FWAlertInfo("Para prosseguir, insira ou escolha uma função", "Mensagem")
        endIf

        u_zMiniForm()
	EndIf
    
    RestArea(aArea)
Return


Static Function fCriaArqv( p_cConteudo )
    Local aArea     := GetArea()
    Local cConteudo := p_cConteudo
    Local oWriter   := nil
    Local lRet      := .T.

    FERASE(cArqvLog, NIL, .F.)
    
    oWriter:= FWFileWriter():New( cArqvLog, .F.)
    If !oWriter:Create()
        // Erro ao criar arquivo de Funções
        lRet := .F.
    Endif
    oWriter:Write( cConteudo )
    oWriter:Close()
    oWriter := nil

    RestArea(aArea)
Return lRet
