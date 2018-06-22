program JEU_TEST05;

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


Function travailParTour(nbTravail : Integer) : Integer;

begin
  Result := nbTravail + 1;
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
  nbTravail : Integer;
  croissance : Boolean);

Var
  quitGestion : Boolean;

begin
  writeln('Civilisation : ');
  writeln('Vue détaillée de : ', nom());
  writeln('Listes des villes de la civilisation :');
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
  writeln('Travail par tour : ', nbTravail);

  gotoxy(10,10);
  write('Tour : ', nbTour);

  gotoxy(1,20);
  writeln('1 - Construire la ferme');
  writeln('2 - Construire la mine');
  writeln('3 - Construire la carrière');
  writeln('4 - Construire la caserne');

  writeln('0 - Retour au menu');

  quitGestion := False;

  while quitGestion = False do
  begin
    read(reponseEcranPrincipale);
    if reponseEcranPrincipale = 0 then
    begin
      ClrScr();
      quitGestion := True;
    end;

  end;
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
  nbTravail : Integer;
  croissance : Boolean);

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
  writeln('Travail par tour : ', nbTravail);

  gotoxy(10,10);
  write('Tour : ', nbTour);
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
  nbTravail : Integer;
  croissance : Boolean;

begin

  quitPartie := False;
  cpttour := 1;
  nbPopulation := 1;
  nbNourri := 0;
  nbNourriMax := 10;
  nbNourriParTour := 1;
  nbTourAvantCroiss := 10;
  nbTravail := 1;
  croissance := True;


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
        nbTravail,
        croissance);

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

      if nbNourri = nbNourriMax then
      begin

        nbPopulation := population(nbPopulation);

        nbNourriParTour := nourritureParTour(nbNourriParTour);

        nbNourri := 0;

        nbNourriMax := nourritureMax(nbPopulation, nbNourriMax);

        nbTravail := travailParTour(nbTravail);

      end;

      nbTourAvantCroiss := nbTourAvantCroissance(nbTourAvantCroiss);

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
        nbTravail,
        croissance);

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
