'
' **************************************************************
' * NELLE AREE SBAGLIATE - IGP (ISAAC GARCIA PEVERI) TECH BLOG *
' * DATE WRITTEN:  01/06/2024                                  *
' * DATE COMPILED: 01/06/2024                                  *
' * LAST EDITED:   01/06/2024                                  *
' * COMPILER:      XC BASIC 3 FOR WINDOWS X64                  *
' **************************************************************

' **** WORKING-STORAGE
Dim rooms(50)   As String*20
Dim objects(20) As String*20
Dim inventory(20) As String*20
Dim position As Byte: position = 0
Dim tool As String*20: tool = ""
Dim objToRead As String*20: objToRead = ""
Dim keyPressed As String*1: keyPressed = ""
Dim scelta As String*1: scelta = ""
Dim mailBoxOpen As Byte: mailBoxOpen = 0
Dim letterRead As Byte: letterRead = 0
Dim validWord As Byte: validWord = 0
Const maxObjects As Byte = 19
' -------------------------------------------------------------

' **** PROCEDURE DIVISION
' -------------------------------------------------------------
Sub CheckBadWords(verb As string*30) Static
    If verb = "stronzo" _
    Or verb = "vaffanculo" _
    Or verb = "idiota" _
    Or verb = "deficiente" _
    Or verb = "imbecille" _
    Or verb = "testa di cazzo" _
    Or verb = "minchione" _
    Or verb = "polifemo" _
    Or verb = "pisquano" _
    Or verb = "srupido" _
    Or verb = "mongolo" _
    Or verb = "bigolo" _
    Or verb = "pescegatto" _
    Or verb = "mongoloide" _
    Or verb = "fottiti" _
    Or verb = "inculati" _
    Or verb = "culattone" _
    Or verb = "frocio" _
    Or verb = "frocioide" _
    Or verb = "zoccola" _
    Or verb = "troia" _
    Or verb = "troiona" _
    Or verb = "baldracca" _
    Or verb = "bagascia" _
    Or verb = "puttana" _
    Or verb = "maiala" _
    Or verb = "culo" _
    Or verb = "cazzo" _
    Or verb = "merda" _
    Or verb = "fesso" _
    Or verb = "vaccagare" _
    Or verb = "va a cagare" _
    Or verb = "vai a cagare" _
    Or verb = "vai a fanculo" _
    Or verb = "vai a fare in culo" _
    Or verb = "vai a dare via il culo" _
    Or verb = "vadavialcul" _
    Or verb = "a li mortacci tua" _
    Or verb = "cretino" Then
       validWord = 1
       Poke 646, 1
       Poke 53281,10
       Print chr$(147)
       Print "le tue brutte parole suggeriscono che"
       Print "dovreti lavare la tua tastiera "
       Print "col sapone! sei un maleducato!!!"
       Print ""
       Print "fine del gioco!"
       Print ""
       Print "tie'!"
       end
    End If
End Sub
' -------------------------------------------------------------

Sub ShowInventory() Static
    For idx As byte = 0 To maxObjects
       If (inventory(idx)) <> "" Then
          Print "{green}  ", inventory(idx)
       End If
    Next idx
End Sub
' -------------------------------------------------------------

Sub LocationOffice() Static
    Print ""
    Poke 646,3: Print "  sei rimasto nella tua azienda "
    Poke 646,3: Print "  oltre il tuo normale orario   "
    Poke 646,3: Print "  lavorativo per una consegna"
    Poke 646,3: Print "  urgente ed hai appena terminato."
    Poke 646,3: Print "  ti rendi conto che e' tardi..."
    Poke 646,3: Print "  a nord, la porta di accesso al"
    Poke 646,7: Print "  <corridioio dell'azienda>"
    Poke 646,3: Print "  a ovest la"
    Poke 646,7: Print "  <finestra sulla strada>"
End Sub
' -------------------------------------------------------------

Sub LocationRoad() Static
    Print ""
    Poke 646,3: Print "  imbocchi l'uscita del parcheggio..."
    Poke 646,3: Print "  e' notte fonda, percorri la "
    Poke 646,3: Print "  strada statale che conduce a casa"
    Poke 646,3: Print "  il silenzio e' interrotto solo dall'"
    Poke 646,3: Print "  incessante canto dei grilli e dal"
    Poke 646,3: Print "  rumore del motore della tua auto."
    Poke 646,3: Print "  giunto a casa, vedi a nord"
    Poke 646,7: Print "  <la porta di ingresso di casa>"
    Poke 646,3: Print "  ad est vedi"
    Poke 646,7: Print "  <la cassetta della posta>"
    Poke 646,3: Print "  a sud"
    Poke 646,7: Print "  <la strada>"
    position = 8
End Sub
' -------------------------------------------------------------

Sub LocationRoad_II() Static
    Print ""
    Poke 646,3: Print "  imbocchi l'uscita del parcheggio..."
    Poke 646,3: Print "  e' notte fonda, percorri la "
    Poke 646,3: Print "  strada statale che conduce a casa"
    Poke 646,3: Print "  il silenzio e' interrotto solo dall'"
    Poke 646,3: Print "  incessante canto dei grilli e dal"
    Poke 646,3: Print "  rumore del motore della tua auto."
    position = 41
End Sub
' -------------------------------------------------------------

Sub LocationServerRoom() Static
    Print ""
    Poke 646,3: Print "  ti trovi davanti"
    Poke 646,3: Print "  all'entrata della sala server"
    Poke 646,3: Print "  sei di fronte alla porta di"
    Poke 646,3: Print "  ingresso. ad ovest vedi:"
    Poke 646,7: Print "  <porta di ingresso all'azienda>"
    Poke 646,3: Print "  a sud"
    Poke 646,7: Print "  <le scale verso il secondo piano>"
