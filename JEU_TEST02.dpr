program JEU_TEST02;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Crt32 in '..\..\..\..\Desktop\consoleDemoUnicodeDelphi\Crt32.pas';


Function nom() : String;

begin
  Result := 'Paris';
end;

{Function population(nbPopulation) : Integer;

begin
  Result := nbPopulation + 1;
end;}

Function nourriture(nbNourri : Integer ; nbNourriParTour : Integer) : Integer;


begin
  nbNourri := nbNourri + nbNourriParTour;
  Result := nbNourri;
end;

{Function nourritureParTour() : Integer;

begin

end;}

Procedure nbTourAvantCroissance(var nbTourAvantCroiss : Integer ; nbNourriParTour : Integer);

begin

  if nbNourriParTour > 0 then
  begin
    nbTourAvantCroiss := nbTourAvantCroiss - 1;
  end

  else
  begin
    writeln('Aucune croissance.');
  end;

end;

Function tour(nbTour : Integer) : Integer;

begin
  nbTour := nbTour + 1;
  Result := nbTour;
end;


Procedure ecranPrincipal();

Var
  cpttour : Integer;
  reponseEcranPrincipale : Integer;
  quitPartie : Boolean;
  population : Integer;
  nbNourri : Integer;
  nbNourriParTour : Integer;
  nbTourAvantCroiss : Integer;
  travail : Integer;

begin

  quitPartie := False;
  cpttour := 1;
  population := 1;
  nbNourri := 0;
  nbNourriParTour := 0;
  nbTourAvantCroiss := 10;
  travail := 1;

  writeln('Civilisation : ');
  writeln('Ecran de gestion de la civilisation');
  writeln('Listes des villes de la civilisation :');
  writeln('Nom : ', nom());
  writeln('Population : ', population);
  writeln('Nourriture : ', nbNourri);
  writeln('Nourriture par tour : ', nbNourriParTour);
  writeln('Nb tours avant croissance : ', nbTourAvantCroiss);
  writeln('Travail par tour : ', travail);

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
      cpttour := tour(cpttour);
      gotoxy(10,10);
      ClrEol();
      write('Tour : ', cpttour);

      nbNourri := nourriture(nbNourri, nbNourriParTour);
      gotoxy(1,6);
      ClrEol();
      write('Nourriture : ', nbNourri);

      gotoxy(1,8);
      ClrEol();
      nbTourAvantCroissance(nbTourAvantCroiss, nbNourriParTour);
      write('Nb tours avant croissance : ', nbTourAvantCroiss);

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



begin

  ecranPrincipal();


  readln;

end.
