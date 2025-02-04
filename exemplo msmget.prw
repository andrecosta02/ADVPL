#include "protheus.ch"
#include "msmgadd.ch"
 
//-------------------------------------------------------------------
/*/{Protheus.doc} MyMrbwEnch
    MsMget sample
@author totvs
@since 31/07/2019
//-----------------------------------------------------------------*/
User Function MyMrbwEnch()
    Private cCadastro := "Cadastro de Clientes"
    Private aRotina := {{"Pesquisar" , "axPesqui" , 0, 1},;
        {"Visualizar" , "U_MyMsmGet" , 0, 2}}
    DbSelectArea("SA1")
    DbSetOrder(1)
    MBrowse(6,1,22,75,"SA1")
Return
 
//-------------------------------------------------------------------
/*/{Protheus.doc} MyMsmGet
    Função de manutenção do cadastro
@author totvs
@since 31/07/2019
//-----------------------------------------------------------------*/
User Function MyMsmGet(cAlias,nReg,nOpc)
    Local oDlg
    Local oEnch
    Local lMemoria  := .T.
    Local lCreate   := .T.
    Local lSX3  := .T.  //verifica se irá criar a enchoice a partir do SX3 ou a partir de um vetor.
    Local aPos  := {000,000,400,600}        //posição da enchoice na tela
    Local aCpoEnch  := {}   //campos que serão mostrados na enchoice
    Local aAlterEnch := {"A1_COD", "A1_NOME"}   //habilita estes campos para edição
    Local aField    := {}
    Local aFolder   := {"Cadastrais","Adm/Fin.", "Fiscais", "Vendas"}
    Local cSvAlias  := Alias()
 
    DbSelectArea("SX3")
    DbSetOrder(1)
    DbSeek(cAlias)
 
    // Exemplo da estrutura do array aField
    //Aadd(aField, {"Codigo", "A1_COD", "C", 6, 0, "@!", 'IIF(Empty(M->A1_LOJA),.T.,ExistChav("SA1",M->A1_COD+M->A1_LOJA,,"EXISTCLI"))', .F., 1, "", "", "", .F., .F., "", 1, .F., "", "S"})
    //Aadd(aField, {"campo 1", "CAMPO_1", "N", 6, 2, "@E 999.99", '', .F., 1, "", "", "", .F., .F., "", 1, .F., "", "S"})
    //M->CAMPO_1 := 156
 
    While !Eof() .And. SX3->X3_ARQUIVO == cAlias
        If !(SX3->X3_CAMPO $ "A1_FILIAL") .And. X3Uso(SX3->X3_USADO)
            AADD(aCpoEnch,SX3->X3_CAMPO)
        EndIf
 
        IF Alltrim(SX3->X3_CAMPO) $ "A1_COD|A1_NOME|A1_DESC|A1_COND|A1_ENDCOB|A1_ENDENT"
 
            Aadd(aField, {X3TITULO(),;            // [1] - Titulo
                SX3->X3_CAMPO,;                   // [2] - campo
                SX3->X3_TIPO,;                    // [3] - Tipo
                SX3->X3_TAMANHO,;                 // [4] - Tamanho
                SX3->X3_DECIMAL,;                 // [5] - Decimal
                SX3->X3_PICTURE,;                 // [6] - Picture
                SX3->X3_VALID,;                   // [7] - Valid
                .F.,;                             // [8] - Obrigat
                SX3->X3_NIVEL,;                   // [9] - Nivel
                SX3->X3_RELACAO,;                 // [10]- Inicializador Padrão
                SX3->X3_F3,;                      // [11]- F3
                SX3->X3_WHEN,;                    // [12]- when
                .F.,;                             // [13]- visual
                .F.,;                             // [14]- chave
                SX3->X3_CBOX,;                    // [15]- box
                Val(SX3->X3_FOLDER),;             // [16]- folder
                .F.,;                             // [17]- nao alteravel
                SX3->X3_PICTVAR,;                 // [18]- pictvar
                SX3->X3_TRIGGER})                 // [19]- gatilho
        EndIf
        DbSkip()
    End

    DEFINE MSDIALOG oDlg TITLE "Teste MsmGet" FROM 0,0 TO 355,600 PIXEL
    oDlg:lMaximized := .T.
    RegToMemory(cAlias, If(nOpc==3,.T.,.F.))
    If lSX3
        //exemplo de utilização da enchoice lendo as informações do SX3 - quando a variável lSX3 for .T.
        oEnch := MsmGet():New(cAlias,nReg,nOpc,/*aCRA*/,/*cLetras*/,/*cTexto*/,aCpoEnch,aPos,aAlterEnch,;
            /*nModelo*/,/*nColMens*/,/*cMensagem*/, /*cTudoOk*/,oDlg,/*lF3*/,lMemoria,/*lColumn*/,;
            /*caTela*/,/*lNoFolder*/,/*lProperty*/,/*aField*/,/*aFolder*/,/*lCreate*/,;
            /*lNoMDIStretch*/,/*cTela*/)   
    Else
        //exemplo de utilização da enchoice por array    
        oEnch := MsmGet():New(,,nOpc,/*aCRA*/,/*cLetras*/,/*cTexto*/,aCpoEnch,aPos,aAlterEnch,/*nModelo*/,;
            /*nColMens*/,/*cMensagem*/, /*cTudoOk*/,oDlg,/*lF3*/,lMemoria,/*lColumn*/,/*caTela*/,;
            /*lNoFolder*/,/*lProperty*/,aField,aFolder,lCreate,/*lNoMDIStretch*/,/*cTela*/)
    EndIf
 
    oEnch:oBox:align := CONTROL_ALIGN_ALLCLIENT
    ACTIVATE MSDIALOG oDlg CENTER ON INIT EnchoiceBar(oDlg,{|| oDlg:End()},{|| oDlg:End()},,,,.F.,.F.)
 
    If !Empty(cSvAlias)
        DbSelectArea(cSvAlias)
    EndIf
 
RETURN
