'
' **************************************************************
' * NELLE AREE SBAGLIATE 2 IGP (ISAAC GARCIA PEVERI) TECH BLOG *
' * DATE WRITTEN:  15/06/2024                                  *
' * DATE COMPILED: 20/06/2024                                  *
' * LAST EDITED:   20/06/2024                                  *
' * COMPILER:      XC BASIC 3 FOR WINDOWS X64                  *
' **************************************************************

' **** WORKING-STORAGE
Dim rooms(56)   As String*20
Dim objects(8) As String*18
Dim inventory(8) As String*18
Dim position As Byte: position = 0
Dim objToUse As String*18: objToUse = ""
Dim scelta As String*1: scelta = ""
Dim validWord As Byte: validWord = 0
Dim isDoor20Open As Byte: isDoor20Open = 0
Dim isDoor32Open As Byte: isDoor32Open = 0
Dim isDoor46Open As Byte: isDoor46Open = 0
Dim isCpuPwdCorrect As Byte: isCpuPwdCorrect = 0
Dim isTorchTurnedOn As Byte: isTorchTurnedOn = 0
Const maxObjects As Byte = 8
' -------------------------------------------------------------

Sub GameOver2() Static
    Poke 53281,11: poke 53280,12
    Print chr$(147)
    locate 2,10: Print "{white}una scarica elettrica a 3000v ti"
    locate 2,11: Print "{white}attraversa il corpo riducendoti"
    locate 2,12: Print "{white}in pochi istanti ad un ammasso"
    locate 2,14: Print "{white}di carbone!"
    locate 2,15: Print "{white}sei morto!"
    locate 2,16: Print "{white}fine del gioco"
    End
End Sub
' -------------------------------------------------------------