End Sub
' -------------------------------------------------------------

Sub LocationInsideServerRoom() Static
    position = 4
    Print ""
    Poke 646,3: Print "  solo un paio di server rumorosi"
    Poke 646,3: Print "  e tanti led lampeggianti.."
    Poke 646,3: Print "  niente di che.."
    Poke 646,3: Print "  esci dalla stanza e richiudi la porta"
    Poke 646,3: Print "  a ovest, puoi anche vedere"
    Poke 646,7: Print "  <porta di ingresso all'azienda>"
    Poke 646,3: Print "  a sud"
    Poke 646,7: Print "  <le scale verso il secondo piano>"
End Sub
' -------------------------------------------------------------

Sub LocationHall() Static
    Print ""
    Poke 646,3: Print "  il corridoio si estende davanti a te"
    Poke 646,3: Print "  l'oscurita' che lo avvolge, rende "
    Poke 646,3: Print "  l'ambiente circostante cupo ed allo"
    Poke 646,3: Print "  stesso tempo inquetante. non c'e' "
    Poke 646,3: Print "  nessuno, solo il silenzio totale."
    Poke 646,3: Print "  puoi anche vedere ad est:"
    Poke 646,3: Print "  la porta di accesso ai "
    Poke 646,7: Print "  <bagni>"
    Poke 646,3: Print "  a sud la stanza del tuo"
    Poke 646,7: Print "  <ufficio>"
    Poke 646,3: Print "  a nord, una luce verso le scale"
    Poke 646,3: Print "  che conducono alla"
    Poke 646,7: Print "  <sala server>"
End Sub
' -------------------------------------------------------------

Sub LocationWindow() Static
    Print ""
    Poke 646,3: Print "  sei davanti alla finestra."
    Poke 646,3: Print "  fuori e' completamente buio."
    Poke 646,3: Print "  realizzi che e' davvero tardi..."
End Sub
' -------------------------------------------------------------

Sub LocationRestRooms() Static
    Print ""
    Poke 646,3: Print "  un bagno pulito."
    Poke 646,3: Print "  niente di particolare."
    Poke 646,3: Print "  puoi anche vedere ad ovest:"
    Poke 646,7: Print "  <corridoio dell'azienda>"
End Sub
' -------------------------------------------------------------

Sub LocationParking() Static
    Print ""
    Poke 646,3: Print "  il parcheggio e' completamente vuoto."
    Poke 646,3: Print "  e la monotonia del luogo e' interrotta"
    Poke 646,3: Print "  dalla presenza della tua auto!"
    Poke 646,3: Print "  a est, vedi la"
    Poke 646,7: Print "  <porta di ingresso all'azienda>"
    Poke 646,3: Print "  mentre a nord, vedi la tua"
    Poke 646,7: Print "  <automobile>"
End Sub
' -------------------------------------------------------------

Sub LocationDoorHoouse() Static
    Print ""
    Poke 646,3: Print "  ti trovi di fronte alla porta di"
    Poke 646,3: Print "  ingresso di casa."
    Poke 646,3: Print "  vedi inoltre, a sud"
    Poke 646,7: Print "  <la strada> "
    Poke 646,3: Print "  ad est vedi"
    Poke 646,7: Print "  <la cassetta della posta>"
End Sub
' -------------------------------------------------------------

Sub LocationSaloon() Static
    Print ""
    Poke 646,3: Print "  sei in soggiorno. ad est vedi"
    Poke 646,7: Print "  <l'ingresso alla cucina>"
    Poke 646,3: Print "  a nord"
    Poke 646,7: Print "  <la entrata al dormitorio>"
    Poke 646,3: Print "  a nord-est"
    Poke 646,7: Print "  <l'ingresso del bagno>"
    Poke 646,3: Print "  a sud:"
    Poke 646,7: Print "  <la porta di ingresso di casa>"
    Poke 646,3: Print "  che riconduce alla strada"
    Poke 646,3: Print "  mentre ad ovest trovi l'uscita"
    Poke 646,3: Print "  che conduce verso il tuo "
    Poke 646,7: Print "  <giardino privato> "
End Sub
' -------------------------------------------------------------

Sub LocationMailBox() Static
    Print ""
    Poke 646,3: Print "  sei di fronte alla tua cassetta"
    Poke 646,7: Print "  delle lettere."
    Poke 646,3: Print "  a ovest vedi"
    Poke 646,7: Print "  <la porta di ingresso>"
End Sub
' -------------------------------------------------------------

Sub LocationKitchen() Static
    Print ""
    Poke 646,3: Print "  sei in cucina. ad ovest vedi"
    Poke 646,7: Print "  <l'ingresso al soggiorno>"
End Sub
' -------------------------------------------------------------

Sub LocationDormitory() Static
    Print ""
    Poke 646,3: Print "  sei nel dormitorio. a sud vedi"
    Poke 646,7: Print "  <l'ingresso al soggiorno>"
End Sub
' -------------------------------------------------------------

Sub LocationBathroom() Static
    Print ""
    Poke 646,3: Print "  sei in bagno. a sud vedi"
    Poke 646,7: Print "  <l'ingresso al soggiorno>"
End Sub
' -------------------------------------------------------------

Sub LocationGarden() Static
    Print ""
    Poke 646,3: Print "  ti trovi in giardino. a est vedi"
    Poke 646,7: Print "  <l'ingresso al soggiorno>"
    Poke 646,3: Print "  senti il suono del canto dei    "
    Poke 646,3: Print "  grilli echeggiare.              "
