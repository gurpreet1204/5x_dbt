with dates as (

    select * from {{ ref('date_wise_cases') }}

),

monthly_data as (

    select Year(cast(date as datetime)) as year,
    MONTHNAME(cast(date as datetime)) as month,
    location,
    max(dates.total_cases) as total_cases,
    max(dates.total_deaths) as total_deaths,
    max(dates.total_recovered) as total_recovered,
    max(dates.total_active_cases) as total_active_cases
     from dates group by month,location,year
)


select * from monthly_data