Sub Location(pPosition As Byte) Static 'SPAWN POINT
    Poke 53281,1: Poke 53280,1

    Select Case pPosition
      Case 0
           Locate 1,2
           Print ""
           Print "{black} ti trovi in un ampio spazio antistante"
           Print "{black} un gigantesco edificio abbandonato."
           Print "{black} il complesso si trova nella citta' di"
           Print "{black} ostrava, nella repubblica ceca."
           Print "{black} a nord, vedi"
           Print "{red} l'enorme edificio abbandonato"
           Print "{black} a sud"
           Print "{red} la tua auto parcheggiata"
           Print "{red} sul fianco della strada deserta."
           Print "{black} non c'e' nessuno nei paraggi. e' notte"
           Print "{black} fonda. il silenzio avvolge questo"
           Print "{black} inquietante luogo."

      Case 1
           Locate 1,2
           Print ""
           Print "{black} sei davanti al malandato complesso..."
           Print "{black} la puzza di umido e muffa si fa"
           Print "{black} pesantemente sentire."
           Print "{black} la porta di ingresso sembra invitarti"
           Print "{black} ad entrare all'interno"
           Print "{black} a sud:"
           Print "{red} il piazzale"
           Print "{black} a est"
           Print "{red} un piccolo sentiero"
           Print "{black} a nord"
           Print "{red} la porta di ingresso all'edificio"

      Case 2
           Locate 1,2
           Print ""
           Print "{black} sei davanti alla tua automobile"
           Print "{black} a nord torni nello"
           Print "{red} spazio antistante"
           Print "{black} a quell'orribile e malandato"
           Print "{black} edificio fatiscente!"

      Case 3
           Locate 1,2
           Print ""
           Print "{black} il piccolo sentiero conduce ad "
           Print "{black} una area delimitata dalla foresta"
           Print "{red} un piccolo capanno di legno"
           Print "{black} poco distante da te."
           Print "{black} puoi andare solo ad ovest."

      Case 4
           Locate 1,2
           Print ""
           Print "{black} la cupa entrata principale mostra"
           Print "{black} ad ovest una"
           Print "{red} massiccia porta rossa di acciaio."
           Print "{black} a nord invece:"
           Print "{red} la scala che conduce al piano superiore"
           Print "{black} a sud invece:"
           Print "{red} l'uscita dall'edificio."

      Case 5
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una piccola stanza quadrata"
           Print "{black} ad est"
           Print "{red} il corridoio con le scale."

      Case 6
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una piccola stanza quadrata"
           Print "{black} ad ovest"
           Print "{red} il corridoio con le scale."

      Case 7
           Locate 1,2
           Print ""
           Print "{black} di fronte a te (nord):"
           Print "{red} gli scalini per il piano superiore"
           Print "{black} mentre ad ovest:"
           Print "{red} una porta verde di legno."
           Print "{black} a est:"
           Print "{red} una stanza senza porta."
           Print "{black} a sud invece ritorni nella"
           Print "{red} hall principale."

      Case 8
           Locate 1,2
           Dim objFound As Byte: objFound = 0

           For idx As Byte = 0 To maxObjects
               If inventory(idx) = objects(1) Then 'TORCH
                  objFound = 1

                  If isTorchTurnedOn = 1 Then
                     Print ""
                     Print "{black} sei in un largo e lungo corridoio."
                     Print "{black} a nord si vede:"
                     Print "{red} una porta marrone, aperta."
                     Print "{black} il corridoio estendersi ad est"
                     Print "{black} ed a ovest."
                     Print "{black} a sud:"
                     Print "{red} il corridoio verso il piano inferiore"
                     Print "{black} rumori inquietanti provengono"
                     Print "{black} dalle vicinanze..."
                  End If

                  Exit For
               End If
           Next

           If objFound = 0 Or isTorchTurnedOn = 0 Then
              Poke 53281,0: Poke 53280,0
              Print ""
              Print "{yellow} e' troppo buio per proseguire oltre!"
              Print "{yellow} puoi solo andare a sud."
              Print "{yellow} senti anche degli strani suoni"
              Print "{yellow} nelle vicinanze..."
           End If

      Case 9
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una grande stanza."
           Print "{black} improvvisamente senti freddo."
           Print "{black} vedi inoltre in questa stanza:"
           Print "{red} un personal computer."
           Print "{red} un grosso armadio."
           Print "{black} a sud:"
           Print "{red} il grande corridoio del primo piano."

      Case 10
           Locate 1,2
           Print ""
           Print "{black} entri in una piccola stanza"
           Print "{black} ad ovest:"
           Print "{red} la uscita verso il corridoio."
           Print "{black} a sud:"
           Print "{red} una scala buia"
           Print "{black} ti conduce verso il piano -1"

      Case 11
           Locate 1,2
           Print ""
           Print "{black} ti trovi sulla scalinata"
           Print "{black} hai solo due direzioni:"
           Print "{black} a nord o a sud."

      Case 12
           Locate 1,2
           Print ""
           Print "{black} ti trovi nel corridoio superiore."
           Print "{black} hai solo queste direzioni:"
           Print "{black} a nord, a sud oppure a nordest."

      Case 13
           Locate 1,2
           Print ""
           Print "{black} la fatiscente camera da letto non"
           Print "{black} ti ispira molta fiducia."
           Print "{black} nonostante la stanchezza ti stia"
           Print "{black} praticamente uccidendo, decidi di"
           Print "{black} non riposare nemmeno se ti venisse"
           Print "{black} offerto tutto l'oro del pianeta!"
           Print "{black} nell'angolo opposto vedi anche:"
           Print "{red} un vecchio televisore"
           Print "{black} unica uscita: a sud"

      Case 14
           Locate 1,2
           Print ""
           Print "{black} una grossa stanza vuota"
           Print "{black} puoi solo andare a sud."
           Print "{black} per uscire di qui!"

      Case 15
           Locate 1,2
           Print ""
           Print "{black} scendi la buia scalinata"
           Print "{black} tremando dalla paura. non sai"
           Print "{black} cosa aspettarti."
           Print "{black} puoi solo proseguire a sud"
           Print "{black} oppure tornare indietro a nord"

      Case 16
           Locate 1,2
           Print ""
           Print "{black} il lungo corridoio sotterraneo"
           Print "{black} sembra non avere una fine."
           Print "{black} non riesci a vedere cosa c'e'"
           Print "{black} oltre..."
           Print "{black} decidi: o torni indietro (nord)"
           Print "{black} oppure prosegui (sud)."

      Case 17
           Locate 1,2
           Print ""
           Print "{black} raggiungi una stanza adibita a bar."
           Print "{black} l'unica uscita e' tornare indietro"
           Print "{black} (a nord)."
           Print "{red} nella stanza vedi un tavolo,"
           Print "{red} un paio di sedie,"
           Print "{red} una tazza di caffe',"
           Print "{red} una macchina per il caffe'"

      Case 18
           Locate 1,2
           Print ""
           Print "{black} giungi in fondo alla scalinata che"
           Print "{black} ti ha condotto nelle viscere del"
           Print "{black} complesso."
           Print "{black} sei sicuro di voler continuare?"
           Print "{black} puoi tornare indietro (est)"
           Print "{black} oppure proseguire (sud)."
           Print "{black} a te la scelta!"

      Case 19
           Locate 1,2
           Print ""
           Print "{black} ti trovi in un angusto cunicolo."
           Print "{black} puoi andare solo a nord o a sud."

      Case 20
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare solo:"
           Print "{black} a nord, ad est oppure ad ovest."

      Case 21
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare solo:"
           Print "{black} a sud, ad est oppure ad ovest."

      Case 22
           Locate 1,2
           Print ""
           Print "{black} trovi una porta nera davanri"
           Print "{black} a te."
           Print "{black} puoi andare solo a ovest"
           Print "{black} oppure entrare."

      Case 23
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare solo:"
           Print "{black} a nord, ad est oppure ad ovest."

      Case 24
           Locate 1,2
           Print ""
           Print "{black} una stanza inospitale, l'unica"
           Print "{black} cosa che vedi e':"
           Print "{red} un grande armadio colorato in legno."
           Print "{black} puoi solo andare a nord."

      Case 25
           Locate 1,2
           Print ""
           Print "{black} raggiungi una stanza esagonale"
           Print "{black} vedi in questa stanza:"
           Print "{black} un macchinario con due leve:"
           Print "{red} una leva rossa"
           Print "{red} una leva verde"
           Print "{black} a sud torni nel tunnel"

      Case 26
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare solo:"
           Print "{black} a sud, ad est oppure ad ovest."

      Case 27
           Locate 1,2
           Print ""
           Print "{black} sei in un vicolo cieco."
           Print "{black} puoi andare solo ad est."

      Case 28
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare solo:"
           Print "{black} a sud, ad est oppure a nord."

      Case 29
           Locate 1,2
           Print ""
           Print "{black} davanti a te:"
           Print "{red} la massiccia porta rossa di acciaio."
           Print "{black} ad est"
           Print "{red} la hall dove ti trovavi."

      Case 30
           Locate 1,2
           Print ""
           Print "{black} hai davanti a te"
           Print "{red} la sottile porta verde di legno."
           Print "{black} ad est"
           Print "{red} il corridoio con le scale."

      Case 31
           Locate 1,2
           Print ""
           Print "{black} sei in fondo al corridoio ovest."
           Print "{black} a nord puoi vedere:"
           Print "{red} la scala che conduce al piano 2."
           Print "{black} a sud invece:"
           Print "{black} l'entrata in una piccola stanza."
           Print "{black} a est invece:"
           Print "{black} torni al centro del corridoio."

      Case 32
           Locate 1,2
           Print ""
           Print "{black} improvvisamente davanti a te"
           Print "{red} una porta bianca"
           Print "{black} ti sbarra l'accesso."
           Print "{black} puoi solo proseguire verso nord."

      Case 33
           Locate 1,2
           Print ""
           Print "{black} sei in un vicolo cieco."
           Print "{black} puoi andare solo ad ovest."

      Case 34
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare in tutte le direzioni."

      Case 35
           Locate 1,2
           Print ""
           Print "{black} sei in un vicolo cieco."
           Print "{black} puoi andare solo ad est."

      Case 36
           Locate 1,2
           Print ""
           Print "{black} sei in un vicolo cieco."
           Print "{black} puoi andare solo a nord."

      Case 37
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare in tutte le direzioni."

      Case 38
           Locate 1,2
           Print ""
           Print "{black} sei in un vicolo cieco."
           Print "{black} puoi andare solo a sud."

      Case 39
           Locate 1,2
           Print ""
           Print "{black} sei in un vicolo cieco."
           Print "{black} puoi andare solo ad ovest."

      Case 40
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare solo:"
           Print "{black} ad est oppure a nord."

      Case 41
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare solo:"
           Print "{black} ad ovest oppure a nord."

      Case 42
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare solo:"
           Print "{black} a nord, sud, est."

      Case 43
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare in tutte le direzioni."

      Case 44
           Locate 1,2
           Print ""
           Print "{black} sei in un vicolo cieco."
           Print "{black} puoi andare solo a sud."

      Case 45
           Locate 1,2
           Print ""
           Print "{black} sei in un vicolo cieco."
           Print "{black} puoi andare solo a ovest."

      Case 46
           Locate 1,2
           Print ""
           Print "{black} davanti a te in bella vista"
           Print "{black} un enorme"
           Print "{red} portone arruginito"
           Print "{black} puoi andare a ovest"
           Print "{black} oppure entrare"

      Case 47
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare solo:"
           Print "{black} a nord o a est."

      Case 48
           Locate 1,2
           Print ""
           Print "{black} hai raggiunto la stanza finale."
           Print "{black} vedi:"
           Print "{red} un enorme super computer."
           Print "{black} la macchina e' inoperativa."
           Print "{black} trovi anche un biglietto:"
           Print "{purple} jack, l'esperimento beta e' fallito."
           Print "{purple} marty e david sono deceduti."
           Print "{purple} ho deciso di dismettere questa"
           Print "{purple} macchina dopo l'incidente."
           Print ""
           Print "{blue} avventura completata."
          End

      Case 49
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare solo:"
           Print "{black} ad ovest oppure a nord."

      Case 50
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare solo:"
           Print "{black} a sud, ad est oppure ad ovest."

      Case 51
           Locate 1,2
           Print ""
           Print "{black} sei in un vicolo cieco."
           Print "{black} puoi andare solo ad est."

      Case 52
           Locate 1,2
           Print ""
           Print "{black} ti trovi in una biforcazione."
           Print "{black} puoi andare solo:"
           Print "{black} a sud, ad est oppure ad ovest."

      Case 53
           Locate 1,2
           Print ""
           Print "{black} sei in un vicolo cieco."
           Print "{black} puoi andare solo a nord."

      Case 54
           Locate 1,2
           Print ""
           Print "{black} sei in un vicolo cieco."
           Print "{black} puoi andare solo"
           Print "{black} a sud o ad ovest."

      Case 55
           Locate 1,2
           Poke 53281,11: poke 53280,12
           Print chr$(147)
           locate 2,10: Print "{white}una strana sostanza ti avvolge"
           locate 2,12: Print "{white}in pochi istanti soccombi..."
           locate 2,15: Print "{white}sei morto!"
           locate 2,16: Print "{white}fine del gioco"
           End
   End Select
