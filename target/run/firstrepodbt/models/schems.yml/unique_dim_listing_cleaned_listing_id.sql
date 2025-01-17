select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    listing_id as unique_field,
    count(*) as n_records

from airbnb.raw.dim_listing_cleaned
where listing_id is not null
group by listing_id
having count(*) > 1



      
    ) dbt_internal_test