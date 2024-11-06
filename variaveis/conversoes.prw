#include "Totvs.ch"

/*
{Protheus.doc} fConversoes

    - Objetivo:     Demonstrar as formas de conversões 

    - Tipo rotina:  Funcoes

    - Autor:        Andre Costa - 05/11/2024

*/

User Function fConversoes()
    Local aArea         := GetArea()

    /*
    Funcoes para usar com Datas
    */


    // CTOD -           Converte de caracter para data	
    dData := CTOD("20/05/2010") // "20/05/2010" --> 20/05/10
    
    // DTOC -           Converte de data para caracter	
    cData := DTOC(Data) // 20/05/10 --> "20/05/2010"
    
    // DTOS -           Converte de data para string no formato aaaammdd	
    cData := DTOS(Data) // 20/05/10 --> "20100510"
    
    // STOD -           Converte de String para data no formato dd/mm/aaaa	
    dData := STOD("20100510") // "20100510" --> 20/05/10
    
    // Date -           Retorna a data atual	
    dData := Date() // 06/11/2024
    
    // Day -            Retorna o dia de uma data	
    Day(Date())

    
    // Month -          Retorna o mes de uma data	
    Month(Data)
    
    // Year -           Retorna o ano de uma data	
    Year(Data)
    
    // cMonth -         Retorna uma cadeia de caracteres com nome do mês em inglês	
    cMonth(Data)
    
    // MesExtenso -     Retorna o nome do mês por extenso	
    MesExtenso(nMes)
    
    // AnoMes -         Retorna o ano e o mês no formato aaaamm	
    AnoMes(Data)
    
    // MesDia -         Retorna o mês e dia no formato mmdd	
    MesDia(Data)
    
    // Day2Str -        Retorna o dia no formato DD	
    Day2Str(Data)
    
    // Month2Str -      Retorna o mês no formato MM	
    Month2Str(Data)
    
    // Year2Str -       Retorna o ano no formato AAAA	
    Year2Str(Data)
    
    // DaySum -         Soma dia(s) a uma Data	
    DaySum(Data,nDias)
    
    // DaySub -         Subtrai dia(s) de uma Data	
    DaySub(Data,nDias)
    
    // MonthSum -       Soma mes(es) a uma Data	
    MonthSum(Data,nMes)
    
    // MonthSub -       Subtrai mes(es) de uma Data	
    MonthSub(Data,nMes)
    
    // YearSum -        Soma ano(s) a uma data	
    YearSum(Data,nAno)
    
    // YearSub -        Subtrai ano(s) de uma data	
    YearSub(Data,nAno)
    
    // DateDiffDay -    Diferenca em dias entre duas datas	
    DateDiffDay(Data1,Data2)
    
    // DateDiffMonth -  Diferenca em meses entre duas datas	
    DateDiffMonth(Data1,Data2)
    
    // DateDiffYear -   Diferenca em anos entre duas datas	
    DateDiffYear(Data1,Data2)
    
    // DateDiffYMD -    Diferenca de Anos, Meses e Dias entre duas datas	
    DateDiffYMD(Data1,Data2)
    
    // DiaSemana -      Retorna a Descrição do Dia da Semana conforme parâmetros	
    DiaSemana(Data,nTam,nDia)
    
    // Dow -            Retorna o dia da Semana	
    Dow(Data)
    
    // FirstDate -      Retorna a Data do Primeiro dia do mes da data passada	
    FirstDate(Data)
    
    // LastDate -       Retorna a Data do ùltimo dia do mes da data passada	
    LastDate(Data)
    
    // Last_Day -       Retorna o último dia do mes de uma data	
    Last_Day(Data)
    
    // FirstYDate -     Retorna a Data do Primeiro dia do Ano da Data Passada	
    FirstYDate(Data)
    
    // LastYDate -      Retorna a Data do último dia do Ano da Data Passada	
    LastYDate(Data)



    RestArea(aArea)
Return
