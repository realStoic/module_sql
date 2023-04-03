select 
    id,
    host_id,
    room_type,
    geoDistance(13.4050, 52.5200,toFloat64OrNull(longitude),toFloat64OrNull(latitude)) as d
from listings
where d < (select avg(geoDistance(13.4050, 52.5200,toFloat64OrNull(longitude),toFloat64OrNull(latitude))) as d from listings where room_type = 'Private room' )
order by d desc
limit 100
