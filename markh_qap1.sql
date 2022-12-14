PGDMP         (            	    z           QAP1    14.5    14.5 !    /           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            0           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            1           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            2           1262    24602    QAP1    DATABASE     Q   CREATE DATABASE "QAP1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE "QAP1";
                postgres    false                        2615    24603    airports_qap1    SCHEMA        CREATE SCHEMA airports_qap1;
    DROP SCHEMA airports_qap1;
                postgres    false            ?            1259    24619    aircraft    TABLE     ?   CREATE TABLE airports_qap1.aircraft (
    id bigint NOT NULL,
    type character(100) NOT NULL,
    "airline_Name" character(100) NOT NULL,
    "num_Passengers" bigint NOT NULL
);
 #   DROP TABLE airports_qap1.aircraft;
       airports_qap1         heap    postgres    false    4            ?            1259    24614    airport    TABLE     ?   CREATE TABLE airports_qap1.airport (
    id bigint NOT NULL,
    "airport_Name" character(255) NOT NULL,
    "airport_Code" character(5) NOT NULL,
    city_id bigint
);
 "   DROP TABLE airports_qap1.airport;
       airports_qap1         heap    postgres    false    4            ?            1259    24724    airport_aircraft    TABLE     ?   CREATE TABLE airports_qap1.airport_aircraft (
    airport_name bigint NOT NULL,
    aircraft_type bigint NOT NULL,
    depart bigint NOT NULL,
    arrive bigint NOT NULL
);
 +   DROP TABLE airports_qap1.airport_aircraft;
       airports_qap1         heap    postgres    false    4            ?            1259    24739    airports_passengers    TABLE     u   CREATE TABLE airports_qap1.airports_passengers (
    passenger_id bigint NOT NULL,
    airport_id bigint NOT NULL
);
 .   DROP TABLE airports_qap1.airports_passengers;
       airports_qap1         heap    postgres    false    4            ?            1259    24709    arrivals    TABLE     a   CREATE TABLE airports_qap1.arrivals (
    id bigint NOT NULL,
    arrival_name character(255)
);
 #   DROP TABLE airports_qap1.arrivals;
       airports_qap1         heap    postgres    false    4            ?            1259    24604    city    TABLE     ?   CREATE TABLE airports_qap1.city (
    id bigint NOT NULL,
    "city_Name" character(255) NOT NULL,
    "city_Prov" character(255) NOT NULL,
    "city_Pop" bigint NOT NULL
);
    DROP TABLE airports_qap1.city;
       airports_qap1         heap    postgres    false    4            ?            1259    24734 
   departures    TABLE     b   CREATE TABLE airports_qap1.departures (
    id bigint NOT NULL,
    depart_name character(255)
);
 %   DROP TABLE airports_qap1.departures;
       airports_qap1         heap    postgres    false    4            ?            1259    24609 	   passenger    TABLE     ?   CREATE TABLE airports_qap1.passenger (
    id bigint NOT NULL,
    "first_Name" character(255) NOT NULL,
    last_name character(255) NOT NULL,
    "phone_Number" bigint NOT NULL
);
 $   DROP TABLE airports_qap1.passenger;
       airports_qap1         heap    postgres    false    4            ?            1259    24693    passenger_aircraft    TABLE     u   CREATE TABLE airports_qap1.passenger_aircraft (
    passenger_id bigint NOT NULL,
    aircraft_id bigint NOT NULL
);
 -   DROP TABLE airports_qap1.passenger_aircraft;
       airports_qap1         heap    postgres    false    4            '          0    24619    aircraft 
   TABLE DATA           U   COPY airports_qap1.aircraft (id, type, "airline_Name", "num_Passengers") FROM stdin;
    airports_qap1          postgres    false    213   ?%       &          0    24614    airport 
   TABLE DATA           U   COPY airports_qap1.airport (id, "airport_Name", "airport_Code", city_id) FROM stdin;
    airports_qap1          postgres    false    212   &       *          0    24724    airport_aircraft 
   TABLE DATA           ^   COPY airports_qap1.airport_aircraft (airport_name, aircraft_type, depart, arrive) FROM stdin;
    airports_qap1          postgres    false    216   I'       ,          0    24739    airports_passengers 
   TABLE DATA           N   COPY airports_qap1.airports_passengers (passenger_id, airport_id) FROM stdin;
    airports_qap1          postgres    false    218   	)       )          0    24709    arrivals 
   TABLE DATA           ;   COPY airports_qap1.arrivals (id, arrival_name) FROM stdin;
    airports_qap1          postgres    false    215   w)       $          0    24604    city 
   TABLE DATA           O   COPY airports_qap1.city (id, "city_Name", "city_Prov", "city_Pop") FROM stdin;
    airports_qap1          postgres    false    210   g*       +          0    24734 
   departures 
   TABLE DATA           <   COPY airports_qap1.departures (id, depart_name) FROM stdin;
    airports_qap1          postgres    false    217   d+       %          0    24609 	   passenger 
   TABLE DATA           W   COPY airports_qap1.passenger (id, "first_Name", last_name, "phone_Number") FROM stdin;
    airports_qap1          postgres    false    211   T,       (          0    24693    passenger_aircraft 
   TABLE DATA           N   COPY airports_qap1.passenger_aircraft (passenger_id, aircraft_id) FROM stdin;
    airports_qap1          postgres    false    214   s-       ?           2606    24618    airport Airport_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY airports_qap1.airport
    ADD CONSTRAINT "Airport_pkey" PRIMARY KEY (id);
 G   ALTER TABLE ONLY airports_qap1.airport DROP CONSTRAINT "Airport_pkey";
       airports_qap1            postgres    false    212            ?           2606    24623    aircraft aircraft_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY airports_qap1.aircraft
    ADD CONSTRAINT aircraft_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY airports_qap1.aircraft DROP CONSTRAINT aircraft_pkey;
       airports_qap1            postgres    false    213            ?           2606    24728 &   airport_aircraft airport_aircraft_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY airports_qap1.airport_aircraft
    ADD CONSTRAINT airport_aircraft_pkey PRIMARY KEY (airport_name, aircraft_type, depart, arrive);
 W   ALTER TABLE ONLY airports_qap1.airport_aircraft DROP CONSTRAINT airport_aircraft_pkey;
       airports_qap1            postgres    false    216    216    216    216            ?           2606    24743 ,   airports_passengers airports_passengers_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY airports_qap1.airports_passengers
    ADD CONSTRAINT airports_passengers_pkey PRIMARY KEY (passenger_id, airport_id);
 ]   ALTER TABLE ONLY airports_qap1.airports_passengers DROP CONSTRAINT airports_passengers_pkey;
       airports_qap1            postgres    false    218    218            ?           2606    24713    arrivals arrivals_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY airports_qap1.arrivals
    ADD CONSTRAINT arrivals_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY airports_qap1.arrivals DROP CONSTRAINT arrivals_pkey;
       airports_qap1            postgres    false    215            ?           2606    24608    city city_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY airports_qap1.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY airports_qap1.city DROP CONSTRAINT city_pkey;
       airports_qap1            postgres    false    210            ?           2606    24738    departures departures_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY airports_qap1.departures
    ADD CONSTRAINT departures_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY airports_qap1.departures DROP CONSTRAINT departures_pkey;
       airports_qap1            postgres    false    217            ?           2606    24697 *   passenger_aircraft passenger_aircraft_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY airports_qap1.passenger_aircraft
    ADD CONSTRAINT passenger_aircraft_pkey PRIMARY KEY (passenger_id, aircraft_id);
 [   ALTER TABLE ONLY airports_qap1.passenger_aircraft DROP CONSTRAINT passenger_aircraft_pkey;
       airports_qap1            postgres    false    214    214            ?           2606    24613    passenger passenger_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY airports_qap1.passenger
    ADD CONSTRAINT passenger_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY airports_qap1.passenger DROP CONSTRAINT passenger_pkey;
       airports_qap1            postgres    false    211            ?           2606    24656    airport city_fk    FK CONSTRAINT     ?   ALTER TABLE ONLY airports_qap1.airport
    ADD CONSTRAINT city_fk FOREIGN KEY (city_id) REFERENCES airports_qap1.city(id) NOT VALID;
 @   ALTER TABLE ONLY airports_qap1.airport DROP CONSTRAINT city_fk;
       airports_qap1          postgres    false    210    212    3463            '   u   x???1
?0??99EN mU:WW7??A+R?????+?]???oax$??|?Imb??﬈?Ơ????C~j??\Rt?zla?????"Y? ?;D?S?w??????j??qm?X?v2      &   !  x???MN?0??3??	??M??I?%*$Y`?Ƥ.?H??IU?=c?8B???x?7O3ώ???G???=?IZ-&e??Y( ?i?s?IiY!>%??GX)8???I縀??G?"̍pI<??.0?\??$?X=	}R???
???4?x>???ۓ'?2W3\A??]?????e????P??4??i/t?m8?)J??XC!G??{?&???w?5?
7????f?;3?????o[h:s?*??Z5?q?P9???/??5?T??j?v#˅}7????^s?-?E??????      *   ?  x?U?Q??0E??b?? ?2?_Ǆ??:ǏǽX?դ?5?????,???+^??7??'~?'???w|???'>۸??W
Y???J֡x?6x?v???N8۾ۺ?\B?\?dy?+^??7|e}?Iҟx?;???|?Ϝ?Ϧ??ּ?+}R^<?\?dy?<????x?>???f??y???Ny??,p???y???????9???w|?8???y??g??f??k?Y??Ny??,??
+l??;p4?u??????xp??Xa?6x?>???3O?????dQ+l??x???/x?+^??7???x?;>???3_??3aoY??-kQ?,VXa?+?,??_?6?5ʧ????ރ?)?_q????kS??GQ?S??|???????O???q??|\>??V?a>????;??ԩ??O??{g۞?n??????|?      ,   ^   x?-N??0{?a*H8?]??5?`?L?	?b?F?~K?j??9?L?I?q??䖔$
ŹbV?/΀[?O?ī??U???
?n?S??? ? ?&
      )   ?   x???MN?@???)|??)??@ՂR??l??%#?v4??p{	qf1?	?߳????g?5ѓ??GoʁJ?(??O??|?5?^u?yP?L\??????#??Kؗe^?֎b?HX??????t˳hn!??[h$M?S]ѫpLV?x???j?zr?? ??[o?a?~sR????????5@???:-w}?5ǝ?bnA???L%?!?9??L?{???????      $   ?   x???KN?0??????
*_'}0?!Q??J$$&nHE??$?O?&???
??ѕ????&va(??c'PA?2ƈ?S??????$???0/??x??<!W??@m:??zy??????@?J?is?c8?1??X??	TX-?hb??=,88v??A"K4]??ٞ?g~4MAVxi?.??shPo?	T??'A?P?S7k??w?_???@5????z.????!?k?3?V?m&"?ܣ?      +   ?   x???MN?@???)|??)??@ՂR??l??%#?v4??p{	qf1?	?߳????g?5ѓ??GoʁJ?(??O??|?5?^u?yP?L\??????#??Kؗe^?֎b?HX??????t˳hn!??[h$M?S]ѫpLV?x???j?zr?? ??[o?a?~sR????????5@???:-w}?5ǝ?bnA???L%?!?9??L?{???????      %     x???=n?0Fg?>AaI???u??A[?K6R#*0N?ܾN??7??w?'????0?rn?C??v?R??!:V?a ?a?/%????0??=????Jz?'??????bp???????W??k??!??cJ?}?'?w??[?e9hk???:x???fg??_?z?z?0t?k[1?Ge??c3OF????˚??E?Tm%=???R???m2?}?pm?71sm5?5?Zؐl???,{?i???b??<ۭ??yҖP??5??t??;D?6??M      (   C   x??? 1߸?U?\?????I??-????\W?a?D??A7?I???h?EWt?xЛ?[????e     