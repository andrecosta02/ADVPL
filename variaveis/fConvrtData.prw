#include "Totvs.ch"

/*
{Protheus.doc} fConvrtData

    - Objetivo:     Demonstrar as formas de conversões 

    - Tipo rotina:  Funcoes

    - Autor:        Andre Costa - 05/11/2024

*/

User Function fConvrtData()
    Local aArea         := GetArea()

    /*
    Funcoes para usar com Datas
    */

    // Date -           Retorna a data atual	
    dData := Date() // 06/11/2024

    // CTOD -           Converte de caracter para data	
    dData := CTOD("20/05/2010") // "20/05/2010" --> 20/05/10
    
    // DTOC -           Converte de data para caracter	
    cData := DTOC(Date()) // 20/05/10 --> "20/05/2010"
    
    // DTOS -           Converte de data para string no formato aaaammdd	
    cData := DTOS(Date()) // 20/05/10 --> "20100510"
    
    // STOD -           Converte de String para data no formato dd/mm/aaaa	
    dData := STOD("20100510") // "20100510" --> 20/05/10 
    
    // Day -            Retorna o dia de uma data	
    nData := Day(Date()) // Se data for 06/11/2024, retorna 6
    
    // Month -          Retorna o mes de uma data	
    nMes := Month(Date()) // Se data for 06/11/2024, retorna 2024
    
    // Year -           Retorna o ano de uma data	
    nAno := Year(Date()) // Se data for 06/11/2024, retorna 11
    
    // cMonth -         Retorna uma cadeia de caracteres com nome do mês em inglês	
    cMes := cMonth(Date()) // Retorna o mês da Data em inglês, "November"
    
    // MesExtenso -     Retorna o nome do mês por extenso	
    cMes := MesExtenso(12) // Retorna o mês em Português do número passado, "Dezembro"
    cMes := MesExtenso(1) // "Janeiro"
    
    // AnoMes -         Retorna o ano e o mês no formato aaaamm	
    cAnoMes := AnoMes(Date()) // 20/05/10 --> "201005"
    
    // MesDia -         Retorna o mês e dia no formato mmdd	
    cAnoMes := MesDia(Date()) // 20/05/10 --> "1005"
    
    // Day2Str -        Retorna o dia no formato DD	
    cDia := Day2Str(Date()) // 20/05/10 --> "20"
    
    // Month2Str -      Retorna o mês no formato MM	
    cMes := Month2Str(Date()) // 20/05/10 --> "05"
    
    // Year2Str -       Retorna o ano no formato AAAA	
    cAno := Year2Str(Date()) // 20/05/10 --> "2010"
    
    // DaySum -         Soma dia(s) a uma Data	
    dDataSum := DaySum(Date(), 2) // 06/11/2024 --> 08/11/2024
    
    // DaySub -         Subtrai dia(s) de uma Data	
    dDataSub := DaySub(Date(), 2) // 06/11/2024 --> 04/11/2024
    
    // MonthSum -       Soma mes(es) a uma Data	
    dMesSum := MonthSum(Date(), 1) // 06/11/2024 --> 06/12/2024
    
    // MonthSub -       Subtrai mes(es) de uma Data	
    dMesSub := MonthSub(Date(), 1) // 06/11/2024 --> 06/10/2024
    
    // YearSum -        Soma ano(s) a uma data	
    dAnoSum := YearSum(Date(), 2) // 06/11/2024 --> 06/11/2026
    
    // YearSub -        Subtrai ano(s) de uma data	
    dAnoSub := YearSub(Date(), 2) // 06/11/2024 --> 06/11/2022
    
    // DateDiffDay -    Diferenca em dias entre duas datas	
    nDiaDiff := DateDiffDay(CTOD("01/01/2000"), CTOD("25/01/2000")) // Retorna: 24
    
    // DateDiffMonth -  Diferenca em meses entre duas datas	
    nMesDiff := DateDiffMonth(CTOD("01/01/2000"), CTOD("01/11/2000")) // Retorna: 10
    
    // DateDiffYear -   Diferenca em anos entre duas datas	
    nAnoDiff := DateDiffYear(CTOD("01/01/2000"), CTOD("01/01/2015")) // Retorna: 15
    
    // DateDiffYMD -    Diferenca de Anos, Meses e Dias entre duas datas	
    aDiffYMD := DateDiffYMD(CTOD("01/01/2000"), CTOD("01/01/2015")) // Retorna: {15, 4, 1}, sequencia --> {ano, mes, dia}
    
    // DiaSemana -      Retorna a Descrição do Dia da Semana conforme parâmetros	
    cDiaAtu     := DiaSemana(Date(),  , )   // Retorna Ex: "Quarta"
    cDiaAbrev   := DiaSemana(Date(), 3, )   // Retorna Ex: "Qua"
    cDiaSemana  := DiaSemana( , , 7)        // Retorna: "Sabado"

    // GPEDiaSem -      Retorna o nome do dia completo
    cDiaAtuFull := GPEDiaSem(Date()) // Ex: "Segunda-Feira"
    
    // Dow -            Retorna o numero referente ao dia da Semana
    nDiaSemana := Dow(Date()) // eExemplo, se for Domingo, retorna 1 
    
    // FirstDate -      Retorna a Data do Primeiro dia do mes da data passada	
    dFirstDate := FirstDate(Date()) // Retorna: 01/11/2024
    
    // LastDate -       Retorna a Data do ùltimo dia do mes da data passada	
    dLastDate := LastDate(Date()) // Retorna: 30/11/2024
    
    // Last_Day -       Retorna o último dia do mes de uma data	
    nLastDay := Last_Day(Date()) // Retorna: 28, 29, 30 ou 31
    
    // FirstYDate -     Retorna a Data do Primeiro dia do Ano da Data Passada	
    dFirstAno := FirstYDate(Date()) // Retorna: 01/01/2024
    
    // LastYDate -      Retorna a Data do último dia do Ano da Data Passada	
    dLastAno := LastYDate(Date()) // Retorna: 30/12/2024

    RestArea(aArea)
Return
