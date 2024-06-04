USE PortfolioProject;

-- The database includes data related to the Covid 19 epidemic such as the number of infections, the number of deaths, or the number of people vaccinated, etc.
-- The data was collected from 210 countries and territories around the world, starting from January 1, 2020 to April 30, 2022 which was the period when the Covid-19 pandemic broke out and was at its most complex.
-- 1. What is the percentage of the number of deaths to the number of infections worldwide?
SELECT
	SUM(new_cases) AS total_cases,
	SUM(CAST(new_deaths AS INT)) AS total_deaths,
	SUM(CAST(new_deaths AS INT)) / SUM(New_Cases) * 100 AS DeathPercentage
FROM
	CovidDeaths
WHERE
	continent IS NOT NULL
ORDER BY
	1,
	2;

-- 2. What is the total number of deaths per continent?
SELECT
	continent,
	SUM(CAST(new_deaths AS INT)) AS TotalDeathCount
FROM
	CovidDeaths
WHERE
	continent IS NOT NULL
GROUP BY
	continent
ORDER BY
	TotalDeathCount DESC;

-- 3. What is the percentage of population infected per country?
SELECT
	Location,
	Population,
	MAX(total_cases) AS HighestInfectionCount,
	MAX((total_cases / population)) * 100 AS PercentPopulationInfected
FROM
	CovidDeaths
WHERE
	continent IS NOT NULL
GROUP BY
	Location,
	Population
ORDER BY
	PercentPopulationInfected DESC;

-- 4. What is the percentage of population infected per day per country?
SELECT
	Location,
	Population,
	DATE,
	MAX(total_cases) AS HighestInfectionCount,
	MAX((total_cases / population)) * 100 AS PercentPopulationInfected
FROM
	CovidDeaths
WHERE
	continent IS NOT NULL
GROUP BY
	Location,
	Population,
	DATE
ORDER BY
	PercentPopulationInfected DESC;