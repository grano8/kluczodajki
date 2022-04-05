local kluczodajki = {
  ["Firletki"]="(jasnowlosa arogancka kobieta|Jasnowlosa arogancka kobieta|Daina)",
  ["Nilda"]="(Migdalowooka wiotka polelfka|migdalowooka wiotka polelfka|Nilda}",
  ["Wiezienie"]="(Mloda jasnowlosa dziewczyna|mloda jasnowlosa dziewczyna)",
  ["Gnom"]="(Niespokojny blady gnom|niespokojny blady gnom)",
  ["Profesor"]="(Jasnowlosy wygadany mezczyzna|jasnowlosy wygadany mezczyzna|Ralf)",
  ["Driada"]="(Stara agresywna driada|stara agresywna driada)",
  ["Zniwek"]="(Podstarzaly wychudzony wiesniak|podstarzaly wychudzony wiesniak|Zniwomir)",
  ["Garisson"]="(Srogi raptawy mezczyzna|srogi raptawy mezczyzna|Garisson)",
  ["Ekima"]="(Nietoperzowy|nietoperzowy)",
  ["Wiedzmin"]="(Zmasakrowane zwloki czlowieka|zmasakrowane zwloki czlowieka)",
  ["Wszawy"]="(wszawy)",
  ["Baba"]="(Nieforemna dlugowlosa kobieta|nieforemna dlugowlosa kobieta)",
  ["Fusta"]="(fusta)",
  ["Szkuner"]="(Ponury stary szkuner|ponury stary szkuner)",
  ["Kaplan"]="(Mlody ambitny kaplan|Vemician|mlody ambitny kaplan)",
  ["Twardokrusz"]="(Przerosniety wielkostopy troll gorski|przerosniety wielkostopy troll gorski|Twardokrusz)",
  ["Branimir"]="(Krzepki opalony mezczyzna|krzepki opalony mezczyzna|Branimir GP)",
  ["Tegobor"]="(Szarozielony zwalisty troll|szarozielony zwalisty troll|Tegobor)"
}

local kluczodajki_triggery={}

local znalezione_klucze={}

function definiuj_alerty_kluczy()
  for k,v in pairs(kluczodajki) do
    if kluczodajki_triggery[k] then disableTrigger(kluczodajki_triggery[k]) end
    kluczodajki_triggery[k]=tempRegexTrigger(v,function() alertuj_klucz(k); return true end,1)
  end 
end

function alertuj_klucz(klucz_id)
  raiseEvent("playBeep")
  tempTimer(0.5,[[raiseEvent("playBeep")]])
  tempTimer(1.0,[[raiseEvent("playBeep")]])
  raiseEvent("playBeep")
  print("<<<<<             "..klucz_id.."                          >>>>")
  print("<<<<<             "..klucz_id.."                          >>>>")
  print("<<<<<             "..klucz_id.."                          >>>>")
  znalezione_klucze[klucz_id]=amap.db:get_room_id()
  if kluczodajki_triggery[klucz_id] then disableTrigger(kluczodajki_triggery[klucz_id]) end
  tempTimer(120.0,function() definiuj_alerty_kluczy(); end)
end

function klucze_pokaz()
  for k,v in pairs(znalezione_klucze) do
    print("Znalazlem "..k.." w "..v.."!")
  end
end

function klucze_usun()
  znalezione_klucze={}
end

definiuj_alerty_kluczy()
