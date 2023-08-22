select * from CovidDeaths 

select * from CovidVaccinations 


-- 2) Total de casos e total de mortes por país

	select sum(new_cases) from CovidDeaths 

	select location, sum(new_deaths) as mortes_por_pais from CovidDeaths 
	group by 1 order by mortes_por_pais desc
	
	
	
	-- 3) Probabilidade de morrer se contrair covid em cada país
	
	with ac as (select location, sum(new_deaths) as total_mortes, sum(new_cases) as total_casos 
	from CovidDeaths group by location)
	select total_casos / toal_mortes from CovidDeaths 

	
	
	-- 4) Total de casos e total de população por país

	select location, sum(population) as populacao, sum(new_cases) as total_casos 
	from CovidDeaths group by 1 

	
	
	-- 5) Probabilidade de se infectar com Covid por país
	
	with ab as(select location, population, sum(new_cases) as qtd_casos 
	from CovidDeaths group by 1)
	select qtd_casos / population from ab
	
	
	
	-- 6) Países com maior taxa de infecção
	
	select location, round(avg(reproduction_rate), 2) as taxa_infeccao from CovidDeaths 
	group by 1 order by taxa_infeccao desc

	
	
	-- 7) Países com maior taxa de morte
	
	select location, round(avg(new_deaths_per_million), 2) as taxa_morte from CovidDeaths 
	group by 1 order by taxa_morte desc
	
	
	
	-- 8) Continentes com maior taxa de morte
	
	select continent, round(avg(new_deaths_per_million), 2) as taxa_morte from CovidDeaths 
	group by 1 order by taxa_morte desc
	
	
	
	-- 9) População total VS Vacinações: Porcentagem da população que recebeu pelo menos uma vacina
	
	with ad as(select * from CovidDeaths inner join CovidVaccinations 
	on covidDeaths.iso_code = CovidVacinations.iso_code)
	select total_vaccinations / population from ad
	
	

	
	
	-- 10) Crie uma view para armazenar dados para visualizações posteriores
	
	Create view vw_1 as 
	select location, sum(new_deaths) as mortes_por_pais from CovidDeaths 
	group by 1 order by mortes_por_pais desc
	
	

	
	

	
	
	
	





