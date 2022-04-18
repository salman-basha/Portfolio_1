/*
Covid 19 Data Exploration 
Skills used: Joins, Windows Functions, Aggregate Functions, Converting Data Types
*/


/* select * 
from `portfolioproject1-346013.covid.covid_death` */

/* select * 
from `portfolioproject1-346013.covid.covid_vaccination` */

/* select * 
from `portfolioproject1-346013.covid.covid_death` order by 3,4 */

/* select * 
from `portfolioproject1-346013.covid.covid_vaccination` 
order by 3,4 */

--SELECT DATA THAT WE ARE GOING TO BE USING 
--COVID DEATHS FILE.

/* select Location, date,total_cases, new_cases,total_deaths,population
from `portfolioproject1-346013.covid.covid_death` 
order by 1,2 */

-- LOOKING AT TOTAL CASES VS TOTAL DEATHS

/* select Location, date,total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_percentage
from `portfolioproject1-346013.covid.covid_death` 
order by 1,2 */

-- LOOKING AT TOTAL CASES VS TOTAL DEATHS
--SHOWS LIKELIHOOD  OF DYING IF YOU CONTRACT COVID IN YOUR COUNTRY

/* select Location, date,total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_percentage
from `portfolioproject1-346013.covid.covid_death` 
where location like '%States%' 
order by 1,2 */

-- LOOKING AT TOTAL CASES VS POPULATION
-- SHOWS WHAT PERCENTAGEBOF POPULATION GOT COVID

/* select Location, date, population,total_cases,(total_cases/population)*100 as Death_percentage
from `portfolioproject1-346013.covid.covid_death` 
where location like '%States%' 
order by 1,2 */

/* select Location, date, population,total_cases,(total_cases/population)*100 as Death_percentage
from `portfolioproject1-346013.covid.covid_death` 
--where location like '%States%' 
order by 1,2 */

-- LOOKING AT COUNTRIES WITH HEIGHEST INFECTION RATE COMPARED TO POPULATION

/*select Location, population, MAX(total_cases) AS Highest_Infection_Country,MAX(total_cases/population)*100 as Percent_Population_Infected
from `portfolioproject1-346013.covid.covid_death` 
--where location like '%States%' 
group by  location,population
order by 1,2 */

/*select Location, population, MAX(total_cases) AS Highest_Infection_Country,MAX(total_cases/population)*100 as Percent_Population_Infected
from `portfolioproject1-346013.covid.covid_death` 
--where location like '%States%' 
group by  location,population
order by Percent_Population_Infected desc */

-- SHOWING COUNTRIES WITH HIGHEST DEATH COUNT PER POPULATION ----

/*select Location, MAX(total_deaths) as TotalDeathCount
from `portfolioproject1-346013.covid.covid_death`
group by location
order by TotalDeathCount desc */

/* select Location, MAX(cast(total_deaths AS int)) AS  TotalDeathCount
from `portfolioproject1-346013.covid.covid_death`
group by location
order by TotalDeathCount desc */


/* select Location, MAX(cast(total_deaths AS int)) AS  TotalDeathCount
from `portfolioproject1-346013.covid.covid_death`
where continent is not null 
group by location
order by TotalDeathCount desc */

--LET'S BREAK THINGS DOWN BY CONTINENT

/* select continent, MAX(cast(total_deaths AS int)) AS  TotalDeathCount
from `portfolioproject1-346013.covid.covid_death`
where continent is not null 
group by continent
order by TotalDeathCount desc */

/* select Location, MAX(cast(total_deaths AS int)) AS  TotalDeathCount
from `portfolioproject1-346013.covid.covid_death`
where continent is null 
group by location
order by TotalDeathCount desc */

-- SHOWING CONTINENTS WITH THE HIGHEST DEATH COUNT PER POPULATION

/* select continent, MAX(cast(total_deaths AS int)) AS  TotalDeathCount
from `portfolioproject1-346013.covid.covid_death`
where continent is not null 
group by continent
order by TotalDeathCount desc */

-- GLOBAL NUMBERS

/* select Location, date,total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_percentage
from `portfolioproject1-346013.covid.covid_death` 
--where location like '%States%' 
where continent is not null 
order by 1,2 */

/*select date,total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_percentage
from `portfolioproject1-346013.covid.covid_death` 
--where location like '%States%' 
where continent is not null
order by 1,2 */

/* select date,sum(new_cases) as SumOfNewCases  --, total_deaths, (total_deaths/total_cases)*100 as Death_percentage
from `portfolioproject1-346013.covid.covid_death` 
--where location like '%States%' 
where continent is not null
group by date
order by 1,2 */

 /*select 
    date, sum(new_cases) as SumOfNewCases ,
    sum(cast(new_deaths as int)) as SumOfNewDeaths
    from `portfolioproject1-346013.covid.covid_death` 
    --where location like '%States%' 
    where continent is not null
    group by date 
    order by 1,2 */