End Sub
' -------------------------------------------------------------

Sub ClearWindow() Static
    Print chr$(147)
    Locate 1,1
    Print "{rev_on}{blue}                                       "
End Sub
' -------------------------------------------------------------

Sub ShowActualLocation(pPosition As Byte) Static
    Call ClearWindow()

    Locate 1,1
    Print "{rev_on}{blue}ti trovi qui:  " + rooms(position)

    Call Location(pPosition)
End Sub
' -------------------------------------------------------------

Sub PressAKeyToContinue() Static
    Locate 1,21
    Print "{green}     premi un tasto per continuare "
    Dim a As string*2: a = ""
    Do While Len(a) < 1
       Get a
    Loop
End Sub
' -------------------------------------------------------------

Sub Help(pPosition As Byte) Static
    Select Case pPosition
       Case 24
            Print "{purple} la prudenza non basta mai! fai attenzione!"
       Case 14
            Print "{purple} credi di essere al sicuro...!"
       Case 8
            Print "{purple} senti un pericolo... stai attento!"
       Case 9
            Print "{purple} deve esserci un modo per sbloccare il pc"
       Case 10
            Print "{purple} solo il coraggioso potra' avanzare!"
       Case 25
            Print "{purple} a volte, meglio non toccare niente!"
       Case Else
            Print "{purple} prova un verbo o combinazione!"
    End Select

    Call PressAKeyToContinue()
End Sub
' -------------------------------------------------------------

'removed due to insufficient space Sub CheckBadWords(verb As string*30) Static
'removed due to insufficient space     If verb = "stronzo" _
'removed due to insufficient space     Or verb = "vaffanculo" _
'removed due to insufficient space     Or verb = "idiota" _
'removed due to insufficient space     Or verb = "deficiente" _
'removed due to insufficient space     Or verb = "imbecille" _
'removed due to insufficient space     Or verb = "testa di cazzo" _
'removed due to insufficient space     Or verb = "minchione" _
'removed due to insufficient space     Or verb = "polifemo" _
'removed due to insufficient space     Or verb = "pisquano" _
'removed due to insufficient space     Or verb = "srupido" _
'removed due to insufficient space     Or verb = "mongolo" _
'removed due to insufficient space     Or verb = "bigolo" _
'removed due to insufficient space     Or verb = "pescegatto" _
'removed due to insufficient space     Or verb = "mongoloide" _
'removed due to insufficient space     Or verb = "fottiti" _
'removed due to insufficient space     Or verb = "inculati" _
'removed due to insufficient space     Or verb = "culattone" _
'removed due to insufficient space     Or verb = "frocio" _
'removed due to insufficient space     Or verb = "frocioide" _
'removed due to insufficient space     Or verb = "zoccola" _
'removed due to insufficient space     Or verb = "troia" _
'removed due to insufficient space     Or verb = "troiona" _
'removed due to insufficient space     Or verb = "baldracca" _
'removed due to insufficient space     Or verb = "bagascia" _
'removed due to insufficient space     Or verb = "puttana" _
'removed due to insufficient space     Or verb = "maiala" _
'removed due to insufficient space     Or verb = "culo" _
'removed due to insufficient space     Or verb = "cazzo" _
'removed due to insufficient space     Or verb = "merda" _
'removed due to insufficient space     Or verb = "fesso" _
'removed due to insufficient space     Or verb = "minchia" _
'removed due to insufficient space     Or verb = "cazzone" _
'removed due to insufficient space     Or verb = "vaccagare" _
'removed due to insufficient space     Or verb = "va a cagare" _
'removed due to insufficient space     Or verb = "vai a cagare" _
'removed due to insufficient space     Or verb = "vai a fanculo" _
'removed due to insufficient space     Or verb = "vai a fare in culo" _
'removed due to insufficient space     Or verb = "vai a dare via il culo" _
'removed due to insufficient space     Or verb = "vadavialcul" _
'removed due to insufficient space     Or verb = "a li mortacci tua" _
'removed due to insufficient space     Or verb = "pisquano" _
'removed due to insufficient space     Or verb = "cretino" Then
'removed due to insufficient space        validWord = 1
'removed due to insufficient space        Poke 646, 1
'removed due to insufficient space        Poke 53281,10
'removed due to insufficient space        Print chr$(147)
'removed due to insufficient space        Print "le tue brutte parole suggeriscono che"
'removed due to insufficient space        Print "dovresti lavare la tua tastiera "
'removed due to insufficient space        Print "col sapone! sei un maleducato!!!"
'removed due to insufficient space        Print ""
'removed due to insufficient space        Print "fine del gioco!"
'removed due to insufficient space        Print ""
'removed due to insufficient space        Print "tie'!"
'removed due to insufficient space        end
'removed due to insufficient space     End If
'removed due to insufficient space End Sub
' -------------------------------------------------------------

