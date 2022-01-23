
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select 
        date(current_date - i),
        dim,
        rand() metric1,
        rand() metric2,
        rand() metric3
    from 
        unnest(generate_array(1, 100)) i, 
        (
            select * from unnest([true, false]) dim
        )
        
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
