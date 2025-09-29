create or replace function latlon_to_geometry (
    latitude  in number,
    longitude in number
) return sdo_geometry
    deterministic
is
begin
               --first ensure valid lat/lon input
    if latitude is null
       or longitude is null
    or latitude not between - 90 and 90
    or longitude not between - 180 and 180 then
        return null;
    else
               --return point geometry
        return sdo_geometry(2001, --identifier for a point geometry
                            4326, --identifier for lat/lon coordinate system
                            sdo_point_type(longitude, latitude, null),
                            null,
                            null);
    end if;
end;
/


-- sqlcl_snapshot {"hash":"a1a5d11a5e251b0affcfb0ae21c83abaa5239635","type":"FUNCTION","name":"LATLON_TO_GEOMETRY","schemaName":"MOVIESTREAM","sxml":""}