Sub ShowInventory() Static
    Call ClearWindow()

    Locate 1,1
    Print "{rev_on}{green}                                       "
    Locate 1,1
    Print "{rev_on}{green}inventario"

    Locate 1,2
    Print ""

    For idx As byte = 0 To maxObjects
       If (inventory(idx)) <> "" Then
          Print "{gray}", inventory(idx) + "                           "
       End If
    Next idx

    Call PressAKeyToContinue()
End Sub
' -------------------------------------------------------------

Sub NothingHere() Static
    Locate 1,20
    Print "{green}         nulla di strano qui"
    Call PressAKeyToContinue()
End Sub
' -------------------------------------------------------------

Sub SearchObj(pObj As string*20, rObj As string*20) Static
    Dim objFound As Byte: objFound = 0

    For idx As Byte = 0 To maxObjects
        If rObj = pObj Then
           If objects(idx) = pObj  Then
              objFound = 1

               Poke 646, 14: Print "{rev_on}  va bene, preso!"
                 objects(idx) = ""

               For idx2 As byte = 0 To maxObjects
                 If inventory(idx2) = "" Then
                    inventory(idx2) = pObj
                    Exit For
                 End If
              Next

              objects(idx) = ""
              Exit For
           Else
              idx2 = idx2 + 1
           End If
        Else
           objFound = 0
        End If
    Next

    If objFound = 0 Then
       Locate 1,20
       Print "{green}         l'oggetto non esiste!"
    End If

    Call PressAKeyToContinue()
End Sub
' -------------------------------------------------------------

Sub GetObj(rObj As String*20) Static
    Dim objFound As Byte: objFound = 0
    Dim idx2 As byte: idx2 = 0

    Select Case position
       Case 3
            Call SearchObj(objects(0), rObj)
            Exit Sub
       Case 5
            Call SearchObj(objects(1), rObj)
            Exit Sub
       Case 9
            Call SearchObj(objects(5), rObj)
            Exit Sub
       Case 14
            Call SearchObj(objects(4), rObj)
            Exit Sub
       Case 33
            Call SearchObj(objects(7), rObj)
            Exit Sub
    End Select

    Locate 1,20
    Print "{green}         l'oggetto non esiste!"
    Call PressAKeyToContinue()
End Sub
' -------------------------------------------------------------

Sub TurnOnObj() Static
    Dim objFound As Byte: objFound = 0
    'Print "{red} debug objtouse:   >" + objToUse + "<"
    'Print "{red} debug objects(1): >" + objects(1) + "<"

    If objToUse = "torcia" Then
       For idx As Byte = 0 To maxObjects
           If inventory(idx) = objToUse  Then
              objFound = 1
              Print "{rev_on}{cyan}  hai acceso la torcia"
              Poke 53281,1
              isTorchTurnedOn = 1
              Exit For
           End If
       Next
    End If

    If objFound = 0 Then
       Locate 1,20
       Print "{green}         non hai questo oggetto"
    End If

    Call PressAKeyToContinue()
End Sub
' -------------------------------------------------------------

Sub CheckObj() Static
    Dim objFound As Byte: objFound = 0

    If objToUse = "tazza" Or objToUse = "tazza di caffe" Then
       Poke 646,14: Print "{rev_on}  c'e' scritto 16777215 sotto la tazza."
    Else
       Locate 1,20
       Poke 646,14: Print "{green}            nulla di insolito."
    End If

    Locate 1,20
    Call PressAKeyToContinue()
End Sub
' -------------------------------------------------------------

Sub UseObj() Static
    Dim objFound As Byte: objFound = 0

    Select Case position
         Case 9
             If objToUse = "computer" Then
                If isCpuPwdCorrect = 0 Then
                   Dim cod As string*10: cod = ""
                   Locate 1,16
                   Print "{green} il computer chiede una password."
                   Input "{purple}  password? "; cod
                   If cod = "16777215" Then
                      isCpuPwdCorrect = 1
                      isDoor20Open = 1
                      Locate 1,20
                      Print "{green} un suono sordo proviene da qualche parte"
                      Call PressAKeyToContinue()
                   Else
                      Locate 1,20
                      Print "{green}     il codice inserito e' errato."
                      Call PressAKeyToContinue()
                   End If
                   Call ShowActualLocation(position)
                   Exit Sub
                Else
                   Locate 1,20
                   Print "{green}    lo hai gia' sbloccato. non serve!"
                   Call PressAKeyToContinue()
                   Exit Sub
                End If
             End If

         Case 25
             If objToUse = "leva rossa" Then
                Locate 1,20
                Print "{green}             non succede niente."
                Call PressAKeyToContinue()
                Exit Sub
             End If
             If objToUse = "leva verde" Then
                Locate 1,20
                Print "{green}            !!!!!!!!!!!!!!!!!!!"
                Call PressAKeyToContinue()
                Call GameOver2()
             End If
    End Select

    If objFound = 0 Then
       Locate 1,20
       Print "{green}         l'oggetto non esiste!"
       Call PressAKeyToContinue()
    End If
