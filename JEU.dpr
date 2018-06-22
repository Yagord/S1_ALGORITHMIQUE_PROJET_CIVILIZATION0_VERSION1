program JEU;

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

  writeln('Civilisation : ');
  writeln('Ecran de gestion de la civilisation');
  writeln('Listes des villes de la civilisation :');
  writeln('Nom : ', nom());
  writeln('Population : ', nbPopulation);
  writeln('Nourriture : ', nbNourri, '/', nbNourriMax);
  writeln('Nourriture par tour : ', nbNourriParTour);
  writeln('Nb tours avant croissance : ', nbTourAvantCroiss);
  writeln('Travail par tour : ', nbTravail);

  gotoxy(10,10);
  write('Tour : ', cpttour);

  gotoxy(1,20);
  writeln('1 - Accéder à : Paris');
  writeln('2 - Gestion militaire et diplomatique');
  writeln('9 - Fin de tour');
  writeln('0 - Quitter la partie');


  while quitPartie = False do
  begin

    gotoxy(25,10);
    ClrEol();
    read(reponseEcranPrincipale);

    if reponseEcranPrincipale = 9 then
    begin

      gotoxy(10,10);
      ClrEol();
      cpttour := tour(cpttour);
      write('Tour : ', cpttour);

      gotoxy(1,6);
      ClrEol();
      nbNourri := nourriture(nbNourri, nbNourriParTour);
      writeln('Nourriture : ', nbNourri, '/', nbNourriMax);

      if nbNourri = nbNourriMax then
      begin

        gotoxy(1,5);
        ClrEol();
        nbPopulation := population(nbPopulation);
        write('Population : ', nbPopulation);
        gotoxy(1,7);
        ClrEol();
        nbNourriParTour := nourritureParTour(nbNourriParTour);
        write('Nourriture par tour : ', nbNourriParTour);
        gotoxy(1,6);
        ClrEol();
        nbNourri := 0;
        nbNourriMax := nourritureMax(nbPopulation, nbNourriMax);
        writeln('Nourriture : ', nbNourri, '/', nbNourriMax);
        gotoxy(1,9);
        ClrEol();
        nbTravail := travailParTour(nbTravail);
        writeln('Travail par tour : ', nbTravail);
      end;

      gotoxy(1,8);
      ClrEol();
      if nbNourriParTour > 0  then
      begin
        nbTourAvantCroiss := nbTourAvantCroissance(nbTourAvantCroiss);
        write('Nb tours avant croissance : ', nbTourAvantCroiss);
      end
      else
      begin
        write('Aucune croissance.');
        croissance := False;
      end;

    end

    else if reponseEcranPrincipale = 1 then
    begin
      ClrScr();
      ecranGestion();

    end


    else if reponseEcranPrincipale = 0 then
    begin
      quitPartie := True;
    end

    else
    begin
      gotoxy(25,10);
      ClrEol();
    end;


  end;


end;


Procedure ecranGestion();


begin
  writeln('Civilisation : ');
  writeln('Ecran de gestion de la civilisation');
  writeln('Listes des villes de la civilisation :');
  writeln('Nom : ', nom());
  writeln('Population : ', nbPopulation);
  writeln('Nourriture : ', nbNourri, '/', nbNourriMax);
  writeln('Nourriture par tour : ', nbNourriParTour);
  writeln('Nb tours avant croissance : ', nbTourAvantCroiss);
  writeln('Travail par tour : ', nbTravail);

  gotoxy(10,10);
  write('Tour : ', cpttour);

  gotoxy(1,20);
  writeln('1 - Accéder à : Paris');
  writeln('2 - Gestion militaire et diplomatique');
  writeln('9 - Fin de tour');
  writeln('0 - Quitter la partie');
end;


begin

  ecranPrincipal();


  readln;

end.
