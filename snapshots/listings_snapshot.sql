{% snapshot listings_snapshot %}

{{
    config(
        target_database = 'INT',
        unique_key='id',
        target_schema = 'SNAPSHOT',
        strategy = 'timestamp',
        updated_at = 'updated_at',
       invalidate_hard_deletes=True
    )
}}

    SELECT 
    id , 
    name , 
    listing_url, 
    room_type, 
    minimum_nights,
    host_id,
    price,
    created_at,
    updated_at
    FROM
    {{source('raw_airbnb','listings')}}

{% endsnapshot %}