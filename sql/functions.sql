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

-- creates a random name from a first and last name
CREATE OR REPLACE FUNCTION faker_full_name() RETURNS varchar AS $$
    DECLARE
        first_name varchar;
        last_name varchar;
    BEGIN
        select * into first_name from faker.first_names order by random() limit 1;
        select * into last_name from faker.last_names order by random() limit 1;
        RETURN first_name || ' ' || last_name;
    END;
$$ LANGUAGE plpgsql;

-- creates a random username
CREATE OR REPLACE FUNCTION faker_username() RETURNS varchar AS $$
    DECLARE
        first_name varchar;
        last_name varchar;
    BEGIN
        select * into first_name from faker.first_names order by random() limit 1;
        select * into last_name from faker.last_names order by random() limit 1;
        RETURN lower(first_name) || '_' || lower(last_name) || ceil(random() * 100)::text;
    END;
$$ LANGUAGE plpgsql;

-- creates a random email address
CREATE OR REPLACE FUNCTION faker_email() RETURNS varchar AS $$
    DECLARE
        host varchar;
    BEGIN
        select * into host from (select (Array['gmail.com','yahoo.com','hotmail.com','example.com']::text[])[ceil(random()*4)]) as hosts;
        RETURN faker_username() || '@' || host;
    END;
$$ LANGUAGE plpgsql;

-- creates a random valid area code
CREATE OR REPLACE FUNCTION faker_area_code() RETURNS varchar AS $$
    DECLARE
        area_code varchar;
    BEGIN
        select * into area_code from (select floor((random() * (999 - 201)) + 201)::varchar) as a;
        RETURN area_code;
    END;
$$ LANGUAGE plpgsql;

-- creates a random phone number
CREATE OR REPLACE FUNCTION faker_phone_number() RETURNS varchar AS $$
    DECLARE
        area_code varchar;
        first_three varchar;
        last_four varchar;
    BEGIN
        select * into first_three from (select floor((random() * 3 + 1) * 100)::varchar) as b;
        select * into last_four from (select floor((random() * 4 + 1) * 1000)::varchar) as c;
        RETURN faker_area_code() || '-' || first_three || '-' || last_four;
    END;
$$ LANGUAGE plpgsql;
