with dates as (

    select * from {{ ref('date_wise_cases') }}

),

stat as (
    select Year(cast(date as datetime)) as year,
    MONTHNAME(cast(date as datetime)) as month,
    location,
    max(dates.Case_Recovered_Rate) as Case_Recovered_Rate,
    max(Growth_Factor_of_New_Cases) as Growth_Factor_of_New_Cases,	
    max(Growth_Factor_of_New_Deaths) as Growth_Factor_of_New_Deaths,
    max(dates.Total_Cases_per_Million) as Total_Cases_per_Million,
    max(dates.Total_Deaths_per_Million) as Total_Deaths_per_Million,
    max(dates.New_Deaths_per_Million) as New_Deaths_per_Million,
    max(dates.Case_Fatality_Rate) as Case_Fatality_Rate
     from dates group by month,location,year
)


select * from stat