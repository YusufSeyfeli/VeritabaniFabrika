PGDMP                         {            Fabrika    13.8    13.8 B               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            !           1262    40992    Fabrika    DATABASE     f   CREATE DATABASE "Fabrika" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE "Fabrika";
                postgres    false            �            1255    49330    check_personel_maaş()    FUNCTION     �   CREATE FUNCTION public."check_personel_maaş"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE maaş INTEGER;
BEGIN
  IF NEW."maas" > 1000000 THEN
    RAISE EXCEPTION 'Maaş 1 milyondan büyük olamaz';
  END IF;
  return NULL;
END;
$$;
 /   DROP FUNCTION public."check_personel_maaş"();
       public          postgres    false            �            1255    49316    check_personel_personelid()    FUNCTION     �   CREATE FUNCTION public.check_personel_personelid() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE personelid INTEGER;
BEGIN
  IF NEW.personelid = '' THEN
    RAISE EXCEPTION 'personelid boş bırakılamaz';
  END IF;
END;
$$;
 2   DROP FUNCTION public.check_personel_personelid();
       public          postgres    false            �            1255    49322    check_personel_soyisim()    FUNCTION     �   CREATE FUNCTION public.check_personel_soyisim() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE soyisim CHARACTER VARYING;
BEGIN
  IF NEW.soyisim = '' THEN
    RAISE EXCEPTION 'Soyisim boş bırakılamaz ';
  END IF;
END;
$$;
 /   DROP FUNCTION public.check_personel_soyisim();
       public          postgres    false            �            1255    49321 �   personel_ekle(integer, character varying, character varying, integer, character varying, integer, time with time zone, character varying, character varying)    FUNCTION       CREATE FUNCTION public.personel_ekle(personelid integer, tc character varying, soyisim character varying, "görevid" integer, isim character varying, "maaş" integer, dgtarihi time with time zone, cinsiyet character varying, "şifre" character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN

   INSERT INTO personel ("personelid",tc,soyisim,görevid,isim,maaş,
						dgtarihi,cinsiyet,"şifre","görevid")
   VALUES ("personelid",tc,soyisim,görevid,isim,maaş,
			dgtarihi,cinsiyet,"şifre","görevid");
END;
$$;
 �   DROP FUNCTION public.personel_ekle(personelid integer, tc character varying, soyisim character varying, "görevid" integer, isim character varying, "maaş" integer, dgtarihi time with time zone, cinsiyet character varying, "şifre" character varying);
       public          postgres    false            �            1259    49190    Görev    TABLE     s   CREATE TABLE public."Görev" (
    "görevid" integer NOT NULL,
    "görevisim" character varying(20) NOT NULL
);
    DROP TABLE public."Görev";
       public         heap    postgres    false            �            1259    49258    Hammadde    TABLE     h   CREATE TABLE public."Hammadde" (
    hammaddeid integer NOT NULL,
    hammaddefiyat integer NOT NULL
);
    DROP TABLE public."Hammadde";
       public         heap    postgres    false            �            1259    49268    HammaddeStok    TABLE     k   CREATE TABLE public."HammaddeStok" (
    hammaddeid integer NOT NULL,
    stokhammadde integer NOT NULL
);
 "   DROP TABLE public."HammaddeStok";
       public         heap    postgres    false            �            1259    49263    Hammaddeisim    TABLE     y   CREATE TABLE public."Hammaddeisim" (
    hammaddeid integer NOT NULL,
    hammaddeisim character varying(20) NOT NULL
);
 "   DROP TABLE public."Hammaddeisim";
       public         heap    postgres    false            �            1259    49248    Makham    TABLE     a   CREATE TABLE public."Makham" (
    hammaddeid integer NOT NULL,
    makineid integer NOT NULL
);
    DROP TABLE public."Makham";
       public         heap    postgres    false            �            1259    49205    Makine    TABLE     �   CREATE TABLE public."Makine" (
    makineid integer NOT NULL,
    "kazanç" integer NOT NULL,
    makinefiyat integer NOT NULL,
    "üretim" integer NOT NULL
);
    DROP TABLE public."Makine";
       public         heap    postgres    false            �            1259    49218 
   Makineisim    TABLE     s   CREATE TABLE public."Makineisim" (
    makineid integer NOT NULL,
    makineisim character varying(20) NOT NULL
);
     DROP TABLE public."Makineisim";
       public         heap    postgres    false            �            1259    49238    Makper    TABLE     a   CREATE TABLE public."Makper" (
    makineid integer NOT NULL,
    personelid integer NOT NULL
);
    DROP TABLE public."Makper";
       public         heap    postgres    false            �            1259    49185    Personel    TABLE     p  CREATE TABLE public."Personel" (
    personelid integer NOT NULL,
    tc character varying(11) NOT NULL,
    soyisim character varying(20) NOT NULL,
    isim character varying(20) NOT NULL,
    maas integer,
    cinsiyet character varying(5),
    "şifre" character varying(20) NOT NULL,
    "görevid" integer NOT NULL,
    dgtarihi character varying(10) NOT NULL
);
    DROP TABLE public."Personel";
       public         heap    postgres    false            �            1259    49195    Stok    TABLE     Z   CREATE TABLE public."Stok" (
    "ürünid" integer NOT NULL,
    "stokürün" integer
);
    DROP TABLE public."Stok";
       public         heap    postgres    false            �            1259    49308 	   Yönetici    TABLE     e   CREATE TABLE public."Yönetici" (
    "yöneticiid" integer NOT NULL
)
INHERITS (public."Personel");
    DROP TABLE public."Yönetici";
       public         heap    postgres    false    200            �            1259    49233    Ürün    TABLE     f   CREATE TABLE public."Ürün" (
    "ürünid" integer NOT NULL,
    "ürünfiyat" integer NOT NULL
);
    DROP TABLE public."Ürün";
       public         heap    postgres    false            �            1259    49243    ÜrünMakine    TABLE     g   CREATE TABLE public."ÜrünMakine" (
    "ürünid" integer NOT NULL,
    makineid integer NOT NULL
);
 "   DROP TABLE public."ÜrünMakine";
       public         heap    postgres    false            �            1259    49253 	   Ürünham    TABLE     f   CREATE TABLE public."Ürünham" (
    "ürünid" integer NOT NULL,
    hammaddeid integer NOT NULL
);
    DROP TABLE public."Ürünham";
       public         heap    postgres    false            �            1259    49228 
   Ürünisim    TABLE     w   CREATE TABLE public."Ürünisim" (
    "ürünid" integer NOT NULL,
    "ürünisim" character varying(20) NOT NULL
);
     DROP TABLE public."Ürünisim";
       public         heap    postgres    false            �            1259    49223    Şube    TABLE     �   CREATE TABLE public."Şube" (
    "şubeid" integer NOT NULL,
    makineid integer NOT NULL,
    "şubeisim" character varying(20) NOT NULL,
    personelid integer NOT NULL
);
    DROP TABLE public."Şube";
       public         heap    postgres    false                      0    49190    Görev 
   TABLE DATA           <   COPY public."Görev" ("görevid", "görevisim") FROM stdin;
    public          postgres    false    201   �N                 0    49258    Hammadde 
   TABLE DATA           ?   COPY public."Hammadde" (hammaddeid, hammaddefiyat) FROM stdin;
    public          postgres    false    212   �N                 0    49268    HammaddeStok 
   TABLE DATA           B   COPY public."HammaddeStok" (hammaddeid, stokhammadde) FROM stdin;
    public          postgres    false    214   �N                 0    49263    Hammaddeisim 
   TABLE DATA           B   COPY public."Hammaddeisim" (hammaddeid, hammaddeisim) FROM stdin;
    public          postgres    false    213   
O                 0    49248    Makham 
   TABLE DATA           8   COPY public."Makham" (hammaddeid, makineid) FROM stdin;
    public          postgres    false    210   'O                 0    49205    Makine 
   TABLE DATA           O   COPY public."Makine" (makineid, "kazanç", makinefiyat, "üretim") FROM stdin;
    public          postgres    false    203   DO                 0    49218 
   Makineisim 
   TABLE DATA           <   COPY public."Makineisim" (makineid, makineisim) FROM stdin;
    public          postgres    false    204   aO                 0    49238    Makper 
   TABLE DATA           8   COPY public."Makper" (makineid, personelid) FROM stdin;
    public          postgres    false    208   ~O                 0    49185    Personel 
   TABLE DATA           s   COPY public."Personel" (personelid, tc, soyisim, isim, maas, cinsiyet, "şifre", "görevid", dgtarihi) FROM stdin;
    public          postgres    false    200   �O                 0    49195    Stok 
   TABLE DATA           :   COPY public."Stok" ("ürünid", "stokürün") FROM stdin;
    public          postgres    false    202   �O                 0    49308 	   Yönetici 
   TABLE DATA           �   COPY public."Yönetici" (personelid, tc, soyisim, isim, maas, cinsiyet, "şifre", "görevid", "yöneticiid", dgtarihi) FROM stdin;
    public          postgres    false    215   �O                 0    49233    Ürün 
   TABLE DATA           =   COPY public."Ürün" ("ürünid", "ürünfiyat") FROM stdin;
    public          postgres    false    207   �O                 0    49243    ÜrünMakine 
   TABLE DATA           >   COPY public."ÜrünMakine" ("ürünid", makineid) FROM stdin;
    public          postgres    false    209   P                 0    49253 	   Ürünham 
   TABLE DATA           =   COPY public."Ürünham" ("ürünid", hammaddeid) FROM stdin;
    public          postgres    false    211   ,P                 0    49228 
   Ürünisim 
   TABLE DATA           @   COPY public."Ürünisim" ("ürünid", "ürünisim") FROM stdin;
    public          postgres    false    206   IP                 0    49223    Şube 
   TABLE DATA           O   COPY public."Şube" ("şubeid", makineid, "şubeisim", personelid) FROM stdin;
    public          postgres    false    205   fP       c           2606    49194    Görev Görev_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Görev"
    ADD CONSTRAINT "Görev_pkey" PRIMARY KEY ("görevid");
 @   ALTER TABLE ONLY public."Görev" DROP CONSTRAINT "Görev_pkey";
       public            postgres    false    201            }           2606    49272    HammaddeStok HammaddeStok_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."HammaddeStok"
    ADD CONSTRAINT "HammaddeStok_pkey" PRIMARY KEY (hammaddeid);
 L   ALTER TABLE ONLY public."HammaddeStok" DROP CONSTRAINT "HammaddeStok_pkey";
       public            postgres    false    214            y           2606    49262    Hammadde Hammadde_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Hammadde"
    ADD CONSTRAINT "Hammadde_pkey" PRIMARY KEY (hammaddeid);
 D   ALTER TABLE ONLY public."Hammadde" DROP CONSTRAINT "Hammadde_pkey";
       public            postgres    false    212            {           2606    49267    Hammaddeisim Hammaddeisim_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Hammaddeisim"
    ADD CONSTRAINT "Hammaddeisim_pkey" PRIMARY KEY (hammaddeid);
 L   ALTER TABLE ONLY public."Hammaddeisim" DROP CONSTRAINT "Hammaddeisim_pkey";
       public            postgres    false    213            u           2606    49252    Makham Makham_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Makham"
    ADD CONSTRAINT "Makham_pkey" PRIMARY KEY (hammaddeid);
 @   ALTER TABLE ONLY public."Makham" DROP CONSTRAINT "Makham_pkey";
       public            postgres    false    210            g           2606    49209    Makine Makine_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Makine"
    ADD CONSTRAINT "Makine_pkey" PRIMARY KEY (makineid);
 @   ALTER TABLE ONLY public."Makine" DROP CONSTRAINT "Makine_pkey";
       public            postgres    false    203            i           2606    49222    Makineisim Makineisim_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Makineisim"
    ADD CONSTRAINT "Makineisim_pkey" PRIMARY KEY (makineid);
 H   ALTER TABLE ONLY public."Makineisim" DROP CONSTRAINT "Makineisim_pkey";
       public            postgres    false    204            q           2606    49242    Makper Makper_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Makper"
    ADD CONSTRAINT "Makper_pkey" PRIMARY KEY (makineid);
 @   ALTER TABLE ONLY public."Makper" DROP CONSTRAINT "Makper_pkey";
       public            postgres    false    208            a           2606    49189    Personel Personel_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Personel"
    ADD CONSTRAINT "Personel_pkey" PRIMARY KEY (personelid);
 D   ALTER TABLE ONLY public."Personel" DROP CONSTRAINT "Personel_pkey";
       public            postgres    false    200            e           2606    49199    Stok Stok_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Stok"
    ADD CONSTRAINT "Stok_pkey" PRIMARY KEY ("ürünid");
 <   ALTER TABLE ONLY public."Stok" DROP CONSTRAINT "Stok_pkey";
       public            postgres    false    202                       2606    49312    Yönetici Yönetici_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Yönetici"
    ADD CONSTRAINT "Yönetici_pkey" PRIMARY KEY ("yöneticiid");
 F   ALTER TABLE ONLY public."Yönetici" DROP CONSTRAINT "Yönetici_pkey";
       public            postgres    false    215            s           2606    49247    ÜrünMakine ÜrünMakine_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."ÜrünMakine"
    ADD CONSTRAINT "ÜrünMakine_pkey" PRIMARY KEY ("ürünid");
 L   ALTER TABLE ONLY public."ÜrünMakine" DROP CONSTRAINT "ÜrünMakine_pkey";
       public            postgres    false    209            o           2606    49237    Ürün Ürün_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Ürün"
    ADD CONSTRAINT "Ürün_pkey" PRIMARY KEY ("ürünid");
 @   ALTER TABLE ONLY public."Ürün" DROP CONSTRAINT "Ürün_pkey";
       public            postgres    false    207            w           2606    49257    Ürünham Ürünham_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Ürünham"
    ADD CONSTRAINT "Ürünham_pkey" PRIMARY KEY ("ürünid");
 F   ALTER TABLE ONLY public."Ürünham" DROP CONSTRAINT "Ürünham_pkey";
       public            postgres    false    211            m           2606    49232    Ürünisim Ürünisim_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Ürünisim"
    ADD CONSTRAINT "Ürünisim_pkey" PRIMARY KEY ("ürünid");
 H   ALTER TABLE ONLY public."Ürünisim" DROP CONSTRAINT "Ürünisim_pkey";
       public            postgres    false    206            k           2606    49227    Şube Şube_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Şube"
    ADD CONSTRAINT "Şube_pkey" PRIMARY KEY ("şubeid");
 >   ALTER TABLE ONLY public."Şube" DROP CONSTRAINT "Şube_pkey";
       public            postgres    false    205            �           2620    49331    Personel trigger_check_maaş    TRIGGER     �   CREATE TRIGGER "trigger_check_maaş" BEFORE INSERT OR UPDATE ON public."Personel" FOR EACH ROW EXECUTE FUNCTION public."check_personel_maaş"();
 9   DROP TRIGGER "trigger_check_maaş" ON public."Personel";
       public          postgres    false    200    219            �           2620    49323    Personel trigger_check_soyisim    TRIGGER     �   CREATE TRIGGER trigger_check_soyisim BEFORE INSERT OR UPDATE ON public."Personel" FOR EACH ROW EXECUTE FUNCTION public.check_personel_soyisim();
 9   DROP TRIGGER trigger_check_soyisim ON public."Personel";
       public          postgres    false    200    218            �           2620    49318 $   Personel trigger_personel_personelid    TRIGGER     �   CREATE TRIGGER trigger_personel_personelid BEFORE INSERT OR UPDATE ON public."Personel" FOR EACH ROW EXECUTE FUNCTION public.check_personel_personelid();
 ?   DROP TRIGGER trigger_personel_personelid ON public."Personel";
       public          postgres    false    216    200            �           2606    49283    Personel görevid    FK CONSTRAINT     �   ALTER TABLE ONLY public."Personel"
    ADD CONSTRAINT "görevid" FOREIGN KEY ("görevid") REFERENCES public."Görev"("görevid") NOT VALID;
 ?   ALTER TABLE ONLY public."Personel" DROP CONSTRAINT "görevid";
       public          postgres    false    200    201    2915            �           2606    49303    Ürünham hammaddeid    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ürünham"
    ADD CONSTRAINT hammaddeid FOREIGN KEY (hammaddeid) REFERENCES public."Hammaddeisim"(hammaddeid) NOT VALID;
 @   ALTER TABLE ONLY public."Ürünham" DROP CONSTRAINT hammaddeid;
       public          postgres    false    213    211    2939            �           2606    49273    Şube makineid    FK CONSTRAINT     �   ALTER TABLE ONLY public."Şube"
    ADD CONSTRAINT makineid FOREIGN KEY (makineid) REFERENCES public."Makine"(makineid) NOT VALID;
 :   ALTER TABLE ONLY public."Şube" DROP CONSTRAINT makineid;
       public          postgres    false    203    205    2919            �           2606    49293    ÜrünMakine makineid    FK CONSTRAINT     �   ALTER TABLE ONLY public."ÜrünMakine"
    ADD CONSTRAINT makineid FOREIGN KEY (makineid) REFERENCES public."Makineisim"(makineid) NOT VALID;
 A   ALTER TABLE ONLY public."ÜrünMakine" DROP CONSTRAINT makineid;
       public          postgres    false    2921    204    209            �           2606    49298    Makham makineid    FK CONSTRAINT     �   ALTER TABLE ONLY public."Makham"
    ADD CONSTRAINT makineid FOREIGN KEY (makineid) REFERENCES public."Makineisim"(makineid) NOT VALID;
 ;   ALTER TABLE ONLY public."Makham" DROP CONSTRAINT makineid;
       public          postgres    false    204    210    2921            �           2606    49278    Şube personelid    FK CONSTRAINT     �   ALTER TABLE ONLY public."Şube"
    ADD CONSTRAINT personelid FOREIGN KEY (personelid) REFERENCES public."Personel"(personelid) NOT VALID;
 <   ALTER TABLE ONLY public."Şube" DROP CONSTRAINT personelid;
       public          postgres    false    200    205    2913            �           2606    49288    Makper personelid    FK CONSTRAINT     �   ALTER TABLE ONLY public."Makper"
    ADD CONSTRAINT personelid FOREIGN KEY (personelid) REFERENCES public."Personel"(personelid) NOT VALID;
 =   ALTER TABLE ONLY public."Makper" DROP CONSTRAINT personelid;
       public          postgres    false    208    2913    200                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     