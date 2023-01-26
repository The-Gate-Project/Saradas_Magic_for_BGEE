// creator  : DLTCEP_enhanced_WeiDU (version 23100)
// argument : SARAD1S.DLG
// game		 : .
// source	 : ./override/SARAD1S.DLG
// dialog	 : d:\bgee\data\00766\dialog.tlk
// dialogF  : (none)

BEGIN ~!sarad1s~

IF ~!global("TalkedToSarad1s","GLOBAL",1)~ THEN BEGIN 0 // from:
  SAY @100 /* ~Benvenuti avventurieri, il mio nome e' Saradas, viaggiatore e potente mago. Per tutta la mia vita ho vagato per Faerun in cerca di conoscenza e artefatti. Ho anche creato alcuni incantesimi che potrei condividere con voi... per il giusto prezzo, naturalmente. Date pure un'occhiata.~ */
  IF ~~ THEN REPLY @101 /* ~Vediamo un po' cosa hai da offrire, mago.~ */ DO ~StartStore("!sarad1s",LastTalkedToBy(Myself)) setglobal("TalkedToSarad1s","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @102 /* ~A dire il vero andiamo un po' di fretta, sarà  per la prossima volta.~ */ DO ~setglobal("TalkedToSarad1s","GLOBAL",1)~ EXIT
  IF ~~ THEN REPLY @103 /* ~Sinceramente non ci interessa chi sei o cosa vendi, vecchio, inoltre nutro parecchi dubbi riguardo ai tuoi fantomatici "poteri".~ */ GOTO 2
END

IF ~global("TalkedToSarad1s","GLOBAL",1) GlobalLT("Chapter","GLOBAL",5) ~ THEN BEGIN 1 // from:
  SAY @108 /* ~Oh, siete tornati. Siete alla ricerca di qualche pergamena o artefatto? O forse di un amico...Non se ne ha mai abbastanza di questi tempi.~ */
  IF ~~ THEN REPLY @109 /* ~Bentrovato, Saradas. Mostraci cio' che hai da vendere.~ */ DO ~StartStore("!sarad1s",LastTalkedToBy(Myself))~ EXIT
  IF ~~ THEN REPLY @110 /* ~A dire il vero siamo solo di passaggio, e' tempo di rimettersi in viaggio.~ */ EXIT
  IF ~~ THEN REPLY @111 /* ~Ne' dell'uno ne' dell'altro. Trovati qualcun altro da importunare, vecchiaccio appiccicoso. Umph!~ */ EXIT
  IF 
  ~ReputationGT([PC],9)
  !GlobalTimerNotExpired("!sarad1sHealedParty","GLOBAL")
  OR(6)
  HPpercentLT(Player1,50)
  HPpercentLT(Player2,50)
  HPpercentLT(Player3,50)
  HPpercentLT(Player4,50)
  HPpercentLT(Player5,50)
  HPpercentLT(Player6,50)~ THEN REPLY @134  GOTO HealGoodParty
  IF
  ~ReputationGT([PC],9)
  GlobalTimerNotExpired("!sarad1sHealedParty","GLOBAL")
  OR(6)
  HPpercentLT(Player1,50)
  HPpercentLT(Player2,50)
  HPpercentLT(Player3,50)
  HPpercentLT(Player4,50)
  HPpercentLT(Player5,50)
  HPpercentLT(Player6,50)~ THEN REPLY @134  GOTO HealNotReady
  IF
  ~ReputationLT([PC],10)
  OR(6)
  HPpercentLT(Player1,50)
  HPpercentLT(Player2,50) 
  HPpercentLT(Player3,50) 
  HPpercentLT(Player4,50)
  HPpercentLT(Player5,50) 
  HPpercentLT(Player6,50)~ THEN REPLY @134  GOTO NoHealBadParty
END

IF ~~ THEN BEGIN HealGoodParty
  SAY @135
IF ~~ THEN DO ~ApplySpell(player1,Cleric_cure_serious_wounds)
               ApplySpell(player2,Cleric_cure_serious_wounds)
               ApplySpell(player3,Cleric_cure_serious_wounds)
               ApplySpell(player4,Cleric_cure_serious_wounds)
               ApplySpell(player5,Cleric_cure_serious_wounds)
               ApplySpell(player6,Cleric_cure_serious_wounds)
               SetGlobalTimer("!sarad1sHealedParty","GLOBAL",2400)~ EXIT
END

IF ~~ THEN BEGIN NoHealBadParty
  SAY @136
IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN HealNotReady
  SAY @137
IF ~~ THEN EXIT
END


IF ~~ THEN BEGIN 2 // from: 0.2
  SAY @104 /* ~Sai, non amo dare dimostrazione dei miei poteri, specialmente in pubblico... ma se e' questo che vuoi ti accontentero', potresti addirittura trarne insegnamento~ */
  IF ~~ THEN REPLY @105 /* ~D'accordo nonnetto, fatti sotto! Ti faro' passare la voglia di parlare tanto.~ */ DO ~setglobal("TalkedToSarad1s","GLOBAL",1) Enemy()~ EXIT
  IF ~~ THEN REPLY @106 /* ~Mmm...forse sara'  per la prossima volta! Ora sono...davvero moooolto impegnato...Non che non fossi in grado di batterti, si capisce...~ */ DO ~setglobal("TalkedToSarad1s","GLOBAL",1)~ GOTO 3
END


IF ~~ THEN BEGIN 3
  SAY @107 /* ~Saggia decisione, ragazzo. Ora va e cerca di imparare le buone maniere, se ti riesce.~ */
IF ~~ THEN EXIT
END



IF ~GlobalGT("Chapter","GLOBAL",4) global("TalkedToSarad1s","GLOBAL",1) global("Sarad1sTalkAfterDavaeorn","GLOBAL",0)~ THEN BEGIN 4
  SAY @115               /* ~Bentornati! <CHARNAME>, ho saputo della vostra eroica impresa alle miniere del Bosco Ammantato, davvero ben fatto!~ */
  IF ~~ THEN REPLY @116  /* ~Oh, vedo che le notizie viaggiano piuttosto veloci...Non e' stato affatto facile, ma io e il mio gruppo siamo piuttosto felici di esserne usciti vivi~ */ GOTO 5
  IF ~~ THEN REPLY @117  /* ~Non sono affari tuoi, vecchio. Lasciami in pace una volta per tutte.~ */ DO ~setglobal("Sarad1sTalkAfterDavaeorn","GLOBAL",1)~ GOTO 6
END

IF ~~ THEN BEGIN 5 // from: 4
  SAY @118 /* ~Suvvia, lo sai che non c'e' ragione di essere modesti con me, c'e' sempre bisogno di persone come te nei Reami.~ */
IF ~Kit(protagonist,MAGESCHOOL_ABJURER)~       THEN REPLY @121 /* ~Ti ringrazio, ma sono davvero stanco, i pericoli non sembrano finire mai. Se solo Gorion fosse ancora qui per insegnarmi...~ */ GOTO GiveAbjurerSpell
IF ~Kit(protagonist,MAGESCHOOL_DIVINER)~       THEN REPLY @121 /* ~Ti ringrazio, ma sono davvero stanco, i pericoli non sembrano finire mai. Se solo Gorion fosse ancora qui per insegnarmi...~ */ GOTO GiveDivinerSpell
IF ~Kit(protagonist,MAGESCHOOL_ENCHANTER)~     THEN REPLY @121 /* ~Ti ringrazio, ma sono davvero stanco, i pericoli non sembrano finire mai. Se solo Gorion fosse ancora qui per insegnarmi...~ */ GOTO GiveEnchanterSpell
IF ~Kit(protagonist,MAGESCHOOL_CONJURER)~      THEN REPLY @121 /* ~Ti ringrazio, ma sono davvero stanco, i pericoli non sembrano finire mai. Se solo Gorion fosse ancora qui per insegnarmi...~ */ GOTO GiveConjurerSpell
IF ~Kit(protagonist,MAGESCHOOL_ILLUSIONIST)~   THEN REPLY @121 /* ~Ti ringrazio, ma sono davvero stanco, i pericoli non sembrano finire mai. Se solo Gorion fosse ancora qui per insegnarmi...~ */ GOTO GiveIllusionistSpell
IF ~Kit(protagonist,MAGESCHOOL_INVOKER)~       THEN REPLY @121 /* ~Ti ringrazio, ma sono davvero stanco, i pericoli non sembrano finire mai. Se solo Gorion fosse ancora qui per insegnarmi...~ */ GOTO GiveInvokerSpell
IF ~Kit(protagonist,MAGESCHOOL_NECROMANCER)~   THEN REPLY @121 /* ~Ti ringrazio, ma sono davvero stanco, i pericoli non sembrano finire mai. Se solo Gorion fosse ancora qui per insegnarmi...~ */ GOTO GiveNecromancerSpell
IF ~Kit(protagonist,MAGESCHOOL_TRANSMUTER)~    THEN REPLY @121 /* ~Ti ringrazio, ma sono davvero stanco, i pericoli non sembrano finire mai. Se solo Gorion fosse ancora qui per insegnarmi...~ */ GOTO GiveTransmuterSpell
IF ~Kit(protagonist,MAGESCHOOL_GENERALIST)~    THEN REPLY @121 /* ~Ti ringrazio, ma sono davvero stanco, i pericoli non sembrano finire mai. Se solo Gorion fosse ancora qui per insegnarmi...~ */ GOTO GiveGeneralistSpell
IF ~Kit(protagonist,WILDMAGE)~                 THEN REPLY @121 /* ~Ti ringrazio, ma sono davvero stanco, i pericoli non sembrano finire mai. Se solo Gorion fosse ancora qui per insegnarmi...~ */ GOTO GiveWildSpell
IF ~Kit(protagonist,DRAGON_DISCIPLE)~          THEN REPLY @121 /* ~Ti ringrazio, ma sono davvero stanco, i pericoli non sembrano finire mai. Se solo Gorion fosse ancora qui per insegnarmi...~ */ GOTO GiveDragonSpell
IF ~~ THEN REPLY @119 /* ~Grazie Saradas, ma c'e' ancora molto da fare...Arrivederci.~*/ DO ~setglobal("Sarad1sTalkAfterDavaeorn","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN GiveConjurerSpell
  SAY @122
IF ~~ THEN REPLY @123 DO ~setglobal("Sarad1sTalkAfterDavaeorn","GLOBAL",1) SetGlobal("Sarad1sGaveSpellClassCON","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN GiveWildSpell
  SAY @124
IF ~~ THEN REPLY @123 DO ~setglobal("Sarad1sTalkAfterDavaeorn","GLOBAL",1) SetGlobal("Sarad1sGaveSpellClassWIL","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN GiveAbjurerSpell
  SAY @125
IF ~~ THEN REPLY @123 DO ~setglobal("Sarad1sTalkAfterDavaeorn","GLOBAL",1) SetGlobal("Sarad1sGaveSpellClassABJ","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN GiveDivinerSpell
  SAY @126
IF ~~ THEN REPLY @123 DO ~setglobal("Sarad1sTalkAfterDavaeorn","GLOBAL",1) SetGlobal("Sarad1sGaveSpellClassDIV","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN GiveEnchanterSpell
  SAY @127
IF ~~ THEN REPLY @123 DO ~setglobal("Sarad1sTalkAfterDavaeorn","GLOBAL",1) SetGlobal("Sarad1sGaveSpellClassENC","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN GiveIllusionistSpell
  SAY @128
IF ~~ THEN REPLY @123 DO ~setglobal("Sarad1sTalkAfterDavaeorn","GLOBAL",1) SetGlobal("Sarad1sGaveSpellClassILL","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN GiveInvokerSpell
  SAY @129
IF ~~ THEN REPLY @123 DO ~setglobal("Sarad1sTalkAfterDavaeorn","GLOBAL",1) SetGlobal("Sarad1sGaveSpellClassINV","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN GiveNecromancerSpell
  SAY @130
IF ~~ THEN REPLY @123 DO ~setglobal("Sarad1sTalkAfterDavaeorn","GLOBAL",1) SetGlobal("Sarad1sGaveSpellClassNEC","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN GiveTransmuterSpell
  SAY @131
IF ~~ THEN REPLY @123 DO ~setglobal("Sarad1sTalkAfterDavaeorn","GLOBAL",1) SetGlobal("Sarad1sGaveSpellClassALT","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN GiveGeneralistSpell
  SAY @132
IF ~~ THEN REPLY @123 DO ~setglobal("Sarad1sTalkAfterDavaeorn","GLOBAL",1) SetGlobal("Sarad1sGaveSpellClassGEN","GLOBAL",1)~ EXIT
END

IF ~~ THEN BEGIN GiveDragonSpell
  SAY @133
IF ~~ THEN REPLY @123 DO ~setglobal("Sarad1sTalkAfterDavaeorn","GLOBAL",1) SetGlobal("Sarad1sGaveSpellClassDRA","GLOBAL",1)~ EXIT
END




IF ~~ THEN BEGIN 6
  SAY @120  /* ~Va bene va bene, me ne vado, non c'e' bisogno di essere scortesi. Ricorda pero' che nella vita e' importante avere degli amici fidati.~ */
IF ~~ THEN DO ~ForceSpell(Myself,POOF_GONE)~ EXIT
END


IF ~global("TalkedToSarad1s","GLOBAL",1) global("Sarad1sTalkAfterDavaeorn","GLOBAL",1) GlobalGT("Chapter","GLOBAL",4) ~ THEN BEGIN 7 // from:
  SAY @108 /* ~Oh, siete tornati. Siete alla ricerca di qualche pergamena o artefatto? O forse di un amico...Non se ne ha mai abbastanza di questi tempi.~ */
  IF ~~ THEN REPLY @109 /* ~Bentrovato, Saradas. Mostraci cio' che hai da vendere.~ */ DO ~StartStore("!sarad1s",LastTalkedToBy(Myself))~ EXIT
  IF ~~ THEN REPLY @110 /* ~A dire il vero siamo solo di passaggio, e' tempo di rimettersi in viaggio.~ */ EXIT
  IF ~~ THEN REPLY @111 /* ~Ne' dell'uno ne' dell'altro. Trovati qualcun altro da importunare, vecchiaccio appiccicoso. Umph!~ */ EXIT
  IF
  ~ReputationGT([PC],9)
  !GlobalTimerNotExpired("!sarad1sHealedParty","GLOBAL")
  OR(6)
  HPpercentLT(Player1,50)
  HPpercentLT(Player2,50)
  HPpercentLT(Player3,50)
  HPpercentLT(Player4,50)
  HPpercentLT(Player5,50)
  HPpercentLT(Player6,50)~ THEN REPLY @134  GOTO HealGoodParty
  IF
  ~ReputationLT([PC],10)
  OR(6)
  HPpercentLT(Player1,50)
  HPpercentLT(Player2,50) 
  HPpercentLT(Player3,50) 
  HPpercentLT(Player4,50)
  HPpercentLT(Player5,50) 
  HPpercentLT(Player6,50)~ THEN REPLY @134  GOTO NoHealBadParty
  IF
  ~ReputationGT([PC],9)
  GlobalTimerNotExpired("!sarad1sHealedParty","GLOBAL")
  OR(6)
  HPpercentLT(Player1,50)
  HPpercentLT(Player2,50)
  HPpercentLT(Player3,50)
  HPpercentLT(Player4,50)
  HPpercentLT(Player5,50)
  HPpercentLT(Player6,50)~ THEN REPLY @134  GOTO HealNotReady
END
