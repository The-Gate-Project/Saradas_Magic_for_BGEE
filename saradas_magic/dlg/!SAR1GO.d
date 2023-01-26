// creator  : DLTCEP_enhanced_WeiDU (version 23100)
// argument : SAR1GO.DLG
// game		 : .
// source	 : ./override/SAR1GO.DLG
// dialog	 : d:\bgee\data\00766\dialog.tlk
// dialogF  : (none)

BEGIN ~!SAR1GO~

IF ~!global("!SAR1GO","locals",1) !global("!SaraS1eal","GLOBAL",3)~ THEN BEGIN 0 // from:
  SAY @200 /* ~Sono stanco di sprecare il mio tempo con voi. Spero solo che abbiate imparato la lezione e che in futuro non commettiate altri atti malvagi. Addio.~ */
  IF ~~ THEN EXIT
END

IF ~global("!SaraS1eal","GLOBAL",3)~ THEN BEGIN 1 // from:
  SAY @201 /* ~Ecco fatto, spero vi piaccia la vostra nuova forma. Vi si addice moltissimo. Non temete, non e' permanente. Durera' quel tanto che basta a farvi passare la voglia di derubare il prossimo. Addio!~ */
  IF ~~ THEN DO ~ForceSpell(Myself,POOF_GONE)~ EXIT
END