End Sub
' -------------------------------------------------------------

Sub LocationLeo() Static
    Print ""
    Poke 646,3: Print "  a nord:"
    Poke 646,7: Print "  <la strada per casa tua>"
    Poke 646,3: Print "  ad ovest invece:"
    Poke 646,7: Print "  <la strada per quel luogo!>"
End Sub
' -------------------------------------------------------------

Sub LocationRoadToForest() Static
    Print ""
    Poke 646,3: Print "  la curiosita' e' forte..."
    Poke 646,3: Print "  intraprendi quel viaggio solitario."
    Poke 646,3: Print "  dopo qualche ora di guida, giungi"
    Poke 646,3: Print "  sul luogo che leonardo ti ha"
    Poke 646,3: Print "  indicato. a nordest vedi:"
    Poke 646,7: Print "  <la strada da cui sei arrivato>"
    Poke 646,3: Print "  ad ovest invece:"
    Poke 646,7: Print "  <la foresta>"
End Sub
' -------------------------------------------------------------

Sub LocationForest() Static
    Print "": Poke 646,3
    Print "  ti trovi in una doppia biforcazione"
    Print "  il bosco si estende per tutta la"
    Print "  sua grandezza in ogni direzione."
    Print "  ad est torni sulla" : Poke 646,7
    Print "  <strada del ritorno>": Poke 646,3
    Print "  ci sono altre direzioni in cui"
    Print "  puoi andare:": Poke 646,7
    Print "  <nord>, <ovest>, <sud>"
End Sub
' -------------------------------------------------------------

Sub LocationSquareRoom() Static
    Print "": poke 646, 3
    Print "  ti trovi in una stanza fredda"
    Print "  di forma quadrata."
    Print "  l'aria e' terribile..."
    Print "  senti una presenza angosciante"
    Print "  puoi andare a"
    Poke 646,7: Print "  <nordest>"
End Sub
' -------------------------------------------------------------

Sub LocationInfinity() Static
    Print ""
    Poke 646,3
    Print "  al posto di casa tua trovi"
    Print "  una infinita' di case indentiche"
    Print "  tra loro..."
    Print "  non hai modo di uscire da questa"
    Print "  nuova realta'. devi accettarla."
    Print "  non avendo alternative per poter"
    Print "  uscirne. bentornato a casa!"
    Print ""
    Poke 646,9: Print "{rev_on} avventura completata!"
    end
End Sub
' -------------------------------------------------------------

Sub ObjNothing() Static
    Print ""
    Print "Non c'e' niente qui."
End Sub
' -------------------------------------------------------------

Sub SearchObj() Static
    Dim objFound As Byte: objFound = 0

    'Print "{blue} <debug> tool = ", tool
    'Print "{blue} <debug> pos  = ", position
    'Print "{blue} <debug> open = ", mailboxOpen

    For idx As Byte = 0 To maxObjects
        If objects(idx) = tool  Then
           objFound = 1

           If tool = "lettera" Then
              If mailBoxOpen = 0 Then
                 objFound = 0
                 Poke 646,14: Print "{rev_on}devi aprire la cassetta!"
                 Exit Sub
              End If
           End If

           If tool = "piccola chiave" Then
              objFound = 0
              For idx2 As byte = 0 To maxObjects
                 If inventory(idx2) = "torcia" Then
                    objFound = 1
                 End If
              Next
              If objFound = 0 Then
                 Poke 646,14: Print "{rev_on} non vedi niente!"
                 Exit Sub
              End If
           End If

           Poke 646,14: Print "{rev_on}  va bene, preso!"

           For idx2 As byte = 0 To maxObjects
              If inventory(idx2) = "" Then
                 inventory(idx2) = tool
                 Exit For
              End If
           Next

           objects(idx) = ""
           Exit For
        Else
           idx2 = idx2 + 1
        End If
    Next

    If objFound = 0 Then
       Poke 646,14: Print "{rev_on}  l'oggetto non esiste!"
    End If
End Sub
' -------------------------------------------------------------

Sub GetObj() Static
    Dim objFound As Byte: objFound = 0
    Dim idx2 As byte: idx2 = 0

    'Print "{blue} <debug> tool = ", tool
    'Print "{blue} <debug> pos  = ", position

    'LETTER
    If tool = objects(5) And Position = 9 Then
       Call SearchObj()
       Exit Sub
    End If

    'OBJETCS IN OFFICE
    If (tool = objects(0) Or tool = objects(1) Or tool = objects(2)) And position = 0 Then
       Call SearchObj()
       Exit Sub
    End If

    'TICKET IN THE BATHROOM (COMPANY)
    If (tool = objects(7)) And position = 3 Then
       Call SearchObj()
       Exit Sub
    End If

    'TICKET IN THE KITCHEN
    If (tool = objects(9)) And position = 12 Then
       Call SearchObj()
       Exit Sub
    End If

    'TORCH AT HOME
    If (tool = objects(3)) And position = 10 Then
       Call SearchObj()
       Exit Sub
    End If

    'SMALL KEY
    If (tool = objects(8)) And position = 14 Then
       Call SearchObj()
       Exit Sub
    End If

    Poke 646,14: Print "{rev_on}l'oggetto specificato non esiste!"
End Sub
' -------------------------------------------------------------

