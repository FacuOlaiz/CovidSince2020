--Exclusi�n de continentes dentro de columna de paises
WITH CovidSince2020 (Continent, Location, date, population, new_cases, new_deaths, new_tests, new_vaccinations, median_age, aged_65_older, aged_70_older, female_smokers,
male_smokers, life_expectancy, Continente)
as
(
SELECT Continent, Location, date, population, new_cases, new_deaths, new_tests, new_vaccinations, median_age, aged_65_older, aged_70_older, female_smokers,
male_smokers, life_expectancy,
--valores null dentro de continente se renombrar seg�n pa�s y se renombra la col continent por Continente
isnull(Continent, location) as Continente
FROM PortfolioProject_Covid..CovidSince2020
)

--Se filtra tabla para crear vista final
SELECT Continente, Location as Pa�s, date as Fecha, population as Poblaci�n, new_cases as NuevosCasos, new_deaths as NuevasMuertes, new_tests as NuevosTests,
new_vaccinations as NuevosVacunados, median_age as EdadMedia, aged_65_older as MayoresDe65A�os, aged_70_older as MayoresDe70A�os, female_smokers as Fumadoras, male_smokers as Fumadores,
life_expectancy as EsperanzaDeVida FROM CovidSince2020
WHERE location <> continente
ORDER BY Location

--Creaci�n de vista para visualizar en PowerBI
CREATE VIEW tCovidSince2020 as
WITH CovidSince2020 (Continent, Location, date, population, new_cases, new_deaths, new_tests, new_vaccinations, median_age, aged_65_older, aged_70_older, female_smokers,
male_smokers, life_expectancy, Continente)
as
(
SELECT Continent, Location, date, population, new_cases, new_deaths, new_tests, new_vaccinations, median_age, aged_65_older, aged_70_older, female_smokers,
male_smokers, life_expectancy,
isnull(Continent, location) as Continente
FROM PortfolioProject_Covid..CovidSince2020
)
SELECT Continente, Location as Pa�s, date as Fecha, population as Poblaci�n, new_cases as NuevosCasos, new_deaths as NuevasMuertes, new_tests as NuevosTests,
new_vaccinations as NuevosVacunados, median_age as EdadMedia, aged_65_older as MayoresDe65A�os, aged_70_older as MayoresDe70A�os, female_smokers as Fumadoras, male_smokers as Fumadores,
life_expectancy as EsperanzaDeVida FROM CovidSince2020
WHERE location <> continente