select * from {{ref('stats')}} where location in (select location from {{ref('province_details')}})