Sub ReadObj() Static
    Dim objFound As Byte: objFound = 0

    If objToRead = "biglietto" Then
       For idx As Byte = 0 To maxObjects
           If inventory(idx) = objToRead  Then
              objFound = 1
              Poke 646,14: Print "{rev_on}  c'e' scritto 64738."
              inventory(idx) = "biglietto 64738"
              Exit For
           End If
       Next
    End If

    If objToRead = "lettera" Then
       For idx As Byte = 0 To maxObjects
           If inventory(idx) = objToRead  Then
              objFound = 1
              Poke 646,14
              Print "  ciao isaac."
              Print "  ho scoperto un luogo strano che penso"
              Print "  ti interesserebbe vedere."
              Print "  si trova a circa 6 ore di viaggio da."
              Print "  qui. vediamoci domani pomeriggio a   "
              Print "  casa mia alle 14:00.                 "
              Print "  e' importante.                       "

              Poke 646,3
              Print ""
              Print "  dopo aver letto la lettera, realizzi"
              Print "  che la stanchezza sta prevalendo e"
              Print "  decidi di andare a dormire..."
              Print "  ti risvegli dopo 30 minuti nella"
              Print "  tua stanza."
              position = 11
              letterRead = 1
              Exit For
           End If
       Next
    End If

    If objToRead = "post-it" Then
       For idx As Byte = 0 To maxObjects
           If inventory(idx) = objToRead  Then
              objFound = 1
              Poke 646,14
              Print " - pane"
              Print " - 6 birre "
              Print " - una confezione di uova"
              Print " - carne per borscht"
              Print " - spezie "
              Poke 646,3
              Print ""
              Print "   una lista della spesa."
              Print "   non ti serve. la hai buttata"
              inventory(idx) = ""
              Exit For
           End If
       Next
    End If

    If objToRead = "badge" Then
       For idx As Byte = 0 To maxObjects
           If inventory(idx) = objToRead  Then
              objFound = 1
              Poke 646,14
              Print ""
              Print "      igp tech co ltd"
              Print "     isaac garcia peveri"
              Print "         matr. 128"
              Print " hardware and software dept."
              Print "          manager"
              Exit For
           End If
       Next
    End If

    If objFound = 0 Then
       Poke 646,14: Print "{rev_on}  l'oggetto non esiste!"
    End If
End Sub
' -------------------------------------------------------------

Sub ExamineOffice() Static
    Print ""
    Poke 646,3: Print "  sei seduto alla tua scrivania."
    Poke 646,3: Print "  sulla scrivania vedi anche:"

    Print ""
    For idx As byte = 0 To 2
        If objects(idx) <> "" Then
            Poke 646,13: Print "{rev_on}", objects(idx)
        End If
    Next
End Sub
' -------------------------------------------------------------

Sub ExamineHall() Static
    Print ""
    Poke 646,3: Print "  intravedi a nord una luce"
    Poke 646,3: Print "  verso la scala che conduce"
    Poke 646,3: Print "  al piano inferiore dell'edificio"
End Sub
' -------------------------------------------------------------

Sub ExamineRestRooms() Static
    Print ""
    Poke 646,3: Print "  un rotolo di carta igienica e'"
    Poke 646,3: Print "  correttamente posizionato per terra."

    If objects(7) <> "" Then
       Poke 646,3: Print "  guardando con piu' attenzione, sotto"
       Poke 646,3: Print "  il lavabo trovi:"
       Print ""
       Poke 646,13: Print "{rev_on}", objects(7)
    End If
End Sub
' -------------------------------------------------------------

Sub ExamineServerRooms() Static
    Print ""
    Poke 646,3: Print "  vedi la porta della sala server."
End Sub
' -------------------------------------------------------------

Sub ExamineInsideServerRooms() Static
    Print ""
    Poke 646,3: Print "  solo un paio di server rumorosi"
    Poke 646,3: Print "  e tanti led lampeggianti.."
    Poke 646,3: Print "  niente di che.."
End Sub
' -------------------------------------------------------------

Sub ExamineWindow() Static
    Print ""
    Poke 646,3: Print "  fuori e' buio."
    Poke 646,3: Print "  non vedi altro."
End Sub
' -------------------------------------------------------------

Sub ExamineParking() Static
    Print ""
    Poke 646,3: Print "  vedi la tua automobile solitaria."
    Poke 646,3: Print "  non c'e' altro. solo il silenzio "
    Poke 646,3: Print "  interrotto solo dal calpestio della"
    Poke 646,3: Print "  ghiaia, e ad est vedi la"
    Poke 646,7: Print "  <porta di ingresso all'azienda>"
    Poke 646,3: Print "  ed a nord vedi la tua"
    Poke 646,7: Print "  <automobile>"
    Poke 646,3: Print "  ben parcheggiata nell'apposito spazio"
End Sub
' -------------------------------------------------------------

Sub ExamineExtHouse() Static
    Print ""
    Poke 646,3: Print "  sei davanti a casa."
End Sub
' -------------------------------------------------------------

Sub ExamineDormitory() Static
    Print ""
    Poke 646,3: Print "  una stanza in perfetto ordine"
    Poke 646,3: Print "  sul muro sopra la testiera del letto"
    Poke 646,7: Print "  <un dipinto erotico> "
    Poke 646,3: Print "  si innalza di fronte a chi entra."
End Sub
' -------------------------------------------------------------

Sub ExamineBathroom() Static
    Print ""
    Poke 646,3: Print "  la bomboletta di schiuma da barba"
    Poke 646,3: Print "  giace sul lavabo."
    Poke 646,3: Print "  un profumo di agrumi avvolge l'"
    Poke 646,3: Print "  intera stanza."
End Sub
' -------------------------------------------------------------

