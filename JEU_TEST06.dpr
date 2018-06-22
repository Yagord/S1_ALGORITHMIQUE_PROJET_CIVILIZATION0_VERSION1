program JEU_TEST06;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Crt32 in '..\..\..\..\Desktop\consoleDemoUnicodeDelphi\Crt32.pas';


Function nom() : String;

begin
  Result := 'Paris';
end;


Function population(nbPopulation : Integer) : Integer;

begin
  Result := nbPopulation + 1;
end;


Function nourriture(nbNourri : Integer ; nbNourriParTour : Integer) : Integer;

begin
  Result := nbNourri + nbNourriParTour;
end;


Function nourritureMax (nbPopulation : Integer ; nbNourriMax : Integer) : Integer;

Var
  res : Integer;

begin

  res := nbNourriMax + 150 + ((nbPopulation - 3)*100);

  if nbPopulation = 2 then
  begin
    res := res - 10;
  end;

  Result := res;
end;


Function nourritureParTour(nbNourriParTour : Integer) : Integer;

begin
  Result := nbNourriParTour - 1;
end;


Function nbTourAvantCroissance(nbTourAvantCroiss : Integer) : Integer;

begin
  Result := nbTourAvantCroiss - 1;
end;


Function tour(nbTour : Integer) : Integer;

begin
  Result := nbTour + 1;
end;


Function travailParTour(nbTravailParTour : Integer) : Integer;

begin
  Result := nbTravailParTour + 1;
end;


Function travail(nbTravail : Integer ; nbTravailParTour : Integer) : Integer;

begin
  Result := nbTravail + nbTravailParTour;
end;



Procedure affichageInfo(
  nbTour : Integer;
  reponseEcranPrincipale : Integer;
  quitPartie : Boolean;
  nbPopulation : Integer;
  nbNourri : Integer;
  nbNourriMax : Integer;
  nbNourriParTour : Integer;
  nbTourAvantCroiss : Integer;
  nbTravailParTour : Integer;
  construction : Boolean;
  descriptionConstruction : String;
  nbTravail : Integer;
  nbTravailMax : Integer;
  lvlferme : Integer;
  lvlmine : Integer);

begin
  writeln('Nom : ', nom());
  writeln('Population : ', nbPopulation);
  writeln('Nourriture : ', nbNourri, '/', nbNourriMax);
  writeln('Nourriture par tour : ', nbNourriParTour);
  if nbNourriParTour > 0  then
    begin
      writeln('Nb tours avant croissance : ', nbTourAvantCroiss);
    end
    else
    begin
      writeln('Aucune croissance.');
    end;
  writeln('Travail par tour : ', nbTravailParTour);

  gotoxy(1,12);
  if construction = False then
  begin
    writeln('Pas de construction.');
  end
  else
  begin
    if descriptionConstruction = 'Ferme' then
    begin
      writeln('Construction : ', descriptionConstruction, ' niveau ', lvlferme + 1);
    end
    else if descriptionConstruction = 'Mine' then
    begin
      writeln('Construction : ', descriptionConstruction, ' niveau ', lvlmine + 1);
    end;
    {else if descriptionConstruction = 'Carrière' then
    begin
      writeln('Construction : ', descriptionConstruction, ' niveau ', lvlcarriere + 1);
    end
    else if descriptionConstruction = 'Caserne' then
    begin
      writeln('Construction : ', descriptionConstruction, ' niveau ', lvlcaserne + 1);
    end;}

    writeln('Travail accumulé : ', nbTravail, '/', nbTravailMax);
  end;


  gotoxy(10,10);
  write('Tour : ', nbTour);
end;






Procedure ecranGestion(
  nbTour : Integer;
  reponseEcranPrincipale : Integer;
  quitPartie : Boolean;
  nbPopulation : Integer;
  nbNourri : Integer;
  nbNourriMax : Integer;
  nbNourriParTour : Integer;
  nbTourAvantCroiss : Integer;
  nbTravailParTour : Integer;
  var construction : Boolean;
  var descriptionConstruction : String;
  var nbTravail : Integer;
  var nbTravailMax : Integer;
  lvlferme : Integer;
  lvlmine : Integer);

Var
  quitGestion : Boolean;
  reponseEcranGestion : Integer;
  //lvlFerme : Integer;
  //lvlMine : Integer;
  lvlCariere : Integer;
  lvlCaserne : Integer;
  sommeLvl : Integer;

