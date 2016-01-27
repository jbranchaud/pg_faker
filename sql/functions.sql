-- functions

-- grabs a random first name from faker.first_names
CREATE OR REPLACE FUNCTION faker_first_name() RETURNS varchar AS $$
    DECLARE
        first_name varchar;
    BEGIN
        select * into first_name from faker.first_names order by random() limit 1;
        RETURN first_name;
    END;
$$ LANGUAGE plpgsql;

-- grabs a random last name from faker.last_names
CREATE OR REPLACE FUNCTION faker_last_name() RETURNS varchar AS $$
    DECLARE
        last_name varchar;
    BEGIN
        select * into last_name from faker.last_names order by random() limit 1;
        RETURN last_name;
    END;
$$ LANGUAGE plpgsql;
