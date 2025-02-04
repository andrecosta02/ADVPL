#INCLUDE 'Protheus.ch'
#INCLUDE 'FWMVCDEF.ch'
#Include 'RestFul.ch'

//------------------------------------------------------------------------------------------
/*/{Protheus.doc} Telegram 
@class			: Telegram 
@Sample			: Telegram():New()
@description	: Classe responsavel pela integração entre Protheus x Telegram.
@Param			: 
@return			:  
@obs 			: 
				  
@project		: 
@ --------------|----------------
@author			: Lucas.Brustolin
@since			: 03/04/2020
@version		: Protheus 12.1.17
/*/
//------------------------------------------------------------------------------------------
Class Telegram From FwRest
    Data cUrl       As String 
    Data cToken     As String
    Data aHeadOut   As Array
    Data cPath      As String 
    Data cEndPoint  As String 
    Data cChatId    As String 

    Method New() Constructor  
    Method SetChat()
    Method GetChat()
    Method SendMessage()
    Method GetUpdates()
    Method GetMe()
EndClass 


Method New ( p_cChat ) Class Telegram
   	Local cUrl	 	:= SuperGetMv("ML_TLGURL",  , "https://api.telegram.org")   // Endereço base para integração
	Local cToken	:= SuperGetMv("ML_TLGKEY",  , )                             // Chave de autenticação.
    Local cChat     := p_cChat
    // Local cChat     := SuperGetMv("ML_TLGCHAT", , )                             // Chat ID do Bot

    _Super:New(cUrl) // Inicializa metodo da classe pai

	Self:cURL		    := cUrl 
	Self:cToken 	    := cToken
    Self:cPath          := "/bot" + ::cToken  
    // Self:cChatId        := "-387410847"
    Self:cChatId        := cChat

    Self:aHeadOut 	    := {}
    Self:cEndPoint      := ""
Return( Self )


Method SetChat( cChatId ) Class Telegram
    ::cChatId := cChatId
Return( ::cChatId  )


Method GetChat() Class Telegram
Return( ::cChatId  )

// ---------------------------------------------------------------------+
// Faz o envio de mensagens para determinad chat id - markdown ou  HTML |
// ---------------------------------------------------------------------+   
Method SendMessage( cMessage, lHtml ) Class Telegram
    Local cParseMode    := ""
    Local lRet          := .F. 

    Default cMessage    := ""
    Default lHtml       := .F. 

    //-- Determina se a msg será no formato HTML ou normal
    cParseMode  := "parse_mode="
    cParseMode  += IIF( lHtml,"html", "markdown" )

    ::cEndPoint := ::cPath + "/sendMessage?"  + cParseMode  + "&use_aliases=true&chat_id=" + ::cChatId + "&text=" + cMessage

    _Super:SetPath( ::cEndPoint )

    lRet := _Super:Get() 
Return( lRet )


// ------------------------------------------------------------------------------------------------------------+
//  Se precisarmos do chat_id de uma pessoa que envia uma mensagem para o nosso bot, use o método getUpdates . |
// ------------------------------------------------------------------------------------------------------------+
Method GetUpdates() Class Telegram
    Local cRet := ""

    ::cEndPoint := ::cPath + "/getUpdates"
    
    _Super:SetPath( ::cEndPoint )

    If _Super:Get()
        cRet := _Super:GetResult()
    EndIf 
Return( cRet )

// -------------------------------------------------------------------------------+
//  informações básicas sobre o bot recém criado, precisamos usar o método getMe  |
// -------------------------------------------------------------------------------+
Method GetMe() Class Telegram
    Local cRet := ""

    ::cEndPoint := ::cPath  + "/getMe"
    
    _Super:SetPath( ::cEndPoint )

    If _Super:Get()
        cRet := _Super:GetResult()
    EndIf 
Return( cRet )



//----------------------------------------------------------+
// FUNÇÃO DE UTILIZACAO DA CLASSE Telegram [ @MultErpBot ]  |
//----------------------------------------------------------+

User Function fTelegram( p_cChat, p_cMsg, p_lHtml )
    Local aArea     := GetArea()
    Local xRet      := Nil
    Local cChat     := p_cChat  // ID do Chat que a mensagem será enviada
    Local cMsg      := p_cMsg   // Mensagem a ser enviada
    Local lHtml     := p_lHtml  // Define se aplicará HTML ou MarkDown na Mensagem
    Local oTelegram := Nil
    Local lRet      := .F.

    oTelegram := Telegram():New( cChat )
    
    If ValType(oTelegram) == "O"
        xRet := oTelegram:SetChat( cChat /*Chat ID*/ )

        if oTelegram:SendMessage( cMsg, lHtml )
            lRet := .T.
        endIf

    EndIf

    RestArea(aArea)
Return lRet



User Function fGetMsgTel()
    Local aArea := GetArea()
    Local xRet  := nil

    xRet := oTelegram:GetUpdates()

    RestArea(aArea)
Return