begin

  quitGestion := False;
  //lvlFerme := 0;
  //lvlMine := 0;
  lvlCariere := 0;
  lvlCaserne := 0;
  sommeLvl := lvlFerme + lvlMine + lvlCariere + lvlCaserne;

  writeln('Civilisation : ');
  writeln('Vue détaillée de : ', nom());
  writeln('Listes des villes de la civilisation :');

  affichageInfo(
        nbTour,
        reponseEcranPrincipale,
        quitPartie,
        nbPopulation,
        nbNourri,
        nbNourriMax,
        nbNourriParTour,
        nbTourAvantCroiss,
        nbTravailParTour,
        construction,
        descriptionConstruction,
        nbTravail,
        nbTravailMax,
        lvlferme,
        lvlmine);

  gotoxy(1,14);
  writeln('Batiments consruits :');

  if lvlFerme > 0 then
  begin
    writeln('Ferme lvl ', lvlFerme);
  end;
  if lvlMine > 0 then
  begin
    writeln('Mine lvl ', lvlMine);
  end;
  if lvlCariere > 0 then
  begin
    writeln('Cariere lvl ', lvlCariere);
  end;
  if lvlCaserne > 0 then
  begin
    writeln('Caserne lvl ', lvlCaserne);
  end;

  gotoxy(1,20);
  writeln('1 - Construire la ferme');
  writeln('2 - Construire la mine');
  writeln('3 - Construire la carrière');
  writeln('4 - Construire la caserne');

  writeln('0 - Retour au menu');






  while quitGestion = False do

  begin

    gotoxy(25,10);
    ClrEol();
    read(reponseEcranGestion);


    if reponseEcranGestion = 1 then
    begin

      if (lvlferme < 3) AND (construction = False) AND (sommeLvl < nbPopulation) then
      begin
        construction := True;
        descriptionConstruction := 'Ferme';
        nbTravail := 0;

        if lvlferme = 0 then
        begin
          nbTravailMax := 20;
        end;

        if lvlferme = 1 then
        begin
          nbTravailMax := 60;
        end;

        if lvlferme = 2 then
        begin
          nbTravailMax := 200;
        end;

        writeln('Construction lancée !');

      end

      else
      begin
        if lvlferme = 3 then
        begin
          writeln('Impossible, niveau max atteint.');
        end

        else if construction = True then
        begin
          writeln('Impossible, construction en cours.');
        end

        else if sommeLvl >= nbPopulation then
        begin
          writeln('Impossible population insuffisante.');
        end;
      end;

      end


    else if reponseEcranGestion = 2 then
    begin

      if (lvlmine < 3) AND (construction = False) AND (sommeLvl < nbPopulation) then
      begin
        construction := True;
        descriptionConstruction := 'Mine';
        nbTravail := 0;

        if lvlmine = 0 then
        begin
          nbTravailMax := 100;
        end

        else if lvlmine = 1 then
        begin
          nbTravailMax := 300;
        end

        else if lvlmine = 2 then
        begin
          nbTravailMax := 600;
        end;

        writeln('Construction lancée.');

      end

      else
      begin
        if lvlmine = 3 then
        begin
          writeln('Impossible, niveau max atteint.');
        end

        else if construction = True then
        begin
          writeln('Impossible, construction en cours.');
        end

        else if sommeLvl >= nbPopulation then
        begin
          writeln('Impossible population insuffisante.');
        end;
      end;

    end


    else if reponseEcranGestion = 3 then
    begin

      if (lvlCariere < 3) AND (construction = False) AND (sommeLvl < nbPopulation) then
      begin
        construction := True;
        descriptionConstruction := 'Carrière';
        nbTravail := 0;

        if lvlCariere = 0 then
        begin
          nbTravailMax := 50;
        end

        else if lvlmine = 1 then
        begin
          nbTravailMax := 150;
        end

        else if lvlmine = 2 then
        begin
          nbTravailMax := 300;
        end;

        writeln('Construction lancée.');

      end

      else
      begin
        if lvlmine = 3 then
        begin
          writeln('Impossible, niveau max atteint.');
        end

        else if construction = True then
        begin
          writeln('Impossible, construction en cours.');
        end

        else if sommeLvl >= nbPopulation then
        begin
          writeln('Impossible population insuffisante.');
        end;
      end;

    end


    else if reponseEcranGestion = 0 then
    begin
      ClrScr();
      quitGestion := True;
    end;


  end;

