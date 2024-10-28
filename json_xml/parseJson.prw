User Function Exemplo1()
// Local cFile := '\teste\exemplo1.json'
Local cFile := 'C:\TOTVS12\includes\testes\exemplo1.json'
Local cJsonStr,oJson
Local nId, cNome, lDepend, aAlerg
Local oOutros, cTipoS, lEleitor, lReserv

cJsonStr = MEMOREAD(cFile)

oJson := JSonObject():New()
cErr  := oJSon:fromJson(cJsonStr)

nId := oJson:GetJSonObject('Id')
cNome := oJson:GetJSonObject('Nome')
lDepend := oJson:GetJSonObject('Dependentes')

aAlerg := oJson:GetJSonObject('Alergias')
cAlerg1 := aAlerg[1]
cAlerg2 := aAlerg[2]

oOutros := oJson:GetJSonObject('Outros')

cTipoS := oOutros:GetJSonObject('Sangue')
lEleitor := oOutros:GetJSonObject('Eleitor')
lReserv := oOutros:GetJSonObject('Reservista')

// Descarta o objeto 
FreeObj(oJson)

Return


If !empty(cErr)
  MsgStop(cErr,"JSON PARSE ERROR")
  Return
Endif