Sub ExamineSquareRoom() Static
    Print ""
    Poke 646,3: Print " {rev_on} c'e' una enorme porta di ferro"
    Poke 646,3: Print " {rev_on} chiusa da un massiccio lucchetto"
    Poke 646,3: Print " {rev_on} meccanico a combinazione."
End Sub
' -------------------------------------------------------------

Sub ExamineSaloon() Static
    Print ""
    If objects(3) <> "" Then
       Poke 646,3: Print "  sul tavolo vedi anche una"
       Print ""
       Poke 646,13: Print "{rev_on}", objects(3)
    End If

    Print ""
End Sub
' -------------------------------------------------------------

Sub ExamineKitchen() Static
    Print ""
    If objects(9) <> "" Then
       Poke 646,3: Print "  trovi qualcosa sul tavolino"
       Poke 646,3: Print "  da pranzo:                 "
       Print ""
       Poke 646,13: Print "{rev_on}", objects(9)
    End If
    Print ""
End Sub
' -------------------------------------------------------------

Sub ExamineGarden() Static
    Print ""

    Dim objFound As Byte: objFound = 0

    For idx As Byte = 0 To maxObjects
        If inventory(idx) = "torcia" Then
           objFound = 1
           If objects(8) <> "" Then
              Poke 646,3: Print "  vedi qualcosa per terra..."
              Print ""
              Poke 646,13: Print "{rev_on}", objects(8)
           End If
        End If
    Next

    If objFound = 0 Then
       Poke 646,3: Print "  e' completamente buio!"
       Poke 646,3: Print "  non riesci a vedere niente."
    End If

    Print ""
End Sub
' -------------------------------------------------------------

Sub ExamineMailBox() Static
    Print ""
    If objects(5) <> "" Then
       Poke 646,3: Print "  c'e' qualcosa dentro..."
       Print ""
       Poke 646,13: Print "{rev_on}", objects(5)
    End If

    Print ""
End Sub
' -------------------------------------------------------------

Sub ShowActualLocation() Static
    Print " luogo attuale: " + rooms(position)
    Print ""

    If position = 0 Then
       Call LocationOffice()
    End If
    If position = 1 Then
       Call LocationHall()
    End if
    If position = 2 Then
       Call LocationWindow()
    End If
    If position = 3 Then
       Call LocationRestRooms()
    End If
    If position = 4 Or position = 38 Then
       Call LocationServerRoom()
    End If
    If position = 5 Then
       Call LocationInsideServerRoom()
    End If
    If position = 6 Or position = 39 Then
       Call LocationParking()
    End If
    If position = 7 Then
       Call LocationRoad()
    End If
    If position = 40 Then
       Call LocationRoad_II()
    End If
    If position = 8 Then
       Call LocationDoorHoouse()
    End If
    If position = 9 Then
       Call LocationMailBox()
    End If
    If position = 10 Then
       Call LocationSaloon()
    End If
    If position = 11 Then
       Call LocationDormitory()
    End If
    If position = 12 Then
       Call LocationKitchen()
    End If
    If position = 13 Then
       Call LocationBathroom()
    End If
    If position = 14 Then
       Call LocationGarden()
    End If
    If position = 15 Then
       Call LocationLeo()
    End If
    If position = 16 Then
       Call LocationRoadToForest()
    End If
    If position = 20 Then
       Call LocationForest()
    End If
    If position = 35 Then
       Call LocationSquareRoom()
    End If
    If position = 41 Then
       Call LocationInfinity()
    End If
End Sub
' -------------------------------------------------------------