End Sub
' -------------------------------------------------------------

Sub ObjectsInLocation(pPosition As Byte) Static
    Select Case pPosition
       Case 3
            Print ""
            If objects(0) <> "" Then
               Poke 646,3: Print "  c'e' una ", objects(0)
            Else
               Poke 646,3: Print "          non c'e' niente qui."
            End If

       Case 5
            Print ""
            If objects(5) <> "" Then
               Poke 646,3: Print "  c'e' un ", objects(5)
            Else
               Poke 646,3: Print "          non c'e' niente qui."
            End If

       Case 24
            Print ""
            If objects(6) <> "" Then
               Poke 646,3: Print "  c'e' un ", objects(6)
            Else
               Poke 646,3: Print "          non c'e' niente qui."
            End If

       Case 14
            Print ""
            If objects(4) <> "" Then
               Poke 646,3: Print "  c'e' un ", objects(4)
            Else
               Poke 646,3: Print "          non c'e' niente qui."
            End If

       Case 33
            Print ""
            If objects(7) <> "" Then
               Poke 646,3: Print "  c'e' un ", objects(7)
            Else
               Poke 646,3: Print "          non c'e' niente qui."
            End If
    End Select

    Call PressAKeyToContinue()
End Sub
' -------------------------------------------------------------

Sub CheckMove(verb As String*10) Static
    Select Case position
       Case 0
            If (verb = "s" Or verb = "sud") Then
               position = 2: validWord = 1 'CAR
            End If
            If (verb = "n" Or verb = "nord") Then
               position = 1: validWord = 1 'FRONT OF THE PALACE
            End If

       Case 1
            If (verb = "n" Or verb = "nord") Then
               position = 4: validWord = 1 'MAIN HALL
            End If

            If (verb = "e" Or verb = "est")  Then
               position = 3: validWord = 1 'SMALL ROAD TO CAPANNO
            End If

            If (verb = "s" Or verb = "sud")  Then
               position = 0: validWord = 1 'SQUARE
            End If

       Case 2
            If (verb = "n" Or verb = "nord") Then
               position = 0: validWord = 1 'SQUARE
            End If

       Case 3
            If (verb = "o" Or verb = "ovest") Then
               position = 1 'FRONT OF THE PALACE FROM CAPANNO
            End If

       Case 4
            If (verb = "o" Or verb = "ovest") Then
               position = 29: validWord = 1
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 1: validWord = 1
            End If

            If (verb = "n" Or verb = "nord") Then
               position = 7: validWord = 1 'HALL WITH GREEN DOOR AND STAIRS AND ROOM
            End If

       Case 5
            If (verb = "e" Or verb = "est") Then
               position = 7: validWord = 1 'HALL WITH STAIRS TO P1
            End If

       Case 6
            If (verb = "o" Or verb = "ovest") And position = 6 Then
               position = 7: validWord = 1 'HALL WITH STAIRS TO P1
            End If

       Case 7
            If (verb = "o" Or verb = "ovest") Then
               position = 30: validWord = 1 'IN FRONT OF GREEN DOOR
            End If
            If (verb = "e" Or verb = "est") Then
               position = 6: validWord = 1 'ROOM WITHOUT DOOR
            End If
            If (verb = "n" Or verb = "nord") Then
               position = 8: validWord = 1 'HALL ON P1
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 4: validWord = 1 'HALL ON P1
            End If

       Case 8
            If (verb = "s" Or verb = "sud") Then
               position = 7: validWord = 1
            End If
            If (verb = "n" Or verb = "nord") Then
               If isTorchTurnedOn = 1 Then
                  position = 9: validWord = 1
               End If
            End If
            If (verb = "e" Or verb = "est") Then
               If isTorchTurnedOn = 1 Then
                  position = 22: validWord = 1
               End If
            End If
            If (verb = "o" Or verb = "ovest") Then
               If isTorchTurnedOn = 1 Then
                  position = 31: validWord = 1 ' S = DOOR TO 14 AND N = TO 2P
               End If
            End If

       Case 9
            If (verb = "s" Or verb = "sud") Then
               position = 8: validWord = 1
            End If

       Case 10
            If (verb = "o" Or verb = "ovest") Then
               position = 8: validWord = 1
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 15: validWord = 1
            End If

       Case 11
            If (verb = "n" Or verb = "nord") Then
               position = 12: validWord = 1
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 31: validWord = 1
            End If

       Case 12
            If (verb = "n" Or verb = "nord") Then
               position = 13: validWord = 1 ' BEDROOM
            End If
            If (verb = "ne" Or verb = "nordest") Then
               position = 14: validWord = 1 ' EMPTY ROOM W/KEY TO BASEMENT
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 11: validWord = 1
            End If

       Case 13
            If (verb = "s" Or verb = "sud") Then
               position = 12: validWord = 1
            End If

       Case 14
            If (verb = "s" Or verb = "sud") Then
               position = 12: validWord = 1
            End If

       Case 15
            If (verb = "n" Or verb = "nord") Then
               position = 10: validWord = 1
            End If
            If (verb = "s" Or verb = "sud") Then
               If isDoor32Open = 0 Then
                  position = 32: validWord = 1
               Else
                  position = 16: validWord = 1
               End If
            End If

       Case 16
            If (verb = "s" Or verb = "sud") Then
               position = 17: validWord = 1
            End If
            If (verb = "n" Or verb = "nord") Then
               position = 15: validWord = 1
            End If

       Case 17
            If (verb = "n" Or verb = "nord") Then
               position = 16: validWord = 1
            End If

       Case 18
            If (verb = "e" Or verb = "est") Then
               position = 4: validWord = 1
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 19: validWord = 1
            End If

       Case 19
            If (verb = "n" Or verb = "nord") Then
               position = 18: validWord = 1
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 20: validWord = 1
            End If

       Case 20
            If (verb = "n" Or verb = "nord") Then
               position = 19: validWord = 1
            End If
            If (verb = "e" Or verb = "est")  Then
               position = 21: validWord = 1
            End If
            If (verb = "o" Or verb = "ovest") Then
               position = 23: validWord = 1
            End If

       Case 21
            If (verb = "s" Or verb = "sud") Then
               position = 42: validWord = 1
            End If
            If (verb = "e" Or verb = "est")  Then
               position = 49: validWord = 1
            End If
            If (verb = "o" Or verb = "ovest") Then
               position = 20: validWord = 1
            End If

       Case 22
            If (verb = "o" Or verb = "ovest") Then
               position = 8: validWord = 1
            End If

       Case 23
            If (verb = "o" Or verb = "ovest") Then
               position = 26: validWord = 1
            End If
            If (verb = "e" Or verb = "est") Then
               position = 20: validWord = 1
            End If
            If (verb = "n" Or verb = "nord") Then
               position = 25: validWord = 1
            End If

       Case 24
            If (verb = "n" Or verb = "nord") Then
               position = 31: validWord = 1 ' FORK
            End If

       Case 25
            If (verb = "s" Or verb = "sud") Then
               position = 23: validWord = 1
            End If

       Case 26
            If (verb = "s" Or verb = "sud") Then
               position = 28: validWord = 1
            End If
            If (verb = "e" Or verb = "est") Then
               position = 23: validWord = 1
            End If
            If (verb = "o" Or verb = "ovest") Then
               position = 27: validWord = 1
            End If

       Case 27
            If (verb = "e" Or verb = "est") Then
               position = 26: validWord = 1
            End If

       Case 28
            If (verb = "s" Or verb = "sud") Then
               position = 34: validWord = 1
            End If
            If (verb = "e" Or verb = "est") Then
               position = 33: validWord = 1
            End If
            If (verb = "n" Or verb = "nord") Then
               position = 26: validWord = 1
            End If

       Case 29
            If (verb = "e" Or verb = "est") Then
               position = 4: validWord = 1 'MAIN HALL
            End If

       Case 30
            If (verb = "e" Or verb = "est") Then
               position = 7: validWord = 1
            End If

       Case 31
            If (verb = "s" Or verb = "sud") Then
               position = 24: validWord = 1 ' UWAGA TUTAJ :)
            End If
            If (verb = "n" Or verb = "nord") Then
               position = 11: validWord = 1 ' STARIS TO P2
            End If
            If (verb = "e" Or verb = "est") Then
               position = 8: validWord = 1
            End If

       Case 32
            If (verb = "n" Or verb = "nord") Then
               position = 15: validWord = 1
            End If

       Case 33
            If (verb = "o" Or verb = "ovest") Then
               position = 28: validWord = 1
            End If

       Case 34
            If (verb = "o" Or verb = "ovest") Then
               position = 35: validWord = 1
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 36: validWord = 1
            End If
            If (verb = "e" Or verb = "est") Then
               position = 37: validWord = 1
            End If
            If (verb = "n" Or verb = "nord") Then
               position = 28: validWord = 1
            End If

       Case 35
            If (verb = "e" Or verb = "est") Then
               position = 34: validWord = 1
            End If

       Case 36
            If (verb = "n" Or verb = "nord") Then
               position = 34: validWord = 1
            End If

       Case 37
            If (verb = "o" Or verb = "ovest") Then
               position = 34: validWord = 1
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 40: validWord = 1
            End If
            If (verb = "e" Or verb = "est") Then
               position = 39: validWord = 1
            End If
            If (verb = "n" Or verb = "nord") Then
               position = 38: validWord = 1
            End If

       Case 38
            If (verb = "s" Or verb = "sud") Then
               position = 37: validWord = 1
            End If

       Case 39
            If (verb = "o" Or verb = "ovest") Then
               position = 37: validWord = 1
            End If

       Case 40
            If (verb = "n" Or verb = "nord") Then
               position = 37: validWord = 1
            End If
            If (verb = "e" Or verb = "est") Then
               position = 41: validWord = 1
            End If

       Case 41
            If (verb = "n" Or verb = "nord") Then
               position = 42: validWord = 1
            End If
            If (verb = "o" Or verb = "ovest") Then
               position = 40: validWord = 1
            End If

       Case 42
            If (verb = "n" Or verb = "nord") Then
               position = 21: validWord = 1
            End If
            If (verb = "e" Or verb = "est") Then
               position = 43: validWord = 1
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 41: validWord = 1
            End If

       Case 43
            If (verb = "o" Or verb = "ovest") Then
               position = 42: validWord = 1
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 47: validWord = 1
            End If
            If (verb = "e" Or verb = "est") Then
               position = 45: validWord = 1
            End If
            If (verb = "n" Or verb = "nord") Then
               position = 44: validWord = 1
            End If

       Case 44
            If (verb = "s" Or verb = "sud") Then
               position = 43: validWord = 1
            End If

       Case 45
            If (verb = "o" Or verb = "ovest") Then
               position = 43: validWord = 1
            End If

       Case 46
            If (verb = "o" Or verb = "ovest") Then
               position = 47: validWord = 1
            End If

       Case 47
            If (verb = "n" Or verb = "nord") Then
               position = 43: validWord = 1
            End If
            If (verb = "e" Or verb = "est") Then
               If isDoor46Open = 1 Then
                  position = 48: validWord = 1
               Else
                  position = 46: validWord = 1
               End If
            End If

       Case 48
            If (verb = "o" Or verb = "ovest") Then
               If isDoor46Open = 0 Then
                  position = 47: validWord = 1
               End If
            End If

       Case 49
            If (verb = "o" Or verb = "ovest") Then
               position = 21: validWord = 1
            End If
            If (verb = "n" Or verb = "nord") Then
               position = 50: validWord = 1
            End If

       Case 50
            If (verb = "o" Or verb = "ovest") Then
               position = 51: validWord = 1
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 49: validWord = 1
            End If
            If (verb = "e" Or verb = "est") Then
               position = 52: validWord = 1
            End If

       Case 51
            If (verb = "e" Or verb = "est") Then
               position = 50: validWord = 1
            End If

       Case 52
            If (verb = "o" Or verb = "ovest") Then
               position = 50: validWord = 1
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 53: validWord = 1
            End If
            If (verb = "e" Or verb = "est") Then
               position = 54: validWord = 1
            End If

       Case 53
            If (verb = "n" Or verb = "nord") Then
               position = 52: validWord = 1
            End If

       Case 54
            If (verb = "o" Or verb = "ovest") Then
               position = 52: validWord = 1
            End If
            If (verb = "s" Or verb = "sud") Then
               position = 55: validWord = 1
            End If
    End Select

    verb = ""
