-- functions

-- grabs a rando first name from faker.first_names
CREATE OR REPLACE FUNCTION faker_first_name() RETURNS varchar AS $$
    DECLARE
        first_name varchar;
    BEGIN
        select * into first_name from faker.first_names order by random() limit 1;
        RETURN first_name;
    END;
$$ LANGUAGE plpgsql;
