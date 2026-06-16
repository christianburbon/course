WITH src_hosts AS (
    SELECT * FROM {{ref('src_hosts')}}
)
SELECT
    * EXCLUDE (host_name)
    ,NVL(host_name,'Anonymous') as host_name
FROM src_hosts