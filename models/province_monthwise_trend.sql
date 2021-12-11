select * from {{ref('month_wise_data')}} where location in (select location from {{ref('province_details')}})