End Sub
' -------------------------------------------------------------

Sub GameOver() Static
    Poke 53281,10: poke 53280,10
    Print chr$(147)
    locate 2,10: Print "{white}una strana creatura ti si avvicina..."
    locate 2,11: Print "{white}il mostro stacca la tua testa con un"
    locate 2,12: Print "{white}solo boccone!"
    locate 2,13: Print "{white}sei morto!"
    locate 2,14: Print "{white}fine del gioco"
    End
End Sub
' -------------------------------------------------------------

Sub Start() Static
   poke 53280,1: poke 53281,1
   Dim verb As String*30

   Do While 1
       validWord = 0
        'Print "debug position = " ,position
       'inventory(0) = objects(0) 'TODO REMOVE
       'inventory(1) = objects(1) 'TODO REMOVE
       'inventory(2) = objects(2) 'TODO REMOVE
       'inventory(3) = objects(3) 'TODO REMOVE
       'inventory(4) = objects(4) 'TODO REMOVE
       'inventory(5) = objects(5) 'TODO REMOVE
       'inventory(6) = objects(6) 'TODO REMOVE

       Call ShowActualLocation(position)
       Locate 0,0
       'Print "{gray} debug position is: ", position

       Locate 1,15
       Print ""
       verb = ""
       Poke 646,14: Input " cosa fai? "; verb

       If position = 5 And (verb = "apri armadio" Or verb = "apri armadietto" Or verb = "apri piccolo armadietto") Then 'SMALL SKAF
          Locate 1, 16
          For idx As Byte = 0 To maxObjects
                If inventory(idx) = "torcia" Then
                    Print "{green}               e' vuoto!      "
                    Exit For
                Else
                    Print "{green}        c'e' una torcia dentro"
                    Exit For
                End If
            Next
            Call PressAKeyToContinue()
            validWord = 1
       End If

       If position = 9 And (verb = "apri armadio" Or verb = "apri armadietto" Or verb = "apri grosso armadio") Then 'SMALL SKAF
          Locate 1,20
          Print "{green}       solo un mucchio di archivi."
          Call PressAKeyToContinue()
          validWord = 1
       End If

       If position = 24 And (verb = "apri armadio") Then 'BIG COLOURED SKAF
          Locate 1,20
          Call GameOver()
       End If

       If position = 24 Or Position = 9 And verb = "esamina armadio" Then
          Locate 1,20
          Print "{green}  conterra' qualcosa di interessante?"
          Call PressAKeyToContinue()
          validWord = 1
       End If

       If verb = "entra" Or verb = "apri" Then
          If position = 2 Then 'CAR'
            Locate 1,20
            Print "{green}     sei rimasto senza carburante."
            Call PressAKeyToContinue()
            validWord = 1
          End If

          If position = 30 Then 'GREEN DOOR
            Locate 1,20
            Position = 5 'ROOM WITH SKAF
            validWord = 1
          End If

          If position = 22 Then 'BLACK DOOR
            Locate 1,20
            Position = 10 'ROOM WITH SKAF
            validWord = 1
          End If

          Dim objFound As byte: objFound = 0

          If position = 32 Then 'BLACK DOOR
            Locate 1,20
            For idx As byte = 0 To maxObjects
               If inventory(idx) = objects(4) Then
                  objFound = 1
                  isDoor32Open = 1
                  Locate 1,20
                  Print "{green}           hai aperto la porta"
                  Exit For
               End If
            Next

            If objFound = 1 Then
               position = 16
            Else
               Locate 1,20
               Print "{green}     questa porta e' chiusa a chiave"
            End If
            Call PressAKeyToContinue()
            validWord = 1
          End If

          If position = 46 Then 'BLACK DOOR
            Locate 1,20
            For idx As byte = 0 To maxObjects
               If inventory(idx) = objects(7) Then
                  objFound = 1
                  isDoor46Open = 1
                  Locate 1,20
                  Print "{green}         hai aperto il portone"
                  Exit For
               End If
            Next

            If objFound = 1 Then
               position = 48
            Else
               Locate 1,20
               Print "{green}     il portone e' chiuso a chiave."
            End If
            Call PressAKeyToContinue()
            validWord = 1
          End If

          If position = 29 Then 'RED DOOR
            If isDoor20Open = 0 Then
               Dim cod As string*10: cod = ""
               Locate 1,19
               Print "{green}   la porta e' bloccata. non si apre."
               If isDoor20Open = 1 Then
                  Position = 18 'HALL TO STAIRS TO B2
                  Locate 1,20
                  Print "{green}           hai aperto la porta"
                  Call PressAKeyToContinue()
               End If
            Else
                Position = 18 'HALL TO STAIRS TO B2
            End If

            Call PressAKeyToContinue()
          End If
          validWord = 1
       End If

       If LEFT$(verb,6) = "prendi" Then
          objToUse = Right$(verb, Len(verb) - 7)
          'Print " debug objtouse: >" + objToUse + "<"
          Call GetObj(objToUse)
          validWord = 1
       End If

       If LEFT$(verb,3) = "usa" Then
          objToUse = Right$(verb, Len(verb) - 4)
          Call UseObj()
          validWord = 1
       End If

       If LEFT$(verb,7) = "accendi" Then
          objToUse = Right$(verb, Len(verb) - 8)
          'Print " debug objtouse: >" + objToUse + "<"
          Call TurnOnObj()
          validWord = 1
       End If

       If verb = "esamina televisore" Or verb = "esamina tv" Then
          validWord = 1
          Locate 1,20
          Print "{green}           la tv non funziona!"
          Call PressAKeyToContinue()
       End If

       If verb = "guarda" _
       Or verb = "osserva" Then
          validWord = 1

          If position = 3 Or position = 5 Or position = 14 Or position = 33 Then
             Call ObjectsInLocation(position)
          Else
             Call NothingHere()
          End If
       End If

       If LEFT$(verb, 7) = "esamina" Then
          If position = 17 Then
             validWord = 1
             objToUse = Right$(verb, Len(verb) - 8)
             'Print " debug objtouse: >" + objToUse + "<"
             Call CheckObj()
          End If
          validWord = 1
       End If

       Call CheckMove(verb)
       'removed due to insufficient space Call CheckBadWords(verb)

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
          Call PressAKeyToContinue()
          Poke 646,1: Poke 53280,1: Poke 53281,1
          verb = ""
       End If

       If verb = "aiuto" Or verb = "help" Or verb = "a" Or verb = "h" Then
          validWord = 1
          Call Help(position)
       End If

       If validWord = 0 Then
          Locate 1,20
          Print "{green}        non sembra funzionare! "
          Call PressAKeyToContinue()
       End If
   Loop