Sub CheckMove(verb As String*10) Static
    If (verb = "e" Or verb = "est") And position = 36 Then
       validWord = 1
       Poke 646,3: Print "la porta dei bagni non si apre"
       position = 36
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And position = 36 Then
       validWord = 1
       Poke 646,3: Print "la porta dell'uffcio non si apre"
       position = 36
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And position = 36 Then
       validWord = 1
       position = 38
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And position = 38 Then
       validWord = 1
       position = 39
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And position = 38 Then
       validWord = 1
       position = 36
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And position = 39 Then
       validWord = 1
       position = 38
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And position = 39 Then
       validWord = 1
       position = 40
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And position = 0 Then
       validWord = 1
       position = 1
       verb = ""
    End If

    If (verb = "o"  Or verb = "ovest") And position = 0 Then
       validWord = 1
       position = 2
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And position = 2 Then
       validWord = 1
       position = 0
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And position = 1 Then
       validWord = 1
       position = 0
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And position = 1 Then
       validWord = 1
       position = 3
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And position = 3 Then
       validWord = 1
       position = 1
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And position = 1 Then
       validWord = 1
       position = 4
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And position = 4 Then
       validWord = 1
       position = 1
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And position = 4 Then
       validWord = 1
       position = 6
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And position = 6 Then
       validWord = 1
       position = 4
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And position = 6 Then
       validWord = 1
       position = 7
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And position = 8 Then
       validWord = 1

       If letterRead = 0 Then
          poke 646,3
          Print " imbocchi nuovamente la strada verso"
          Print " la tua azienda."
          Print " ritorni nuovamente in quel parcheggio"
          Print " desolato. spegni il motore, scendi dall"
          Print " automobile. in lontananza il continuo"
          Print " ed incessante canto dei grilli fa da"
          Print " coreografia all'ambiente circostante..."
          position = 6
       Else
          poke 646,3
          Print " percorri la strada verso casa di"
          Print " leonardo. parcheggi l'auto e scendi."
          Print " ti dirigi nel suo soggiorno dove leo,"
          Print " ti racconta di questo strano luogo:"
          poke 646,14: Print ""
          Print " distante da qui circa 550km, c'e' un"
          Print " luogo di cui ho sentito parlare"
          Print " si trova all'interno di una fitta"
          Print " foresta, ma non ho assolutamente"
          Print " idea di cosa sia."
          position = 15
       End If
       Print ""
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And position = 8 Then
       validWord = 1
       position = 9
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And position = 9 Then
       validWord = 1
       position = 8
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And position = 10 Then
       validWord = 1
       position = 12
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And position = 10 Then
       validWord = 1
       position = 8
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And position = 10 Then
       validWord = 1
       position = 11
       verb = ""
    End If

    If (verb = "ne" Or verb = "nordest") And position = 10 Then
       validWord = 1
       position = 13
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And position = 10 Then
       validWord = 1
       position = 14
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And position = 12 Then
       validWord = 1
       position = 10
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And (position = 11 Or position = 13) Then
       validWord = 1
       position = 10
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And (position = 14) Then
       validWord = 1
       position = 10
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And (position = 15) Then
       validWord = 1
       position = 8
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And (position = 15) Then
       validWord = 1
       position = 16
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And (position = 16) Then
       validWord = 1
       position = 20
       verb = ""
    End If

    If (verb = "ne" Or verb = "nordest") And (position = 16) Then
       validWord = 1
       position = 15
       poke 646,3
       Print " percorri la strada verso casa di"
       Print " leonardo. parcheggi l'auto e scendi."
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And (position = 20) Then
       validWord = 1
       position = 21
       poke 646,3
       Print " percorri il sentiero..."
       Print " sei in un vicolo cieco."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <est>"
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And (position = 20) Then
       validWord = 1
       position = 16
       poke 646,3
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And (position = 20) Then
       validWord = 1
       position = 31
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <ovest>, <nord>"
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And (position = 20) Then
       validWord = 1
       position = 22
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <sud>, <est>, <nord>"
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And (position = 21) Then
       validWord = 1
       position = 20
       poke 646,3
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And (position = 22) Then
       validWord = 1
       position = 20
       poke 646,3
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And (position = 22) Then
       validWord = 1
       position = 23
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <ovest>, <est>, <nord>"
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And (position = 22) Then
       validWord = 1
       position = 26
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <ovest>, <est>, <sud>"
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And (position = 23) Then
       validWord = 1
       position = 25
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <ovest>, <est>, <sud>"
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And (position = 23) Then
       validWord = 1
       position = 24
       poke 646,3
       Print " percorri il sentiero..."
       Print " {rev_on} sei in un vicolo cieco."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <ovest>"
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And (position = 23) Then
       validWord = 1
       position = 22
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <est>, <nord>, <sud>"
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And (position = 25) Then
       validWord = 1
       position = 23
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <ovest>, <nord>, <est>"
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And (position = 25) Then
       validWord = 1
       position = 26
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <ovest>, <sud>, <est>"
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And (position = 25) Then
       validWord = 1
       position = 34
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <ovest>, <sud>, <nord>"
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And (position = 24) Then
       validWord = 1
       position = 23
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <ovest>, <nord>, <est>"
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And (position = 31) Then
       validWord = 1
       position = 30
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <est>, <nord>"
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And (position = 31) Then
       validWord = 1
       position = 20
       poke 646,3
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And (position = 30) Then
       validWord = 1
       position = 31
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <ovest>, <nord>"
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And (position = 30) Then
       validWord = 1
       position = 29
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <sud>, <est>"
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And (position = 29) Then
       validWord = 1
       position = 30
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <nord>, <est>"
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And (position = 29) Then
       validWord = 1
       position = 27
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <ovest>, <sud>, <est>"
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And (position = 27) Then
       validWord = 1
       position = 28
       poke 646,3
       Print " percorri il sentiero..."
       Print "{rev_on} sei in un vicolo ciecoS."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <nord>"
       verb = ""
    End If

    If (verb = "o" Or verb = "ovest") And (position = 27) Then
       validWord = 1
       position = 29
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <sud>, <est>"
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And (position = 27) Then
       validWord = 1
       position = 26
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <sud>, <est>, <ovest>"
       verb = ""
    End If

    If (verb = "e" Or verb = "est") And (position = 26) Then
       validWord = 1
       position = 25
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <sud>, <ovest>, <est>"
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And (position = 26) Then
       validWord = 1
       position = 22
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <sud>, <nord>, <est>"
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And (position = 34) Then
       validWord = 1
       position = 33
       poke 646,3
       Print " percorri il sentiero..."
       Print " {rev_on} sei in un vicolo cieco."
       Print " puoi andare soltanto a"
       poke 646,7
       Print " <sud>"
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And (position = 33) Then
       validWord = 1
       position = 34
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto a"
       poke 646,7
       Print " <sud>, <nord>, <ovest>"
       verb = ""
    End If

    If (verb = "s" Or verb = "sud") And (position = 34) Then
       validWord = 1
       position = 32
       poke 646,3
       Print " percorri il sentiero..."
       Print " {rev_on}{yellow} trovi il luogo!"
       Print " una scalinata scende sotto il"
       Print " terreno conducendo ad un tetro"
       Print " cunicolo sotterraneo."
       poke 646,7
       Print "<sudovest>: scendi."
       Print "<nord>: torni nella foresta."
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And (position = 34) Then
       validWord = 1
       position = 33
       poke 646,3
       Print " percorri il sentiero..."
       Print " {rev_on} sei in un vicolo cieco."
       Print " puoi andare solo a"
       poke 646,7
       Print "<sud>"
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And (position = 32) Then
       validWord = 1
       position = 34
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <sud>, <ovest>, <nord>"
       verb = ""
    End If

    If (verb = "so" Or verb = "sudovest") And (position = 32) Then
       validWord = 1
       poke 646,3
       Print " scendi la lunghissima scalinata"
       Print " che conduce nelle profondita'"
       Print " ed arrivi in una stanza."
       position = 35
       verb = ""
    End If

    If (verb = "n" Or verb = "nord") And (position = 28) Then
       validWord = 1
       position = 27
       poke 646,3
       Print " percorri il sentiero..."
       Print " puoi andare soltanto ad"
       poke 646,7
       Print " <est>, <sud>, <ovest>"
       verb = ""
    End If

    If (verb = "ne" Or verb = "nordest") And (position = 35) Then
       validWord = 1
       position = 32
       poke 646,3
       Print " risali la lunga rampa di scale"
       Print " che ti riconduce in superficie"
       Print " puoi andare in queste direzioni"
       poke 646,7
       Print " <sudovest>, <nord>"
       verb = ""
    End If

