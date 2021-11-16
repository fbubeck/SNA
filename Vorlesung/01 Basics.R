

## ========================================================##
##                                                        ##
##   R basics                                             ##
##   dhbw R workshop by Philipp Mendoza                   ##
##                                                        ##
##   Email: p.m.mendoza@uva.nl                            ##
##   Twitter: @philipp_mendoza                            ##
##                                                        ##
## ========================================================##


## --------------------------------------------------------------------------------------------------------------------------------------------------------------
5 + 6 # Wir addieren zwei Zahlen
5 * 6 # oder multiplizieren diese
10 - 2 * (1 + 2) # Klammer vor Punkt vor Strich
5^2 # Potenzieren
sqrt(25) # Wurzelziehen
log(32) # Logarithmieren (ln)
exp(2) # Exponieren (e^)

1 < 2 # Ist 1 kleiner als 2?
"R" == "schwierig" # Ist R schwierig?



## --------------------------------------------------------------------------------------------------------------------------------------------------------------
x <- 5 + 6 # Ergebnis wird in x gespeichert
x # Aufrufen des Objekts
(x <- 5 + 6) # Zuweisen + Anzeigen des Ergebnisses
y <- 5 * 6 # Ergebnis wird in y gespeichert
x + y # Mit den Objekten können wir weiterrechnen
x + y # Leerzeichen erhöhen die Übersichtlichkeit
z <- x + y # Zuweisung
z # Evaluierung

rm(z) # Remove z: löscht das Objekt.
z # Fehler!

## --------------------------------------------------------------------------------------------------------------------------------------------------------------
2 == 2 # Gleichheit
2 != 2 # Ungleichheit
x <= y # kleiner oder gleich: "<", ">" und ">=" funktionieren auch

class("Character")
class(1)
class(T)
class(list(1,"asdf"))


## --------------------------------------------------------------------------------------------------------------------------------------------------------------
# NA - fehlende oder undefinierte Daten
5 + NA # Wenn in einem Ausdruck verwendet, ist das Ergebnis im Allgemeinen NA
is.na(5 + NA) # Prüfen, ob missing



# NULL - ein leeres Objekt, z.B. eine null/leere Liste
10 + NULL # use liefert ein leeres Objekt (Länge Null)
is.null(NULL) # prüfen, ob NULL




## --------------------------------------------------------------------------------------------------------------------------------------------------------------
5 / 0
is.finite(5 / 0) # Prüfen Sie, ob eine Zahl endlich ist (ist sie nicht).


## --------------------------------------------------------------------------------------------------------------------------------------------------------------
0 / 0
is.nan(0 / 0)


## --------------------------------------------------------------------------------------------------------------------------------------------------------------
x <- 2 # Ein (numerischer) Vektor der Länge 1
x <- NA # Überschreiben des Werts: leere Menge

x <- c(1, 2, 2, 1, 2, 1) # Erzeugen eines Vektors
length(x) # Wie viele Elemente hat x?
class(x) # Welche "Klasse" hat x?

y <- c(3, 4, 2, 2, 1, 3) # Ein Vektor selber Länge

x * 2 # Multiplikation mit einem "Skalar"
x + y # Elementweise Addition der Vektoren


## --------------------------------------------------------------------------------------------------------------------------------------------------------------
x1 <- c(1, 2, 2) # Numeric
x2 <- c("a", "b", "c") # Character
x3 <- c(TRUE, FALSE, FALSE) # Logical
x4 <- c(1, FALSE, TRUE) # Gemischt -> ?
x5 <- c(1, "b", FALSE) # Gemischt -> ?

class(x1) # Und von welchem Datentyp sind x4 und x5 ?
str(x1) # informativer als class() ist str() "structure"


## --------------------------------------------------------------------------------------------------------------------------------------------------------------
1:10 # Erzeugt eine Zahlenfolge von 1 bis 10
seq(from = 1945, to = 2015, by = 5) # allgemeiner



letters # erzeugt die Buchstaben des Alphabets
length(letters) # Wie viele Buchstaben hat es?

rep("a", 10) # wir können auch Werte wiederholen
rep(c(1, 2), 10) # der Vektor c(1,2) wird 10 Mal wh
rep(2:4, 1:3) # 2,3,4 werden 1,2,3 mal wh

paste("x", 1:6) # Elementweise Verbindung
paste("x", 1:6, sep = "") # Ohne Leerzeichen