End Sub
' -------------------------------------------------------------

Sub Init() Static
   For idx As byte = 0 To maxObjects
       objects(idx) = ""
       inventory(idx) = ""
   Next

   rooms(0)  = "spazio aperto"
   rooms(1)  = "entrata edificio"
   rooms(2)  = "automobile"
   rooms(3)  = "piccola distesa"
   rooms(4)  = "hall principale"
   rooms(5)  = "stanza semplice"
   rooms(6)  = "stanza quadrata"
   rooms(7)  = "corridoio piccolo"
   rooms(8)  = "lungo corridoio"
   rooms(9)  = "ufficio"
   rooms(10) = "accesso a scale -1"
   rooms(11) = "scale verso p2"
   rooms(12) = "corridoio p2"
   rooms(13) = "dormitorio"
   rooms(14) = "stanza vuota"
   rooms(15) = "piano -1"
   rooms(16) = "corridoio sotterraneo"
   rooms(17) = "sala bar"
   rooms(18) = "scala sotterraneo -2" 'ONLY S
   rooms(19) = "cunicolo -2"          'N, S
   rooms(20) = "serie di tunnel"      'N, W, E
   rooms(21) = "serie di tunnel"      'S, E, W
   rooms(22) = "porta nera"           'TO ROOM 10
   rooms(23) = "serie di tunnel"      'N, E, W
   rooms(24) = "stanza inospitale"    'N
   rooms(25) = "quadro elettrico"     'S
   rooms(26) = "serie di tunnel"      'E, W, S
   rooms(27) = "vicolo cieco"         'ONLY E
   rooms(28) = "serie di tunnel"      'N, S, E
   rooms(29) = "porta rossa"          'ACCESS TO 18 (-2 HALL STAIRS)
   rooms(30) = "porta verde"
   rooms(31) = "bivio"
   rooms(32) = "porta bianca"
   rooms(33) = "vicolo cieco"         'ONLY W (SMALL KEY TO OPEN 47)
   rooms(34) = "serie di tunnel"      'ALL DIRECTIONS
   rooms(35) = "vicolo cieco"         'W
   rooms(36) = "vicolo cieco"         'N
   rooms(37) = "serie di tunnel"      'ALL DIRECTIONS
   rooms(38) = "vicolo cieco"         'S
   rooms(39) = "vicolo cieco"         'W
   rooms(40) = "bivio"                'N, E
   rooms(41) = "bivio"                'W, N
   rooms(42) = "serie di tunnel"      'S, N, E
   rooms(43) = "serie di tunnel"      'ALL DIRECTIONS
   rooms(44) = "vicolo cieco"         'S
   rooms(45) = "vicolo cieco"         'W
   rooms(46) = "enorme portone"       'W ONLY OR OPEN
   rooms(47) = "corridoio sinistro"   'N, S
   rooms(48) = "sala macchinario"     'N
   rooms(49) = "bivio"                'N, W
   rooms(50) = "bivio"                'E, W, S
   rooms(51) = "vicolo cieco"         'E
   rooms(52) = "serie di tunnel"      'S, E, W
   rooms(53) = "vicolo cieco"         'N
   rooms(54) = "bivio"                'W, S
   rooms(55) = "vicolo cieco"         'DIE!

   objects(0) = "piccola chiave"
   objects(1) = "torcia"
   objects(2) = "biglietto"
   objects(3) = "grossa chiave"
   objects(4) = "chiave nera"
   objects(5) = "piccolo armadietto"
   objects(6) = "armadio colorato"
   objects(7) = "chiave arruginita"

   position = 0

   Print CHR$(147): Poke 53281,1: Poke 53280,1
   Print "{red}          magione abbandonata"
   Print "{red}       c.2024 isaac garcia peveri"
   Print "{red}           per 1001avventura"
   Print ""
   'Poke 646, 09: Print "         alpha 1.00 non finito "
   Print ""
   Print "{black} effettua una delle seguenti scelte:"
   Print "{black} i = istruzioni"
   Print "{black} s = inizia il gioco"

    Do While 1
       Input scelta

       If scelta = "i" then
          Print CHR$(147): Poke 53281,1: Poke 53280,1
          Print "{red}          magione abbandonata"
          Print "{red}       c.2024 isaac garcia peveri"
          Print "{red}          per 1001avventura"
          Print ""
          Print "{black} n, s, o, e = vai nella direzione"
          Print ""
          Print "{black} per giocare introduci un verbo."
          Print ""
          Print "{black} se esiste un oggetto che puo' essere"
          Print "{black} raccolto utilizza verbo + oggetto:"
          Print ""
          Print "{purple} prendi chiavi di casa"
          Print "{purple} leggi nota"
          Print ""
          Print "{black} fine = termina il gioco"
          Print "{black} help/aiuto = piccolo aiuto"
          Call PressAKeyToContinue()
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

