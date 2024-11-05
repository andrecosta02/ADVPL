User Function fMBrowse()
    Local aArea       := GetArea()
    Local cTabela     := "ZZZ"
    Private aCores    := {}
    Private cCadastro := "Título do Cadastro"
    Private aRotina   := {}
     
    //Montando o Array aRotina, com funções que serão mostradas no menu
    aAdd(aRotina,{"Pesquisar",  "AxPesqui", 0, 1})
    aAdd(aRotina,{"Visualizar", "AxVisual", 0, 2})
    aAdd(aRotina,{"Incluir",    "AxInclui", 0, 3})
    aAdd(aRotina,{"Alterar",    "AxAltera", 0, 4})
    aAdd(aRotina,{"Excluir",    "AxDeleta", 0, 5})
    aAdd(aRotina,{"* Função A", "u_zFuncA", 0, 8})
    aAdd(aRotina,{"* Função B", "u_zFuncB", 0, 8})
 
    //Montando as cores da legenda
    aAdd(aCores,{"ZZZ_CAMPO == '1' ", "BR_VERDE" })
    aAdd(aCores,{"ZZZ_CAMPO == '2' ", "BR_VERMELHO" })
     
    //Selecionando a tabela e ordenando
    DbSelectArea(cTabela)
    (cTabela)->(DbSetOrder(1))
     
    //Montando o Browse
    mBrowse(6, 1, 22, 75, cArquivo, , , , , , aCores )
     
    //Encerrando a rotina
    (cTabela)->(DbCloseArea())
    RestArea(aArea)
// Teste comit  
// Segundo commit    

Return