## --------------------------------------------------------------------------------------------------------------------------------------------------------------
abc <- letters
abc[1] # der erste Buchstabe des Alphabets
abc[2:3] # der zweite und der dritte Buchstabe
abc[c(1, 3:6)] # auch eine Auswahl

jahr <- 1990:2015 # Folge von 1990 bis 2015
jahr[10:15] # Der 10. bis 15. Eintrag

geschl <- c("m", "m", "w", "m", "W", "w")
geschl == "m" # Logischer Vektor, Länge wie `geschl`
which(geschl == "m") # Indices der Einträge "m"


## --------------------------------------------------------------------------------------------------------------------------------------------------------------
abc <- letters
abc[1] # der erste Buchstabe des Alphabets
abc[1] <- "z" # Alphabet beginnt ab sofort mit "z"
abc[length(abc)] <- "a" # und endet mit "a"
abc

jahr <- 1990:2015 # Wieder die Jahreszahlen
jahr[jahr > 2000] # Nur die Jahre nach 2000
(jahre.ab2001 <- jahr[jahr > 2000]) # Ein neuer Vektor

geschl <- c("m", "m", "w", "m", "g", "w") # Tippfehl.
geschl[geschl == "g"] # Adressierung dieses Eintrags
geschl[geschl == "g"] <- "w" # Korrektur


## Erster Schritt zu Matritzen --------------------------------------------------------------------------------------------------------------------------------------------------------------
x1 <- 1:5 # Erzeugen eines Vektors.
x2 <- 6:10 # Ein zweiter Vektor selber Länge.
x3 <- 11:15 # Noch ein dritter Vektor
x4 <- 16:20 # Und noch ein Vektor

cbind(x1, x2, x3, x4) # cbind(): spaltenweise Verb.
rbind(x1, x2, x3, x4) # rbind(): zeilenweise Verb.


## Matritzen / Data frames --------------------------------------------------------------------------------------------------------------------------------------------------------------
mat <- cbind(x1, x2, x3, x4) # spaltenweise Verbindung
mat
nrow(mat) # wie viele Zeilen?
ncol(mat) # wie viele Spalten?
dim(mat) # Welche Dimension?

mat[1, 1] # Element der 1. Zeile / 1. Spalte
mat[2, 1] # Element in der 2. Zeile / 1. Spalte
mat[3, 2] # Element in der 3. Zeile / 2. Spalte

mat[3, ] # Elemente der 3. Zeile
mat[, 4] # Elemente der 4. Spalte
mat[1:3, 4] # E. der 1. bis 3. Zeile / 4. Spalte


## --------------------------------------------------------------------------------------------------------------------------------------------------------------
id <- 1:6 # Immer gut: eine ID
alter <- c(32, 43, 54, 65, 76, 89) # Alter in J
geschl <- c("m", "w", "w", "m", "w", "w") # m/w
einst <- c(.6, .5, .6, .5, .4, .3) # Einstell. [0,1]
gesund <- c(1, 2, 1, 1, 2, 3) # Gesundh. [1:+, 2:~, 3:-]

df <- data.frame(id, alter, geschl, einst, gesund)

summary(df) # Kompakte Beschreibung der Daten
View(df) # Sehen wir uns den Datensatz an

skimr::skim(df)

## --------------------------------------------------------------------------------------------------------------------------------------------------------------
df[, 1] # Elemente der ersten Spalte
df$alter # Vektor der das Alter enthält
df$alter[2] # Alter des zweiten Falls

mean(df$alter) # das arithmet. Mittel (gesamt)
table(df$geschl) # Eine Tabelle für Geschlecht

df$alter[df$geschl == "w"] # Alter der Frauen
mean(df$alter[df$geschl == "w"]) # Mittel (Frauen)


## --------------------------------------------------------------------------------------------------------------------------------------------------------------
ls() # Erzeugt eine Liste der Objekte im Workspace
rm(list = ls()) # Remove Funktion zum Löschen von Objekten

x1 <- 1
x2 <- "bla"
x3 <- TRUE # div. Objekte
rm(x1) # Löschen einzelner Objekte

rm(list = ls()) # Löschen sämtlicher Objekte


## Hilfe? ---------------------------------------------------------------------------------------------------------------------------------------------------
mean() # In R Studio: Drücken von `Tab`innerh. Klammer

?help # Hilfe zur Hilfe
?mean # z.B. Hilfe zum Mittelwert
??ggplot
??mean # Suche in den Hilfeseiten

help.start() # Starthilfe

hist(alter)