end;






Procedure ecranPrincipal();

Var
  cpttour : Integer;
  reponseEcranPrincipale : Integer;
  quitPartie : Boolean;
  nbPopulation : Integer;
  nbNourri : Integer;
  nbNourriMax : Integer;
  nbNourriParTour : Integer;
  nbTourAvantCroiss : Integer;
  nbTravailParTour : Integer;
  construction : Boolean;
  descriptionConstruction : String;
  nbTravail : Integer;
  nbTravailMax : Integer;
  lvlferme : Integer;
  lvlmine : Integer;

begin

  quitPartie := False;
  cpttour := 1;
  nbPopulation := 1;
  nbNourri := 0;
  nbNourriMax := 10;
  nbNourriParTour := 1;
  nbTourAvantCroiss := 10;
  nbTravailParTour := 1;
  construction := False;
  descriptionConstruction := '';
  lvlferme := 0;
  lvlmine := 0;

  while quitPartie = False do
  begin

    writeln('Civilisation : ');
    writeln('Ecran de gestion de la civilisation');
    writeln('Listes des villes de la civilisation :');

    affichageInfo(
        cpttour,
        reponseEcranPrincipale,
        quitPartie,
        nbPopulation,
        nbNourri,
        nbNourriMax,
        nbNourriParTour,
        nbTourAvantCroiss,
        nbTravailParTour,
        construction,
        descriptionConstruction,
        nbTravail,
        nbTravailMax,
        lvlferme,
        lvlmine);

    gotoxy(1,20);
    writeln('1 - Accéder à : Paris');
    writeln('2 - Gestion militaire et diplomatique');
    writeln('9 - Fin de tour');
    writeln('0 - Quitter la partie');

    gotoxy(25,10);
    ClrEol();
    read(reponseEcranPrincipale);

    if reponseEcranPrincipale = 9 then
    begin

      ClrScr();

      cpttour := tour(cpttour);

      nbNourri := nourriture(nbNourri, nbNourriParTour);

      if nbNourri >= nbNourriMax then
      begin

        nbPopulation := population(nbPopulation);

        nbNourriParTour := nourritureParTour(nbNourriParTour);

        nbNourri := 0;

        nbNourriMax := nourritureMax(nbPopulation, nbNourriMax);

        nbTravailParTour := travailParTour(nbTravailParTour);

        if nbNourriParTour > 0 then
        begin
          nbTourAvantCroiss := nbNourriMax div nbNourriParTour + 1;
        end;

      end;

      nbTourAvantCroiss := nbTourAvantCroissance(nbTourAvantCroiss);

      if construction = True then
      begin
        nbTravail := travail(nbTravail, nbTravailParTour);
      end;

      if nbTravail >= nbTravailMax then
      begin
        if descriptionConstruction = 'Ferme' then
        begin
          nbNourriParTour := nbNourriParTour + 3;
          nbTourAvantCroiss := nbNourriMax div nbNourriParTour + 1;  //actualisation du nombre de tour avant la croissance après nbNauuriParTour + 3
          construction := False;
          nbTravail := 0;
          lvlferme := lvlferme + 1;
        end

        else if descriptionConstruction = 'Mine' then
        begin
          nbTravailParTour := nbTravailParTour + 2;
          construction := False;
          nbTravail := 0;
          lvlmine := lvlmine + 1;
        end;

      end;

    end

    else if reponseEcranPrincipale = 1 then
    begin

      ClrScr();
      ecranGestion(
        cpttour,
        reponseEcranPrincipale,
        quitPartie,
        nbPopulation,
        nbNourri,
        nbNourriMax,
        nbNourriParTour,
        nbTourAvantCroiss,
        nbTravailParTour,
        construction,
        descriptionConstruction,
        nbTravail,
        nbTravailMax,
        lvlferme,
        lvlmine);

    end


    else if reponseEcranPrincipale = 0 then
    begin
      quitPartie := True;
    end

    else
    begin
      ClrScr();
    end;


  end;


end;






begin

  ecranPrincipal();


  readln;

end.