End Sub
' -------------------------------------------------------------

Sub Start() Static
   mailBoxOpen = 0
   Dim verb As String*10, comb As String*5: verb = "": comb = ""
   'position = 20 'TODO REMOVE

   Do While 1
       validWord = 0
       'inventory(0) = objects(1) 'TODO REMOVE
       'inventory(1) = objects(5) 'TODO REMOVE

       'Print "{blue}{rev_on} <debug> position = ", position
       Poke 646, 1

       Call ShowActualLocation()

       Print ""
       verb = "": tool = ""
       Poke 646,10: Input "cosa fai? "; verb

       If verb = "prendi" Then
          Poke 646,10: Input "cosa prendi con te? "; tool
          Call GetObj()
          validWord = 1
       End If

       If verb = "leggi" Or verb = "leggo" Then
          Poke 646,10: Input "cosa leggo? "; objToRead
          Call ReadObj()
          validWord = 1
       End If

       If verb = "guarda" _
       Or verb = "esamina" _
       Or verb = "controlla" Then
          validWord = 1

          If position = 0 Then
             Call ExamineOffice()
          End If
          If position = 1 Or position = 36 Then
             Call ExamineHall()
          End If
          If position = 2 Then
             Call ExamineWindow()
          End If
          If position = 3 Then
             Call ExamineRestRooms()
          End If
          If position = 4 Or position = 38 Then
             Call ExamineServerRooms()
          End If
          If position = 5 Then
             Call ExamineInsideServerRooms()
          End If
          If position = 6 Or position = 39 Then
             Call ExamineParking()
          End If
          If position = 8 Or position = 40 Then
             Call ExamineExtHouse()
          End If
          If position = 9 Then
             Call ExamineMailBox()
          End If
          If position = 10 Then
             Call ExamineSaloon()
          End If
          If position = 11 Then
             Call ExamineDormitory()
          End If
          If position = 12 Then
             Call ExamineKitchen()
          End If
          If position = 13 Then
             Call ExamineBathroom()
          End If
          If position = 14 Then
             Call ExamineGarden()
          End If
          If position = 35 Then
             Call ExamineSquareRoom()
          End If
       End If

       Dim opened5, opened8, opened9, opened43 As byte
       opened5 = 0: opened8 = 0: opened9 = 0: opened43 = 0

       If verb = "apri" Or verb = "entra" Then
          validWord = 1

          ' The server room
          If position = 4 Then
             For idx As byte = 0 To maxObjects
                 If inventory(idx) = "chiavi sala server" Then
                    position = 5
                    opened5 = 1
                    Exit For
                 End If
             Next
             If opened5 = 0 Then
                Poke 646,14: Print "{rev_on} non hai la chiave per aprire la porta"
             End If
          End If

          ' Server room in diff realty
          If position = 38 Then
             Poke 646,14: Print "{rev_on} non si apre..."
          End If

          ' Entrance to my house
          If position = 8 Then
             For idx As byte = 0 To maxObjects
                 If inventory(idx) = "chiavi di casa"     Then
                    position = 10
                    opened8 = 1
                    Exit For
                 End If
             Next
             If opened8 = 0 Then
                Poke 646,14: Print "{rev_on} non hai la chiave per aprire la porta"
             End If
          End If

          ' My mail box
          If position = 9 Then
             For idx As byte = 0 To maxObjects
                 If inventory(idx) = "piccola chiave" Then
                    opened9 = 1
                    mailBoxOpen = 1
                    Poke 646,14: Print "{rev_on} hai aperto la cassetta."
                    inventory(idx) = "" 'USELESS NOW
                    Exit For
                 End If
             Next
             If opened9 = 0 Then
                Poke 646,14: Print "{rev_on} non hai la chiave per aprire la posta"
             End If
          End If

          ' Combination
          If position = 35 Then
             Input " inserisci la combinazione: "; comb
             If comb = "64738" Then
                opened43 = 1
             End If
             If opened43 = 0 Then
                Poke 646,14: Print "{rev_on} la combinazione e' errata"
             Else
                Poke 646,14
                Print " la porta si e' aperta"
                Print " entri all'interno..."
                Print " ti senti a disagio..."
                Print " ti senti a disagio..."
                Print " l'aria si fa pesante..."
                Print " ti addormenti."
                Print " "
                Print " ti risvegli dopo 1 ora"
                Print " e noti qualcosa che non"
                Print " quadra, ma ti e' familiare"
                position = 36
             End If
          End If
       End If

       Call CheckMove(verb)
       Call CheckBadWords(verb)

       If verb = "i" Or verb = "inventatio" Then
          validWord = 1
          Poke 646, 1
          Print ""
          Print "hai con te questi oggetti: "
          Call ShowInventory()
          verb = ""
       End If

       If verb = "fine" Then
          validWord = 1
          Poke 646, 6
          Poke 53281,13
          Print chr$(147)
          Print "grazie per aver giocato"
          Print ""
          Print "fine del gioco!"
          verb = ""
          end
       End If

       If verb = "saluta" Then
          validWord = 1
          Poke 646, 8
          Poke 53281,13
          Print chr$(147)
          locate 5,10: Print "ciao leonardo di 1001avventura"
          locate 5,11: Print "premi un tasto per continuare "
          Print ""
          Do While keyPressed = ""
             Get keyPressed
          Loop
          Poke 646,1: Poke 53280,0: Poke 53281,0
          verb = ""
       End If

       If verb = "aiuto" Or verb = "help" Then
          validWord = 1
          Print " {red} {rev_on} prova ad usare un verbo."
          Print " {red} {rev_on} evita le parolacce!"
       End If

       If validWord = 0 Then
            Print " {red} {rev_on} non sembra funzionare! "
       End If

       Print ""
   Loop