/* select 
    date, sum(new_cases) as SumOfNewCases ,
    sum(cast(new_deaths as int)) as SumOfNewDeaths, 
    sum(new_deaths)/sum(new_cases)*100 as Death_percentage
    from `portfolioproject1-346013.covid.covid_death` 
    --where location like '%States%' 
    where continent is not null
    group by date 
    order by 1,2 */



/* select 
    date, sum(new_cases) as SumOfNewCases ,
    sum(cast(new_deaths as int)) as SumOfNewDeaths, 
    sum(cast(new_deaths as int))/sum(new_cases)*100 as Death_percentage
    from `portfolioproject1-346013.covid.covid_death` 
    --where location like '%States%' 
    where continent is not null
    group by date 
    order by 1,2 */

--table 1

/* select 
    sum(new_cases) as Total_Cases ,
    sum(cast(new_deaths as int)) as Total_Deaths, 
    sum(cast(new_deaths as int))/sum(new_cases)*100 as Death_percentage
    from `portfolioproject1-346013.covid.covid_death` 
    --where location like '%States%' 
    where continent is not null
    --group by date 
    order by 1,2 */


--table 2 
/*
    select location,sum(cast(new_deaths as int)) as Total_Death_Count
    from `portfolioproject1-346013.covid.covid_death`
    where continent is null and 
    location not in ('World','European Union','International','Upper middle income','Lower middle income','High income','Low income')
    group by location
    order by Total_Death_Count desc */

--table 3

 /*  select location, population,max(total_cases) as Highest_Infection_Count, max((total_cases/population))*100 as Percent_Population_Infected
    from `portfolioproject1-346013.covid.covid_death`
    group by location, population
    order by Percent_Population_Infected desc 
*/

--table 4

/*   
   select location, population, date ,max(total_cases) as Highest_Infection_Count, max((total_cases/population))*100 as Percent_Population_Infected
    from `portfolioproject1-346013.covid.covid_death`
    group by location, population,date
    order by Percent_Population_Infected desc 
*/


--SELECT DATA THAT WE ARE GOING TO BE USING 
--COVID VACCINATION & COVID DEATHS FILE.
--NOW JOIN THESE TWO TABLES
 
--select * from `portfolioproject1-346013.covid.covid_vaccination`

--select * from `portfolioproject1-346013.covid.covid_death` 

/* select *
from `portfolioproject1-346013.covid.covid_death`  deaths
join `portfolioproject1-346013.covid.covid_vaccination`  vaccine
on (deaths.Location = vaccine.Location
and deaths.date = vaccine.date) */

-- LOOKING AT TOTAL POPULATION VS VACCINATION

/* select deaths.continent,deaths.location,deaths.date, deaths.population,vaccine.new_vaccinations 
from `portfolioproject1-346013.covid.covid_death`  deaths
join `portfolioproject1-346013.covid.covid_vaccination`  vaccine
on (deaths.Location = vaccine.Location
and deaths.date = vaccine.date) */

-- NOW LOOK FOR BETTER VIEW

/* select deaths.continent,deaths.location,deaths.date, deaths.population,vaccine.new_vaccinations 
from `portfolioproject1-346013.covid.covid_death`  deaths
join `portfolioproject1-346013.covid.covid_vaccination`  vaccine
    on (deaths.Location = vaccine.Location 
    and deaths.date = vaccine.date)
where deaths.continent is not null 
order by 1,2,3 */

/* select deaths.continent,deaths.location,deaths.date, deaths.population,vaccine.new_vaccinations 
from `portfolioproject1-346013.covid.covid_death`  deaths
join `portfolioproject1-346013.covid.covid_vaccination`  vaccine
    on (deaths.Location = vaccine.Location 
    and deaths.date = vaccine.date)
where deaths.continent is not null 
order by 2,3 */

/* select deaths.continent,deaths.location,deaths.date, deaths.population,vaccine.new_vaccinations,
    sum(cast(vaccine.new_vaccinations as int)) over(partition by deaths.location)
from `portfolioproject1-346013.covid.covid_death`  deaths
join `portfolioproject1-346013.covid.covid_vaccination`  vaccine
    on (deaths.Location = vaccine.Location 
    and deaths.date = vaccine.date)
where deaths.continent is not null 
order by 2,3 */

/* select deaths.continent,deaths.location,deaths.date, deaths.population,vaccine.new_vaccinations,
    sum(cast(vaccine.new_vaccinations as int)) over(partition by deaths.location order by deaths.location,deaths.date) AS RollingPeopleVaccinated
from `portfolioproject1-346013.covid.covid_death`  deaths
join `portfolioproject1-346013.covid.covid_vaccination`  vaccine
    on (deaths.Location = vaccine.Location 
    and deaths.date = vaccine.date)
where deaths.continent is not null 
order by 2,3 
*/
