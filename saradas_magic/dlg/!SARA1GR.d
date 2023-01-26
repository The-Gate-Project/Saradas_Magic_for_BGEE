// creator  : DLTCEP_enhanced_WeiDU (version 23100)
// argument : SAR1NGRY.DLG
// game		 : .
// source	 : ./override/SAR1NGRY.DLG
// dialog	 : d:\bgee\data\00766\dialog.tlk
// dialogF  : (none)

BEGIN ~!SARA1GR~

IF ~!global("!SaraS1eal","GLOBAL",1)~ THEN BEGIN 0 // from:
  SAY @300 /*~Questa e' stata davvero una pessima idea...Sono spiacente ma sembra proprio che debba insegnarvi le buone maniere.~ */
  IF ~~ THEN EXIT
END


IF ~global("!SaraS1eal","GLOBAL",1)~ THEN BEGIN 1 // from:
  SAY @301 /*~Bene Bene, e cosi' vi piace appropriarvi indebitamente delle cose altrui...Conosco la punizione giusta per quelli come voi.~ */
  IF ~~ THEN DO ~setglobal("!SaraS1eal","GLOBAL",2)~ EXIT
END