End Sub
' -------------------------------------------------------------

Sub Init() Static
   For idx As byte = 0 To maxObjects
       objects(idx) = ""
       inventory(idx) = ""
   Next

   rooms(0) = "ufficio "
   rooms(1) = "corridoio "
   rooms(2) = "finestra "
   rooms(3) = "bagni "
   rooms(4) = "sala server "
   rooms(5) = "dentro la sala server "
   rooms(6) = "prcheggio aziendale "
   rooms(7) = "strada "
   rooms(8) = "casa "
   rooms(9) = "cassetta della posta "
   rooms(10) = "soggiorno di casa "
   rooms(11) = "dormitorio "
   rooms(12) = "cucina "
   rooms(13) = "bagno "
   rooms(14) = "giardino "
   rooms(15) = "casa di leonardo "
   rooms(16) = "strada secondaria "
   rooms(20) = "foresta "      ' N, E ,S
   rooms(21) = "vicolo cieco " ' E
   rooms(22) = "biforcazione " ' N
   rooms(23) = "biforcazione " ' W, N, E
   rooms(24) = "vicolo cieco " ' W
   rooms(25) = "biforcazione " ' S, E, W
   rooms(26) = "biforcazione " ' S, E, W
   rooms(27) = "biforcazione " ' S, E, W
   rooms(28) = "vicolo cieco " ' N
   rooms(29) = "radura       " ' S, E
   rooms(30) = "distesa      " ' N, E
   rooms(31) = "sentiero "     ' W, N
   rooms(32) = "ampia radura " ' N, SO
   rooms(33) = "vicolo cieco " ' S
   rooms(34) = "biforcazione " ' S, N
   rooms(35) = "stanza quadrata " ' S, N
   rooms(36) = "corridoio "
   rooms(37) = "bagni"
   rooms(38) = "sala server"
   rooms(39) = "parcheggio aziendale"
   rooms(40) = "strada"
   rooms(41) = "sobborgo infinito"

   objects(0) = "badge"
   objects(1) = "chiavi di casa"
   objects(2) = "chiavi sala server"
   objects(3) = "torcia"
   objects(4) = "pacco postale"
   objects(5) = "lettera"
   objects(6) = "cristallo lucente"
   objects(7) = "biglietto"
   objects(8) = "piccola chiave"
   objects(9) = "post-it"

   position = 0

   Print CHR$(147): Poke 53281,0: Poke 53280,0
   Poke 646, 10: Print "          nelle aree sbagliate"
   Poke 646, 10: Print "       c.2024 isaac garcia peveri"
   Print ""
   Poke 646, 1:  Print " effettua una delle seguenti scelte:"
   Poke 646, 1:  Print " i = istruzioni"
   Poke 646, 1:  Print " s = inizia il gioco"

    Do While 1
       Input scelta

       If scelta = "i" then
          keyPressed = ""

          Print CHR$(147): Poke 53281,1: Poke 53280,1
          Poke 646, 10: Print "          nelle aree sbagliate"
          Poke 646, 10: Print "       c.2024 isaac garcia peveri"
          Print ""
          Poke 646, 0:  Print " n, s, o, e = vai nella direzione"
          Print ""
          Poke 646, 0:  Print " per giocare introduci un verbo."
          Poke 646, 0:  Print " alcuni verbi come <prendi>  attivano "
          Poke 646, 0:  Print " un ulteriore richista in cui si deve "
          Poke 646, 0:  Print " digitare il nome dell'oggetto con cui"
          Poke 646, 0:  Print " interagire. ad esempio:"
          Print ""
          Poke 646, 0:  Print " prendi <return> fara' apparire:"
          Poke 646, 0:  Print " cosa prendi? <digita nome oggetto>"
          Print ""
          Poke 646, 0:  Print " leggi <return> fara' apparire:"
          Poke 646, 0:  Print " cosa leggo? <digita nome oggetto>"
          Print ""
          Poke 646, 0:  Print " fine = termina il gioco"
          Poke 646, 0:  Print " help/aiuto = piccolo aiuto"
          Print ""
          Poke 646, 3:  Print " <premi un tasto per continuare>"

          Do While keyPressed = ""
             Get keyPressed
          Loop

          Call Init()
       End If

       If scelta = "s" Then
          Print chr$(147)
          Call Start()
       End If
    Loop
End Sub
' -------------------------------------------------------------

Call Init()
' -------------------------------------------------------------

