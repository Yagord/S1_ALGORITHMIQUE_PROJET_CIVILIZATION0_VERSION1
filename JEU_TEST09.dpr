program JEU_TEST09;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  GestionEcran in '..\..\..\..\Desktop\GestionEcran.pas';

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
  lvlFerme : Integer;
  lvlMine : Integer;
  lvlCarriere : Integer;
  lvlCaserne : Integer);

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
    if descriptionConstruction = 'Ferme' then
    begin
      writeln('Construction : ', descriptionConstruction, ' niveau ', lvlFerme + 1);
    end
    else if descriptionConstruction = 'Mine' then
    begin
      writeln('Construction : ', descriptionConstruction, ' niveau ', lvlMine + 1);
    end
    else if descriptionConstruction = 'Carrière' then
    begin
      writeln('Construction : ', descriptionConstruction, ' niveau ', lvlCarriere + 1);
    end
    else if descriptionConstruction = 'Caserne' then
    begin
      writeln('Construction : ', descriptionConstruction, ' niveau ', lvlCaserne + 1);
    end;

    writeln('Travail accumulé : ', nbTravail, '/', nbTravailMax);
  end;


  deplacerCurseurXY(10,10);
  write('Tour : ', nbTour);
end;






Procedure gestionConstruction(lvlBatiment : Integer;
                              sommeLvl : Integer;
                              var construction : Boolean;
                              descriptionConstruction : String;
                              var nbTravail : Integer;
                              var nbTravailMax : Integer;
                              nbPopulation : Integer
                              );
begin

  deplacerCurseurXY(35,20);

  if (lvlBatiment < 3) AND (construction = False) AND (sommeLvl < nbPopulation) then
  begin
    construction := True;
    nbTravail := 0;

    if lvlBatiment = 0 then
    begin
      if descriptionConstruction = 'Ferme' then
      begin
        nbTravailMax := 20;
      end
      else if descriptionConstruction = 'Mine' then
      begin
        nbTravailMax := 100;
      end
      else if descriptionConstruction = 'Carrière' then
      begin
        nbTravailMax := 50;
      end
      else if descriptionConstruction = 'Caserne' then
      begin
        nbTravailMax := 50;
      end;
    end;

    if lvlBatiment = 1 then
    begin
      if descriptionConstruction = 'Ferme' then
      begin
        nbTravailMax := 60;
      end
      else if descriptionConstruction = 'Mine' then
      begin
        nbTravailMax := 300;
      end
      else if descriptionConstruction = 'Carrière' then
      begin
        nbTravailMax := 150;
      end
      else if descriptionConstruction = 'Caserne' then
      begin
        nbTravailMax := 150;
      end;
    end;

    if lvlBatiment = 2 then
    begin
      if descriptionConstruction = 'Ferme' then
      begin
        nbTravailMax := 200;
      end
      else if descriptionConstruction = 'Mine' then
      begin
        nbTravailMax := 600;
      end
      else if descriptionConstruction = 'Carrière' then
      begin
        nbTravailMax := 300;
      end
      else if descriptionConstruction = 'Caserne' then
      begin
        nbTravailMax := 300;
      end;
    end;

    writeln('Construction lancée !');

  end

  else
    begin
    if lvlBatiment = 3 then
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
  lvlFerme : Integer;
  lvlMine : Integer;
  lvlCarriere : Integer;
  lvlCaserne : Integer);

Var
  quitGestion : Boolean;
  reponseEcranGestion : Integer;
  //lvlFerme : Integer;
  //lvlMine : Integer;
  //lvlCarriere : Integer;
  //lvlCaserne : Integer;
  sommeLvl : Integer;

begin

  quitGestion := False;
  //lvlFerme := 0;
  //lvlMine := 0;
  //lvlCarriere := 0;
  //lvlCaserne := 0;
  sommeLvl := lvlFerme + lvlMine + lvlCarriere + lvlCaserne;

  while quitGestion = False do

  begin

    deplacerCurseurXY(0,0);
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
          lvlFerme,
          lvlMine,
          lvlCarriere,
          lvlCaserne);

    deplacerCurseurXY(1,14);
    writeln('Batiments consruits :');

    if lvlFerme > 0 then
    begin
      writeln('Ferme lvl ', lvlFerme);
    end;
    if lvlMine > 0 then
    begin
      writeln('Mine lvl ', lvlMine);
    end;
    if lvlCarriere > 0 then
    begin
      writeln('Cariere lvl ', lvlCarriere);
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

    deplacerCurseurXY(25,10);
    //ClrEol();
    read(reponseEcranGestion);

    effacerEcran();

    if reponseEcranGestion = 1 then
    begin

      descriptionConstruction := 'Ferme';
      gestionConstruction(lvlFerme,
      sommeLvl,
      construction,
      descriptionConstruction,
      nbTravail,
      nbTravailMax,
      nbPopulation)

      end


    else if reponseEcranGestion = 2 then
    begin

      descriptionConstruction := 'Mine';
      gestionConstruction(lvlMine,
      sommeLvl,
      construction,
      descriptionConstruction,
      nbTravail,
      nbTravailMax,
      nbPopulation)

    end


    else if reponseEcranGestion = 3 then
    begin

      descriptionConstruction := 'Carrière';
      gestionConstruction(lvlCarriere,
      sommeLvl,
      construction,
      descriptionConstruction,
      nbTravail,
      nbTravailMax,
      nbPopulation)

    end

    else if reponseEcranGestion = 4 then
    begin

      descriptionConstruction := 'Caserne';
      gestionConstruction(lvlCaserne,
      sommeLvl,
      construction,
      descriptionConstruction,
      nbTravail,
      nbTravailMax,
      nbPopulation)

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
  lvlFerme : Integer;
  lvlMine : Integer;
  lvlCarriere : Integer;
  lvlCaserne : Integer;

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
  lvlFerme := 0;
  lvlMine := 0;
  lvlCarriere := 0;
  lvlCaserne := 0;

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
        lvlFerme,
        lvlMine,
        lvlCarriere,
        lvlCaserne);

    deplacerCurseurXY(1,20);
    writeln('1 - Accéder à : Paris');
    writeln('2 - Gestion militaire et diplomatique');
    writeln('9 - Fin de tour');
    writeln('0 - Quitter la partie');

    deplacerCurseurXY(25,10);
    //ClrEol();
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
        if descriptionConstruction = 'Ferme' then
        begin
          nbNourriParTour := nbNourriParTour + 3;
          nbTourAvantCroiss := nbNourriMax div nbNourriParTour + 1;  //actualisation du nombre de tour avant la croissance après nbNauuriParTour + 3
          construction := False;
          nbTravail := 0;
          lvlFerme := lvlFerme + 1;
        end

        else if descriptionConstruction = 'Mine' then
        begin
          nbTravailParTour := nbTravailParTour + 2;
          construction := False;
          nbTravail := 0;
          lvlMine := lvlMine + 1;
        end

        else if descriptionConstruction = 'Carrière' then
        begin
          nbTravailParTour := nbTravailParTour + 2;
          construction := False;
          nbTravail := 0;
          lvlCarriere := lvlCarriere;
        end

        else if descriptionConstruction = 'Caserne' then
        begin
          construction := False;
          nbTravail := 0;
          lvlCaserne := lvlCaserne + 1;
        end;

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
        lvlFerme,
        lvlMine,
        lvlCarriere,
        lvlCaserne);

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
