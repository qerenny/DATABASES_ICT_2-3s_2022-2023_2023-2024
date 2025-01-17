PGDMP  3                	    {         
   Sport_club    16.0    16.0 N    x           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            y           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            z           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            {           1262    16561 
   Sport_club    DATABASE     �   CREATE DATABASE "Sport_club" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Sport_club";
                postgres    false                        2615    24580    coach    SCHEMA        CREATE SCHEMA coach;
    DROP SCHEMA coach;
                postgres    false            	            2615    24582    competition    SCHEMA        CREATE SCHEMA competition;
    DROP SCHEMA competition;
                postgres    false                        2615    24579 	   sportsman    SCHEMA        CREATE SCHEMA sportsman;
    DROP SCHEMA sportsman;
                postgres    false                        2615    24581    training_information    SCHEMA     $   CREATE SCHEMA training_information;
 "   DROP SCHEMA training_information;
                postgres    false            �            1259    16635    coach    TABLE     s  CREATE TABLE coach.coach (
    salary numeric NOT NULL,
    coach_code integer NOT NULL,
    passport_number character varying(30) NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    patronymic character varying(20) NOT NULL,
    phone_number integer NOT NULL,
    CONSTRAINT check_salary CHECK ((salary > (0)::numeric))
);
    DROP TABLE coach.coach;
       coach         heap    postgres    false    7            �            1259    16716    coach_category    TABLE     Z  CREATE TABLE coach.coach_category (
    category_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date,
    category_name character varying(20) NOT NULL,
    coach_code integer NOT NULL,
    CONSTRAINT category_from_date_check CHECK ((from_date > '1930-01-01'::date)),
    CONSTRAINT check_to_date CHECK ((to_date > from_date))
);
 !   DROP TABLE coach.coach_category;
       coach         heap    postgres    false    7            �            1259    16728    coach_rating    TABLE     C  CREATE TABLE coach.coach_rating (
    rating_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    coach_code integer NOT NULL,
    rating_number integer NOT NULL,
    CONSTRAINT check_from_date CHECK ((from_date >= CURRENT_DATE)),
    CONSTRAINT check_to_date CHECK ((to_date > from_date))
);
    DROP TABLE coach.coach_rating;
       coach         heap    postgres    false    7            �            1259    16780    competition    TABLE     y  CREATE TABLE competition.competition (
    competition_code integer NOT NULL,
    name_competition character varying(100) NOT NULL,
    date_time timestamp without time zone NOT NULL,
    venue character varying(60) NOT NULL,
    category character varying(20) NOT NULL,
    type_competition character varying(20) NOT NULL,
    status character varying(10) NOT NULL,
    CONSTRAINT " check_date_time" CHECK ((date_time >= CURRENT_TIMESTAMP)),
    CONSTRAINT check_status CHECK (((status)::text = ANY (ARRAY[('passed'::character varying)::text, ('not_passed'::character varying)::text, ('in_progress'::character varying)::text])))
);
 $   DROP TABLE competition.competition;
       competition         heap    postgres    false    9            �            1259    16816    competition_conducting    TABLE     �  CREATE TABLE competition.competition_conducting (
    competition_conducting_code integer NOT NULL,
    competition_code integer NOT NULL,
    sportsman_code integer NOT NULL,
    coach_code integer NOT NULL,
    sport_code integer NOT NULL,
    status character varying(10) NOT NULL,
    coachs_points integer NOT NULL,
    sportsmans_points integer NOT NULL,
    date_time timestamp without time zone NOT NULL,
    prize_place numeric,
    CONSTRAINT check_coachs_points CHECK ((coachs_points >= 0)),
    CONSTRAINT check_sportsmans_points CHECK ((sportsmans_points >= 0)),
    CONSTRAINT check_status CHECK (((status)::text = ANY (ARRAY[('passed'::character varying)::text, ('not_passed'::character varying)::text, ('in_progress'::character varying)::text])))
);
 /   DROP TABLE competition.competition_conducting;
       competition         heap    postgres    false    9            �            1259    16790 
   qualifying    TABLE     �  CREATE TABLE competition.qualifying (
    qualifying_code integer NOT NULL,
    sportsman_code integer NOT NULL,
    competition_code integer NOT NULL,
    coach_code integer NOT NULL,
    sport_code integer NOT NULL,
    status character varying(10) NOT NULL,
    date_time timestamp without time zone NOT NULL,
    CONSTRAINT check_status CHECK (((status)::text = ANY (ARRAY[('passed'::character varying)::text, ('not_passed'::character varying)::text, ('in_progress'::character varying)::text])))
);
 #   DROP TABLE competition.qualifying;
       competition         heap    postgres    false    9            �            1259    16667    medical_life    TABLE     (  CREATE TABLE sportsman.medical_life (
    medical_life_code integer NOT NULL,
    date_of_injury date NOT NULL,
    date_of_discharge date,
    sportsman_code integer NOT NULL,
    injury_code integer NOT NULL,
    CONSTRAINT check_date_of_injury CHECK ((date_of_injury > '1930-01-01'::date))
);
 #   DROP TABLE sportsman.medical_life;
    	   sportsman         heap    postgres    false    6            �            1259    16647 	   sportsman    TABLE     �  CREATE TABLE sportsman.sportsman (
    sportsman_code integer NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    patronymic character varying(20) NOT NULL,
    date_of_birth date NOT NULL,
    sport_code integer NOT NULL,
    passport_number character varying(30) NOT NULL,
    CONSTRAINT check_date_of_birth CHECK ((date_of_birth >= '1930-01-01'::date))
);
     DROP TABLE sportsman.sportsman;
    	   sportsman         heap    postgres    false    6            �            1259    16685    sportsman_qualification    TABLE     �  CREATE TABLE sportsman.sportsman_qualification (
    qualification_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date,
    category character varying(20) NOT NULL,
    weight integer NOT NULL,
    sportsman_code integer NOT NULL,
    sport_code integer NOT NULL,
    CONSTRAINT chech_from_date CHECK ((from_date > '1930-01-01'::date)),
    CONSTRAINT check_weight CHECK ((weight >= 30))
);
 .   DROP TABLE sportsman.sportsman_qualification;
    	   sportsman         heap    postgres    false    6            �            1259    16702    sportsman_rating    TABLE     +  CREATE TABLE sportsman.sportsman_rating (
    rating_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    sportsman_code integer NOT NULL,
    CONSTRAINT check_from_date CHECK ((from_date >= CURRENT_DATE)),
    CONSTRAINT check_to_date CHECK ((to_date > from_date))
);
 '   DROP TABLE sportsman.sportsman_rating;
    	   sportsman         heap    postgres    false    6            �            1259    16660    type_of_injury    TABLE     �   CREATE TABLE sportsman.type_of_injury (
    type_of_injury character varying(60) NOT NULL,
    injury_code integer NOT NULL,
    treatment text NOT NULL,
    description text NOT NULL,
    first_aid text NOT NULL
);
 %   DROP TABLE sportsman.type_of_injury;
    	   sportsman         heap    postgres    false    6            �            1259    16742 
   leadership    TABLE       CREATE TABLE training_information.leadership (
    leadership_code integer NOT NULL,
    from_date date NOT NULL,
    to_date date,
    sportsman_code integer NOT NULL,
    coach_code integer NOT NULL,
    CONSTRAINT check_from_date CHECK ((from_date >= CURRENT_DATE))
);
 ,   DROP TABLE training_information.leadership;
       training_information         heap    postgres    false    8            �            1259    16628 
   sport_type    TABLE     �   CREATE TABLE training_information.sport_type (
    type_of_sport_code integer NOT NULL,
    sport_code integer NOT NULL,
    rules text NOT NULL
);
 ,   DROP TABLE training_information.sport_type;
       training_information         heap    postgres    false    8            �            1259    16758    training    TABLE       CREATE TABLE training_information.training (
    training_code integer NOT NULL,
    time_date timestamp without time zone NOT NULL,
    status character varying(10) NOT NULL,
    sportsman_code integer NOT NULL,
    coach_code integer NOT NULL,
    sport_code integer NOT NULL,
    CONSTRAINT check_status CHECK (((status)::text = ANY (ARRAY[('passed'::character varying)::text, ('not_passed'::character varying)::text, ('in_progress'::character varying)::text]))),
    CONSTRAINT check_time_date CHECK ((time_date > CURRENT_TIMESTAMP))
);
 *   DROP TABLE training_information.training;
       training_information         heap    postgres    false    8            i          0    16635    coach 
   TABLE DATA                 coach          postgres    false    220   ~n       o          0    16716    coach_category 
   TABLE DATA                 coach          postgres    false    226   �q       p          0    16728    coach_rating 
   TABLE DATA                 coach          postgres    false    227   t       s          0    16780    competition 
   TABLE DATA                 competition          postgres    false    230   	v       u          0    16816    competition_conducting 
   TABLE DATA                 competition          postgres    false    232   �x       t          0    16790 
   qualifying 
   TABLE DATA                 competition          postgres    false    231   �{       l          0    16667    medical_life 
   TABLE DATA              	   sportsman          postgres    false    223   )~       j          0    16647 	   sportsman 
   TABLE DATA              	   sportsman          postgres    false    221   %�       m          0    16685    sportsman_qualification 
   TABLE DATA              	   sportsman          postgres    false    224   }�       n          0    16702    sportsman_rating 
   TABLE DATA              	   sportsman          postgres    false    225   i�       k          0    16660    type_of_injury 
   TABLE DATA              	   sportsman          postgres    false    222   �       q          0    16742 
   leadership 
   TABLE DATA                 training_information          postgres    false    228   ��       h          0    16628 
   sport_type 
   TABLE DATA                 training_information          postgres    false    219   ��       r          0    16758    training 
   TABLE DATA                 training_information          postgres    false    229   ��       �           2606    16722    coach_category category_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY coach.coach_category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_code);
 E   ALTER TABLE ONLY coach.coach_category DROP CONSTRAINT category_pkey;
       coach            postgres    false    226            �           2606    16734    coach_rating coach_rating_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY coach.coach_rating
    ADD CONSTRAINT coach_rating_pkey PRIMARY KEY (rating_code);
 G   ALTER TABLE ONLY coach.coach_rating DROP CONSTRAINT coach_rating_pkey;
       coach            postgres    false    227            �           2606    16642    coach pk_coach_code 
   CONSTRAINT     X   ALTER TABLE ONLY coach.coach
    ADD CONSTRAINT pk_coach_code PRIMARY KEY (coach_code);
 <   ALTER TABLE ONLY coach.coach DROP CONSTRAINT pk_coach_code;
       coach            postgres    false    220            �           2606    16736    coach_rating unique_coach_code 
   CONSTRAINT     ^   ALTER TABLE ONLY coach.coach_rating
    ADD CONSTRAINT unique_coach_code UNIQUE (coach_code);
 G   ALTER TABLE ONLY coach.coach_rating DROP CONSTRAINT unique_coach_code;
       coach            postgres    false    227            �           2606    16644 $   coach unique_coaches_passport_number 
   CONSTRAINT     i   ALTER TABLE ONLY coach.coach
    ADD CONSTRAINT unique_coaches_passport_number UNIQUE (passport_number);
 M   ALTER TABLE ONLY coach.coach DROP CONSTRAINT unique_coaches_passport_number;
       coach            postgres    false    220            �           2606    16646 !   coach unique_coaches_phone_number 
   CONSTRAINT     c   ALTER TABLE ONLY coach.coach
    ADD CONSTRAINT unique_coaches_phone_number UNIQUE (phone_number);
 J   ALTER TABLE ONLY coach.coach DROP CONSTRAINT unique_coaches_phone_number;
       coach            postgres    false    220            �           2606    24585 (   competition_conducting check_prize_place    CHECK CONSTRAINT     �   ALTER TABLE competition.competition_conducting
    ADD CONSTRAINT check_prize_place CHECK (((prize_place >= (1)::numeric) AND (prize_place <= (3)::numeric))) NOT VALID;
 R   ALTER TABLE competition.competition_conducting DROP CONSTRAINT check_prize_place;
       competition          postgres    false    232    232            �           2606    16823 2   competition_conducting competition_conducting_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT competition_conducting_pkey PRIMARY KEY (competition_conducting_code);
 a   ALTER TABLE ONLY competition.competition_conducting DROP CONSTRAINT competition_conducting_pkey;
       competition            postgres    false    232            �           2606    16789    competition competition_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY competition.competition
    ADD CONSTRAINT competition_pkey PRIMARY KEY (competition_code);
 K   ALTER TABLE ONLY competition.competition DROP CONSTRAINT competition_pkey;
       competition            postgres    false    230            �           2606    16795    qualifying qualifying_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT qualifying_pkey PRIMARY KEY (qualifying_code);
 I   ALTER TABLE ONLY competition.qualifying DROP CONSTRAINT qualifying_pkey;
       competition            postgres    false    231            �           2606    16672    medical_life medical_life_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY sportsman.medical_life
    ADD CONSTRAINT medical_life_pkey PRIMARY KEY (medical_life_code);
 K   ALTER TABLE ONLY sportsman.medical_life DROP CONSTRAINT medical_life_pkey;
    	   sportsman            postgres    false    223            �           2606    16666    type_of_injury pk_injury_code 
   CONSTRAINT     g   ALTER TABLE ONLY sportsman.type_of_injury
    ADD CONSTRAINT pk_injury_code PRIMARY KEY (injury_code);
 J   ALTER TABLE ONLY sportsman.type_of_injury DROP CONSTRAINT pk_injury_code;
    	   sportsman            postgres    false    222            �           2606    16652    sportsman sportsman_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY sportsman.sportsman
    ADD CONSTRAINT sportsman_pkey PRIMARY KEY (sportsman_code);
 E   ALTER TABLE ONLY sportsman.sportsman DROP CONSTRAINT sportsman_pkey;
    	   sportsman            postgres    false    221            �           2606    16691 4   sportsman_qualification sportsman_qualification_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY sportsman.sportsman_qualification
    ADD CONSTRAINT sportsman_qualification_pkey PRIMARY KEY (qualification_code);
 a   ALTER TABLE ONLY sportsman.sportsman_qualification DROP CONSTRAINT sportsman_qualification_pkey;
    	   sportsman            postgres    false    224            �           2606    16708 &   sportsman_rating sportsman_rating_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY sportsman.sportsman_rating
    ADD CONSTRAINT sportsman_rating_pkey PRIMARY KEY (rating_code);
 S   ALTER TABLE ONLY sportsman.sportsman_rating DROP CONSTRAINT sportsman_rating_pkey;
    	   sportsman            postgres    false    225            �           2606    16710 &   sportsman_rating unique_sportsman_code 
   CONSTRAINT     n   ALTER TABLE ONLY sportsman.sportsman_rating
    ADD CONSTRAINT unique_sportsman_code UNIQUE (sportsman_code);
 S   ALTER TABLE ONLY sportsman.sportsman_rating DROP CONSTRAINT unique_sportsman_code;
    	   sportsman            postgres    false    225            �           2606    16674 *   medical_life unique_sportsman_code_medical 
   CONSTRAINT     r   ALTER TABLE ONLY sportsman.medical_life
    ADD CONSTRAINT unique_sportsman_code_medical UNIQUE (sportsman_code);
 W   ALTER TABLE ONLY sportsman.medical_life DROP CONSTRAINT unique_sportsman_code_medical;
    	   sportsman            postgres    false    223            �           2606    16654 +   sportsman unique_sportsmans_passport_number 
   CONSTRAINT     t   ALTER TABLE ONLY sportsman.sportsman
    ADD CONSTRAINT unique_sportsmans_passport_number UNIQUE (passport_number);
 X   ALTER TABLE ONLY sportsman.sportsman DROP CONSTRAINT unique_sportsmans_passport_number;
    	   sportsman            postgres    false    221            �           2606    16747    leadership leadership_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY training_information.leadership
    ADD CONSTRAINT leadership_pkey PRIMARY KEY (leadership_code);
 R   ALTER TABLE ONLY training_information.leadership DROP CONSTRAINT leadership_pkey;
       training_information            postgres    false    228            �           2606    16634    sport_type pk_sport_code 
   CONSTRAINT     l   ALTER TABLE ONLY training_information.sport_type
    ADD CONSTRAINT pk_sport_code PRIMARY KEY (sport_code);
 P   ALTER TABLE ONLY training_information.sport_type DROP CONSTRAINT pk_sport_code;
       training_information            postgres    false    219            �           2606    16764    training training_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY training_information.training
    ADD CONSTRAINT training_pkey PRIMARY KEY (training_code);
 N   ALTER TABLE ONLY training_information.training DROP CONSTRAINT training_pkey;
       training_information            postgres    false    229            �           2606    16723    coach_category fk_coach_code    FK CONSTRAINT     �   ALTER TABLE ONLY coach.coach_category
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);
 E   ALTER TABLE ONLY coach.coach_category DROP CONSTRAINT fk_coach_code;
       coach          postgres    false    226    4767    220            �           2606    16737    coach_rating fk_coach_code    FK CONSTRAINT     �   ALTER TABLE ONLY coach.coach_rating
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);
 C   ALTER TABLE ONLY coach.coach_rating DROP CONSTRAINT fk_coach_code;
       coach          postgres    false    4767    220    227            �           2606    16796    qualifying fk_coach_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);
 G   ALTER TABLE ONLY competition.qualifying DROP CONSTRAINT fk_coach_code;
       competition          postgres    false    220    4767    231            �           2606    16824 $   competition_conducting fk_coach_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);
 S   ALTER TABLE ONLY competition.competition_conducting DROP CONSTRAINT fk_coach_code;
       competition          postgres    false    220    232    4767            �           2606    16801    qualifying fk_competition_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT fk_competition_code FOREIGN KEY (competition_code) REFERENCES competition.competition(competition_code);
 M   ALTER TABLE ONLY competition.qualifying DROP CONSTRAINT fk_competition_code;
       competition          postgres    false    4799    231    230            �           2606    16829 *   competition_conducting fk_competition_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT fk_competition_code FOREIGN KEY (competition_code) REFERENCES competition.competition(competition_code);
 Y   ALTER TABLE ONLY competition.competition_conducting DROP CONSTRAINT fk_competition_code;
       competition          postgres    false    232    4799    230            �           2606    16806    qualifying fk_sport_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);
 G   ALTER TABLE ONLY competition.qualifying DROP CONSTRAINT fk_sport_code;
       competition          postgres    false    219    231    4765            �           2606    16834 $   competition_conducting fk_sport_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);
 S   ALTER TABLE ONLY competition.competition_conducting DROP CONSTRAINT fk_sport_code;
       competition          postgres    false    4765    219    232            �           2606    16811    qualifying fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.qualifying
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 K   ALTER TABLE ONLY competition.qualifying DROP CONSTRAINT fk_sportsman_code;
       competition          postgres    false    221    4773    231            �           2606    16839 (   competition_conducting fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY competition.competition_conducting
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 W   ALTER TABLE ONLY competition.competition_conducting DROP CONSTRAINT fk_sportsman_code;
       competition          postgres    false    232    4773    221            �           2606    16675    medical_life fk_injury_code    FK CONSTRAINT     �   ALTER TABLE ONLY sportsman.medical_life
    ADD CONSTRAINT fk_injury_code FOREIGN KEY (injury_code) REFERENCES sportsman.type_of_injury(injury_code);
 H   ALTER TABLE ONLY sportsman.medical_life DROP CONSTRAINT fk_injury_code;
    	   sportsman          postgres    false    4777    223    222            �           2606    16655    sportsman fk_sport_code    FK CONSTRAINT     �   ALTER TABLE ONLY sportsman.sportsman
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);
 D   ALTER TABLE ONLY sportsman.sportsman DROP CONSTRAINT fk_sport_code;
    	   sportsman          postgres    false    219    221    4765            �           2606    16692 %   sportsman_qualification fk_sport_code    FK CONSTRAINT     �   ALTER TABLE ONLY sportsman.sportsman_qualification
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);
 R   ALTER TABLE ONLY sportsman.sportsman_qualification DROP CONSTRAINT fk_sport_code;
    	   sportsman          postgres    false    219    224    4765            �           2606    16680    medical_life fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY sportsman.medical_life
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 K   ALTER TABLE ONLY sportsman.medical_life DROP CONSTRAINT fk_sportsman_code;
    	   sportsman          postgres    false    4773    221    223            �           2606    16697 )   sportsman_qualification fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY sportsman.sportsman_qualification
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 V   ALTER TABLE ONLY sportsman.sportsman_qualification DROP CONSTRAINT fk_sportsman_code;
    	   sportsman          postgres    false    224    4773    221            �           2606    16711 "   sportsman_rating fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY sportsman.sportsman_rating
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 O   ALTER TABLE ONLY sportsman.sportsman_rating DROP CONSTRAINT fk_sportsman_code;
    	   sportsman          postgres    false    221    4773    225            �           2606    16748    leadership fk_coach_code    FK CONSTRAINT     �   ALTER TABLE ONLY training_information.leadership
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);
 P   ALTER TABLE ONLY training_information.leadership DROP CONSTRAINT fk_coach_code;
       training_information          postgres    false    4767    220    228            �           2606    16765    training fk_coach_code    FK CONSTRAINT     �   ALTER TABLE ONLY training_information.training
    ADD CONSTRAINT fk_coach_code FOREIGN KEY (coach_code) REFERENCES coach.coach(coach_code);
 N   ALTER TABLE ONLY training_information.training DROP CONSTRAINT fk_coach_code;
       training_information          postgres    false    4767    229    220            �           2606    16770    training fk_sport_code    FK CONSTRAINT     �   ALTER TABLE ONLY training_information.training
    ADD CONSTRAINT fk_sport_code FOREIGN KEY (sport_code) REFERENCES training_information.sport_type(sport_code);
 N   ALTER TABLE ONLY training_information.training DROP CONSTRAINT fk_sport_code;
       training_information          postgres    false    229    4765    219            �           2606    16753    leadership fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY training_information.leadership
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 T   ALTER TABLE ONLY training_information.leadership DROP CONSTRAINT fk_sportsman_code;
       training_information          postgres    false    228    221    4773            �           2606    16775    training fk_sportsman_code    FK CONSTRAINT     �   ALTER TABLE ONLY training_information.training
    ADD CONSTRAINT fk_sportsman_code FOREIGN KEY (sportsman_code) REFERENCES sportsman.sportsman(sportsman_code);
 R   ALTER TABLE ONLY training_information.training DROP CONSTRAINT fk_sportsman_code;
       training_information          postgres    false    229    4773    221            i   G  x��U�n�:��+|S\�Kr�S�E�4/���i���*RA9mݯ˥�6�<����pfvt}��Z߯�o��]�s�����������ꕁ`���y����Nw<^,�1��)��i)�e��9�y$M��ߜ]�>98_YE6|g�WzHc,�&V��m>Ʃ��pw�
^�/�&XPp���0�c=e�ӏ2}��}�Ô��к��6�e1�h��}���MH_�iHc�w��4�[M���ŁΒs�����gA���8�R���S>Lb�3�T��N�#l���dtO�8L;���Q����<�Cy�r�^;4��;���*ؓ\�&-㐪`" ��b�f����y%��
���:�6�-�����D;�!:_y��� 58�iu�E��s�E�dZB�U��u�΁F����<,��@K�ϒ���r ǻ�mp�>��v9����	~����c�̃�c|K�3���P�\zt�Y�����ǚ���$Kwũ)�߷�>�+�&8�4�B���߇鴷i<�8�-�e�&>���pYgMe�R'�]���<�5�5Բ��ƔZX,�K���|}���8�ĕ����CuK�XQ�����_kx7,����_q��֜���r�|� p� X"���z���q��(�rqJ����i�AZӳ�Er
�8|���AZ�n�m����Zǒv��.��ˁ�K֥�Ħ�<-�?8�k[��Rk������
��Gv�v�e��p�Dʷt@Y^�)�d�T��>|�rw�r��9?{��4��6��җZY(�]�^+zQ������=���ނ&�%kk�;�^�J��}џ:�)�O8;��?      o   *  x���[o1���+��Xd���)�H�D
��$�����{l���DH�e�~93�͙����廻�����d���������e���������+��)(��N���;E�6?�M>�5=u��_mm��t�NE)P�
)l�'�"n�3O��D��i(��1�1壳�m�<�VF��Q��I0���"�Q��`���,��P�X�M�%��:���.�
æ�!r�
X�$��O�B�R,�kk�jQ�<)�N�+3r$�$n���i�lN���g��`���E������g�ǡ����a��ZW�X�I.�R�	�k~9�ԹG`�]��uWq���1�ǚf�e��G�k�նO�X�;�mS x�w#�5g��](~��,6�]#��ꏿ���)�ݱf�㦹�e�V��8��A?�X{��G�(��9�e��B��6m��x	GkZ�m8�~�}����k�4J�Q�V�*�:� hKwbd�.�LFp���djj�y/9�{-���69 ���#�G0#��lؤXǪH����ȔQ$�~�ˇ�A .�{q�E�+j      p   �  x���KkQ���+z7
3��\��b@"��VB������n�j���MC5͹�_�:�tw��a9�=|\�~>>}�Y�_=�~��m��������ZH�=�舾?W��2O��B�o��NW
��5a�.V�@��I&��{ǫԹ"�*�Ыq�	a���l��X��"�0!��~��d�p�:��f
l�{�CW"����	]fmR(�Bw�â9����]��1:��[fC�	�L����oG�Ygc Lt��ܽ��� l�5e�^7C鬄G�����70fd���jw��;N.u�녅Ӛ�+�a�erbD�^7$.��<�:a�37��		�u�Ckp�I�+C�.�f�o����c��a߬�h��aA�X�`뺱q�X@��nV����B-/^kF�U+C�첋�~1�Iul 3G�4��C�bm�
����u���9B X3�M��Ԭ�S���j
&��$��`�����      s   �  x���Mo�@�����JM�]��nO����z۫x���K�}w���A�P[�0|�g��x����z;�?l��2��3�5��s'��,�lFh�]Τ�2�4�hpEȕGF��ž���Z*v���*Jm�N��PU,����b�hB|;V!6E�f�g��-p]�`Y������Lj��>V^0u�9+x}aeN���ILb[yx���/��`Jռ���\Sje�Yʲ9D�xt�]�����d���G���{�a��~�58U+���A�0��yV��Ŏp�[�Z����4E�ޓ]�Դ��A0�z�a@�&Ij�	��e�a���t#-]�hQ+IAv�f@<��T
��)`��?����g7�7ض�����VvD������$H,�hk���c��>�"?��ژw��ⱽY����|�T5��1���8���j?T���`w�±���j�&������V���m*�������O�~��W	6����cu�N��o�؞ӥT
N��}nS4�~?������Ր��V7?iy|f�g��XB��lr 9�q�eJ���.�͞8���U\��%^|�i(��m!w�bV���ua�F�}3�r��87�h���1��{��<94����-Y�<��dlt�ܘ�psy"yڬ�K�$�Q2�)���R��u�~	";����_�q92      u   
  x���;kY�s���d��R�[;������Ǧ��fQ`I ��w�;��&,=003�����sNݛ��}���|��q�}�������������o��?��}���g����_�}�^1��iˡ��-j�6!c=m���]?~z������U����Bb�k#z�����۫��	#��ח���I�iS��H���� xQ��Y�(5�r%�#KM)T��7ɨZ��aM!1rF��q��^��o��A���|�9��o����`D��������O�p���fx(3Ԗ1��`���Z�.�ߌ��S"Y`�"1L�U?����Xǝ�$�\��j�/'~�c����q<2�]	1��"Y�L�L�'�h�-��Q0���D�#�Xm������dô�I{�:
�*�,���ݚ�H��{�e���t�÷���e!�Q�I��E��hd˵G9�{�!�M��Z�W�=�M���( F�>�|T�z�~"F��wl[$K�	�K�
%l�Z�0Gu�c���)����Np�YzU��R��_��^�GN#f��(|��Ǻ�����M{��U��u�.h�۷�'	MC�\>�L)K �ː�j�P���)�ghGۼ˵/K:��`��8��,G5o������f"��2,��R01��мD���#H�!�Z�%�\���0��44�Eb���b8k&)6_	
'��-Ю�b�B�I�����	s��J�oI�2���R�208�N��ۦm��k��0�.G�K�TΚ�
����a�uJ���Da�	su���K�      t     x��V�jA��+z����CW.��&�e@�H�¿�����a��zQ�sϣ�xu}��f;^�|ܾ>�z�{>=�����s������������ϗ��+���&�1��:l���X�}��o��ϛ����F�>����r����fRq�Z�f�"N��I����@@��mp�Ԫm1�0�L/�i��k�J�x�;������:*�1S�!k�<+&-Z���5[���X$!%��&^�7�$P� u�T��aYڞ��\ d�C���YE�v��Q;�Xb8(�/�(��rZ�W���W��D�5�w9V�!�e���Ǒχg�`�ZV�Y$�z���2?���얫��2{F@()��rJQ�^��:�j�h�b&Y����EY���f0�#!���9BRvT��:GH�Z��x Q*���$��,�f6�u���T
̩��-%���	gj�ك$Ƥ���"�s������!�,�Z�v{�2q>�$S�A�� �ܯ&9�9x��˦尐D.��ḽP��Po�Ut��qv����      l   �  x���KkTA���+�n�J=�^�r�ŀD0ѭ�!���?V�H��@�VC��t�wNU�/�>^.�������~?�_}s����������������.�W�tX�+�J���J�U4;,$�������� m�Q,+M�F�Emd�'9ZGq���� ������j3��8�D��85�Q�=�K���T;75�V��DG�6?�����2�״���طO}wo�!v3U�A7	O^RG�*SC��tsP  LH���E���XD��2�t����8a�g(��i������܋Aq�i��O���(��T4���8�����Z#�Sؤ�iJ��YRͭ���[1+�X`�
NTz�&�	r��b�}��i9H�g]��D�f6��&,��%�cA-���S��S�X2��E�A2�,���*�l1'.�Zŀ)�4a�h:��(iy�t��d�(m�~@�Y��8�9.-z4��rf��Sf\����5ϟn�b�ʻ��pi      j   H  x��VMs�0��Wp��)��5=Q`�@�� M�
��c�6!ÿ�Ĵ9T'K���}��7���|ٻ�_~�5�U�k���|^���?&��'�3�z��߄>^GY�7��95m�-i�w��J�M�,3 ��\��'�u�i<:,�B��<=�g^����.<�p�;��)@r��ǭ1��E�w��]g�(]b`p�5c�Y�Y��H1_��<�C����PtI�h²�9�+X�֌NN���C_Wq1�e�7$9`
w�;G��(�����[��|��a���38ǝN��,s�;����$[(C��p��6y��YB��,!�@�,���CjX����-U��u.��h!�3)`�œK(��Q�ux��H�ޗ����䤠vF�DL[#H�eVm}�N7OCY���������%\�C�LHg��,ߢ�۞���n�u5���VS��l�)-�bfmC�9�nc���cX��r�4�V˘W�Za�4�s�²l�l�W�_0���^�aw3�TZ�;*�0���imc���>_�-�9���x�\�IG�*��h�<��#�������O�y��8�\{��dǵ���J6ه�Ɍ�"�~՚���q,-N0�*n���FN,`Մ���%���G�$C���.�����"�o��uy��j1Б�L�$C:@;E�!�cN�U����h̳�dGmU�`��$!5'y��C�y%�Z�u.� 8��(c%fZ`r`R���x��|����6o|��c'[p���N�/��#d�q(�&��Ahm?�Ex�ВM���1IK�-�d����&����v�%5�I�D�ÁiC����:�4      m   �  x���OO�@��|��h�����g��	���Tʵ
K*"���觯=���+�0���D�???������9������ø[��w�ӷO����/۱�n�ۓO_�͛�Ӭ9& ��!��hNho�~7��N�$��$�Db����y�%�{��S���s�v������"JЇ0�C ���I��KY�ź_=��f�A��J
�*j��m����b����`���;N�Ka�yY�����Vz$�m�5!�J�I��+f�I��C�E�ۙ��OzIt�eU*��+�P8})��%��W{׍���i��GT;պ�)a9K���j��'�U�zGm��%ԫ%(|U��^��b�����J�d~�z�1$Geur|����y�n���Rth=v	��I<O�<^�v���Ѱ�+�KL�H������ �/����Դ��C��K��'��&���5��mx=�^�q�zw%)�7ɬX&423��?��%��Q�EB�$��{6�뱋3�jN��
�^g!p� ,�2��0�;[IH6�7�esI=��	x���E�a�l�H�j�����"O�c~��i��_v�m��R�����b��(���C��v�Ш�+`�)1�O�n�
l9�&��Ή~~��f�h���~#P���e�	8��Uw�-�F��oHҿ��1A}�u��+�'M��[|r߮s^fK�v�蒀���0���W֥f�v�Z�=���)�G����7m4�#      n   �  x���;OA�������Z�-*
�H(H�Z�
QP���W$^N�]����|v6ۧ���a�}~��_����n}��v��|�߇��������^k�hD[���L.���f�Y����'-)���\&��\��@�2�:~�z&��+;�SЊi�X�5ux64;iq�F��T���X�aʄ��\Xՠ!�q<e��%���RC-�J9�EMyU��l���H�o�FXkw��#
'�Hz�\If���9�s�l�}��Ar*�4�G3�D�:����c��5O;RnF�2
���_Ps�ɼó�'��r?��҄v�{�G�u��&a�	C����h�0:s��N��=r�;� 8�X�v[@:�\A#�G��:!Hs�����jL̕���P�-RF�{$d�����r,h      k      x��ZM��8���W���"6n��������ݳ�9m@$(�M����_f@�����زDUYYY	|�z��Ǎ���曙����a����'4��ï9.��W��zwm������}�/������2���jk����6�0��5��d���ߒZ?��}ik��L��Lh_���|q����B4;�ڃ��m�W�	+t�Ǘ��N�I��|J��8���O���q�L\��B��u�d�s�d�vv�-f�~H\��l�Эyw7��݀��a���!0��:���Bjg�Z��iއ���]�[�{g�[?p��:k|�
xv���^d]�m����	��Ǚ�5n�a��X���g�!��/6�bߣr���$g�Pu�.��ٸ����g��O��1�#�ԣ���ͧ��s1Ϟ�|�-,*�*�`g���+>AD��1ؐ��F�'̩5�G����b~?�_�\�#?.6!��b`���:��iJ��� �f�$��6d��"fܔe��Cf��5�hܺG���D������.C�ݚ�!�[A2��s��<�܇�m�����歝��dJ"ml7�9�.��	@��?�X xb��ܝ��#�����I����Z"�p�	�jM�, ?��	�->��bf�與��h���ɥd�[�3����~��5��S
խ��Il��y#ԑ(�Q��(v?�c�����t��s�̭s������)���D�v{�M��pB�5�����zk����4��A|��]d��E�T�D�y���+Ԅ���v�T��tR��+��s�\�����i� �*���-�ˑ�@+Ze�o�Ǐ�1c&'d�0��Y�'c>TV,ӓ��0��ͷH��x~Ƽ#�x�[ׇ*%�HnO}���~}B������%��&�4G�０�X�Z��/3�"��8��i��GGn��ik�����hk�J�C,H�(=��-�;Um�p�F��T����������@]!=�7(h�B��Y��ܡ����MB@��:T	D��J�l.����|%[D'�X��	iB�$���\Ϥ�F턵�X� �i��u���p4-~]����@�0Kx��Uk�x�KX���K�&��6��G�=?�F�S~��sm��O���f�-��|z��zʅ��®<��K�<ׂBI�Ar�O��K�/�+/zR=3��p5�El���Iۦr'��B1��CCk�qd��<d^$��n�F$77�����R�V
��o�(�;QC=���bql�APt��+��"&�e1m7�>�9F�:z�8��@* "�¾�9��Afk��d�(k�B�`S�^���*�� N�Ύ�
\W��N���$޷��Kw��Gv7J�ocA���l.ζ��;r)����œ�\���rX>�Е�8ty��i.��-I��"a ���3�������0#8d~���@e�0#��x*���=d*��9	�*Ě���촽����4���D<��n~��R��T��&]���}��ӂ$G��n
����J�4�Qu��#�R)M�Z? �PC���z�PpX�P�P~�����
�!/��\�W'*�	+�@���G*B���I�`����,1p�e`]'B��sN��^��21�(	����ʎ>�9�p�P]C-�Z��J
��h�M��W���#[;N�$G��oc��w�����|dW�Kn������G�b�,E�E�s�椢��f�}��͇y�n�	����* 
~��r�9
�"�ͪ�R<�nF.~b������ B�6�ѫB��I"���~: \��̀%^��:Cx�#2��iG�5Е���e5�����(3�j�q�� H��H
���|B<����ԥ.?_�
h�H��E��Ǥ�-3�dX��c>~����}�>�[YG�� ��ʞ�0��x�����m�7��<ӋX��S���'�*���n�j/U{f�*�^Q�[9��S�g���S.�p�
����;�'�ӵM��;.2۰ѹ�8@iu����%f�f��*�
�R�Ӄ7���$,��˧Tၡ:m��Bo�
�d�\ԭ�c�K5P�5H�"ɮQ@�%��v�A�����򘨦_cy;�c'��(����l��}]����<���w� 
P��{_c�l|*�d�G�-ym1��e�A^���;Ʋ�3k��9�^?a�fNn�q џ$?
�!�D��21W�� ��x�L"��zYI] ��;a,�KB�iDy�O��ԅ�́c��.B�@Fs�A!ƅ��L�B:$$�NQ��'jM��$�4"�k?a����eR+Ӂ��6R���+�ll����Os�"���Jo����Ep���0�����9�fF`�_a1:��Oڃ	����}u^�u�]�L�@0���"�Ts�5�ů#�T�#M{�#t:H������P����
�Azx�#�h��z_�ؚC�0+	`�W^aO	�*����
���p&a2�q�"vv��[�5��G�9[�Vq�ViklK�ڨ������m���&���~�8�[�wy��ף�A6�t%��^���(!�vn�����+��C�A�1�Gw���ZKNs�7kk� ����Y�83Zz����e��{���r�@�/��� �GGL���a"�-�
g�]�I���@���7�Ƿ|-���{��:�А�/B�R<�M�3D���(�NX�3C�_�6d���z����*�&Ȑ;��!@�q���t��G�4�_�-��m�=��U�=�A�a���.���������,%�WgO&�t�<�)j�Ө ���@��O_�6��*2�e?��wB��X،�F��"����b��F^1�p8W��vS�.�KMѕ]��o0W����\Hy�:�g�b0�C�\��^�qt�h~�q����"	��3�,"ͳ�(�����}�5#�e�l]cC��9*IX�cY�v�8~��׎���v|D� �:k��$����JT��I�ʥ�'e^��=5�hj�������N�˖U#u9M�?���o�R�{֊h���ԩ�fQ��F&853sȮ������4Vc�aZ\�ռ<q(F�x�#5fA��ز��.��k��6u�>�p�槞i��E��H���^��y�zz+e�E����?��\ �A��u</aY��t��^�M4p����ĉN����B�=4`�I�q�m�ER��!5����eX����)�rIS��A��H2f��W!z6p{ ���Is��˗��>�h�����e��bVܺ��re��4;]/y8�P�V����O����w��*����l�����ON���>v��D�`<F?�0Pͧ�a�n��E��0?1�����L.c�i^ΪiUK?� �d4x�v�\�`�A�LN����l%컜L�MFi=WD��'�U&��R.�&$���z��"n��A1C`79s;9k��e��ܙ��^AvY"��LP�`��πrp��aޡj�s�>~�J�G'e��/�y�*��9��)�ͿڹQ9I\�eŎ�i����Ԡ�z�q�)/P�?�C?�k�¾���D#O��:;& G���͂GXL�L��:��V[���̼������:"	�}���$��(�')�l�i+��Q�0�y�Y�F����d8���)�upď7oe�
|?k�p<:��T~�n�D����O��Xv�9*�v}��H� �8 �r���,�?�A�I��G���y���+xH���0؋����D�'{wB<h��W�a[�ța?�^<;V�v�3��Bi_��(�i���49�1-��%��O��Y���崩�A�>S]-����8�N�����ʬ��m��g=q���y��r�p�%��~�-ZV-���������E�ӱ�$�w��h��I<!9q;o��)t>	�ZW�`�i��U�k2~� �ߊyt<u��X��8ۆI�a����T΍�Z��oGǔk9���m��>H�dT�H�v��j��IS��@�[�3��)�5����|u���V�f�'�i)qx�f�#� `  ɳ�[�-��?c� ����������W��EB`B�]ڡ��+�euJt͢�V��d��bW�����|�<F2��Kș���y�7+&���Q��g�D|�͖�:���^љ,j��=�&TY1@�̓*�	���2�@Q�w9R=7N���T(�'W���Pk�yZά���/�AG<��jON��>��Q��-e��8ǒ�ç|�3Y��|���`�Â����<I_7���s%]m���t����*-Z�Y�iܳ^�)yiʨ�Ί
,�-�.��*��۹�*^k�Kf�ݬג���$�zP�uu��'��X�Ȇ��lj�(37� h�8�((fD��Mm�|�GN���uB/�d*���w�[���D~n¥�#���y%߻"D�?˱���^��^<y�fx�6ة��JQ����"c�wT9��V�̙�
=^�?�멞�4#x����d |�K]�,U*���FyB�!�J����R
}��U_�Fl�������O�U��R�X����3�rr��#��	ى��ruWz%�tF(Bxpwz&\��Y�J[2&���,���w.�w�>Ƀ\�ȵ���H�����E���П;N&,p*g�5Ϸs\�����+M��^/�s^�i�����W)X=LT�,��h!*#�W�F�W���]�Z=r��{��
C�@�1���z� g�HX�ˮE�N�܏��
J>}V��7��������t��u�����V��2��w+׈����h���rr�/���ty��������x7�?���
��┮#7�T"�\�O����5}ɺ�.J���=)T�/�H22_rʾ��c�|0�q1��Ps�<����Ln�=(9�BPQ����s����u����qu��Yp�Hbv޺[��|�Q�K=�W�eKXN5���r����s����C���=��\F�'����ԧ9`���*�pvE1ߦdg�w�TGXu��An��Slr��[�Y�|c���U����|C�˅��܁�8 ��$:9a��L�q��i+�_�����tf=͗wk�;��rX�_�֣�&bG)���r������&	�C�ޯwd���F,���,�N<� �� ��a���;9=e�$���/ߞ�      q   �  x��UM�SA��W��SH��{O���ի\5�Y����'�0/�^��0tMUuWoo�n>�O�����q�?�߿����vO��Û����??���������^a#��4Pl�7��hV!-|=��뷫m%�]��p+Ϊ���'�D+�8��(�#�SE��	���$F��B�΅M���Q��i��󀉐��q��ˮx�湫��籲��CZ�*�]��a�FTAL$w�"�)�=#��MJ&�UT���q�OC�H9~nV'b6�|�H_Fk�)��"VQP#*��u ��'�fU.�MF�I;�Q0�=	���X\�]�Q�yKJU.1&�2$�Sl�	��8Q��x��v%E��Ҵ�~����җ^qP��bDuYZ
1��<�p��ʶh�ᅐL�;fK�r
�A��D��/?�%�}���YI�5F��G����&���7z��� � ��Z�qU0S����U��>�@�LEqq���?'�P��i���/BHs�      h   �  x��X˒�6��+�g�\*�[�Y�?���xܞ�f��H�� l�������V��Ւ��y\�z|���������3��͸��Jƻe�|H���������>�?�������כ�����렵4}����2ڕZJe�T��]�tͳ�'�;�*rҪO��[�Iu0��b�.�g���A������A��c샖�C+g�|˛�kqE�����f�}��C̾�z\ ��Ǔ\|xZʣ.��$5*!�M��A�Z:�����#偡O����Y�\��NV/�6ډ���`'_<�����Ew�ɚ_vV���i�2��tiΦ�*�+iLL>���pآ���j�:|n��{�ࡋ
�MQH��\P���Gv�$]bub٪�.���e)_�C��T�i�N��;�������		�����1b,�-�}�Ը�ܻ���v�b�쎷E���K��g�Qa촜L��?-��f.��k�zf��V�G"�������	MV�*�[o-R^|�hZ��	�����ӳ�ϸ�#M�Ynwj0�	�UU���O�Z߻t}��u�z%�MQ`�o�b��8g��Ĳ�S&��m�A�Z�������O��*�u�a�x��	���l����ritjP�s��Ur
�^��z�Gώ�b�,�&`s�h|*!r���d�ʦ����I����KН���r�i�'<������xAM����H��X���8ƕ���eʀ�Ɣ�u=g�_߻b\cD�[�*��`�D�J�WY���?��T_7̼��I1X��t��.5d֔C2eo���3������.6��#v,�G�=g�@�����H[��	L�ޥ�"]TB�#�.��@N����їF�&f>ʚ?tn�š92�a� ��9�u�b�J0`��۰=�
�ᆳ���y����W�v3O��*����0���h�!Z�g	k����F#KC��D�Vi.�?'��;�r�QU"Q$��M �\���Z��G4��٨2�m3{}���I�ph�n�)9K�w�X���X��1��˲'�/�ߦ�ʣ�`��/���Ab
�	ܞ����/�����k�-x� ��QT}$?r��O(t�"UQ_]�}J�v��3$`�{P�o@t��i
�d��Ʉ�N�fIE��ܜFu]�L���֖D� �f0�Fl1M���b�Na��C���Î���E3��qO��0[B�8�/E]ʛ�l�C�+q�t9 < q�[�x�ā���*����>��@[��Q!����<�3�?n�ƫ�e����{��G^�ct��t#5I/�ؚ�ہ'�#���/�+Iy6Ȍ:�[1�����Nl����)�}wŮ8 �7�픩}�`�B}���D@���:Z�tј2
��s$�`ǻ��]ڣ��N�z�{��3#�d�����f(��շ(�{�s�n9bo��0��'���3��tU��ŷ�v��,	t���_Ϭ�9��L��+U��p��В5Ծ<f�i�(���􂤮D�տ�����Ň6���W`5*��X����(C��\��p�Տ�e)g�_ s�a�`NR^F3q��������o`ݘ$�I��zG�+�|���D����f�=z���!1��Ӆ~0�Ӛ�4}2)ON(��<b�c���W~��aj� ���ge��x஢�.L2ٷd��i'�	R��߰������f�㑳����ct�(����Z�wO��B�����
��y�&%+Y�������+�U&���w,�*)�5�k�0;�t��;�$5^��S?�H�w}sȸ=�WT���|�0�Dَ/wZ�򁟂5�eh��1�`���lso�6�1�xm2>�����OQ�I쥶
��M���h�qKc@ ���f��wN�����ij���p��D�^�64;�V����-S�f�����)����/VgT�KC�y�_�;sK��׹J��,3!�df�R�A���mQU��39�m�f�[��1DU�،���N������;��������oah��Uf����^�0�d��e���%/X�4&�p��PR'�K�Ǐ�1t�@v�5P4;�lgs�1�� ���,�V2��� &638��*f�a*P����W{�Cq��u�\���3�;��>�.��=_�  P��c�`��^�	~�������=�!�<󥄣6�������7oܼ'Lq�A�m���~��빛�:��F�8�#�_Dsڽ������m�-�V�/��Ѐ5��w<�%�`w���7      r   "  x���KkQ����KN�t�lW]da()4i���^�)I�?�\J���E/�=����t�|����t�n�?./O���t��p:|�y|9=�����|y������@e�\_#^. o�Wy�������|G����i}r���v��Ʊ:�8��5$�/�ES�)
���MS��/l�8������8hX��&��E��\e�;��1��װ�I~k�ך��<��x@���+��O�W��6ϓ���$�g@��1����z���#��Rrh&��P?�/D���j
۬��z9�ym�4��&��tr {�$K���X`��d�{B�z��(Z�4���|K�$.���f�W��j8�C�xJ��p� \,�oE��Ќ�9��F���C�
�H��p�9=5�w���b��#�ع�`jدd�6�KъvG��ڪ�A��[��J�^L�S<w�U�F��@�;��=���ۮtp#��� 8�˾Go�K�ȼMY/ԈI7��j\h.� ^<��4��3�c%� ]2[j%3Dem@��I�n�<��     