program JEU_TEST07;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  GestionEcran in '..\..\..\..\Desktop\GestionEcran.pas',
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
  nbNourri := nbNourri + nbNourriParTour;
  Result := nbNourri;
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
  nbTourAvantCroiss := nbTourAvantCroiss - 1;
  Result := nbTourAvantCroiss;
end;


Function tour(nbTour : Integer) : Integer;

begin
  nbTour := nbTour + 1;
  Result := nbTour;
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
  lvlferme : Integer);

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

  deplacerCurseurXY(1,12);
  if construction = False then
  begin
    writeln('Pas de construction.');
  end
  else
  begin
    writeln('Construction : ', descriptionConstruction, ' niveau ', lvlferme + 1);
    writeln('Travail accumulé : ', nbTravail, '/', nbTravailMax);
  end;


  deplacerCurseurXY(10,10);
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
  lvlferme : Integer);

Var
  quitGestion : Boolean;
  reponseEcranGestion : Integer;
  //lvlFerme : Integer;
  lvlMine : Integer;
  lvlCariere : Integer;
  lvlCaserne : Integer;

begin

  quitGestion := False;
  //lvlFerme := 0;
  lvlMine := 0;
  lvlCariere := 0;
  lvlCaserne := 0;

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
        lvlferme);

  deplacerCurseurXY(1,13);
  writeln('Batiments consruits :');

  if lvlFerme > 0 then
  begin
    writeln('Ferme lvl ', lvlFerme);
  end;
  if lvlMine > 0 then
  begin
    writeln('Ferme lvl ', lvlMine);
  end;
  if lvlCariere > 0 then
  begin
    writeln('Cariere lvl ', lvlCariere);
  end;
  if lvlCaserne > 0 then
  begin
    writeln('Caserne lvl ', lvlCaserne);
  end;

  deplacerCurseurXY(1,20);
  writeln('1 - Construire la ferme');
  writeln('2 - Construire la mine');
  writeln('3 - Construire la carrière');
  writeln('4 - Construire la caserne');

  writeln('0 - Retour au menu');






  while quitGestion = False do

  begin

    deplacerCurseurXY(25,10);
    ClrEol();
    read(reponseEcranGestion);


    if reponseEcranGestion = 1 then
    begin

      if (lvlferme < 3) AND (construction = False) then
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
          writeln('lvl max atteint.');
        end

        else if construction = True then
        begin
          writeln('Impossible, construction en cours.');
        end;
      end;

      end


    else if reponseEcranGestion = 0 then
    begin
      effacerEcran();
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
        lvlferme);

    deplacerCurseurXY(1,20);
    writeln('1 - Accéder à : Paris');
    writeln('2 - Gestion militaire et diplomatique');
    writeln('9 - Fin de tour');
    writeln('0 - Quitter la partie');

    deplacerCurseurXY(25,10);
    ClrEol();
    read(reponseEcranPrincipale);

    if reponseEcranPrincipale = 9 then
    begin

      effacerEcran();

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
        nbNourriParTour := nbNourriParTour + 3;
        nbTourAvantCroiss := nbNourriMax div nbNourriParTour + 1;  //actualisation du nombre de tour avant la croissance après nbNauuriParTour + 3
        construction := False;
        nbTravail := 0;
        lvlferme := lvlferme + 1;
      end;

    end

    else if reponseEcranPrincipale = 1 then
    begin

      effacerEcran();
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
        lvlferme);

    end


    else if reponseEcranPrincipale = 0 then
    begin
      quitPartie := True;
    end

    else
    begin
      effacerEcran();
    end;


  end;


end;






begin

  ecranPrincipal();


  readln;

end.
