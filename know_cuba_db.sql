PGDMP                      {            know_cuba_db    16.0    16.0 D   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16710    know_cuba_db    DATABASE        CREATE DATABASE know_cuba_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE know_cuba_db;
                postgres    false            h           1255    24801    close_contract(integer, date)    FUNCTION       CREATE FUNCTION public.close_contract(_id_contract integer, _contract_reconcilation_date date) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
UPDATE contract SET contract_reconcilation_date = _contract_reconcilation_date,
state = TRUE WHERE id_contract = _id_contract;
END;$$;
 ^   DROP FUNCTION public.close_contract(_id_contract integer, _contract_reconcilation_date date);
       public          postgres    false            S           1255    24596    delete_activity(integer)    FUNCTION     �   CREATE FUNCTION public.delete_activity(_id_activity integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
DELETE FROM activity WHERE id_activity = _id_activity;
END;
$$;
 <   DROP FUNCTION public.delete_activity(_id_activity integer);
       public          postgres    false            #           1255    57360    delete_all_user()    FUNCTION     }   CREATE FUNCTION public.delete_all_user() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
DELETE FROM public.user;
END;
$$;
 (   DROP FUNCTION public.delete_all_user();
       public          postgres    false            %           1255    24768    delete_contract(integer)    FUNCTION     �   CREATE FUNCTION public.delete_contract(_id_contract integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM contract WHERE id_contract = _id_contract;
END;$$;
 <   DROP FUNCTION public.delete_contract(_id_contract integer);
       public          postgres    false            4           1255    24773    delete_meal_plan(integer)    FUNCTION     �   CREATE FUNCTION public.delete_meal_plan(_id_meal_plan integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM meal_plan WHERE id = _id_meal_plan;
END;$$;
 >   DROP FUNCTION public.delete_meal_plan(_id_meal_plan integer);
       public          postgres    false            .           1255    24775 (   delete_meal_plan_hotel(integer, integer)    FUNCTION     �   CREATE FUNCTION public.delete_meal_plan_hotel(_hotel_id integer, _meal_plan_id integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM hotel_meal_plan 
WHERE hotel_id = _hotel_id AND meal_plan_id = _meal_plan_id;
END;$$;
 W   DROP FUNCTION public.delete_meal_plan_hotel(_hotel_id integer, _meal_plan_id integer);
       public          postgres    false                       1255    24769    delete_modality(integer)    FUNCTION     �   CREATE FUNCTION public.delete_modality(_id_modality integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM modality WHERE id = _id_modality;
END;$$;
 <   DROP FUNCTION public.delete_modality(_id_modality integer);
       public          postgres    false            A           1255    24783 1   delete_modality_tourist_package(integer, integer)    FUNCTION       CREATE FUNCTION public.delete_modality_tourist_package(_modality_id integer, _tourist_package_id integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM tourist_package_modality 
WHERE modality_id = _modality_id AND tourist_package_id = _tourist_package_id;
END;$$;
 i   DROP FUNCTION public.delete_modality_tourist_package(_modality_id integer, _tourist_package_id integer);
       public          postgres    false            �           1255    32862    delete_provider(integer)    FUNCTION     �   CREATE FUNCTION public.delete_provider(_id_provider integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM provider WHERE id_provider = _id_provider;
END;$$;
 <   DROP FUNCTION public.delete_provider(_id_provider integer);
       public          postgres    false                       1255    49273    delete_rol(integer)    FUNCTION     �   CREATE FUNCTION public.delete_rol(_id_rol integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM public.rol WHERE id = _id_rol;
END;$$;
 2   DROP FUNCTION public.delete_rol(_id_rol integer);
       public          postgres    false            $           1255    40962    delete_season(integer)    FUNCTION     �   CREATE FUNCTION public.delete_season(_id_season integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
DELETE FROM season WHERE id = _id_season;
END;
$$;
 8   DROP FUNCTION public.delete_season(_id_season integer);
       public          postgres    false            l           1255    24771 =   delete_selected_plan_accommodation_modality(integer, integer)    FUNCTION     X  CREATE FUNCTION public.delete_selected_plan_accommodation_modality(_selected_plans_id integer, _accommodation_modality_id integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM selected_plan_accommodation_modality 
WHERE selected_plans_id = _selected_plans_id 
AND accommodation_modality_id = _accommodation_modality_id;
END;$$;
 �   DROP FUNCTION public.delete_selected_plan_accommodation_modality(_selected_plans_id integer, _accommodation_modality_id integer);
       public          postgres    false            �           1255    24772    delete_selected_plans(integer)    FUNCTION     �   CREATE FUNCTION public.delete_selected_plans(_selected_plans_id integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM selected_plans WHERE id = _selected_plans_id;
END;$$;
 H   DROP FUNCTION public.delete_selected_plans(_selected_plans_id integer);
       public          postgres    false            V           1255    24780    delete_tourist_package(integer)    FUNCTION     �   CREATE FUNCTION public.delete_tourist_package(_id_tourist_package integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM tourist_package WHERE id_tourist_package = _id_tourist_package;
END;$$;
 J   DROP FUNCTION public.delete_tourist_package(_id_tourist_package integer);
       public          postgres    false                       1255    24774    delete_type_of_room(integer)    FUNCTION     �   CREATE FUNCTION public.delete_type_of_room(_id_type_of_room integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM type_of_room WHERE id = _id_type_of_room;
END;$$;
 D   DROP FUNCTION public.delete_type_of_room(_id_type_of_room integer);
       public          postgres    false            6           1255    24776 +   delete_type_of_room_hotel(integer, integer)    FUNCTION     �   CREATE FUNCTION public.delete_type_of_room_hotel(_hotel_id integer, _type_of_room_id integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM hotel_type_of_room 
WHERE hotel_id = _hotel_id AND type_of_room_id = _type_of_room_id;
END;$$;
 ]   DROP FUNCTION public.delete_type_of_room_hotel(_hotel_id integer, _type_of_room_id integer);
       public          postgres    false            p           1255    49244    delete_user(integer)    FUNCTION     �   CREATE FUNCTION public.delete_user(_id_user integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM public.user WHERE id = _id_user;
END;$$;
 4   DROP FUNCTION public.delete_user(_id_user integer);
       public          postgres    false            !           1255    24607    delete_vehicle(integer)    FUNCTION     �   CREATE FUNCTION public.delete_vehicle(_id_vehicle integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
DELETE FROM vehicle WHERE id_vehicle = _id_vehicle;
END;$$;
 :   DROP FUNCTION public.delete_vehicle(_id_vehicle integer);
       public          postgres    false            �           1255    24853 #   get_accommodation_contract(integer)    FUNCTION     �  CREATE FUNCTION public.get_accommodation_contract(_id_accommodation_contract integer) RETURNS TABLE(id_contract integer, contract_start_date date, contract_termination_date date, contract_description character varying, type_of_contract character varying, state boolean, contract_reconcilation_date date, hotel_id integer, surcharge double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select c.id_contract, c.contract_start_date, c.contract_termination_date, 
c.contract_description, c.type_of_contract, c.state, c.contract_reconcilation_date, 
ac.hotel_id, c.surcharge FROM accommodation_contract AS ac INNER JOIN contract AS c 
ON ac.id_contract = c.id_contract WHERE ac.id_contract = _id_accommodation_contract ;
END;
$$;
 U   DROP FUNCTION public.get_accommodation_contract(_id_accommodation_contract integer);
       public          postgres    false            T           1255    40975 #   get_accommodation_modality(integer)    FUNCTION     S  CREATE FUNCTION public.get_accommodation_modality(_id_accommodation_modality integer) RETURNS TABLE(id integer, accommodation_contract_id integer, type_of_modality character varying, type_of_room_id integer, meal_plan_id integer, price double precision, cant_days_accommodation integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select a.id, a.accommodation_contract_id, m.type_of_modality, a.type_of_room_id, a.meal_plan_id, a.price, a.cant_days_accommodation 
FROM accommodation_modality AS a INNER JOIN modality AS m 
ON a.id = m.id 
WHERE a.id = _id_accommodation_modality;
END;
$$;
 U   DROP FUNCTION public.get_accommodation_modality(_id_accommodation_modality integer);
       public          postgres    false            �           1255    40978 :   get_accommodation_modality_accommodation_contract(integer)    FUNCTION     A  CREATE FUNCTION public.get_accommodation_modality_accommodation_contract(_id_accommodation_contract integer) RETURNS TABLE(id integer, type_of_modality character varying, type_of_room_id integer, meal_plan_id integer, price double precision, cant_days_accommodation integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select a.id, m.type_of_modality, a.type_of_room_id, a.meal_plan_id, a.price, a.cant_days_accommodation 
FROM accommodation_modality AS a INNER JOIN modality AS m 
ON a.id = m.id 
WHERE a.accommodation_contract_id = _id_accommodation_contract;
END;
$$;
 l   DROP FUNCTION public.get_accommodation_modality_accommodation_contract(_id_accommodation_contract integer);
       public          postgres    false            M           1255    32860 3   get_accommodation_modality_tourist_package(integer)    FUNCTION     �  CREATE FUNCTION public.get_accommodation_modality_tourist_package(_tourist_package_id integer) RETURNS TABLE(id integer, type_of_modality character varying, accommodation_contract_id integer, type_of_room_id integer, meal_plan_id integer, price double precision, cant_days_accommodation integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select a.id, m.type_of_modality, a.accommodation_contract_id, a.type_of_room_id, a.meal_plan_id, a.price, a.cant_days_accommodation 
FROM tourist_package_modality AS tpm INNER JOIN accommodation_modality AS a 
ON tpm.modality_id = a.id
INNER JOIN modality AS m 
ON a.id = m.id 
WHERE tpm.tourist_package_id = _tourist_package_id;
END;
$$;
 ^   DROP FUNCTION public.get_accommodation_modality_tourist_package(_tourist_package_id integer);
       public          postgres    false            }           1255    40988    get_activity(integer)    FUNCTION     X  CREATE FUNCTION public.get_activity(_id_activity integer) RETURNS TABLE(id_activity integer, activity_description character varying, service_provider_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select a.id_activity, a.activity_description, a.service_provider_id
FROM activity AS a WHERE a.id_activity = _id_activity;
END;
$$;
 9   DROP FUNCTION public.get_activity(_id_activity integer);
       public          postgres    false            �           1255    57871 &   get_activity_service_provider(integer)    FUNCTION     �  CREATE FUNCTION public.get_activity_service_provider(_id_service_provider integer) RETURNS TABLE(id_activity integer, activity_description character varying, service_provider_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select a.id_activity, a.activity_description, a.service_provider_id
FROM activity AS a WHERE a.service_provider_id = _id_service_provider;
END;
$$;
 R   DROP FUNCTION public.get_activity_service_provider(_id_service_provider integer);
       public          postgres    false            -           1255    49252    get_administrator(integer)    FUNCTION       CREATE FUNCTION public.get_administrator(_id_user integer) RETURNS TABLE(id integer, user_name character varying, user_password character varying, id_rol integer, start_date_connection date, last_date_connection date, connected boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT a.user_id, u.user_name, u.user_password, u.id_rol, u.start_date_connection, 
u.last_date_connection, u.connected  
FROM public.user AS u INNER JOIN public.administrator AS a ON a.user_id = u.id
WHERE a.user_id = _id_user;
END;
$$;
 :   DROP FUNCTION public.get_administrator(_id_user integer);
       public          postgres    false            ]           1255    24854     get_all_accommodation_contract()    FUNCTION     �  CREATE FUNCTION public.get_all_accommodation_contract() RETURNS TABLE(id_contract integer, contract_start_date date, contract_termination_date date, contract_description character varying, type_of_contract character varying, state boolean, contract_reconcilation_date date, hotel_id integer, surcharge double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select c.id_contract, c.contract_start_date, c.contract_termination_date, 
c.contract_description, c.type_of_contract, c.state, c.contract_reconcilation_date, 
ac.hotel_id, c.surcharge FROM accommodation_contract AS ac INNER JOIN contract AS c 
ON ac.id_contract = c.id_contract;
END;
$$;
 7   DROP FUNCTION public.get_all_accommodation_contract();
       public          postgres    false            i           1255    40976     get_all_accommodation_modality()    FUNCTION     L  CREATE FUNCTION public.get_all_accommodation_modality() RETURNS TABLE(id integer, type_of_modality character varying, accommodation_contract_id integer, type_of_room_id integer, meal_plan_id integer, price double precision, cant_days_accommodation integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select a.id, m.type_of_modality, a.accommodation_contract_id, a.type_of_room_id, a.meal_plan_id, a.price, a.cant_days_accommodation 
FROM accommodation_modality AS a INNER JOIN modality AS m 
ON a.id = m.id 
WHERE a.accommodation_contract_id = _id_accommodation_contract;
END;
$$;
 7   DROP FUNCTION public.get_all_accommodation_modality();
       public          postgres    false                       1255    40987    get_all_activity()    FUNCTION       CREATE FUNCTION public.get_all_activity() RETURNS TABLE(id_activity integer, activity_description character varying, service_provider_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select id_activity, activity_description, service_provider_id
FROM activity;
END;
$$;
 )   DROP FUNCTION public.get_all_activity();
       public          postgres    false            2           1255    49249    get_all_administrator()    FUNCTION     �  CREATE FUNCTION public.get_all_administrator() RETURNS TABLE(id integer, user_name character varying, user_password character varying, id_rol integer, start_date_connection date, last_date_connection date, connected boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT a.user_id, u.user_name, u.user_password, u.id_rol, u.start_date_connection, 
u.last_date_connection, u.connected  
FROM public.user AS u INNER JOIN public.administrator AS a ON a.user_id = u.id;
END;
$$;
 .   DROP FUNCTION public.get_all_administrator();
       public          postgres    false            D           1255    57356    get_all_carrier_contract()    FUNCTION     �  CREATE FUNCTION public.get_all_carrier_contract() RETURNS TABLE(id_contract integer, contract_start_date date, contract_termination_date date, contract_description character varying, type_of_contract character varying, state boolean, contract_reconcilation_date date, transportation_provider_id integer, surcharge double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select c.id_contract, c.contract_start_date, c.contract_termination_date, 
c.contract_description, c.type_of_contract, c.state, c.contract_reconcilation_date, 
cc.transportation_provider_id, c.surcharge FROM carrier_contract AS cc INNER JOIN contract AS c 
ON cc.id_contract = c.id_contract;
END;
$$;
 1   DROP FUNCTION public.get_all_carrier_contract();
       public          postgres    false            f           1255    49271    get_all_dependent()    FUNCTION     �  CREATE FUNCTION public.get_all_dependent() RETURNS TABLE(id integer, user_name character varying, user_password character varying, id_rol integer, start_date_connection date, last_date_connection date, connected boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT d.user_id, u.user_name, u.user_password, u.id_rol, u.start_date_connection, 
u.last_date_connection, u.connected  
FROM public.user AS u INNER JOIN public.dependent AS d ON d.user_id = u.id;
END;
$$;
 *   DROP FUNCTION public.get_all_dependent();
       public          postgres    false            H           1255    65536    get_all_hotel()    FUNCTION     �  CREATE FUNCTION public.get_all_hotel() RETURNS TABLE(id integer, name character varying, province character varying, hotel_chain character varying, address character varying, hotel_category integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select h.id, p.name, p.province, h.hotel_chain, h.address, h.hotel_category from hotel AS h INNER JOIN provider AS p
ON h.id = p.id_provider;
END;
$$;
 &   DROP FUNCTION public.get_all_hotel();
       public          postgres    false                       1255    49248    get_all_manager()    FUNCTION     �  CREATE FUNCTION public.get_all_manager() RETURNS TABLE(id integer, user_name character varying, user_password character varying, id_rol integer, start_date_connection date, last_date_connection date, connected boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT m.user_id, u.user_name, u.user_password, u.id_rol, u.start_date_connection, 
u.last_date_connection, u.connected  
FROM public.user AS u INNER JOIN public.manager AS m ON m.user_id = u.id;
END;
$$;
 (   DROP FUNCTION public.get_all_manager();
       public          postgres    false            u           1255    24864    get_all_meal_plan()    FUNCTION     �   CREATE FUNCTION public.get_all_meal_plan() RETURNS TABLE(id integer, meal_plan_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.meal_plan_name FROM meal_plan AS m;
END;
$$;
 *   DROP FUNCTION public.get_all_meal_plan();
       public          postgres    false            '           1255    49250    get_all_package_designer()    FUNCTION     �  CREATE FUNCTION public.get_all_package_designer() RETURNS TABLE(id integer, user_name character varying, user_password character varying, id_rol integer, start_date_connection date, last_date_connection date, connected boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT p.user_id, u.user_name, u.user_password, u.id_rol, u.start_date_connection, 
u.last_date_connection, u.connected  
FROM public.user AS u INNER JOIN public.package_designer AS p ON p.user_id = u.id;
END;
$$;
 1   DROP FUNCTION public.get_all_package_designer();
       public          postgres    false            =           1255    49275    get_all_rol()    FUNCTION     �   CREATE FUNCTION public.get_all_rol() RETURNS TABLE(id integer, rol_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select r.id, r.rol_name from public.rol as r;
END;
$$;
 $   DROP FUNCTION public.get_all_rol();
       public          postgres    false            o           1255    40963    get_all_seasons()    FUNCTION     �  CREATE FUNCTION public.get_all_seasons() RETURNS TABLE(id integer, season_name character varying, season_start_date character varying, season_termination_date character varying, season_description character varying, type_of_season character varying, accommodation_contract_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select id, season_name, season_start_date, season_termination_date, season_description, type_of_season, accommodation_contract_id
FROM season;
END;
$$;
 (   DROP FUNCTION public.get_all_seasons();
       public          postgres    false                       1255    57357    get_all_service_contract()    FUNCTION     �  CREATE FUNCTION public.get_all_service_contract() RETURNS TABLE(id_contract integer, contract_start_date date, contract_termination_date date, contract_description character varying, type_of_contract character varying, state boolean, contract_reconcilation_date date, service_provider_id integer, surcharge double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select c.id_contract, c.contract_start_date, c.contract_termination_date, 
c.contract_description, c.type_of_contract, c.state, c.contract_reconcilation_date, 
sc.service_provider_id, c.surcharge FROM service_contract AS sc INNER JOIN contract AS c 
ON sc.id_contract = c.id_contract;
END;
$$;
 1   DROP FUNCTION public.get_all_service_contract();
       public          postgres    false            ;           1255    40994    get_all_service_modality()    FUNCTION     �  CREATE FUNCTION public.get_all_service_modality() RETURNS TABLE(modality_id integer, type_of_modality character varying, service_contract_id integer, activity_id integer, price double precision, release_date date)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, sm.service_contract_id, sm.activity_id, sm.price, sm.release_date
FROM service_modality AS sm INNER JOIN modality AS m ON sm.modality_id = m.id;
END;
$$;
 1   DROP FUNCTION public.get_all_service_modality();
       public          postgres    false            :           1255    24860    get_all_service_provider()    FUNCTION     1  CREATE FUNCTION public.get_all_service_provider() RETURNS TABLE(id integer, service_name character varying, province character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select s.id, p.name, p.province from service_provider AS s INNER JOIN provider AS p 
ON s.id = p.id_provider;
END;
$$;
 1   DROP FUNCTION public.get_all_service_provider();
       public          postgres    false            (           1255    49162    get_all_tourist_package()    FUNCTION     �   CREATE FUNCTION public.get_all_tourist_package() RETURNS TABLE(id_tourist_package integer, name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT t.id_tourist_package, t.name FROM tourist_package AS t;
END;
$$;
 0   DROP FUNCTION public.get_all_tourist_package();
       public          postgres    false                       1255    49153 ,   get_all_transport_modality_cost_kilometers()    FUNCTION     �  CREATE FUNCTION public.get_all_transport_modality_cost_kilometers() RETURNS TABLE(modality_id integer, type_of_modality character varying, vehicle_id integer, carrier_contract_id integer, type_transport_modality character varying, cost_kilometers_going double precision, cost_kilometers_lap double precision, cost_hours_wait double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, tm.vehicle_id, tm.carrier_contract_id, 
tm.type_transport_modality, ck.cost_kilometers_going, ck.cost_kilometers_lap, 
ck.cost_hours_wait FROM cost_kilometers AS ck
INNER JOIN transport_modality AS tm 
ON ck.modality_id = tm.modality_id INNER JOIN modality AS m ON tm.modality_id = m.id;
END;
$$;
 C   DROP FUNCTION public.get_all_transport_modality_cost_kilometers();
       public          postgres    false            �           1255    49155 .   get_all_transport_modality_established_route()    FUNCTION     �  CREATE FUNCTION public.get_all_transport_modality_established_route() RETURNS TABLE(modality_id integer, type_of_modality character varying, vehicle_id integer, carrier_contract_id integer, type_transport_modality character varying, description_rout character varying, cost_going double precision, cost_lap double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, tm.vehicle_id, tm.carrier_contract_id, 
tm.type_transport_modality, er.description_rout, er.cost_going, 
er.cost_lap FROM established_route AS er
INNER JOIN transport_modality AS tm 
ON er.modality_id = tm.modality_id INNER JOIN modality AS m ON tm.modality_id = m.id;
END;
$$;
 E   DROP FUNCTION public.get_all_transport_modality_established_route();
       public          postgres    false            �           1255    49157 -   get_all_transport_modality_hours_kilometers()    FUNCTION     &  CREATE FUNCTION public.get_all_transport_modality_hours_kilometers() RETURNS TABLE(modality_id integer, type_of_modality character varying, vehicle_id integer, carrier_contract_id integer, type_transport_modality character varying, cost_kilometers_rout double precision, cost_hours double precision, cost_kilometers_rout_additionals double precision, cost_hours_additionals double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, tm.vehicle_id, tm.carrier_contract_id, 
tm.type_transport_modality, hk.cost_kilometers_rout, hk.cost_hours, hk.cost_kilometers_rout_additionals,
hk.cost_hours_additionals FROM hours_kilometers AS hk
INNER JOIN transport_modality AS tm 
ON hk.modality_id = tm.modality_id INNER JOIN modality AS m ON tm.modality_id = m.id;
END;
$$;
 D   DROP FUNCTION public.get_all_transport_modality_hours_kilometers();
       public          postgres    false                       1255    40981 !   get_all_transportation_provider()    FUNCTION     @  CREATE FUNCTION public.get_all_transportation_provider() RETURNS TABLE(id integer, provider_name character varying, province character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select t.id, p.name, p.province from transportation_provider AS t INNER JOIN provider AS P 
ON t.id = p.id_provider;
END;
$$;
 8   DROP FUNCTION public.get_all_transportation_provider();
       public          postgres    false            ?           1255    24863    get_all_type_of_room()    FUNCTION     �   CREATE FUNCTION public.get_all_type_of_room() RETURNS TABLE(id integer, type_of_room_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select t.id, t.type_of_room_name FROM type_of_room AS t;
END;
$$;
 -   DROP FUNCTION public.get_all_type_of_room();
       public          postgres    false                       1255    40971    get_all_vehicle()    FUNCTION       CREATE FUNCTION public.get_all_vehicle() RETURNS TABLE(id_vehicle integer, lock character varying, transportation_provider_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT v.id_vehicle, v.lock, v.transportation_provider_id FROM vehicle AS v;
END;
$$;
 (   DROP FUNCTION public.get_all_vehicle();
       public          postgres    false            X           1255    57355    get_carrier_contract(integer)    FUNCTION     �  CREATE FUNCTION public.get_carrier_contract(_id_carrier_contract integer) RETURNS TABLE(id_contract integer, contract_start_date date, contract_termination_date date, contract_description character varying, type_of_contract character varying, state boolean, contract_reconcilation_date date, transportation_provider_id integer, surcharge double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select c.id_contract, c.contract_start_date, c.contract_termination_date, 
c.contract_description, c.type_of_contract, c.state, c.contract_reconcilation_date, 
cc.transportation_provider_id, c.surcharge FROM carrier_contract AS cc INNER JOIN contract AS c 
ON cc.id_contract = c.id_contract WHERE cc.id_contract = _id_carrier_contract;
END;
$$;
 I   DROP FUNCTION public.get_carrier_contract(_id_carrier_contract integer);
       public          postgres    false            P           1255    49270    get_dependent(integer)    FUNCTION       CREATE FUNCTION public.get_dependent(_id_user integer) RETURNS TABLE(id integer, user_name character varying, user_password character varying, id_rol integer, start_date_connection date, last_date_connection date, connected boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT d.user_id, u.user_name, u.user_password, u.id_rol, u.start_date_connection, 
u.last_date_connection, u.connected  
FROM public.user AS u INNER JOIN public.dependent AS d ON d.user_id = u.id
WHERE d.user_id = _id_user;
END;
$$;
 6   DROP FUNCTION public.get_dependent(_id_user integer);
       public          postgres    false                       1255    65537    get_hotel(integer)    FUNCTION     �  CREATE FUNCTION public.get_hotel(_id_hotel integer) RETURNS TABLE(id integer, name character varying, province character varying, hotel_chain character varying, address character varying, hotel_category integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select h.id, p.name, p.province, h.hotel_chain, h.address, h.hotel_category from hotel AS h INNER JOIN provider AS p
ON h.id = p.id_provider WHERE h.id = _id_hotel;
END;
$$;
 3   DROP FUNCTION public.get_hotel(_id_hotel integer);
       public          postgres    false            B           1255    49253    get_manager(integer)    FUNCTION       CREATE FUNCTION public.get_manager(_id_user integer) RETURNS TABLE(id integer, user_name character varying, user_password character varying, id_rol integer, start_date_connection date, last_date_connection date, connected boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT m.user_id, u.user_name, u.user_password, u.id_rol, u.start_date_connection, 
u.last_date_connection, u.connected  
FROM public.user AS u INNER JOIN public.manager AS m ON m.user_id = u.id
WHERE m.user_id = _id_user;
END;
$$;
 4   DROP FUNCTION public.get_manager(_id_user integer);
       public          postgres    false            N           1255    24842    get_meal_plan(integer)    FUNCTION       CREATE FUNCTION public.get_meal_plan(_id_meal_plan integer) RETURNS TABLE(id integer, meal_plan_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.meal_plan_name FROM meal_plan AS m WHERE m.id = _id_meal_plan;
END;
$$;
 ;   DROP FUNCTION public.get_meal_plan(_id_meal_plan integer);
       public          postgres    false            �           1255    24831    get_meal_plans_hotel(integer)    FUNCTION     ?  CREATE FUNCTION public.get_meal_plans_hotel(_id_hotel integer) RETURNS TABLE(id integer, meal_plan_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.meal_plan_name from hotel_meal_plan as hm inner join meal_plan m on hm.meal_plan_id = m.id
WHERE hm.hotel_id = _id_hotel;
END;
$$;
 >   DROP FUNCTION public.get_meal_plans_hotel(_id_hotel integer);
       public          postgres    false                       1255    24837 0   get_modalitys_services_service_contract(integer)    FUNCTION     �  CREATE FUNCTION public.get_modalitys_services_service_contract(_id_service_contract integer) RETURNS TABLE(modality_id integer, activity_id integer, price double precision, type_of_modality character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select sm.modality_id, sm.activity_id, sm.price, m.type_of_modality 
FROM service_modality as sm INNER JOIN modality as m ON sm.modality_id = m.id
WHERE sm.service_contract_id = _id_service_contract;
END;
$$;
 \   DROP FUNCTION public.get_modalitys_services_service_contract(_id_service_contract integer);
       public          postgres    false                       1255    49251    get_package_designer(integer)    FUNCTION       CREATE FUNCTION public.get_package_designer(_id_user integer) RETURNS TABLE(id integer, user_name character varying, user_password character varying, id_rol integer, start_date_connection date, last_date_connection date, connected boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT p.user_id, u.user_name, u.user_password, u.id_rol, u.start_date_connection, 
u.last_date_connection, u.connected  
FROM public.user AS u INNER JOIN public.package_designer AS p ON p.user_id = u.id
WHERE p.user_id = _id_user;
END;
$$;
 =   DROP FUNCTION public.get_package_designer(_id_user integer);
       public          postgres    false            U           1255    49274    get_rol(integer)    FUNCTION     �   CREATE FUNCTION public.get_rol(_id_rol integer) RETURNS TABLE(id integer, rol_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select r.id, r.rol_name from public.rol as r where r.id = _id_rol;
END;
$$;
 /   DROP FUNCTION public.get_rol(_id_rol integer);
       public          postgres    false            J           1255    40965    get_season(integer)    FUNCTION     
  CREATE FUNCTION public.get_season(_id_season integer) RETURNS TABLE(id integer, season_name character varying, season_start_date character varying, season_termination_date character varying, season_description character varying, type_of_season character varying, accommodation_contract_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select id, season_name, season_start_date, season_termination_date, season_description, type_of_season, accommodation_contract_id
FROM season WHERE id = _id_season;
END;
$$;
 5   DROP FUNCTION public.get_season(_id_season integer);
       public          postgres    false            >           1255    57873 +   get_seasons_accommodation_contract(integer)    FUNCTION     T  CREATE FUNCTION public.get_seasons_accommodation_contract(_id_accommodation_contract integer) RETURNS TABLE(id integer, season_name character varying, season_start_date date, season_termination_date date, season_description character varying, type_of_season character varying, accommodation_contract_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select s.id, s.season_name, s.season_start_date, s.season_termination_date, s.season_description, s.type_of_season, s.accommodation_contract_id
FROM season AS s WHERE s.accommodation_contract_id = _id_accommodation_contract;
END;
$$;
 ]   DROP FUNCTION public.get_seasons_accommodation_contract(_id_accommodation_contract integer);
       public          postgres    false            O           1255    57358    get_service_contract(integer)    FUNCTION     �  CREATE FUNCTION public.get_service_contract(_id_service_contract integer) RETURNS TABLE(id_contract integer, contract_start_date date, contract_termination_date date, contract_description character varying, type_of_contract character varying, state boolean, contract_reconcilation_date date, service_provider_id integer, surcharge double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select c.id_contract, c.contract_start_date, c.contract_termination_date, 
c.contract_description, c.type_of_contract, c.state, c.contract_reconcilation_date, 
sc.service_provider_id, c.surcharge FROM service_contract AS sc INNER JOIN contract AS c 
ON sc.id_contract = c.id_contract WHERE sc.id_contract = _id_service_contract;
END;
$$;
 I   DROP FUNCTION public.get_service_contract(_id_service_contract integer);
       public          postgres    false                       1255    40995    get_service_modality(integer)    FUNCTION     �  CREATE FUNCTION public.get_service_modality(_id_modality integer) RETURNS TABLE(modality_id integer, type_of_modality character varying, service_contract_id integer, activity_id integer, price double precision, release_date date)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, sm.service_contract_id, sm.activity_id, sm.price, sm.release_date
FROM service_modality AS sm INNER JOIN modality AS m ON sm.modality_id = m.id
WHERE sm.modality_id = _id_modality;
END;
$$;
 A   DROP FUNCTION public.get_service_modality(_id_modality integer);
       public          postgres    false            Z           1255    40992 .   get_service_modality_service_contract(integer)    FUNCTION       CREATE FUNCTION public.get_service_modality_service_contract(_id_contract integer) RETURNS TABLE(modality_id integer, type_of_modality character varying, service_contract_id integer, activity_id integer, price double precision, release_date date)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, sm.service_contract_id, sm.activity_id, sm.price, sm.release_date
FROM service_modality AS sm INNER JOIN modality AS m ON sm.modality_id = m.id
WHERE sm.service_contract_id = _id_contract;
END;
$$;
 R   DROP FUNCTION public.get_service_modality_service_contract(_id_contract integer);
       public          postgres    false            9           1255    40993 -   get_service_modality_tourist_package(integer)    FUNCTION     l  CREATE FUNCTION public.get_service_modality_tourist_package(_id_tourist_package integer) RETURNS TABLE(modality_id integer, type_of_modality character varying, service_contract_id integer, activity_id integer, price double precision, release_date date)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, sm.service_contract_id, sm.activity_id, sm.price, sm.release_date
FROM tourist_package_modality AS tpm INNER JOIN service_modality AS sm
ON tpm.modality_id = sm.modality_id INNER JOIN modality AS m ON sm.modality_id = m.id
WHERE tpm.tourist_package_id = _id_tourist_package;
END;
$$;
 X   DROP FUNCTION public.get_service_modality_tourist_package(_id_tourist_package integer);
       public          postgres    false            �           1255    24861    get_service_provider(integer)    FUNCTION     k  CREATE FUNCTION public.get_service_provider(_id_service_provider integer) RETURNS TABLE(id integer, service_name character varying, province character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select s.id, p.name, p.province from service_provider AS s INNER JOIN provider AS p 
ON s.id = p.id_provider where s.id = _id_service_provider;
END;
$$;
 I   DROP FUNCTION public.get_service_provider(_id_service_provider integer);
       public          postgres    false            	           1255    49161    get_tourist_package(integer)    FUNCTION     +  CREATE FUNCTION public.get_tourist_package(_id_tourist_package integer) RETURNS TABLE(id_tourist_package integer, name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT id_tourist_package, name FROM tourist_package 
WHERE id_tourist_package = _id_tourist_package;
END;
$$;
 G   DROP FUNCTION public.get_tourist_package(_id_tourist_package integer);
       public          postgres    false                       1255    49152 /   get_transport_modality_cost_kilometers(integer)    FUNCTION     �  CREATE FUNCTION public.get_transport_modality_cost_kilometers(_id_modality integer) RETURNS TABLE(modality_id integer, type_of_modality character varying, vehicle_id integer, carrier_contract_id integer, type_transport_modality character varying, cost_kilometers_going double precision, cost_kilometers_lap double precision, cost_hours_wait double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, tm.vehicle_id, tm.carrier_contract_id, 
tm.type_transport_modality, ck.cost_kilometers_going, ck.cost_kilometers_lap, 
ck.cost_hours_wait FROM cost_kilometers AS ck
INNER JOIN transport_modality AS tm 
ON ck.modality_id = tm.modality_id INNER JOIN modality AS m ON tm.modality_id = m.id
WHERE m.id = _id_modality;
END;
$$;
 S   DROP FUNCTION public.get_transport_modality_cost_kilometers(_id_modality integer);
       public          postgres    false            R           1255    24846 ?   get_transport_modality_cost_kilometers_tourist_package(integer)    FUNCTION     |  CREATE FUNCTION public.get_transport_modality_cost_kilometers_tourist_package(_id_tourist_package integer) RETURNS TABLE(modality_id integer, type_of_modality character varying, vehicle_id integer, carrier_contract_id integer, type_transport_modality character varying, cost_kilometers_going double precision, cost_kilometers_lap double precision, cost_hours_wait double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, tm.vehicle_id, tm.carrier_contract_id, 
tm.type_transport_modality, ck.cost_kilometers_going, ck.cost_kilometers_lap, 
ck.cost_hours_wait FROM tourist_package_modality AS tpm INNER JOIN cost_kilometers AS ck
ON tpm.modality_id = ck.modality_id INNER JOIN transport_modality AS tm 
ON ck.modality_id = tm.modality_id INNER JOIN modality AS m ON tm.modality_id = m.id
WHERE tpm.tourist_package_id = _id_tourist_package;
END;
$$;
 j   DROP FUNCTION public.get_transport_modality_cost_kilometers_tourist_package(_id_tourist_package integer);
       public          postgres    false            `           1255    49154 1   get_transport_modality_established_route(integer)    FUNCTION     �  CREATE FUNCTION public.get_transport_modality_established_route(_id_modality integer) RETURNS TABLE(modality_id integer, type_of_modality character varying, vehicle_id integer, carrier_contract_id integer, type_transport_modality character varying, description_rout character varying, cost_going double precision, cost_lap double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, tm.vehicle_id, tm.carrier_contract_id, 
tm.type_transport_modality, er.description_rout, er.cost_going, 
er.cost_lap FROM established_route AS er
INNER JOIN transport_modality AS tm 
ON er.modality_id = tm.modality_id INNER JOIN modality AS m ON tm.modality_id = m.id
WHERE m.id = _id_modality;
END;
$$;
 U   DROP FUNCTION public.get_transport_modality_established_route(_id_modality integer);
       public          postgres    false                       1255    24847 A   get_transport_modality_established_route_tourist_package(integer)    FUNCTION     W  CREATE FUNCTION public.get_transport_modality_established_route_tourist_package(_id_tourist_package integer) RETURNS TABLE(modality_id integer, type_of_modality character varying, vehicle_id integer, carrier_contract_id integer, type_transport_modality character varying, description_rout character varying, cost_going double precision, cost_lap double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, tm.vehicle_id, tm.carrier_contract_id, 
tm.type_transport_modality, er.description_rout, er.cost_going, 
er.cost_lap FROM tourist_package_modality AS tpm INNER JOIN established_route AS er
ON tpm.modality_id = er.modality_id INNER JOIN transport_modality AS tm 
ON er.modality_id = tm.modality_id INNER JOIN modality AS m ON tm.modality_id = m.id
WHERE tpm.tourist_package_id = _id_tourist_package;
END;
$$;
 l   DROP FUNCTION public.get_transport_modality_established_route_tourist_package(_id_tourist_package integer);
       public          postgres    false            v           1255    49156 0   get_transport_modality_hours_kilometers(integer)    FUNCTION     P  CREATE FUNCTION public.get_transport_modality_hours_kilometers(_id_modality integer) RETURNS TABLE(modality_id integer, type_of_modality character varying, vehicle_id integer, carrier_contract_id integer, type_transport_modality character varying, cost_kilometers_rout double precision, cost_hours double precision, cost_kilometers_rout_additionals double precision, cost_hours_additionals double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, tm.vehicle_id, tm.carrier_contract_id, 
tm.type_transport_modality, hk.cost_kilometers_rout, hk.cost_hours, hk.cost_kilometers_rout_additionals,
hk.cost_hours_additionals FROM hours_kilometers AS hk
INNER JOIN transport_modality AS tm 
ON hk.modality_id = tm.modality_id INNER JOIN modality AS m ON tm.modality_id = m.id
WHERE m.id = _id_modality;
END;
$$;
 T   DROP FUNCTION public.get_transport_modality_hours_kilometers(_id_modality integer);
       public          postgres    false            q           1255    24845 @   get_transport_modality_hours_kilometers_tourist_package(integer)    FUNCTION     �  CREATE FUNCTION public.get_transport_modality_hours_kilometers_tourist_package(_id_tourist_package integer) RETURNS TABLE(modality_id integer, type_of_modality character varying, vehicle_id integer, carrier_contract_id integer, type_transport_modality character varying, cost_kilometers_rout double precision, cost_hours double precision, cost_kilometers_rout_additionals double precision, cost_hours_additionals double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, tm.vehicle_id, tm.carrier_contract_id, 
tm.type_transport_modality, hk.cost_kilometers_rout, hk.cost_hours, hk.cost_kilometers_rout_additionals,
hk.cost_hours_additionals FROM tourist_package_modality AS tpm INNER JOIN hours_kilometers AS hk
ON tpm.modality_id = hk.modality_id INNER JOIN transport_modality AS tm 
ON hk.modality_id = tm.modality_id INNER JOIN modality AS m ON tm.modality_id = m.id
WHERE tpm.tourist_package_id = _id_tourist_package;
END;
$$;
 k   DROP FUNCTION public.get_transport_modality_hours_kilometers_tourist_package(_id_tourist_package integer);
       public          postgres    false                       1255    40980 $   get_transportation_provider(integer)    FUNCTION     �  CREATE FUNCTION public.get_transportation_provider(_id_transportation_provider integer) RETURNS TABLE(id integer, provider_name character varying, province character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select t.id, p.name, p.province from transportation_provider AS t INNER JOIN provider AS P 
ON t.id = p.id_provider where t.id = _id_transportation_provider ;
END;
$$;
 W   DROP FUNCTION public.get_transportation_provider(_id_transportation_provider integer);
       public          postgres    false            d           1255    24839 B   get_transports_modalitys_cost_kilometers_carrier_contract(integer)    FUNCTION     �  CREATE FUNCTION public.get_transports_modalitys_cost_kilometers_carrier_contract(_id_carrier_contract integer) RETURNS TABLE(modality_id integer, type_of_modality character varying, vehicle_id integer, type_transport_modality character varying, cost_kilometers_going double precision, cost_kilometers_lap double precision, cost_hours_wait double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, tm.vehicle_id, tm.type_transport_modality,
ck.cost_kilometers_going, ck.cost_kilometers_lap, ck.cost_hours_wait
FROM cost_kilometers AS ck INNER JOIN transport_modality AS tm ON ck.modality_id = tm.modality_id
INNER JOIN modality AS m ON tm.modality_id = m.id WHERE tm.carrier_contract_id = _id_carrier_contract;
END;
$$;
 n   DROP FUNCTION public.get_transports_modalitys_cost_kilometers_carrier_contract(_id_carrier_contract integer);
       public          postgres    false                       1255    24840 D   get_transports_modalitys_established_route_carrier_contract(integer)    FUNCTION     �  CREATE FUNCTION public.get_transports_modalitys_established_route_carrier_contract(_id_carrier_contract integer) RETURNS TABLE(modality_id integer, type_of_modality character varying, vehicle_id integer, type_transport_modality character varying, description_rout character varying, cost_going double precision, cost_lap double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, tm.vehicle_id, tm.type_transport_modality,
er.description_rout, er.cost_going, er.cost_lap
FROM established_route AS er INNER JOIN transport_modality AS tm ON er.modality_id = tm.modality_id
INNER JOIN modality AS m ON tm.modality_id = m.id WHERE tm.carrier_contract_id = _id_carrier_contract;
END;
$$;
 p   DROP FUNCTION public.get_transports_modalitys_established_route_carrier_contract(_id_carrier_contract integer);
       public          postgres    false                       1255    24838 C   get_transports_modalitys_hours_kilometers_carrier_contract(integer)    FUNCTION     N  CREATE FUNCTION public.get_transports_modalitys_hours_kilometers_carrier_contract(_id_carrier_contract integer) RETURNS TABLE(modality_id integer, type_of_modality character varying, vehicle_id integer, type_transport_modality character varying, cost_kilometers_rout double precision, cost_hours double precision, cost_kilometers_rout_additionals double precision, cost_hours_additionals double precision)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select m.id, m.type_of_modality, tm.vehicle_id, tm.type_transport_modality,
hk.cost_kilometers_rout, hk.cost_hours, hk.cost_kilometers_rout_additionals, hk.cost_hours_additionals
FROM hours_kilometers AS hk INNER JOIN transport_modality AS tm ON hk.modality_id = tm.modality_id
INNER JOIN modality AS m ON tm.modality_id = m.id WHERE tm.carrier_contract_id = _id_carrier_contract;
END;
$$;
 o   DROP FUNCTION public.get_transports_modalitys_hours_kilometers_carrier_contract(_id_carrier_contract integer);
       public          postgres    false            a           1255    24841    get_type_of_room(integer)    FUNCTION       CREATE FUNCTION public.get_type_of_room(_id_type_of_room integer) RETURNS TABLE(id integer, type_of_room_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select t.id, t.type_of_room_name FROM type_of_room AS t WHERE t.id = _id_type_of_room;
END;
$$;
 A   DROP FUNCTION public.get_type_of_room(_id_type_of_room integer);
       public          postgres    false            
           1255    24830    get_type_of_room_hotel(integer)    FUNCTION     P  CREATE FUNCTION public.get_type_of_room_hotel(_id_hotel integer) RETURNS TABLE(id integer, type_of_room_name character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query select t.id, t.type_of_room_name from hotel_type_of_room as ht inner join type_of_room t on ht.type_of_room_id = t.id
WHERE ht.hotel_id = _id_hotel;
END;
$$;
 @   DROP FUNCTION public.get_type_of_room_hotel(_id_hotel integer);
       public          postgres    false            |           1255    57359 .   get_user(character varying, character varying)    FUNCTION       CREATE FUNCTION public.get_user(_user_name character varying, _password character varying) RETURNS TABLE(id_user integer, user_name character varying, user_password character varying, id_rol integer, start_date_connection date, last_date_connection date, connected boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT u.id, u.user_name, u.user_password, u.id_rol, u.start_date_connection, 
u.last_date_connection, u.connected  
FROM public.user AS u WHERE u.user_name = _user_name AND u.user_password = _password;
END;
$$;
 Z   DROP FUNCTION public.get_user(_user_name character varying, _password character varying);
       public          postgres    false                       1255    40973    get_vehicle(integer)    FUNCTION     ?  CREATE FUNCTION public.get_vehicle(_id_vehicle integer) RETURNS TABLE(id_vehicle integer, lock character varying, transportation_provider_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT v.id_vehicle, v.lock, v.transportation_provider_id FROM vehicle AS v
WHERE v.id_vehicle = _id_vehicle;
END;
$$;
 7   DROP FUNCTION public.get_vehicle(_id_vehicle integer);
       public          postgres    false            W           1255    40970 ,   get_vehicle_transportation_provider(integer)    FUNCTION     �  CREATE FUNCTION public.get_vehicle_transportation_provider(_id_transportation_provider integer) RETURNS TABLE(id_vehicle integer, lock character varying, transportation_provider_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
return query SELECT v.id_vehicle, v.lock, v.transportation_provider_id FROM vehicle AS v
WHERE v.transportation_provider_id = _id_transportation_provider;
END;
$$;
 _   DROP FUNCTION public.get_vehicle_transportation_provider(_id_transportation_provider integer);
       public          postgres    false            5           1255    40977 j   insert_accommodation_contract(date, date, character varying, character varying, integer, double precision)    FUNCTION       CREATE FUNCTION public.insert_accommodation_contract(_contract_strart_date date, _contract_termination_date date, _contract_description character varying, _type_of_contract character varying, _hotel_id integer, _surcharge double precision) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_contract INTEGER;

BEGIN
INSERT INTO contract (contract_start_date, contract_termination_date, contract_description, type_of_contract, surcharge)
VALUES (_contract_strart_date, _contract_termination_date, _contract_description, _type_of_contract, _surcharge);

SELECT currval(pg_get_serial_sequence('contract', 'id_contract')) INTO _id_contract ;

INSERT INTO accommodation_contract (id_contract, hotel_id)
VALUES (_id_contract, _hotel_id);

RETURN _id_contract;
END;
$$;
 �   DROP FUNCTION public.insert_accommodation_contract(_contract_strart_date date, _contract_termination_date date, _contract_description character varying, _type_of_contract character varying, _hotel_id integer, _surcharge double precision);
       public          postgres    false            j           1255    32852 f   insert_accommodation_modality(character varying, integer, integer, integer, double precision, integer)    FUNCTION     �  CREATE FUNCTION public.insert_accommodation_modality(_type_of_modality character varying, _accommodation_contract_id integer, _type_of_room_id integer, _meal_plan_id integer, _price double precision, _cant_days_accommodation integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_modality INTEGER;
BEGIN

INSERT INTO modality (type_of_modality) VALUES (_type_of_modality);

SELECT currval(pg_get_serial_sequence('modality', 'id')) INTO _id_modality;

INSERT INTO accommodation_modality (id ,accommodation_contract_id, type_of_room_id, meal_plan_id, price, cant_days_accommodation)
VALUES (_id_modality ,_accommodation_contract_id, _type_of_room_id, _meal_plan_id, _price, _cant_days_accommodation);

RETURN _id_modality;
END;
$$;
 �   DROP FUNCTION public.insert_accommodation_modality(_type_of_modality character varying, _accommodation_contract_id integer, _type_of_room_id integer, _meal_plan_id integer, _price double precision, _cant_days_accommodation integer);
       public          postgres    false                       1255    40985 +   insert_activity(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.insert_activity(_activity_description character varying, _service_provider_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_activity integer;
BEGIN
 INSERT INTO activity (activity_description, service_provider_id) 
 VALUES (_activity_description, _service_provider_id) RETURNING id_activity INTO _id_activity;
 
 RETURN _id_activity;
END;
$$;
 m   DROP FUNCTION public.insert_activity(_activity_description character varying, _service_provider_id integer);
       public          postgres    false            L           1255    49241 C   insert_administrator(character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.insert_administrator(_user_name character varying, _user_password character varying, _id_rol integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_user_id integer;
BEGIN

INSERT INTO public.user (user_name, user_password, id_rol, connected) 
VALUES (_user_name, _user_password, _id_rol, false) RETURNING id INTO _user_id;

INSERT INTO public.administrator (user_id)
VALUES (_user_id);

RETURN _user_id;
END;
$$;
 |   DROP FUNCTION public.insert_administrator(_user_name character varying, _user_password character varying, _id_rol integer);
       public          postgres    false            y           1255    57353 d   insert_carrier_contract(date, date, character varying, character varying, integer, double precision)    FUNCTION        CREATE FUNCTION public.insert_carrier_contract(_contract_strart_date date, _contract_termination_date date, _contract_description character varying, _type_of_contract character varying, _transportation_provider_id integer, _surcharge double precision) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_contract INTEGER;

BEGIN
INSERT INTO contract (contract_start_date, contract_termination_date, contract_description, type_of_contract, surcharge)
VALUES (_contract_strart_date, _contract_termination_date, _contract_description, _type_of_contract, _surcharge)
RETURNING id_contract INTO _id_contract  ;

INSERT INTO carrier_contract (id_contract, transportation_provider_id)
VALUES (_id_contract, _transportation_provider_id);

RETURN _id_contract;
END;
$$;
 �   DROP FUNCTION public.insert_carrier_contract(_contract_strart_date date, _contract_termination_date date, _contract_description character varying, _type_of_contract character varying, _transportation_provider_id integer, _surcharge double precision);
       public          postgres    false            K           1255    49268 ?   insert_dependent(character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.insert_dependent(_user_name character varying, _user_password character varying, _id_rol integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_user_id integer;
BEGIN

INSERT INTO public.user (user_name, user_password, id_rol, connected) 
VALUES (_user_name, _user_password, _id_rol, false) RETURNING id INTO _user_id;

INSERT INTO public.dependent (user_id)
VALUES (_user_id);

RETURN _user_id;
END;
$$;
 x   DROP FUNCTION public.insert_dependent(_user_name character varying, _user_password character varying, _id_rol integer);
       public          postgres    false            C           1255    32843 a   insert_hotel(character varying, character varying, character varying, character varying, integer)    FUNCTION       CREATE FUNCTION public.insert_hotel(_name character varying, _hotel_chain character varying, _province character varying, _address character varying, _hotel_category integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_provider integer;
BEGIN

INSERT INTO provider (name, province) VALUES (_name, _province) RETURNING id_provider INTO _id_provider ;

INSERT INTO hotel (id, hotel_chain, address, hotel_category) 
VALUES (_id_provider, _hotel_chain, _address, _hotel_category);

RETURN _id_provider;
END;
$$;
 �   DROP FUNCTION public.insert_hotel(_name character varying, _hotel_chain character varying, _province character varying, _address character varying, _hotel_category integer);
       public          postgres    false                       1255    49243 =   insert_manager(character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.insert_manager(_user_name character varying, _user_password character varying, _id_rol integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_user_id integer;
BEGIN

INSERT INTO public.user (user_name, user_password, id_rol, connected) 
VALUES (_user_name, _user_password, _id_rol, false) RETURNING id INTO _user_id;

INSERT INTO public.manager (user_id)
VALUES (_user_id);

RETURN _user_id;
END;
$$;
 v   DROP FUNCTION public.insert_manager(_user_name character varying, _user_password character varying, _id_rol integer);
       public          postgres    false            I           1255    24878 #   insert_meal_plan(character varying)    FUNCTION     #  CREATE FUNCTION public.insert_meal_plan(_meal_plan_name character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_meal_plan integer;
BEGIN
INSERT INTO meal_plan (meal_plan_name) 
VALUES (_meal_plan_name) RETURNING id INTO _id_meal_plan ;

RETURN _id_meal_plan;

END;
$$;
 J   DROP FUNCTION public.insert_meal_plan(_meal_plan_name character varying);
       public          postgres    false            "           1255    24586 (   insert_meal_plan_hotel(integer, integer)    FUNCTION     �   CREATE FUNCTION public.insert_meal_plan_hotel(_hotel_id integer, _meal_plan_id integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
INSERT INTO hotel_meal_plan (hotel_id, meal_plan_id)
VALUES (_hotel_id, _meal_plan_id);
END;$$;
 W   DROP FUNCTION public.insert_meal_plan_hotel(_hotel_id integer, _meal_plan_id integer);
       public          postgres    false            m           1255    24594 1   insert_modality_tourist_package(integer, integer)    FUNCTION       CREATE FUNCTION public.insert_modality_tourist_package(_modality_id integer, _tourist_package_id integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
INSERT INTO tourist_package_modality (modality_id, tourist_package_id)
VALUES (_modality_id, _tourist_package_id);
END;$$;
 i   DROP FUNCTION public.insert_modality_tourist_package(_modality_id integer, _tourist_package_id integer);
       public          postgres    false            t           1255    49242 F   insert_package_designer(character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.insert_package_designer(_user_name character varying, _user_password character varying, _id_rol integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_user_id integer;
BEGIN

INSERT INTO public.user (user_name, user_password, id_rol, connected) 
VALUES (_user_name, _user_password, _id_rol, false) RETURNING id INTO _user_id;

INSERT INTO public.package_designer (user_id)
VALUES (_user_id);

RETURN _user_id;
END;
$$;
    DROP FUNCTION public.insert_package_designer(_user_name character varying, _user_password character varying, _id_rol integer);
       public          postgres    false            c           1255    49272    insert_rol(character varying)    FUNCTION     �   CREATE FUNCTION public.insert_rol(_rol_name character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$DECLARE
_id_rol integer;
BEGIN
INSERT INTO public.rol (rol_name) VALUES (_rol_name) RETURNING id INTO _id_rol;

RETURN _id_rol;
END;$$;
 >   DROP FUNCTION public.insert_rol(_rol_name character varying);
       public          postgres    false            0           1255    57872 [   insert_season(character varying, date, date, character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.insert_season(_season_name character varying, _season_start_date date, _season_termination_date date, _season_description character varying, _type_season character varying, _accommodation_contract_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_season integer;
BEGIN
INSERT INTO season (season_name, season_start_date, season_termination_date, season_description, type_of_season, accommodation_contract_id) 
VALUES (_season_name, _season_start_date, _season_termination_date, _season_description, _type_season, _accommodation_contract_id)
RETURNING id INTO _id_season ;

RETURN _id_season;
END;
$$;
 �   DROP FUNCTION public.insert_season(_season_name character varying, _season_start_date date, _season_termination_date date, _season_description character varying, _type_season character varying, _accommodation_contract_id integer);
       public          postgres    false            )           1255    57354 d   insert_service_contract(date, date, character varying, character varying, integer, double precision)    FUNCTION     �  CREATE FUNCTION public.insert_service_contract(_contract_strart_date date, _contract_termination_date date, _contract_description character varying, _type_of_contract character varying, _service_provider_id integer, _surcharge double precision) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_contract INTEGER;

BEGIN
INSERT INTO contract (contract_start_date, contract_termination_date, contract_description, type_of_contract, surcharge) 
VALUES (_contract_strart_date, _contract_termination_date, _contract_description, _type_of_contract, _surcharge) 
RETURNING id_contract INTO _id_contract;

INSERT INTO service_contract (id_contract, service_provider_id) 
VALUES (_id_contract, _service_provider_id);

RETURN _id_contract;

END;
$$;
 �   DROP FUNCTION public.insert_service_contract(_contract_strart_date date, _contract_termination_date date, _contract_description character varying, _type_of_contract character varying, _service_provider_id integer, _surcharge double precision);
       public          postgres    false            /           1255    40989 T   insert_service_modality(character varying, integer, integer, date, double precision)    FUNCTION     o  CREATE FUNCTION public.insert_service_modality(_type_of_modality character varying, _service_contract_id integer, _activity_id integer, _release_date date, _price double precision) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_modality INTEGER;
BEGIN
INSERT INTO modality (type_of_modality) 
VALUES (_type_of_modality);

SELECT currval(pg_get_serial_sequence('modality', 'id')) INTO _id_modality;

INSERT INTO service_modality (modality_id, service_contract_id, activity_id, price, release_date) 
VALUES (_id_modality, _service_contract_id, _activity_id, _price, _release_date);

RETURN _id_modality;
END;
$$;
 �   DROP FUNCTION public.insert_service_modality(_type_of_modality character varying, _service_contract_id integer, _activity_id integer, _release_date date, _price double precision);
       public          postgres    false            g           1255    32842 =   insert_service_provider(character varying, character varying)    FUNCTION     ~  CREATE FUNCTION public.insert_service_provider(_name character varying, _province character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_provider integer;
BEGIN

INSERT INTO provider (name, province) VALUES (_name, _province) RETURNING id_provider INTO _id_provider  ;


INSERT INTO service_provider (id)
values (_id_provider);

RETURN _id_provider;
END;
$$;
 d   DROP FUNCTION public.insert_service_provider(_name character varying, _province character varying);
       public          postgres    false            �           1255    49159 )   insert_tourist_package(character varying)    FUNCTION     1  CREATE FUNCTION public.insert_tourist_package(_name character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_tourist_package integer;
BEGIN
INSERT INTO tourist_package (name) 
VALUES (_name) RETURNING id_tourist_package INTO _id_tourist_package;

RETURN _id_tourist_package;
END;
$$;
 F   DROP FUNCTION public.insert_tourist_package(_name character varying);
       public          postgres    false            F           1255    32856 �   insert_transport_modality_cost_kilometers(character varying, integer, integer, character varying, double precision, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.insert_transport_modality_cost_kilometers(_type_of_modality character varying, _vehicle_id integer, _carrier_contract_id integer, _type_transport_modality character varying, _cost_kilometers_going double precision, _cost_kilometers_lap double precision, _cost_hours_wait double precision) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_modality_id INTEGER;
BEGIN
INSERT INTO modality (type_of_modality)
VALUES (_type_of_modality);

SELECT currval(pg_get_serial_sequence('modality', 'id')) INTO _modality_id;

INSERT INTO transport_modality (modality_id, vehicle_id, carrier_contract_id, type_transport_modality)
VALUES (_modality_id, _vehicle_id, _carrier_contract_id, _type_transport_modality);

INSERT INTO cost_kilometers (modality_id, cost_kilometers_going, cost_kilometers_lap, cost_hours_wait) 
VALUES (_modality_id, _cost_kilometers_going, _cost_kilometers_lap, _cost_hours_wait);
RETURN _modality_id;
END;
$$;
 7  DROP FUNCTION public.insert_transport_modality_cost_kilometers(_type_of_modality character varying, _vehicle_id integer, _carrier_contract_id integer, _type_transport_modality character varying, _cost_kilometers_going double precision, _cost_kilometers_lap double precision, _cost_hours_wait double precision);
       public          postgres    false            Q           1255    32857 �   insert_transport_modality_established_route(character varying, integer, integer, character varying, character varying, double precision, double precision)    FUNCTION     |  CREATE FUNCTION public.insert_transport_modality_established_route(_type_of_modality character varying, _vehicle_id integer, _carrier_contract_id integer, _type_transport_modality character varying, _description_rout character varying, _cost_going double precision, _cost_lap double precision) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_modality_id INTEGER;
BEGIN
INSERT INTO modality (type_of_modality)
VALUES (_type_of_modality);

SELECT currval(pg_get_serial_sequence('modality', 'id')) INTO _modality_id;

INSERT INTO transport_modality (modality_id, vehicle_id, carrier_contract_id, type_transport_modality)
VALUES (_modality_id, _vehicle_id, _carrier_contract_id, _type_transport_modality);

INSERT INTO established_route (modality_id, description_rout, cost_going, cost_lap) 
VALUES (_modality_id, _description_rout, _cost_going, _cost_lap);
RETURN _modality_id;
END;
$$;
 %  DROP FUNCTION public.insert_transport_modality_established_route(_type_of_modality character varying, _vehicle_id integer, _carrier_contract_id integer, _type_transport_modality character varying, _description_rout character varying, _cost_going double precision, _cost_lap double precision);
       public          postgres    false            ^           1255    32858 �   insert_transport_modality_hours_kilometers(character varying, integer, integer, character varying, double precision, double precision, double precision, double precision)    FUNCTION     '  CREATE FUNCTION public.insert_transport_modality_hours_kilometers(_type_of_modality character varying, _vehicle_id integer, _carrier_contract_id integer, _type_transport_modality character varying, _cost_kilometers_rout double precision, _cost_hours double precision, _cost_kilometers_rout_addtionals double precision, _cost_hours_additionals double precision) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_modality_id INTEGER;
BEGIN
INSERT INTO modality (type_of_modality)
VALUES (_type_of_modality);

SELECT currval(pg_get_serial_sequence('modality', 'id')) INTO _modality_id;

INSERT INTO transport_modality (modality_id, vehicle_id, carrier_contract_id, type_transport_modality)
VALUES (_modality_id, _vehicle_id, _carrier_contract_id, _type_transport_modality);

INSERT INTO hours_kilometers (modality_id, cost_kilometers_rout, cost_hours, cost_kilometers_rout_additionals, cost_hours_additionals) 
VALUES (_modality_id, _cost_kilometers_rout, _cost_hours, _cost_kilometers_rout_addtionals, _cost_hours_additionals);

RETURN _modality_id;
END;
$$;
 h  DROP FUNCTION public.insert_transport_modality_hours_kilometers(_type_of_modality character varying, _vehicle_id integer, _carrier_contract_id integer, _type_transport_modality character varying, _cost_kilometers_rout double precision, _cost_hours double precision, _cost_kilometers_rout_addtionals double precision, _cost_hours_additionals double precision);
       public          postgres    false            w           1255    32841 D   insert_transportation_provider(character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.insert_transportation_provider(_name character varying, _province character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_provider integer;
BEGIN
INSERT INTO provider (name, province) VALUES (_name, _province) RETURNING id_provider INTO _id_provider;

INSERT INTO  transportation_provider (id) values (_id_provider);

RETURN _id_provider;
END;
$$;
 k   DROP FUNCTION public.insert_transportation_provider(_name character varying, _province character varying);
       public          postgres    false            1           1255    40972 &   insert_type_of_room(character varying)    FUNCTION     :  CREATE FUNCTION public.insert_type_of_room(_type_of_room_name character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_type_of_room integer;
BEGIN
INSERT INTO type_of_room (type_of_room_name) 
VALUES (_type_of_room_name) RETURNING id INTO _id_type_of_room ;

RETURN _id_type_of_room;
END;
$$;
 P   DROP FUNCTION public.insert_type_of_room(_type_of_room_name character varying);
       public          postgres    false            ~           1255    24587 +   insert_type_of_room_hotel(integer, integer)    FUNCTION     �   CREATE FUNCTION public.insert_type_of_room_hotel(_hotel_id integer, _type_of_room_id integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
INSERT INTO hotel_type_of_room (hotel_id, type_of_room_id)
VALUES (_hotel_id, _type_of_room_id);
END;$$;
 ]   DROP FUNCTION public.insert_type_of_room_hotel(_hotel_id integer, _type_of_room_id integer);
       public          postgres    false            G           1255    40969 G   insert_vehicle_into_transportation_provider(character varying, integer)    FUNCTION     �  CREATE FUNCTION public.insert_vehicle_into_transportation_provider(_lock character varying, _transportation_provider_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
_id_vehicle integer;
BEGIN
INSERT INTO vehicle (lock, transportation_provider_id) VALUES (_lock, _transportation_provider_id);

SELECT currval(pg_get_serial_sequence('vehicle', 'id_vehicle')) INTO _id_vehicle;

RETURN _id_vehicle;
END;
$$;
 �   DROP FUNCTION public.insert_vehicle_into_transportation_provider(_lock character varying, _transportation_provider_id integer);
       public          postgres    false                       1255    32844 W   update_accommodation_contract(date, date, character varying, integer, double precision)    FUNCTION     �  CREATE FUNCTION public.update_accommodation_contract(_contract_strart_date date, _contract_termination_date date, _contract_description character varying, _id_contract integer, _surcharge double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE contract SET contract_start_date = _contract_strart_date,
contract_termination_date = _contract_termination_date, contract_description = _contract_description,
surcharge = _surcharge
WHERE id_contract = _id_contract;

END;
$$;
 �   DROP FUNCTION public.update_accommodation_contract(_contract_strart_date date, _contract_termination_date date, _contract_description character varying, _id_contract integer, _surcharge double precision);
       public          postgres    false            �           1255    32861 S   update_accommodation_modality(integer, integer, integer, double precision, integer)    FUNCTION     �  CREATE FUNCTION public.update_accommodation_modality(_id_accommodation_modality integer, _type_of_room_id integer, _meal_plan_id integer, _price double precision, _cant_days_accommodation integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN
 UPDATE accommodation_modality SET type_of_room_id = _type_of_room_id, meal_plan_id = _meal_plan_id,
 price = _price, cant_days_accommodation = _cant_days_accommodation WHERE id = _id_accommodation_modality;
END;
$$;
 �   DROP FUNCTION public.update_accommodation_modality(_id_accommodation_modality integer, _type_of_room_id integer, _meal_plan_id integer, _price double precision, _cant_days_accommodation integer);
       public          postgres    false            *           1255    40986 +   update_activity(integer, character varying)    FUNCTION       CREATE FUNCTION public.update_activity(_id_activity integer, _activity_description character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE activity SET activity_description = _activity_description
WHERE id_activity = _id_activity;
END;
$$;
 e   DROP FUNCTION public.update_activity(_id_activity integer, _activity_description character varying);
       public          postgres    false            x           1255    57345 X   update_administrator(integer, character varying, character varying, date, date, boolean)    FUNCTION     �  CREATE FUNCTION public.update_administrator(_id_administrator integer, _user_name character varying, _user_password character varying, _start_date_connection date, _last_date_connection date, _connected boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE public.user SET user_name = _user_name, user_password =_user_password,
start_date_connection = _start_date_connection, last_date_connection = _last_date_connection, connected = _connected
WHERE id = _id_administrator;

END;
$$;
 �   DROP FUNCTION public.update_administrator(_id_administrator integer, _user_name character varying, _user_password character varying, _start_date_connection date, _last_date_connection date, _connected boolean);
       public          postgres    false            3           1255    57351 Q   update_carrier_contract(date, date, character varying, integer, double precision)    FUNCTION     �  CREATE FUNCTION public.update_carrier_contract(_contract_strart_date date, _contract_termination_date date, _contract_description character varying, _id_contract integer, _surcharge double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE contract SET contract_start_date = _contract_strart_date,
contract_termination_date = _contract_termination_date, contract_description = _contract_description, 
surcharge = _surcharge
WHERE id_contract = _id_contract;
END;
$$;
 �   DROP FUNCTION public.update_carrier_contract(_contract_strart_date date, _contract_termination_date date, _contract_description character varying, _id_contract integer, _surcharge double precision);
       public          postgres    false            _           1255    57346 T   update_dependent(integer, character varying, character varying, date, date, boolean)    FUNCTION     �  CREATE FUNCTION public.update_dependent(_id_manager integer, _user_name character varying, _user_password character varying, _start_date_connection date, _last_date_connection date, _connected boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE public.user SET user_name = _user_name, user_password =_user_password,
start_date_connection = _start_date_connection, last_date_connection = _last_date_connection, connected = _connected
WHERE id = _id_manager;

END;
$$;
 �   DROP FUNCTION public.update_dependent(_id_manager integer, _user_name character varying, _user_password character varying, _start_date_connection date, _last_date_connection date, _connected boolean);
       public          postgres    false            �           1255    24820 j   update_hotel(integer, character varying, character varying, character varying, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.update_hotel(_id_hotel integer, _name character varying, _hotel_chain character varying, _province character varying, _address character varying, _hotel_category integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE provider SET name = _name, province = _province
WHERE id = _id_hotel;

UPDATE hotel SET hotel_chain = _hotel_chain, address = _address, hotel_category = _hotel_category
WHERE id_provider = _id_hotel;

END;
$$;
 �   DROP FUNCTION public.update_hotel(_id_hotel integer, _name character varying, _hotel_chain character varying, _province character varying, _address character varying, _hotel_category integer);
       public          postgres    false            @           1255    57347 R   update_manager(integer, character varying, character varying, date, date, boolean)    FUNCTION     �  CREATE FUNCTION public.update_manager(_id_manager integer, _user_name character varying, _user_password character varying, _start_date_connection date, _last_date_connection date, _connected boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE public.user SET user_name = _user_name, user_password =_user_password,
start_date_connection = _start_date_connection, last_date_connection = _last_date_connection, connected = _connected
WHERE id = _id_manager;

END;
$$;
 �   DROP FUNCTION public.update_manager(_id_manager integer, _user_name character varying, _user_password character varying, _start_date_connection date, _last_date_connection date, _connected boolean);
       public          postgres    false            z           1255    24817 ,   update_meal_plan(integer, character varying)    FUNCTION     �   CREATE FUNCTION public.update_meal_plan(_id_meal_plan integer, _meal_plan_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
UPDATE meal_plan SET meal_plan_name = _meal_plan_name
WHERE id = _id_meal_plan;
END;$$;
 a   DROP FUNCTION public.update_meal_plan(_id_meal_plan integer, _meal_plan_name character varying);
       public          postgres    false            s           1255    57348 [   update_package_designer(integer, character varying, character varying, date, date, boolean)    FUNCTION     �  CREATE FUNCTION public.update_package_designer(_id_package_designer integer, _user_name character varying, _user_password character varying, _start_date_connection date, _last_date_connection date, _connected boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

UPDATE public.user SET user_name = _user_name, user_password =_user_password,
start_date_connection = _start_date_connection, last_date_connection = _last_date_connection, connected = _connected
WHERE id = _id_package_designer;

END;
$$;
 �   DROP FUNCTION public.update_package_designer(_id_package_designer integer, _user_name character varying, _user_password character varying, _start_date_connection date, _last_date_connection date, _connected boolean);
       public          postgres    false            8           1255    49276 &   update_rol(integer, character varying)    FUNCTION     �   CREATE FUNCTION public.update_rol(_id_rol integer, _rol_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
UPDATE public.rol SET rol_name = _rol_name WHERE id = _id_rol;
END;$$;
 O   DROP FUNCTION public.update_rol(_id_rol integer, _rol_name character varying);
       public          postgres    false            {           1255    24800 [   update_season(character varying, date, date, character varying, character varying, integer)    FUNCTION       CREATE FUNCTION public.update_season(_season_name character varying, _season_strart_date date, _season_termination_date date, _season_description character varying, _type_of_season character varying, _id_season integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE season SET season_name =_season_name, season_strart_date = _season_strart_date,
season_termination_date = _season_termination_date, season_description = _season_description,
type_of_season = _type_of_season WHERE id = _id_season;
END;
$$;
 �   DROP FUNCTION public.update_season(_season_name character varying, _season_strart_date date, _season_termination_date date, _season_description character varying, _type_of_season character varying, _id_season integer);
       public          postgres    false            +           1255    24816 9   update_selected_plans(integer, integer, integer, integer)    FUNCTION     N  CREATE FUNCTION public.update_selected_plans(_id_selected_plans integer, _type_of_room_id integer, _meal_plan_id integer, _price integer) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
UPDATE selected_plans SET type_of_room_id = _type_of_room_id, meal_plan_id = _meal_plan_id, price = _price 
WHERE id = _id_selected_plans;
END;$$;
 �   DROP FUNCTION public.update_selected_plans(_id_selected_plans integer, _type_of_room_id integer, _meal_plan_id integer, _price integer);
       public          postgres    false            �           1255    57352 Q   update_service_contract(date, date, character varying, integer, double precision)    FUNCTION     �  CREATE FUNCTION public.update_service_contract(_contract_strart_date date, _contract_termination_date date, _contract_description character varying, _id_contract integer, _surcharge double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE contract SET contract_start_date = _contract_strart_date,
contract_termination_date = _contract_termination_date, contract_description = _contract_description,
surcharge = _surcharge
WHERE id_contract = _id_contract;
END;
$$;
 �   DROP FUNCTION public.update_service_contract(_contract_strart_date date, _contract_termination_date date, _contract_description character varying, _id_contract integer, _surcharge double precision);
       public          postgres    false            r           1255    40990 A   update_service_modality(integer, integer, date, double precision)    FUNCTION     Z  CREATE FUNCTION public.update_service_modality(_id_service_modality integer, _id_activity integer, _release_date date, _price double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE service_modality SET activity_id = _id_activity, release_date = _release_date, price = _price
WHERE modality_id = _id_service_modality;
END;
$$;
 �   DROP FUNCTION public.update_service_modality(_id_service_modality integer, _id_activity integer, _release_date date, _price double precision);
       public          postgres    false            b           1255    24802 F   update_service_provider(integer, character varying, character varying)    FUNCTION     1  CREATE FUNCTION public.update_service_provider(_id_service_provider integer, _service_name character varying, _province character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

UPDATE provider SET name = _service_name, province = _province
WHERE id_provider = _id_service_provider;

END;
$$;
 �   DROP FUNCTION public.update_service_provider(_id_service_provider integer, _service_name character varying, _province character varying);
       public          postgres    false            e           1255    49160 2   update_tourist_package(integer, character varying)    FUNCTION     �   CREATE FUNCTION public.update_tourist_package(_id_tourist_package integer, _name character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$

BEGIN
UPDATE tourist_package SET name = _name WHERE id_tourist_package = _id_tourist_package;

END;
$$;
 c   DROP FUNCTION public.update_tourist_package(_id_tourist_package integer, _name character varying);
       public          postgres    false                       1255    24812 q   update_transport_modality_cost_kilometers(integer, integer, double precision, double precision, double precision)    FUNCTION     N  CREATE FUNCTION public.update_transport_modality_cost_kilometers(_id_transport_modality integer, _id_vehicle integer, _cost_kilometers_going double precision, _cost_kilometers_lap double precision, _cost_hours_wait double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE transport_modality SET vehicle_id = _id_vehicle
WHERE modality_id = _id_transport_modality;

UPDATE cost_kilometers SET _cost_kilometers_going = cost_kilometers_going, cost_kilometers_lap = _cost_kilometers_lap,
cost_hours_wait = _cost_hours_wait
WHERE modality_id = _id_transport_modality;
END;
$$;
 �   DROP FUNCTION public.update_transport_modality_cost_kilometers(_id_transport_modality integer, _id_vehicle integer, _cost_kilometers_going double precision, _cost_kilometers_lap double precision, _cost_hours_wait double precision);
       public          postgres    false            k           1255    24815 t   update_transport_modality_established_route(integer, integer, character varying, double precision, double precision)    FUNCTION       CREATE FUNCTION public.update_transport_modality_established_route(_id_transport_modality integer, _id_vehicle integer, _description_rout character varying, _cost_going double precision, _cost_lap double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE transport_modality SET vehicle_id = _id_vehicle
WHERE modality_id = _id_transport_modality;

UPDATE established_route SET description_rout = _description_rout, cost_going = _cost_going,
cost_lap = _cost_lap
WHERE modality_id = _id_transport_modality;
END;
$$;
 �   DROP FUNCTION public.update_transport_modality_established_route(_id_transport_modality integer, _id_vehicle integer, _description_rout character varying, _cost_going double precision, _cost_lap double precision);
       public          postgres    false            �           1255    24814 �   update_transport_modality_hours_kilometers(integer, integer, double precision, double precision, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.update_transport_modality_hours_kilometers(_id_transport_modality integer, _id_vehicle integer, _cost_kilometers_rout double precision, _cost_hours double precision, _cost_kilometers_rout_additionals double precision, _cost_hours_additionals double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE transport_modality SET vehicle_id = _id_vehicle
WHERE modality_id = _id_transport_modality;

UPDATE hours_kilometers SET cost_kilometers_rout = _cost_kilometers_rout, cost_hours = _cost_hours,
cost_kilometers_rout_additionals = _cost_kilometers_rout_additionals, 
cost_hours_additionals = _cost_hours_additionals
WHERE modality_id = _id_transport_modality;
END;
$$;
   DROP FUNCTION public.update_transport_modality_hours_kilometers(_id_transport_modality integer, _id_vehicle integer, _cost_kilometers_rout double precision, _cost_hours double precision, _cost_kilometers_rout_additionals double precision, _cost_hours_additionals double precision);
       public          postgres    false            <           1255    40979 M   update_transportation_provider(integer, character varying, character varying)    FUNCTION     G  CREATE FUNCTION public.update_transportation_provider(_id_transportation_provider integer, _provider_name character varying, _province character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
UPDATE provider SET name = _provider_name, province =  _province
WHERE id_provider = _id_transportation_provider;
END;
$$;
 �   DROP FUNCTION public.update_transportation_provider(_id_transportation_provider integer, _provider_name character varying, _province character varying);
       public          postgres    false            ,           1255    24818 /   update_type_of_room(integer, character varying)    FUNCTION        CREATE FUNCTION public.update_type_of_room(_id_type_of_room integer, _type_of_room_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
UPDATE type_of_room SET type_of_room_name = _type_of_room_name
WHERE id = _id_type_of_room;
END;$$;
 j   DROP FUNCTION public.update_type_of_room(_id_type_of_room integer, _type_of_room_name character varying);
       public          postgres    false            \           1255    24805 *   update_vehicle(integer, character varying)    FUNCTION     �   CREATE FUNCTION public.update_vehicle(_id_vehicle integer, _lock character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
UPDATE vehicle SET lock = _lock WHERE id_vehicle = _id_vehicle;
END;$$;
 S   DROP FUNCTION public.update_vehicle(_id_vehicle integer, _lock character varying);
       public          postgres    false            �            1259    16711    accommodation_contract    TABLE     p   CREATE TABLE public.accommodation_contract (
    id_contract integer NOT NULL,
    hotel_id integer NOT NULL
);
 *   DROP TABLE public.accommodation_contract;
       public         heap    postgres    false            �            1259    16814    accommodation_modality    TABLE       CREATE TABLE public.accommodation_modality (
    id integer NOT NULL,
    accommodation_contract_id integer NOT NULL,
    type_of_room_id integer NOT NULL,
    meal_plan_id integer NOT NULL,
    price double precision NOT NULL,
    cant_days_accommodation integer NOT NULL
);
 *   DROP TABLE public.accommodation_modality;
       public         heap    postgres    false            �            1259    16723    activity    TABLE     �   CREATE TABLE public.activity (
    id_activity integer NOT NULL,
    activity_description character varying(100) NOT NULL,
    service_provider_id integer NOT NULL
);
    DROP TABLE public.activity;
       public         heap    postgres    false            �            1259    16722    activity_id_activity_seq    SEQUENCE     �   CREATE SEQUENCE public.activity_id_activity_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.activity_id_activity_seq;
       public          postgres    false    217            �           0    0    activity_id_activity_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.activity_id_activity_seq OWNED BY public.activity.id_activity;
          public          postgres    false    216                        1259    49168    administrator    TABLE     D   CREATE TABLE public.administrator (
    user_id integer NOT NULL
);
 !   DROP TABLE public.administrator;
       public         heap    postgres    false            �            1259    16729    carrier_contract    TABLE     |   CREATE TABLE public.carrier_contract (
    id_contract integer NOT NULL,
    transportation_provider_id integer NOT NULL
);
 $   DROP TABLE public.carrier_contract;
       public         heap    postgres    false            �            1259    16736    contract    TABLE     _  CREATE TABLE public.contract (
    id_contract integer NOT NULL,
    contract_start_date date NOT NULL,
    contract_termination_date date NOT NULL,
    contract_description character varying(100) NOT NULL,
    type_of_contract character varying(45) NOT NULL,
    state boolean,
    contract_reconcilation_date date,
    surcharge double precision
);
    DROP TABLE public.contract;
       public         heap    postgres    false            �            1259    16735    contract_id_contract_seq    SEQUENCE     �   CREATE SEQUENCE public.contract_id_contract_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.contract_id_contract_seq;
       public          postgres    false    220            �           0    0    contract_id_contract_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.contract_id_contract_seq OWNED BY public.contract.id_contract;
          public          postgres    false    219            �            1259    16742    cost_kilometers    TABLE     �   CREATE TABLE public.cost_kilometers (
    modality_id integer NOT NULL,
    cost_kilometers_going double precision NOT NULL,
    cost_kilometers_lap double precision NOT NULL,
    cost_hours_wait double precision NOT NULL
);
 #   DROP TABLE public.cost_kilometers;
       public         heap    postgres    false                       1259    49258 	   dependent    TABLE     @   CREATE TABLE public.dependent (
    user_id integer NOT NULL
);
    DROP TABLE public.dependent;
       public         heap    postgres    false            �            1259    16747    established_route    TABLE     �   CREATE TABLE public.established_route (
    modality_id integer NOT NULL,
    description_rout character varying(100) NOT NULL,
    cost_going double precision NOT NULL,
    cost_lap double precision NOT NULL
);
 %   DROP TABLE public.established_route;
       public         heap    postgres    false            �            1259    16753    hotel    TABLE     �   CREATE TABLE public.hotel (
    id integer NOT NULL,
    hotel_chain character varying(100) NOT NULL,
    address character varying(100) NOT NULL,
    hotel_category integer NOT NULL
);
    DROP TABLE public.hotel;
       public         heap    postgres    false            �            1259    16752    hotel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.hotel_id_seq;
       public          postgres    false    224            �           0    0    hotel_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.hotel_id_seq OWNED BY public.hotel.id;
          public          postgres    false    223            �            1259    16759    hotel_meal_plan    TABLE     j   CREATE TABLE public.hotel_meal_plan (
    hotel_id integer NOT NULL,
    meal_plan_id integer NOT NULL
);
 #   DROP TABLE public.hotel_meal_plan;
       public         heap    postgres    false            �            1259    16766    hotel_type_of_room    TABLE     p   CREATE TABLE public.hotel_type_of_room (
    hotel_id integer NOT NULL,
    type_of_room_id integer NOT NULL
);
 &   DROP TABLE public.hotel_type_of_room;
       public         heap    postgres    false            �            1259    16773    hours_kilometers    TABLE       CREATE TABLE public.hours_kilometers (
    modality_id integer NOT NULL,
    cost_kilometers_rout double precision NOT NULL,
    cost_hours double precision NOT NULL,
    cost_kilometers_rout_additionals double precision NOT NULL,
    cost_hours_additionals double precision NOT NULL
);
 $   DROP TABLE public.hours_kilometers;
       public         heap    postgres    false                       1259    49190    manager    TABLE     >   CREATE TABLE public.manager (
    user_id integer NOT NULL
);
    DROP TABLE public.manager;
       public         heap    postgres    false            �            1259    16779 	   meal_plan    TABLE     o   CREATE TABLE public.meal_plan (
    id integer NOT NULL,
    meal_plan_name character varying(100) NOT NULL
);
    DROP TABLE public.meal_plan;
       public         heap    postgres    false            �            1259    16778    meal_plan_id_seq    SEQUENCE     �   CREATE SEQUENCE public.meal_plan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.meal_plan_id_seq;
       public          postgres    false    229            �           0    0    meal_plan_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.meal_plan_id_seq OWNED BY public.meal_plan.id;
          public          postgres    false    228            �            1259    16786    modality    TABLE     o   CREATE TABLE public.modality (
    id integer NOT NULL,
    type_of_modality character varying(45) NOT NULL
);
    DROP TABLE public.modality;
       public         heap    postgres    false            �            1259    16785    modality_id_seq    SEQUENCE     �   CREATE SEQUENCE public.modality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.modality_id_seq;
       public          postgres    false    231            �           0    0    modality_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.modality_id_seq OWNED BY public.modality.id;
          public          postgres    false    230                       1259    49173    package_designer    TABLE     G   CREATE TABLE public.package_designer (
    user_id integer NOT NULL
);
 $   DROP TABLE public.package_designer;
       public         heap    postgres    false            �            1259    32792    provider_id_seq    SEQUENCE     x   CREATE SEQUENCE public.provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.provider_id_seq;
       public          postgres    false            �            1259    32793    provider    TABLE     �   CREATE TABLE public.provider (
    id_provider integer DEFAULT nextval('public.provider_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL,
    province character varying NOT NULL
);
    DROP TABLE public.provider;
       public         heap    postgres    false    250            �            1259    32877 
   rol_id_seq    SEQUENCE     s   CREATE SEQUENCE public.rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.rol_id_seq;
       public          postgres    false            �            1259    32878    rol    TABLE     �   CREATE TABLE public.rol (
    id integer DEFAULT nextval('public.rol_id_seq'::regclass) NOT NULL,
    rol_name character varying NOT NULL
);
    DROP TABLE public.rol;
       public         heap    postgres    false    252            �            1259    16793    season    TABLE     T  CREATE TABLE public.season (
    id integer NOT NULL,
    season_name character varying(100) NOT NULL,
    season_start_date date NOT NULL,
    season_termination_date date NOT NULL,
    season_description character varying(200) NOT NULL,
    type_of_season character varying(45) NOT NULL,
    accommodation_contract_id integer NOT NULL
);
    DROP TABLE public.season;
       public         heap    postgres    false            �            1259    16792    season_id_seq    SEQUENCE     �   CREATE SEQUENCE public.season_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.season_id_seq;
       public          postgres    false    233            �           0    0    season_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.season_id_seq OWNED BY public.season.id;
          public          postgres    false    232            �            1259    16813    selected_plans_id_seq    SEQUENCE     �   CREATE SEQUENCE public.selected_plans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.selected_plans_id_seq;
       public          postgres    false    235            �           0    0    selected_plans_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.selected_plans_id_seq OWNED BY public.accommodation_modality.id;
          public          postgres    false    234            �            1259    16823    service_contract    TABLE     u   CREATE TABLE public.service_contract (
    id_contract integer NOT NULL,
    service_provider_id integer NOT NULL
);
 $   DROP TABLE public.service_contract;
       public         heap    postgres    false            �            1259    16829    service_modality    TABLE     �   CREATE TABLE public.service_modality (
    modality_id integer NOT NULL,
    service_contract_id integer NOT NULL,
    activity_id integer NOT NULL,
    price double precision NOT NULL,
    release_date date NOT NULL
);
 $   DROP TABLE public.service_modality;
       public         heap    postgres    false            �            1259    16837    service_provider    TABLE     B   CREATE TABLE public.service_provider (
    id integer NOT NULL
);
 $   DROP TABLE public.service_provider;
       public         heap    postgres    false            �            1259    16836    service_provider_id_seq    SEQUENCE     �   CREATE SEQUENCE public.service_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.service_provider_id_seq;
       public          postgres    false    239            �           0    0    service_provider_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.service_provider_id_seq OWNED BY public.service_provider.id;
          public          postgres    false    238            �            1259    16844    tourist_package    TABLE     v   CREATE TABLE public.tourist_package (
    id_tourist_package integer NOT NULL,
    name character varying NOT NULL
);
 #   DROP TABLE public.tourist_package;
       public         heap    postgres    false            �            1259    16843 &   tourist_package_id_tourist_package_seq    SEQUENCE     �   CREATE SEQUENCE public.tourist_package_id_tourist_package_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.tourist_package_id_tourist_package_seq;
       public          postgres    false    241            �           0    0 &   tourist_package_id_tourist_package_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.tourist_package_id_tourist_package_seq OWNED BY public.tourist_package.id_tourist_package;
          public          postgres    false    240            �            1259    16850    tourist_package_modality    TABLE     |   CREATE TABLE public.tourist_package_modality (
    modality_id integer NOT NULL,
    tourist_package_id integer NOT NULL
);
 ,   DROP TABLE public.tourist_package_modality;
       public         heap    postgres    false            �            1259    16857    transport_modality    TABLE     �   CREATE TABLE public.transport_modality (
    modality_id integer NOT NULL,
    vehicle_id integer NOT NULL,
    carrier_contract_id integer NOT NULL,
    type_transport_modality character varying(45) NOT NULL
);
 &   DROP TABLE public.transport_modality;
       public         heap    postgres    false            �            1259    16865    transportation_provider    TABLE     I   CREATE TABLE public.transportation_provider (
    id integer NOT NULL
);
 +   DROP TABLE public.transportation_provider;
       public         heap    postgres    false            �            1259    16864    transportation_provider_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transportation_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.transportation_provider_id_seq;
       public          postgres    false    245            �           0    0    transportation_provider_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.transportation_provider_id_seq OWNED BY public.transportation_provider.id;
          public          postgres    false    244            �            1259    16872    type_of_room    TABLE     u   CREATE TABLE public.type_of_room (
    id integer NOT NULL,
    type_of_room_name character varying(100) NOT NULL
);
     DROP TABLE public.type_of_room;
       public         heap    postgres    false            �            1259    16871    type_of_room_id_seq    SEQUENCE     �   CREATE SEQUENCE public.type_of_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.type_of_room_id_seq;
       public          postgres    false    247            �           0    0    type_of_room_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.type_of_room_id_seq OWNED BY public.type_of_room.id;
          public          postgres    false    246            �            1259    32886    user_id_seq    SEQUENCE     t   CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false            �            1259    32887    user    TABLE     3  CREATE TABLE public."user" (
    id integer DEFAULT nextval('public.user_id_seq'::regclass) NOT NULL,
    user_name character varying NOT NULL,
    user_password character varying NOT NULL,
    id_rol integer NOT NULL,
    start_date_connection date,
    last_date_connection date,
    connected boolean
);
    DROP TABLE public."user";
       public         heap    postgres    false    254            �            1259    16879    vehicle    TABLE     �   CREATE TABLE public.vehicle (
    id_vehicle integer NOT NULL,
    lock character varying(45) NOT NULL,
    transportation_provider_id integer NOT NULL
);
    DROP TABLE public.vehicle;
       public         heap    postgres    false            �            1259    16878    vehicle_id_vehicle_seq    SEQUENCE     �   CREATE SEQUENCE public.vehicle_id_vehicle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.vehicle_id_vehicle_seq;
       public          postgres    false    249            �           0    0    vehicle_id_vehicle_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.vehicle_id_vehicle_seq OWNED BY public.vehicle.id_vehicle;
          public          postgres    false    248            Q           2604    16726    activity id_activity    DEFAULT     |   ALTER TABLE ONLY public.activity ALTER COLUMN id_activity SET DEFAULT nextval('public.activity_id_activity_seq'::regclass);
 C   ALTER TABLE public.activity ALTER COLUMN id_activity DROP DEFAULT;
       public          postgres    false    217    216    217            R           2604    16739    contract id_contract    DEFAULT     |   ALTER TABLE ONLY public.contract ALTER COLUMN id_contract SET DEFAULT nextval('public.contract_id_contract_seq'::regclass);
 C   ALTER TABLE public.contract ALTER COLUMN id_contract DROP DEFAULT;
       public          postgres    false    219    220    220            S           2604    16782    meal_plan id    DEFAULT     l   ALTER TABLE ONLY public.meal_plan ALTER COLUMN id SET DEFAULT nextval('public.meal_plan_id_seq'::regclass);
 ;   ALTER TABLE public.meal_plan ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            T           2604    16789    modality id    DEFAULT     j   ALTER TABLE ONLY public.modality ALTER COLUMN id SET DEFAULT nextval('public.modality_id_seq'::regclass);
 :   ALTER TABLE public.modality ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            U           2604    16796 	   season id    DEFAULT     f   ALTER TABLE ONLY public.season ALTER COLUMN id SET DEFAULT nextval('public.season_id_seq'::regclass);
 8   ALTER TABLE public.season ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            V           2604    16847 "   tourist_package id_tourist_package    DEFAULT     �   ALTER TABLE ONLY public.tourist_package ALTER COLUMN id_tourist_package SET DEFAULT nextval('public.tourist_package_id_tourist_package_seq'::regclass);
 Q   ALTER TABLE public.tourist_package ALTER COLUMN id_tourist_package DROP DEFAULT;
       public          postgres    false    241    240    241            W           2604    16875    type_of_room id    DEFAULT     r   ALTER TABLE ONLY public.type_of_room ALTER COLUMN id SET DEFAULT nextval('public.type_of_room_id_seq'::regclass);
 >   ALTER TABLE public.type_of_room ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246    247            X           2604    16882    vehicle id_vehicle    DEFAULT     x   ALTER TABLE ONLY public.vehicle ALTER COLUMN id_vehicle SET DEFAULT nextval('public.vehicle_id_vehicle_seq'::regclass);
 A   ALTER TABLE public.vehicle ALTER COLUMN id_vehicle DROP DEFAULT;
       public          postgres    false    248    249    249            \          0    16711    accommodation_contract 
   TABLE DATA           G   COPY public.accommodation_contract (id_contract, hotel_id) FROM stdin;
    public          postgres    false    215   hj      p          0    16814    accommodation_modality 
   TABLE DATA           �   COPY public.accommodation_modality (id, accommodation_contract_id, type_of_room_id, meal_plan_id, price, cant_days_accommodation) FROM stdin;
    public          postgres    false    235   �j      ^          0    16723    activity 
   TABLE DATA           Z   COPY public.activity (id_activity, activity_description, service_provider_id) FROM stdin;
    public          postgres    false    217   �j      �          0    49168    administrator 
   TABLE DATA           0   COPY public.administrator (user_id) FROM stdin;
    public          postgres    false    256   �j      _          0    16729    carrier_contract 
   TABLE DATA           S   COPY public.carrier_contract (id_contract, transportation_provider_id) FROM stdin;
    public          postgres    false    218   *k      a          0    16736    contract 
   TABLE DATA           �   COPY public.contract (id_contract, contract_start_date, contract_termination_date, contract_description, type_of_contract, state, contract_reconcilation_date, surcharge) FROM stdin;
    public          postgres    false    220   Gk      b          0    16742    cost_kilometers 
   TABLE DATA           s   COPY public.cost_kilometers (modality_id, cost_kilometers_going, cost_kilometers_lap, cost_hours_wait) FROM stdin;
    public          postgres    false    221   �k      �          0    49258 	   dependent 
   TABLE DATA           ,   COPY public.dependent (user_id) FROM stdin;
    public          postgres    false    259   �k      c          0    16747    established_route 
   TABLE DATA           `   COPY public.established_route (modality_id, description_rout, cost_going, cost_lap) FROM stdin;
    public          postgres    false    222   �k      e          0    16753    hotel 
   TABLE DATA           I   COPY public.hotel (id, hotel_chain, address, hotel_category) FROM stdin;
    public          postgres    false    224   �k      f          0    16759    hotel_meal_plan 
   TABLE DATA           A   COPY public.hotel_meal_plan (hotel_id, meal_plan_id) FROM stdin;
    public          postgres    false    225   ?l      g          0    16766    hotel_type_of_room 
   TABLE DATA           G   COPY public.hotel_type_of_room (hotel_id, type_of_room_id) FROM stdin;
    public          postgres    false    226   rl      h          0    16773    hours_kilometers 
   TABLE DATA           �   COPY public.hours_kilometers (modality_id, cost_kilometers_rout, cost_hours, cost_kilometers_rout_additionals, cost_hours_additionals) FROM stdin;
    public          postgres    false    227   �l      �          0    49190    manager 
   TABLE DATA           *   COPY public.manager (user_id) FROM stdin;
    public          postgres    false    258   �l      j          0    16779 	   meal_plan 
   TABLE DATA           7   COPY public.meal_plan (id, meal_plan_name) FROM stdin;
    public          postgres    false    229   �l      l          0    16786    modality 
   TABLE DATA           8   COPY public.modality (id, type_of_modality) FROM stdin;
    public          postgres    false    231   m      �          0    49173    package_designer 
   TABLE DATA           3   COPY public.package_designer (user_id) FROM stdin;
    public          postgres    false    257   �m      �          0    32793    provider 
   TABLE DATA           ?   COPY public.provider (id_provider, name, province) FROM stdin;
    public          postgres    false    251   �m      �          0    32878    rol 
   TABLE DATA           +   COPY public.rol (id, rol_name) FROM stdin;
    public          postgres    false    253   kn      n          0    16793    season 
   TABLE DATA           �   COPY public.season (id, season_name, season_start_date, season_termination_date, season_description, type_of_season, accommodation_contract_id) FROM stdin;
    public          postgres    false    233   �n      q          0    16823    service_contract 
   TABLE DATA           L   COPY public.service_contract (id_contract, service_provider_id) FROM stdin;
    public          postgres    false    236   �n      r          0    16829    service_modality 
   TABLE DATA           n   COPY public.service_modality (modality_id, service_contract_id, activity_id, price, release_date) FROM stdin;
    public          postgres    false    237   �n      t          0    16837    service_provider 
   TABLE DATA           .   COPY public.service_provider (id) FROM stdin;
    public          postgres    false    239   6o      v          0    16844    tourist_package 
   TABLE DATA           C   COPY public.tourist_package (id_tourist_package, name) FROM stdin;
    public          postgres    false    241   \o      w          0    16850    tourist_package_modality 
   TABLE DATA           S   COPY public.tourist_package_modality (modality_id, tourist_package_id) FROM stdin;
    public          postgres    false    242   �o      x          0    16857    transport_modality 
   TABLE DATA           s   COPY public.transport_modality (modality_id, vehicle_id, carrier_contract_id, type_transport_modality) FROM stdin;
    public          postgres    false    243   7p      z          0    16865    transportation_provider 
   TABLE DATA           5   COPY public.transportation_provider (id) FROM stdin;
    public          postgres    false    245   Tp      |          0    16872    type_of_room 
   TABLE DATA           =   COPY public.type_of_room (id, type_of_room_name) FROM stdin;
    public          postgres    false    247   zp      �          0    32887    user 
   TABLE DATA           ~   COPY public."user" (id, user_name, user_password, id_rol, start_date_connection, last_date_connection, connected) FROM stdin;
    public          postgres    false    255   �p      ~          0    16879    vehicle 
   TABLE DATA           O   COPY public.vehicle (id_vehicle, lock, transportation_provider_id) FROM stdin;
    public          postgres    false    249   Iq      �           0    0    activity_id_activity_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.activity_id_activity_seq', 25, true);
          public          postgres    false    216            �           0    0    contract_id_contract_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.contract_id_contract_seq', 20, true);
          public          postgres    false    219            �           0    0    hotel_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.hotel_id_seq', 1, false);
          public          postgres    false    223            �           0    0    meal_plan_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.meal_plan_id_seq', 2, true);
          public          postgres    false    228            �           0    0    modality_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.modality_id_seq', 31, true);
          public          postgres    false    230            �           0    0    provider_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.provider_id_seq', 54, true);
          public          postgres    false    250            �           0    0 
   rol_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.rol_id_seq', 4, true);
          public          postgres    false    252            �           0    0    season_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.season_id_seq', 5, true);
          public          postgres    false    232            �           0    0    selected_plans_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.selected_plans_id_seq', 1, false);
          public          postgres    false    234            �           0    0    service_provider_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.service_provider_id_seq', 1, false);
          public          postgres    false    238            �           0    0 &   tourist_package_id_tourist_package_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.tourist_package_id_tourist_package_seq', 12, true);
          public          postgres    false    240            �           0    0    transportation_provider_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.transportation_provider_id_seq', 3, true);
          public          postgres    false    244            �           0    0    type_of_room_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.type_of_room_id_seq', 2, true);
          public          postgres    false    246            �           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 49, true);
          public          postgres    false    254            �           0    0    vehicle_id_vehicle_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.vehicle_id_vehicle_seq', 23, true);
          public          postgres    false    248            �           2606    49172     administrator administrator_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_pkey PRIMARY KEY (user_id);
 J   ALTER TABLE ONLY public.administrator DROP CONSTRAINT administrator_pkey;
       public            postgres    false    256            �           2606    49262    dependent dependent_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.dependent
    ADD CONSTRAINT dependent_pkey PRIMARY KEY (user_id);
 B   ALTER TABLE ONLY public.dependent DROP CONSTRAINT dependent_pkey;
       public            postgres    false    259            �           2606    49194    manager manager_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.manager
    ADD CONSTRAINT manager_pkey PRIMARY KEY (user_id);
 >   ALTER TABLE ONLY public.manager DROP CONSTRAINT manager_pkey;
       public            postgres    false    258            �           2606    49184 &   package_designer package_designer_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.package_designer
    ADD CONSTRAINT package_designer_pkey PRIMARY KEY (user_id);
 P   ALTER TABLE ONLY public.package_designer DROP CONSTRAINT package_designer_pkey;
       public            postgres    false    257            ^           2606    16715 0   accommodation_contract pk_accommodation_contract 
   CONSTRAINT     w   ALTER TABLE ONLY public.accommodation_contract
    ADD CONSTRAINT pk_accommodation_contract PRIMARY KEY (id_contract);
 Z   ALTER TABLE ONLY public.accommodation_contract DROP CONSTRAINT pk_accommodation_contract;
       public            postgres    false    215            `           2606    16728    activity pk_activity 
   CONSTRAINT     [   ALTER TABLE ONLY public.activity
    ADD CONSTRAINT pk_activity PRIMARY KEY (id_activity);
 >   ALTER TABLE ONLY public.activity DROP CONSTRAINT pk_activity;
       public            postgres    false    217            c           2606    16733 $   carrier_contract pk_carrier_contract 
   CONSTRAINT     k   ALTER TABLE ONLY public.carrier_contract
    ADD CONSTRAINT pk_carrier_contract PRIMARY KEY (id_contract);
 N   ALTER TABLE ONLY public.carrier_contract DROP CONSTRAINT pk_carrier_contract;
       public            postgres    false    218            e           2606    16741    contract pk_contract 
   CONSTRAINT     [   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT pk_contract PRIMARY KEY (id_contract);
 >   ALTER TABLE ONLY public.contract DROP CONSTRAINT pk_contract;
       public            postgres    false    220            g           2606    16746 "   cost_kilometers pk_cost_kilometers 
   CONSTRAINT     i   ALTER TABLE ONLY public.cost_kilometers
    ADD CONSTRAINT pk_cost_kilometers PRIMARY KEY (modality_id);
 L   ALTER TABLE ONLY public.cost_kilometers DROP CONSTRAINT pk_cost_kilometers;
       public            postgres    false    221            i           2606    16751 &   established_route pk_established_route 
   CONSTRAINT     m   ALTER TABLE ONLY public.established_route
    ADD CONSTRAINT pk_established_route PRIMARY KEY (modality_id);
 P   ALTER TABLE ONLY public.established_route DROP CONSTRAINT pk_established_route;
       public            postgres    false    222            k           2606    16758    hotel pk_hotel 
   CONSTRAINT     L   ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT pk_hotel PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.hotel DROP CONSTRAINT pk_hotel;
       public            postgres    false    224            o           2606    16763 "   hotel_meal_plan pk_hotel_meal_plan 
   CONSTRAINT     t   ALTER TABLE ONLY public.hotel_meal_plan
    ADD CONSTRAINT pk_hotel_meal_plan PRIMARY KEY (hotel_id, meal_plan_id);
 L   ALTER TABLE ONLY public.hotel_meal_plan DROP CONSTRAINT pk_hotel_meal_plan;
       public            postgres    false    225    225            s           2606    16770 (   hotel_type_of_room pk_hotel_type_of_room 
   CONSTRAINT     }   ALTER TABLE ONLY public.hotel_type_of_room
    ADD CONSTRAINT pk_hotel_type_of_room PRIMARY KEY (hotel_id, type_of_room_id);
 R   ALTER TABLE ONLY public.hotel_type_of_room DROP CONSTRAINT pk_hotel_type_of_room;
       public            postgres    false    226    226            u           2606    16777 $   hours_kilometers pk_hours_kilometers 
   CONSTRAINT     k   ALTER TABLE ONLY public.hours_kilometers
    ADD CONSTRAINT pk_hours_kilometers PRIMARY KEY (modality_id);
 N   ALTER TABLE ONLY public.hours_kilometers DROP CONSTRAINT pk_hours_kilometers;
       public            postgres    false    227            w           2606    16784    meal_plan pk_meal_plan 
   CONSTRAINT     T   ALTER TABLE ONLY public.meal_plan
    ADD CONSTRAINT pk_meal_plan PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.meal_plan DROP CONSTRAINT pk_meal_plan;
       public            postgres    false    229            y           2606    16791    modality pk_modality 
   CONSTRAINT     R   ALTER TABLE ONLY public.modality
    ADD CONSTRAINT pk_modality PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.modality DROP CONSTRAINT pk_modality;
       public            postgres    false    231            {           2606    16798    season pk_season 
   CONSTRAINT     N   ALTER TABLE ONLY public.season
    ADD CONSTRAINT pk_season PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.season DROP CONSTRAINT pk_season;
       public            postgres    false    233            �           2606    16819 (   accommodation_modality pk_selected_plans 
   CONSTRAINT     f   ALTER TABLE ONLY public.accommodation_modality
    ADD CONSTRAINT pk_selected_plans PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.accommodation_modality DROP CONSTRAINT pk_selected_plans;
       public            postgres    false    235            �           2606    16827 $   service_contract pk_service_contract 
   CONSTRAINT     k   ALTER TABLE ONLY public.service_contract
    ADD CONSTRAINT pk_service_contract PRIMARY KEY (id_contract);
 N   ALTER TABLE ONLY public.service_contract DROP CONSTRAINT pk_service_contract;
       public            postgres    false    236            �           2606    16833 $   service_modality pk_service_modality 
   CONSTRAINT     k   ALTER TABLE ONLY public.service_modality
    ADD CONSTRAINT pk_service_modality PRIMARY KEY (modality_id);
 N   ALTER TABLE ONLY public.service_modality DROP CONSTRAINT pk_service_modality;
       public            postgres    false    237            �           2606    16842 $   service_provider pk_service_provider 
   CONSTRAINT     b   ALTER TABLE ONLY public.service_provider
    ADD CONSTRAINT pk_service_provider PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.service_provider DROP CONSTRAINT pk_service_provider;
       public            postgres    false    239            �           2606    16849 "   tourist_package pk_tourist_package 
   CONSTRAINT     p   ALTER TABLE ONLY public.tourist_package
    ADD CONSTRAINT pk_tourist_package PRIMARY KEY (id_tourist_package);
 L   ALTER TABLE ONLY public.tourist_package DROP CONSTRAINT pk_tourist_package;
       public            postgres    false    241            �           2606    16854 4   tourist_package_modality pk_tourist_package_modality 
   CONSTRAINT     �   ALTER TABLE ONLY public.tourist_package_modality
    ADD CONSTRAINT pk_tourist_package_modality PRIMARY KEY (modality_id, tourist_package_id);
 ^   ALTER TABLE ONLY public.tourist_package_modality DROP CONSTRAINT pk_tourist_package_modality;
       public            postgres    false    242    242            �           2606    16861 (   transport_modality pk_transport_modality 
   CONSTRAINT     o   ALTER TABLE ONLY public.transport_modality
    ADD CONSTRAINT pk_transport_modality PRIMARY KEY (modality_id);
 R   ALTER TABLE ONLY public.transport_modality DROP CONSTRAINT pk_transport_modality;
       public            postgres    false    243            �           2606    16870 2   transportation_provider pk_transportation_provider 
   CONSTRAINT     p   ALTER TABLE ONLY public.transportation_provider
    ADD CONSTRAINT pk_transportation_provider PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.transportation_provider DROP CONSTRAINT pk_transportation_provider;
       public            postgres    false    245            �           2606    16877    type_of_room pk_type_of_room 
   CONSTRAINT     Z   ALTER TABLE ONLY public.type_of_room
    ADD CONSTRAINT pk_type_of_room PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.type_of_room DROP CONSTRAINT pk_type_of_room;
       public            postgres    false    247            �           2606    16884    vehicle pk_vehicle 
   CONSTRAINT     X   ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT pk_vehicle PRIMARY KEY (id_vehicle);
 <   ALTER TABLE ONLY public.vehicle DROP CONSTRAINT pk_vehicle;
       public            postgres    false    249            �           2606    32800    provider provider_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (id_provider);
 @   ALTER TABLE ONLY public.provider DROP CONSTRAINT provider_pkey;
       public            postgres    false    251            �           2606    32885    rol rol_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.rol DROP CONSTRAINT rol_pkey;
       public            postgres    false    253            �           2606    49177    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    255            \           1259    16716 "   fk_contrato_alojamiento_hotel1_idx    INDEX     i   CREATE INDEX fk_contrato_alojamiento_hotel1_idx ON public.accommodation_contract USING btree (hotel_id);
 6   DROP INDEX public.fk_contrato_alojamiento_hotel1_idx;
       public            postgres    false    215            �           1259    16834 1   fk_contrato_servicio_has_actividad_actividad1_idx    INDEX     u   CREATE INDEX fk_contrato_servicio_has_actividad_actividad1_idx ON public.service_modality USING btree (activity_id);
 E   DROP INDEX public.fk_contrato_servicio_has_actividad_actividad1_idx;
       public            postgres    false    237            �           1259    16835 9   fk_contrato_servicio_has_actividad_contrato_servicio1_idx    INDEX     �   CREATE INDEX fk_contrato_servicio_has_actividad_contrato_servicio1_idx ON public.service_modality USING btree (service_contract_id);
 M   DROP INDEX public.fk_contrato_servicio_has_actividad_contrato_servicio1_idx;
       public            postgres    false    237            �           1259    16828 1   fk_contrato_servicio_prestatario_de_servicio1_idx    INDEX     }   CREATE INDEX fk_contrato_servicio_prestatario_de_servicio1_idx ON public.service_contract USING btree (service_provider_id);
 E   DROP INDEX public.fk_contrato_servicio_prestatario_de_servicio1_idx;
       public            postgres    false    236            �           1259    16862 4   fk_contrato_transportista_has_vehiculo_vehiculo1_idx    INDEX     y   CREATE INDEX fk_contrato_transportista_has_vehiculo_vehiculo1_idx ON public.transport_modality USING btree (vehicle_id);
 H   DROP INDEX public.fk_contrato_transportista_has_vehiculo_vehiculo1_idx;
       public            postgres    false    243            a           1259    16734 5   fk_contrato_transportista_prestatario_transporte1_idx    INDEX     �   CREATE INDEX fk_contrato_transportista_prestatario_transporte1_idx ON public.carrier_contract USING btree (transportation_provider_id);
 I   DROP INDEX public.fk_contrato_transportista_prestatario_transporte1_idx;
       public            postgres    false    218            l           1259    16765 !   fk_hotel_has_meal_plan_hotel1_idx    INDEX     a   CREATE INDEX fk_hotel_has_meal_plan_hotel1_idx ON public.hotel_meal_plan USING btree (hotel_id);
 5   DROP INDEX public.fk_hotel_has_meal_plan_hotel1_idx;
       public            postgres    false    225            m           1259    16764 %   fk_hotel_has_meal_plan_meal_plan1_idx    INDEX     i   CREATE INDEX fk_hotel_has_meal_plan_meal_plan1_idx ON public.hotel_meal_plan USING btree (meal_plan_id);
 9   DROP INDEX public.fk_hotel_has_meal_plan_meal_plan1_idx;
       public            postgres    false    225            p           1259    16772 $   fk_hotel_has_type_of_room_hotel1_idx    INDEX     g   CREATE INDEX fk_hotel_has_type_of_room_hotel1_idx ON public.hotel_type_of_room USING btree (hotel_id);
 8   DROP INDEX public.fk_hotel_has_type_of_room_hotel1_idx;
       public            postgres    false    226            q           1259    16771 +   fk_hotel_has_type_of_room_type_of_room1_idx    INDEX     u   CREATE INDEX fk_hotel_has_type_of_room_type_of_room1_idx ON public.hotel_type_of_room USING btree (type_of_room_id);
 ?   DROP INDEX public.fk_hotel_has_type_of_room_type_of_room1_idx;
       public            postgres    false    226            �           1259    16863 3   fk_modalidad_contratada_contrato_transportista1_idx    INDEX     �   CREATE INDEX fk_modalidad_contratada_contrato_transportista1_idx ON public.transport_modality USING btree (carrier_contract_id);
 G   DROP INDEX public.fk_modalidad_contratada_contrato_transportista1_idx;
       public            postgres    false    243            �           1259    16856 -   fk_modality_has_tourist_package_modality1_idx    INDEX     y   CREATE INDEX fk_modality_has_tourist_package_modality1_idx ON public.tourist_package_modality USING btree (modality_id);
 A   DROP INDEX public.fk_modality_has_tourist_package_modality1_idx;
       public            postgres    false    242            �           1259    16855 4   fk_modality_has_tourist_package_tourist_package1_idx    INDEX     �   CREATE INDEX fk_modality_has_tourist_package_tourist_package1_idx ON public.tourist_package_modality USING btree (tourist_package_id);
 H   DROP INDEX public.fk_modality_has_tourist_package_tourist_package1_idx;
       public            postgres    false    242            |           1259    16820 -   fk_planes_escogidos_contrato_alojamiento1_idx    INDEX     �   CREATE INDEX fk_planes_escogidos_contrato_alojamiento1_idx ON public.accommodation_modality USING btree (accommodation_contract_id);
 A   DROP INDEX public.fk_planes_escogidos_contrato_alojamiento1_idx;
       public            postgres    false    235            }           1259    16822     fk_selected_plans_meal_plan1_idx    INDEX     k   CREATE INDEX fk_selected_plans_meal_plan1_idx ON public.accommodation_modality USING btree (meal_plan_id);
 4   DROP INDEX public.fk_selected_plans_meal_plan1_idx;
       public            postgres    false    235            ~           1259    16821 #   fk_selected_plans_type_of_room1_idx    INDEX     q   CREATE INDEX fk_selected_plans_type_of_room1_idx ON public.accommodation_modality USING btree (type_of_room_id);
 7   DROP INDEX public.fk_selected_plans_type_of_room1_idx;
       public            postgres    false    235            �           1259    16885 '   fk_vehiculo_prestatario_transporte1_idx    INDEX     q   CREATE INDEX fk_vehiculo_prestatario_transporte1_idx ON public.vehicle USING btree (transportation_provider_id);
 ;   DROP INDEX public.fk_vehiculo_prestatario_transporte1_idx;
       public            postgres    false    249            �           2606    32847 <   accommodation_modality fk_accommodation_modality_id_modality    FK CONSTRAINT     �   ALTER TABLE ONLY public.accommodation_modality
    ADD CONSTRAINT fk_accommodation_modality_id_modality FOREIGN KEY (id) REFERENCES public.modality(id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.accommodation_modality DROP CONSTRAINT fk_accommodation_modality_id_modality;
       public          postgres    false    4985    231    235            �           2606    24867 (   activity fk_activity_service_provider_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.activity
    ADD CONSTRAINT fk_activity_service_provider_id FOREIGN KEY (service_provider_id) REFERENCES public.service_provider(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.activity DROP CONSTRAINT fk_activity_service_provider_id;
       public          postgres    false    5001    239    217            �           2606    24753 8   accommodation_contract fk_contrato_alojamiento_contrato1    FK CONSTRAINT     �   ALTER TABLE ONLY public.accommodation_contract
    ADD CONSTRAINT fk_contrato_alojamiento_contrato1 FOREIGN KEY (id_contract) REFERENCES public.contract(id_contract) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.accommodation_contract DROP CONSTRAINT fk_contrato_alojamiento_contrato1;
       public          postgres    false    220    215    4965            �           2606    24763 5   accommodation_contract fk_contrato_alojamiento_hotel1    FK CONSTRAINT     �   ALTER TABLE ONLY public.accommodation_contract
    ADD CONSTRAINT fk_contrato_alojamiento_hotel1 FOREIGN KEY (hotel_id) REFERENCES public.hotel(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.accommodation_contract DROP CONSTRAINT fk_contrato_alojamiento_hotel1;
       public          postgres    false    224    4971    215            �           2606    24658 /   service_contract fk_contrato_servicio_contrato1    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_contract
    ADD CONSTRAINT fk_contrato_servicio_contrato1 FOREIGN KEY (id_contract) REFERENCES public.contract(id_contract) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.service_contract DROP CONSTRAINT fk_contrato_servicio_contrato1;
       public          postgres    false    236    220    4965            �           2606    24643 >   service_modality fk_contrato_servicio_has_actividad_actividad1    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_modality
    ADD CONSTRAINT fk_contrato_servicio_has_actividad_actividad1 FOREIGN KEY (activity_id) REFERENCES public.activity(id_activity) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.service_modality DROP CONSTRAINT fk_contrato_servicio_has_actividad_actividad1;
       public          postgres    false    237    217    4960            �           2606    24648 F   service_modality fk_contrato_servicio_has_actividad_contrato_servicio1    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_modality
    ADD CONSTRAINT fk_contrato_servicio_has_actividad_contrato_servicio1 FOREIGN KEY (service_contract_id) REFERENCES public.service_contract(id_contract) ON DELETE CASCADE;
 p   ALTER TABLE ONLY public.service_modality DROP CONSTRAINT fk_contrato_servicio_has_actividad_contrato_servicio1;
       public          postgres    false    237    4995    236            �           2606    24663 >   service_contract fk_contrato_servicio_prestatario_de_servicio1    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_contract
    ADD CONSTRAINT fk_contrato_servicio_prestatario_de_servicio1 FOREIGN KEY (service_provider_id) REFERENCES public.service_provider(id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.service_contract DROP CONSTRAINT fk_contrato_servicio_prestatario_de_servicio1;
       public          postgres    false    239    5001    236            �           2606    24738 4   carrier_contract fk_contrato_transportista_contrato1    FK CONSTRAINT     �   ALTER TABLE ONLY public.carrier_contract
    ADD CONSTRAINT fk_contrato_transportista_contrato1 FOREIGN KEY (id_contract) REFERENCES public.contract(id_contract) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.carrier_contract DROP CONSTRAINT fk_contrato_transportista_contrato1;
       public          postgres    false    220    218    4965            �           2606    24618 C   transport_modality fk_contrato_transportista_has_vehiculo_vehiculo1    FK CONSTRAINT     �   ALTER TABLE ONLY public.transport_modality
    ADD CONSTRAINT fk_contrato_transportista_has_vehiculo_vehiculo1 FOREIGN KEY (vehicle_id) REFERENCES public.vehicle(id_vehicle) ON DELETE CASCADE;
 m   ALTER TABLE ONLY public.transport_modality DROP CONSTRAINT fk_contrato_transportista_has_vehiculo_vehiculo1;
       public          postgres    false    243    5018    249            �           2606    24743 B   carrier_contract fk_contrato_transportista_prestatario_transporte1    FK CONSTRAINT     �   ALTER TABLE ONLY public.carrier_contract
    ADD CONSTRAINT fk_contrato_transportista_prestatario_transporte1 FOREIGN KEY (transportation_provider_id) REFERENCES public.transportation_provider(id) ON DELETE CASCADE;
 l   ALTER TABLE ONLY public.carrier_contract DROP CONSTRAINT fk_contrato_transportista_prestatario_transporte1;
       public          postgres    false    218    245    5013            �           2606    24733 6   cost_kilometers fk_cost_kilometers_transport_modality1    FK CONSTRAINT     �   ALTER TABLE ONLY public.cost_kilometers
    ADD CONSTRAINT fk_cost_kilometers_transport_modality1 FOREIGN KEY (modality_id) REFERENCES public.transport_modality(modality_id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.cost_kilometers DROP CONSTRAINT fk_cost_kilometers_transport_modality1;
       public          postgres    false    5011    221    243            �           2606    24728 :   established_route fk_established_route_transport_modality1    FK CONSTRAINT     �   ALTER TABLE ONLY public.established_route
    ADD CONSTRAINT fk_established_route_transport_modality1 FOREIGN KEY (modality_id) REFERENCES public.transport_modality(modality_id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.established_route DROP CONSTRAINT fk_established_route_transport_modality1;
       public          postgres    false    243    5011    222            �           2606    24718 -   hotel_meal_plan fk_hotel_has_meal_plan_hotel1    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel_meal_plan
    ADD CONSTRAINT fk_hotel_has_meal_plan_hotel1 FOREIGN KEY (hotel_id) REFERENCES public.hotel(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.hotel_meal_plan DROP CONSTRAINT fk_hotel_has_meal_plan_hotel1;
       public          postgres    false    4971    224    225            �           2606    24723 1   hotel_meal_plan fk_hotel_has_meal_plan_meal_plan1    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel_meal_plan
    ADD CONSTRAINT fk_hotel_has_meal_plan_meal_plan1 FOREIGN KEY (meal_plan_id) REFERENCES public.meal_plan(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.hotel_meal_plan DROP CONSTRAINT fk_hotel_has_meal_plan_meal_plan1;
       public          postgres    false    229    4983    225            �           2606    24708 3   hotel_type_of_room fk_hotel_has_type_of_room_hotel1    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel_type_of_room
    ADD CONSTRAINT fk_hotel_has_type_of_room_hotel1 FOREIGN KEY (hotel_id) REFERENCES public.hotel(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.hotel_type_of_room DROP CONSTRAINT fk_hotel_has_type_of_room_hotel1;
       public          postgres    false    224    226    4971            �           2606    24713 :   hotel_type_of_room fk_hotel_has_type_of_room_type_of_room1    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel_type_of_room
    ADD CONSTRAINT fk_hotel_has_type_of_room_type_of_room1 FOREIGN KEY (type_of_room_id) REFERENCES public.type_of_room(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.hotel_type_of_room DROP CONSTRAINT fk_hotel_has_type_of_room_type_of_room1;
       public          postgres    false    226    247    5015            �           2606    24703 8   hours_kilometers fk_hours_kilometers_transport_modality1    FK CONSTRAINT     �   ALTER TABLE ONLY public.hours_kilometers
    ADD CONSTRAINT fk_hours_kilometers_transport_modality1 FOREIGN KEY (modality_id) REFERENCES public.transport_modality(modality_id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.hours_kilometers DROP CONSTRAINT fk_hours_kilometers_transport_modality1;
       public          postgres    false    5011    243    227            �           2606    32821    hotel fk_id_provider_hotel    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT fk_id_provider_hotel FOREIGN KEY (id) REFERENCES public.provider(id_provider) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.hotel DROP CONSTRAINT fk_id_provider_hotel;
       public          postgres    false    251    224    5020            �           2606    32836 0   service_provider fk_id_provider_service_provider    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_provider
    ADD CONSTRAINT fk_id_provider_service_provider FOREIGN KEY (id) REFERENCES public.provider(id_provider) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.service_provider DROP CONSTRAINT fk_id_provider_service_provider;
       public          postgres    false    239    251    5020            �           2606    32831 >   transportation_provider fk_id_provider_transportation_provider    FK CONSTRAINT     �   ALTER TABLE ONLY public.transportation_provider
    ADD CONSTRAINT fk_id_provider_transportation_provider FOREIGN KEY (id) REFERENCES public.provider(id_provider) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.transportation_provider DROP CONSTRAINT fk_id_provider_transportation_provider;
       public          postgres    false    5020    245    251            �           2606    32895    user fk_id_rol    FK CONSTRAINT     ~   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT fk_id_rol FOREIGN KEY (id_rol) REFERENCES public.rol(id) ON DELETE CASCADE;
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT fk_id_rol;
       public          postgres    false    255    253    5022            �           2606    24623 B   transport_modality fk_modalidad_contratada_contrato_transportista1    FK CONSTRAINT     �   ALTER TABLE ONLY public.transport_modality
    ADD CONSTRAINT fk_modalidad_contratada_contrato_transportista1 FOREIGN KEY (carrier_contract_id) REFERENCES public.carrier_contract(id_contract) ON DELETE CASCADE;
 l   ALTER TABLE ONLY public.transport_modality DROP CONSTRAINT fk_modalidad_contratada_contrato_transportista1;
       public          postgres    false    243    218    4963            �           2606    24633 B   tourist_package_modality fk_modality_has_tourist_package_modality1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tourist_package_modality
    ADD CONSTRAINT fk_modality_has_tourist_package_modality1 FOREIGN KEY (modality_id) REFERENCES public.modality(id) ON DELETE CASCADE;
 l   ALTER TABLE ONLY public.tourist_package_modality DROP CONSTRAINT fk_modality_has_tourist_package_modality1;
       public          postgres    false    242    4985    231            �           2606    24638 I   tourist_package_modality fk_modality_has_tourist_package_tourist_package1    FK CONSTRAINT     �   ALTER TABLE ONLY public.tourist_package_modality
    ADD CONSTRAINT fk_modality_has_tourist_package_tourist_package1 FOREIGN KEY (tourist_package_id) REFERENCES public.tourist_package(id_tourist_package) ON DELETE CASCADE;
 s   ALTER TABLE ONLY public.tourist_package_modality DROP CONSTRAINT fk_modality_has_tourist_package_tourist_package1;
       public          postgres    false    242    5003    241            �           2606    24668 @   accommodation_modality fk_planes_escogidos_contrato_alojamiento1    FK CONSTRAINT     �   ALTER TABLE ONLY public.accommodation_modality
    ADD CONSTRAINT fk_planes_escogidos_contrato_alojamiento1 FOREIGN KEY (accommodation_contract_id) REFERENCES public.accommodation_contract(id_contract) ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.accommodation_modality DROP CONSTRAINT fk_planes_escogidos_contrato_alojamiento1;
       public          postgres    false    215    235    4958            �           2606    24790 '   season fk_season_accommodation_contract    FK CONSTRAINT     �   ALTER TABLE ONLY public.season
    ADD CONSTRAINT fk_season_accommodation_contract FOREIGN KEY (accommodation_contract_id) REFERENCES public.accommodation_contract(id_contract) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.season DROP CONSTRAINT fk_season_accommodation_contract;
       public          postgres    false    4958    233    215            �           2606    24673 3   accommodation_modality fk_selected_plans_meal_plan1    FK CONSTRAINT     �   ALTER TABLE ONLY public.accommodation_modality
    ADD CONSTRAINT fk_selected_plans_meal_plan1 FOREIGN KEY (meal_plan_id) REFERENCES public.meal_plan(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.accommodation_modality DROP CONSTRAINT fk_selected_plans_meal_plan1;
       public          postgres    false    4983    235    229            �           2606    24678 6   accommodation_modality fk_selected_plans_type_of_room1    FK CONSTRAINT     �   ALTER TABLE ONLY public.accommodation_modality
    ADD CONSTRAINT fk_selected_plans_type_of_room1 FOREIGN KEY (type_of_room_id) REFERENCES public.type_of_room(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.accommodation_modality DROP CONSTRAINT fk_selected_plans_type_of_room1;
       public          postgres    false    5015    247    235            �           2606    24653 .   service_modality fk_service_modality_modality1    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_modality
    ADD CONSTRAINT fk_service_modality_modality1 FOREIGN KEY (modality_id) REFERENCES public.modality(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.service_modality DROP CONSTRAINT fk_service_modality_modality1;
       public          postgres    false    4985    231    237            �           2606    24628 2   transport_modality fk_transport_modality_modality1    FK CONSTRAINT     �   ALTER TABLE ONLY public.transport_modality
    ADD CONSTRAINT fk_transport_modality_modality1 FOREIGN KEY (modality_id) REFERENCES public.modality(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.transport_modality DROP CONSTRAINT fk_transport_modality_modality1;
       public          postgres    false    243    4985    231            �           2606    49178    administrator fk_user_id_admin    FK CONSTRAINT     �   ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT fk_user_id_admin FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.administrator DROP CONSTRAINT fk_user_id_admin;
       public          postgres    false    256    255    5024            �           2606    49263    dependent fk_user_id_dependent    FK CONSTRAINT     �   ALTER TABLE ONLY public.dependent
    ADD CONSTRAINT fk_user_id_dependent FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.dependent DROP CONSTRAINT fk_user_id_dependent;
       public          postgres    false    5024    259    255            �           2606    49195    manager fk_user_id_manager    FK CONSTRAINT     �   ALTER TABLE ONLY public.manager
    ADD CONSTRAINT fk_user_id_manager FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.manager DROP CONSTRAINT fk_user_id_manager;
       public          postgres    false    258    255    5024            �           2606    49185 ,   package_designer fk_user_id_package_designer    FK CONSTRAINT     �   ALTER TABLE ONLY public.package_designer
    ADD CONSTRAINT fk_user_id_package_designer FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.package_designer DROP CONSTRAINT fk_user_id_package_designer;
       public          postgres    false    255    5024    257            �           2606    24613 +   vehicle fk_vehiculo_prestatario_transporte1    FK CONSTRAINT     �   ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT fk_vehiculo_prestatario_transporte1 FOREIGN KEY (transportation_provider_id) REFERENCES public.transportation_provider(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.vehicle DROP CONSTRAINT fk_vehiculo_prestatario_transporte1;
       public          postgres    false    5013    249    245            \      x������ � �      p      x������ � �      ^   I   x�34�t*-NN,R�IT��LJ-*IL�46�24�)JM/MTH��SH,JL�,�42�22�,/,�45����� ��      �      x�34�2��2��21�2��2������ +Ge      _      x������ � �      a   @   x�3�4202�54�54�3�9=�s�4��A�38��,39U�9?��(1��3��̹b���� Cku      b      x������ � �      �      x������ � �      c      x������ � �      e   A   x�3����/I�)�(JL��4�2���M,)
$%f�s�r��pz��p:��*qq��qqq ��      f   #   x�3��4�2��4�2��,�,Sa����� Y��      g   %   x�3��4�2��4�2��,�,S Hq��qqq Y��      h      x������ � �      �      x�36�����       j   (   x�3�tI-N�,���2��O�W��K�)�L������ ��	g      l   m   x�3�tLN���OI,���S�2r2K*��q��p��e&�"�L1��0��1��f��4C,�B��B##�2�8eL8C���J�D-��Zb56�*j�M4F��� ���.      �      x�36�����       �   �   x�-��
�0�ϻO�'���Z�,���eKsX��l�>�Q{���a���@b�N�,��L�J/��[�hA�L.C!6�e�[RCr��.�(d9��$�p�?X�j��L�O"���c1��o؈W��4��Dr+�Kм&I0��z[�>�,�/�;D� iL<�      �   B   x�3�tL����,.)J,�/�2��M�KLO-�2�tI-H�KI�+�2�HL�
��g��ec���� m�O      n      x������ � �      q      x�3�46����� �]      r   *   x�34�4�44��4202�54�5��24��!�b���� ��?      t      x�32�26�25����� l�      v   U   x�-�;�@Bk8�q�{�q���w�(��P�O��q�mΙ��|I\a]������re�s���V�t�ˀo�ё|��"p      w   f   x�%��1��P�*<2��2�ױ��X2��'Yx��H��V�n�h��N�� ��5��".�6�F7�=�����1z��5� �ߋ�X���������s      x      x������ � �      z      x�3��2��26����� �      |   "   x�3���K�,�L)M��2�t�O�I����� km!      �   �   x�u��
�0���LL�u��0�">��RYŹA��ߕV;B������2�k��	g��	���8��WH�R����Z���%-���GB��%���ϙT��oIM����L�/6�ڰ�J�=��(7�;0����>�      ~   C   x�˱�0D�ڷK"��]��� G����3��¶kx|l��\h�����b����O�P�'����     