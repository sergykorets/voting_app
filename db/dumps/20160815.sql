--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-08-15 10:20:18 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2447 (class 0 OID 41970)
-- Dependencies: 186
-- Data for Name: candidates; Type: TABLE DATA; Schema: public; Owner: mat
--

INSERT INTO candidates VALUES (21, 'Zbyněk', 'Sýkora', 'České Budějovice', 1984, 'Zbyněk_Sýkora.JPG', 'image/jpeg', 2130671, '2016-08-13 10:29:11.323252', '2016-08-11 08:12:14.104936', '2016-08-13 10:29:30.583443', 107, 0, 578, 578);
INSERT INTO candidates VALUES (19, 'Tomáš', 'Zelenka', 'Litvínov', 1975, 'Tomáš_Zelenka.jpg', 'image/jpeg', 75176, '2016-08-13 10:29:51.076253', '2016-08-11 08:09:59.320281', '2016-08-13 10:30:09.142258', 0, 16, 709, 709);
INSERT INTO candidates VALUES (14, 'Pavlína', 'Zvelebilová', 'Praha', 1981, 'Pavlína_Zvelebilová.JPG', 'image/jpeg', 4645528, '2016-08-13 10:30:35.513433', '2016-08-11 08:01:13.646677', '2016-08-13 10:30:52.777218', 0, 15, 533, 533);
INSERT INTO candidates VALUES (17, 'Radovan', 'Civiš', 'Plzeň', 1973, 'Radovan_Civiš.jpg', 'image/jpeg', 2548941, '2016-08-13 10:21:26.721974', '2016-08-11 08:05:51.972042', '2016-08-13 10:22:12.110972', 0, 13, 777, 777);
INSERT INTO candidates VALUES (6, 'Karolína', 'Bílková', 'Praha', 1984, 'Karolína_Bílkova.jpg', 'image/jpeg', 61269, '2016-08-13 10:07:54.75285', '2016-08-11 07:48:46.023455', '2016-08-13 10:22:25.648602', 0, 40, 320, 320);
INSERT INTO candidates VALUES (18, 'Rostislav', 'Čichoň', 'Praha až Ostrava', 1966, 'Rostislav_Čichoň.jpg', 'image/jpeg', 1060614, '2016-08-13 10:31:13.811664', '2016-08-11 08:07:01.574014', '2016-08-13 10:31:30.410233', 0, 46, 754, 754);
INSERT INTO candidates VALUES (22, 'Zdeňka', 'Faltýnková', 'Praha', 1957, 'Zdeňka_Faltýnková.jpg', 'image/jpeg', 140177, '2016-08-13 10:22:44.845414', '2016-08-11 08:13:20.35081', '2016-08-13 10:23:03.091033', 0, 3, 641, 641);
INSERT INTO candidates VALUES (9, 'Lenka', 'Honzátková', 'Praha', 1976, 'Lenka_Honzátková.jpg', 'image/jpeg', 180307, '2016-08-13 10:23:18.903395', '2016-08-11 07:54:01.111542', '2016-08-13 10:23:31.086794', 0, 38, 533, 533);
INSERT INTO candidates VALUES (11, 'Miroslav', 'Čiháček', 'Náchod', 1955, 'Miroslav_Čiháček.jpg', 'image/jpeg', 328951, '2016-08-13 10:32:25.67856', '2016-08-11 07:56:55.869304', '2016-08-13 10:32:39.492568', 0, 27, 624, 624);
INSERT INTO candidates VALUES (2, 'Barbora', 'Hrdličková', 'Praha', 1972, 'Barbora_Hrdličková.jpg', 'image/jpeg', 61799, '2016-08-13 10:23:45.317902', '2016-08-11 05:42:51.188533', '2016-08-13 10:23:54.50994', 0, 0, 261, 261);
INSERT INTO candidates VALUES (15, 'Petr', 'Hubalovský', 'Praha', 1981, 'Petr_Hubalovský.jpg', 'image/jpeg', 213747, '2016-08-13 10:24:08.157623', '2016-08-11 08:02:42.9208', '2016-08-13 10:24:23.669475', 0, 173, 604, 604);
INSERT INTO candidates VALUES (16, 'Petr', 'Hurák', 'Roudnice nad Labem', 1974, 'Petr_Hurák.JPG', 'image/jpeg', 303335, '2016-08-13 10:24:40.50413', '2016-08-11 08:04:40.031358', '2016-08-13 10:24:57.298998', 0, 29, 600, 600);
INSERT INTO candidates VALUES (4, 'Jan', 'Šísler', 'Praha', 1952, 'Jan_Šísler.jpg', 'image/jpeg', 161375, '2016-08-13 10:33:05.343967', '2016-08-11 07:44:55.168966', '2016-08-13 10:33:45.20965', 130, 132, 401, 401);
INSERT INTO candidates VALUES (7, 'Kristýna', 'Křenová', 'Hradec Králové', 1992, 'Kristýna_Křenová.jpg', 'image/jpeg', 118890, '2016-08-13 10:25:12.475302', '2016-08-11 07:50:06.031509', '2016-08-13 10:25:23.56032', 130, 0, 534, 534);
INSERT INTO candidates VALUES (20, 'Veronika', 'Liďáková', 'Praha', 1981, 'Veronika_Liďáková.JPG', 'image/jpeg', 4558629, '2016-08-13 10:25:47.95375', '2016-08-11 08:11:06.60335', '2016-08-13 10:26:13.822092', 0, 35, 533, 533);
INSERT INTO candidates VALUES (13, 'Pavel', 'Šťastný', 'Praha', 1975, 'Pavel_Štastný.JPG', 'image/jpeg', 1149125, '2016-08-13 10:34:02.067882', '2016-08-11 07:59:30.964081', '2016-08-13 10:34:15.961628', 0, 0, 534, 534);
INSERT INTO candidates VALUES (8, 'Ladislav', 'Loebe', 'Brno', 1976, 'Ladislav_Loebe.jpg', 'image/jpeg', 2300867, '2016-08-13 10:26:34.853251', '2016-08-11 07:52:33.472474', '2016-08-13 10:26:49.571135', 0, 8, 533, 533);
INSERT INTO candidates VALUES (1, 'David', 'Lukeš', 'Praha', 1981, 'David_Lukeš.JPG', 'image/jpeg', 910251, '2016-08-13 10:27:04.915527', '2016-08-11 05:15:47.66487', '2016-08-13 10:27:22.527545', 232, 0, 534, 534);
INSERT INTO candidates VALUES (3, 'Filip', 'Mergental', 'Praha', 1976, 'Filip_Mergental.jpg', 'image/jpeg', 824392, '2016-08-13 10:27:37.413029', '2016-08-11 07:43:02.3053', '2016-08-13 10:27:49.692555', 0, 0, 800, 800);
INSERT INTO candidates VALUES (5, 'Jiří', 'Pleško', 'Praha', 1987, 'Jiří_Pleško.jpg', 'image/jpeg', 4601876, '2016-08-13 10:28:02.436455', '2016-08-11 07:46:25.192097', '2016-08-13 10:28:17.834754', 0, 96, 600, 600);
INSERT INTO candidates VALUES (10, 'Michal', 'Seidl', 'Rokytnice nad Jizerou ', 1969, 'Michal_Seidl.jpg', 'image/jpeg', 136582, '2016-08-13 10:28:36.842725', '2016-08-11 07:55:38.483933', '2016-08-13 10:28:48.570299', 0, 0, 526, 526);
INSERT INTO candidates VALUES (12, 'Miroslav', 'Šperk', 'Hořice', 1984, 'Miroslav_Šperk.jpg', 'image/jpeg', 333816, '2016-08-13 11:11:43.890112', '2016-08-11 07:58:09.21938', '2016-08-13 11:11:58.149351', 0, 0, 720, 720);


--
-- TOC entry 2449 (class 0 OID 41981)
-- Dependencies: 188
-- Data for Name: elections; Type: TABLE DATA; Schema: public; Owner: mat
--

INSERT INTO elections VALUES (1, 'Volby do předsednictva a revizní komise 2016', '2016-09-15', '2016-10-15', NULL, NULL, '2016-08-12 15:03:52.950242', '2016-08-12 15:05:56.838144');


--
-- TOC entry 2451 (class 0 OID 41992)
-- Dependencies: 190
-- Data for Name: election_parts; Type: TABLE DATA; Schema: public; Owner: mat
--

INSERT INTO election_parts VALUES (2, 1, 'Revizní komise', 3, '2016-08-11 05:16:28.60713', '2016-08-12 15:31:31.718744');
INSERT INTO election_parts VALUES (1, 1, 'Předsednictvo', 6, '2016-08-11 05:16:19.957449', '2016-08-12 15:31:44.077486');


--
-- TOC entry 2455 (class 0 OID 42026)
-- Dependencies: 194
-- Data for Name: candidate_participations; Type: TABLE DATA; Schema: public; Owner: mat
--

INSERT INTO candidate_participations VALUES (5, 5, 1, 'Na vozíku jsem od roku 2009 (úraz při sportu C6). Od roku 2010 jsem aktivní ragbista, od 2012 místopředseda Českého ragbyového svazu vozíčkářů, od 2014 místopředseda Českého svazu tělesně postižených sportovců. Od roku 2010 pracuji na soukromé klinice Canadian Medical Care.', 'Připomínkování legislativy
', NULL, '2016-08-11 07:47:00.865415', '2016-08-11 07:47:00.865415', 5);
INSERT INTO candidate_participations VALUES (6, 6, 1, 'Pracuji na SRJ RÚ Kladruby od roku 2011, podíl na vzniku neuro-urologické ambulance v RÚ Kladruby, postgraduální student v oboru Experimentální chirurgie- hodnocení vlivu mirabegronu na kardiovaskulární systém u pacientů s míšní lézí', 'šíření povědomí o CZEPA mezi mladými rehabilitačními lékaři, možnost organizace kurzu pro mladé lékaře v předatestační přípravě', NULL, '2016-08-11 07:49:17.778829', '2016-08-11 07:49:17.778829', 6);
INSERT INTO candidate_participations VALUES (7, 7, 1, 'Jsem aktivní studentka. Částečně žiji v Hradci Králové a částečně v Praze, kde se na univerzitě věnuji studiu marketingu a PR a v tomto oboru také pracuji. V roce 2015 jsem se stala ambasadorkou grantového programu Nadace O2 a v rámci tohoto programu také mentoruji mladé lidi. Práce, která má smysl mě naplňuje a inspiruje. Baví mě cestování a sport.', 'Protože žiji na malém městě i v metropoli zároveň, vnímám rozdíly v kvalitě života hendikepovaných v závislosti na místě, kde žijí. Od střední školy se ve spolupráci s magistrátem věnuji rozvoji bezbariérovosti našeho města a přístupnosti škol pro hendikepované studenty a své zkušenosti bych ráda sdílela dál. Na jaře jsem byla ve Vídni na mezinárodní spinální konferenci, odkud jsme přivezli spoustu podnětů pro CZEPU a myslím, že je nesmírně důležité pokračovat v mezinárodním dialogu a výměně zkušeností, které vedou ke zlepšení života hendikepovaných. 
', NULL, '2016-08-11 07:51:46.141709', '2016-08-11 07:51:46.141709', 7);
INSERT INTO candidate_participations VALUES (8, 8, 1, 'Absolvent práv na MU Brno, v současnosti zaměstnán jako právník ve spolku ParaCENTRUM Fenix. V této organizaci plním i funkci předsedy. ', 'Pracovat pro členy asociace, prosazovat a hájit jejich zájmy, podporovat je při jejich úplném začleňování do majoritní společnosti. Snažit se o zlepšení přístupu státních orgánů směrem ke členům asociace, vůbec všem tělesně postiženým. Zlepšení přístupu členů asociace ke vzdělání, zaměstnání. Narovnání právního prostředí v oblasti posudkové péče, prostředků zdravotnické techniky atp. 
', NULL, '2016-08-11 07:53:01.550326', '2016-08-11 07:53:01.550326', 8);
INSERT INTO candidate_participations VALUES (18, 18, 1, 'Odborný asistent na UK Fakultě tělesné výchovy a sportu, Externí spolupracovník na Lékařské fakultě Ostravské univerzity. Specializace hlavně na Sportovní trénink OSP, Adjuvatuku, Aplikované pohybové aktivity.', 'Nerad specifikuji, nebo slibuji nemožné. Vzhledem k určitému časovému období na vozíku a profesní odbornosti do dané problematiky, mohu vnášet i osobní dlouholeté zkušenosti.', NULL, '2016-08-11 08:07:48.265948', '2016-08-11 08:07:48.265948', 18);
INSERT INTO candidate_participations VALUES (2, 2, 2, 'Přibližně od roku 2000 se pohybuji v prostředí neziskových organizací (NROS, Neziskovky.cz, TEREZA a další) a to zejména ve spojitosti s jejich finančním řízením. Ráda při práci v revizní komisi využiji své zkušenosti v oblasti hospodaření s dotacemi a granty, ale i s vlastními zdroji organizace, spoluprací s účetními firmami, inventarizací, controllingem a dalšími činnosti, které souvisí s řízením organizace. V současné době jsem členkou dozorčí rady organizace POHODA – společnost pro normální život lidí s postižením, o.p.s., takže i práce v podobném orgánu, jakým je revizní komise, pro mne není zcela neznámá. Věřím, že bych své zkušenosti uplatnila ve prospěch dobrého fungování CZEPA.', '', NULL, '2016-08-11 05:44:16.01042', '2016-08-13 11:01:29.482631', 3);
INSERT INTO candidate_participations VALUES (3, 3, 1, 'Drazí, je to již skoro čtvrt století, co jsem se stal řadovým kvadruplegikem. Zavinila to má mladistvá nerozvážnost. Po skoku do vody se mi v hlavě rozsvítilo a já si dodělal střední a následně pak i vysokou školu. Momentálně pracuji na pozici IT specialista ve firmě Chemcomex Praha, a.s.', 'Zábavnou a nenásilnou formou seznamovat veřejnost se specifickými potřebami lidí po poranění míchy.
', NULL, '2016-08-11 07:43:42.720501', '2016-08-13 11:01:38.357173', 2);
INSERT INTO candidate_participations VALUES (10, 10, 1, 'Potkal jsem metro v kolejišti ve stanici Butovice 24.4.1991 od téhož roku aktivní vozíčkář, profese stavař. Vlastnosti důslednost a rád říkám nahlas co si myslím. Samozřejmě vzhledem k věku pesimistický optimista. Od té doby neslaví Jiřího a také jim nepřeji. ', 'Důsledné hájení práv hendikepovaných vůči státním orgánům. Chtěl bych se pokusit zvýšit tlak na MPSV a NRZP, aby zacházeli s našimi návrhy lépe a zapracovávali je do zákonů poněkud rychleji. ', NULL, '2016-08-11 07:56:05.963631', '2016-08-11 07:56:05.963631', 10);
INSERT INTO candidate_participations VALUES (11, 11, 1, 'Jsem paraplegik po úrazu na závěsném kluzáku (rogalu) od roku 1984. V předsednictvu od založení organizace. Zajímám se o zdravotnickou techniku (u některé jsem byl u vývoje) a to hlavně vozíky, antidekubitní pomůcky, katétry. Ačkoli situace v množství pomůcek se stále zlepšuje, z praxe znám mnoho lidí, kteří dostali nevhodný vozík bez možnosti výběru, což se snažím napravovat. Jako představitel místní vozíčkářské organizace pomáhám nejen s výběrem pomůcek ale i s odstraňováním arch. barier. ', 'Domnívám se, že moje dlouholeté zkušenosti a praxe mohou být využity pro potřeby dalších členů. Např.: Při "úsporných" pokusech zdravotních pojišťoven čas od času odhalím některé, naše zdraví ohrožující nápady, na které je třeba včas reagovat a pomoci tlaku větších organizací zajistit nápravu...
', NULL, '2016-08-11 07:57:29.897682', '2016-08-11 07:57:29.897682', 11);
INSERT INTO candidate_participations VALUES (12, 12, 1, 'V letošním roce mi bude 32 let, po úrazu páteře (r. 2000) jsem na invalidním vozíku. Vystudoval jsem Univerzitu Hradec Králové - pedagogické zaměření. V současné době pracuji jako učitel na střední škole (aprobace: Anglický jazyk a Informatika), dále se věnuji distribuci a vývoji sportovních vozíků. Ve svém volném čase rád sportuji (basketbal, florbal, cyklistika), chodím do kina a cestuji.', 'Rád bych v asociaci pomohl nadále rozvíjet sportovní aktivity vozíčkářů, hlavně pak sportovní aktivity dětí na vozíku. Chtěl bych v asociaci prosadit určité druhy podpory pro sportovní kluby a organizace, pomoci přilákat nové sportovce a rozvinout náborové programy. 

', NULL, '2016-08-11 07:58:47.305012', '2016-08-11 07:58:47.305012', 12);
INSERT INTO candidate_participations VALUES (13, 13, 2, 'Jsem ředitelem interních procesů koncernu CIMEX GROUP (www.cimex.cz), kde působím v několika orgánech v rámci sdružených společností. Ženatý, bezdětný. Společně s manželkou se dlouhodobě zajímáme o filantropii (Rugbymania, Kojenecký ústav Krč, adoptivní rodiče v ZOO Praha atd). Jsem členem několika zájmových sdružení, které pravidelně podporují charitativní projekty (a to i celosvětově). Jsem velmi sportovně založen. S organizací CZEPA jsem obeznámen díky svému dlouholetému (dnes již bývalému) kolegovi Davidovi Lukešovi. Na případné účasti v revizní komisi spatřuji další možnost věnovat se něčemu, co má smysl a pomáhá.', '', NULL, '2016-08-11 08:00:01.689539', '2016-08-11 08:00:01.689539', 13);
INSERT INTO candidate_participations VALUES (15, 15, 1, 'Jsem 13 let tetraplegik po autonehodě a již několik let pracuji jako instruktor nácviku soběstačnosti v Centru Paraple, a proto jsem schopen reflektovat a naslouchat potřebám vozíčkářů. Jsem si vědom problémů a potřeb Vás všech a mohu se je pokusit předávat dál, aby jich bylo co nejméně a mohli jste žít šťastný a spokojený život.', 'Stabilita, podpora, pomoc při spolupráci s dalšími organizacemi, nábor nových členů, znalost a dobré vztahy se spousty vozíčkářů (kteří by mohly aktivně býti CZEPĚ nápomocni)', NULL, '2016-08-11 08:03:41.218743', '2016-08-11 08:03:41.218743', 15);
INSERT INTO candidate_participations VALUES (16, 16, 1, 'Vystudoval jsem technickou školu s maturitou. Vojnu jsem absolvoval na letišti. V roce 1998 jsem založil firmu, nyní funguje jako chráněná dílna. Od roku 2009 jsem na vozíku (tetraparesa), příčina neznámá. Věnuji se rehabilitaci ,kynologii, turistické jízdě na čtyřkolce, firmě, rodině. ', 'Vzhledem k tomu, že jsem si na vlastní kůži vyzkoušel, jak je těžké se znovu jako vozíčkář zapojit do společnosti, vyřídit si vše potřebné, ať už u lékaře, s úředníky nebo třeba jenom nakoupit, chtěl bych nyní pomoci s využitím doposud získaných zkušeností ostatním takto postiženým lidem. Bojovat za větší bezbariérovost ve městech a veřejných budovách, bojovat za upřednostňování pacientů u lékařů, pomoci s opětovným vstupem za volant a na silnice. Výběrem a úpravou vhodného dopravního prostředku. Pokud to bude možné, zajistit půjčování Genny. Věřím, že mé získané zkušenosti budou přínosem k dalšímu rozvoji CZEPA.', NULL, '2016-08-11 08:05:15.307025', '2016-08-11 08:05:15.307025', 16);
INSERT INTO candidate_participations VALUES (17, 17, 1, 'Narodil jsem se v Plzni, kde jsem se vyučil truhlářem. 24 let jsem na vozíku. Od roku 1998 jsem začal pracovat pro Sdružení Exodus jako vedoucí chráněné dílny. Měl jsem možnost naučit se nejen vedení kolektivu lidí s postižením i bez něj, ale i vedení neziskovky jako takové, po stránce ekonomické, sociální a organizační. Od roku 2007 pracuji na projektu sociálního podniku. Před úrazem i po něm jsem dost sportoval. Vyzkoušel jsem hodně sportů, ale nejvíce mě drží jízda na handbike, takže kromě posilování a hraní pinčesu už na další nezbývá čas. ', 'K rozvoji CZEPA rád přispěji vlastní profesní zkušeností z oboru sociálního podniku, ale i tou osobní, související s mým handicapem. Konkrétní návrh zatím nemám, ale pokud bychom se třeba zasadili o to, aby zdravotní pojišťovny tolik nekrátily úhrady kompenzačních pomůcek, žilo by se líp nám všem.', NULL, '2016-08-11 08:06:22.589935', '2016-08-11 08:06:22.589935', 17);
INSERT INTO candidate_participations VALUES (4, 4, 1, 'Při práci u Horské služby v Krušných horách jsem utrpěl v roce 1978 úraz a od té doby jsem na vozíku. V létech 1980 – 1987 pracoval jako asistent produkce (Krátký film Praha), v ČT a v divadle Pod stanem. V roce 1983 se stal spoluzakladatelem basketbalového týmu vozíčkářů, byl aktivním hráčem a organizoval Mezinárodní turnaje v košíkové. Od roku 1988 je členem týmu Kliniky rehabilitačního lékařství Albertov (původně pod vedením prof. MUDr. Jana Pfeiffera, DrSC a nyní Doc. Olgy Švestkové, CSc). Organizace zahraničních stáží . Dodnes pracuje na KRL v oblasti organizace a ergoterapie . V rozmezí let 1990 – 1993 organizoval humanitární pomoc českému zdravotnictví se zaměřením na handicapované osoby ve spolupráci s VDV Olgy Havlové. Jeho současné pracovní aktivity jsou cíleny do oblasti ergoterapie, spolupracuje na projektu zaměstnávání osob se zdravotním postižením a od roku 2003 realizuje 2x ročně rekondiční pobyty osob po poškození mozku. V roce 1995 stál u vzniku nadace Rehalb nyní o.p.s.., jejímž je od roku 2002 výkonným ředitelem. ', 'Podpora vytvoření sítě regionálních zástupců, spolupráce se s Centrem Paraple, rekondiční pobytové akce
', NULL, '2016-08-11 07:45:36.496702', '2016-08-11 07:45:36.496702', 4);
INSERT INTO candidate_participations VALUES (9, 9, 1, 'Podpoře klientů po poškození míchy se věnuji asi 20 let. Začala jsem jako dobrovolník v Centru Paraple. Profesionálně jsem působila jako fyzioterapeut, po mateřské jsem se specializovala na sportovní terapii v CP, kde jsem pořádala sportovní kurzy, podílela jsem se na rozvoji programu Zdravého životního stylu, nyní působím v CP jako metodik . Své zkušenosti se pravidelně snažím předávat odborné veřejnosti. ', 'V současné době je zásadní otázkou stárnutí vozíčkářské populace. Jako zásadní pro podporu našich klientů je tvorba regionálního zajištění klientů a jejich rodin. Podstatnou složkou je vytvoření preventivních programů za účelem udržení zdraví (kvalitní regionální zdravotní služba) a podpora klientů v užívání kvalitních služeb v oblasti osobní asistence (kvalitní regionální sociální služba).
', NULL, '2016-08-11 07:54:31.318239', '2016-08-11 07:54:31.318239', 9);
INSERT INTO candidate_participations VALUES (19, 18, 2, 'Odborný asistent na UK Fakultě tělesné výchovy a sportu, Externí spolupracovník na Lékařské fakultě Ostravské univerzity. Specializace hlavně na sportovní trénink OSP, Adjuvatiku, Aplikované pohybové aktivity. Několik let pracuji na různých projektech, kde musím vést finanční i ekonomickou stránku. V jiných neziskových organizacích mám na starosti podání žádost včetně finanční rozvahy, dohlížím a kontroluji financování projektů.
', '', NULL, '2016-08-11 08:08:14.831956', '2016-08-11 08:08:14.831956', 19);
INSERT INTO candidate_participations VALUES (20, 19, 1, 'Je mi 40 let, téměř 5 let šťastně rozvedený a s více než 15 lety zkušeností na vozíku. Po úraze páteře jsem zůstal jako bývalý sportovec u sportu, sledge hokeje, kterému jsem se na vrcholové úrovni úspěšně věnoval jako „holka pro všechno“ celých 10 let. Souběžně jsem si doplnil vzdělání a ukončil VSFS státní závěrečnou zkouškou, titul inženýr. V současné době jsem se přehoupl do druhé poloviny doktorandského postgraduálního studia na Univerzitě Palackého v Olomouci.', 'Jsem přesvědčen, že je potřeba rozvíjet další aktivity související například se sportem a zejména v oblasti větších práv rodičů na vozíku po rozvodu.', NULL, '2016-08-11 08:10:22.262295', '2016-08-11 08:10:22.262295', 20);
INSERT INTO candidate_participations VALUES (21, 20, 1, 'V problematice lidí po poškození míchy se pohybuji od roku 2000. První zkušenosti a následnou praxi v ergoterapii jsem získala v Centru Paraple. Během rodičovské dovolené jsem pracovala jako pomocný administrativní pracovník při rozvoji CZEPA. Nyní pracuji na Spinální jednotce FN Motol jako ergoterapeutka. Spolupracuji s organizacemi a odborníky zabývajícími se lidmi po poškození míchy.', 'Možnost přispění argumenty a spolupráce s odborníky např. při: řešení úhrad pomůcek pojišťovnami, připomínkování zákonů s tématem dotýkajících se osob po poškození míchy, náhled v souvislostech při řešení otázek v péči od akutního stádia po poškození míchy až po chronický stav.', NULL, '2016-08-11 08:11:32.771253', '2016-08-11 08:11:32.771253', 21);
INSERT INTO candidate_participations VALUES (23, 22, 1, 'Fyzioterapeut, ergoterapeut, zaměstnanec CZEPA', 'Poradenskou činností, edukační a informační činností zdravotnických pracovníků a klientů - uživatelů vozíku o komplexní problematice především spinálních pacientů, zapojením do projektu regionálních zástupců, mapováním a propojováním jednotlivých zdravotnických pracovišť a neziskových organizací s cílem kvalitního poradenského servisu pro nové klienty i chroniky.', NULL, '2016-08-11 08:13:58.298566', '2016-08-11 08:13:58.298566', 23);
INSERT INTO candidate_participations VALUES (1, 1, 1, 'Jsem vystudovaný právník s více než desetiletou praxí v různých pracovních pozicích v komerčním sektoru (právník, marketingový specialista, manažer). Se Svazem paraplegiků (dnes CZEPA) jsem přišel poprvé do styku po svém úraze na první rehabilitaci v Centru Paraple před 14 lety. Několik let jsem dobrovolně pomáhal s připomínkováním legislativy, později i jako člen předsednictva a poslední funkční období jako jednatel CZEPA. Po založení o.p.s. Centrum Paraple v roce 2010 jsem byl i členem a krátce i předsedou správní rady Paraplete. Od března roku 2016 působím v Centru Paraple jako ředitel. Jsem předsedou Českého ragbyového svazu vozíčkářů a i aktivním hráčem ragby. ', 'Díky tomu, že všechny své aktivity již plně směřuji na problematiku lidí s poškozením míchy, zajímá mě jakékoliv možné zlepšení kvality jejich života. V poslední době vnímám jako nejpodstatnější následnou podporu po ukončení všech předchozích programů - tedy zejména problematiku osobní asistence, péče o zdraví v průběhu života (preventivní programy, zdravotní péče v případě akutních obtíží) a bydlení. ', 0, '2016-08-11 05:17:49.311933', '2016-08-13 11:01:38.360274', 1);
INSERT INTO candidate_participations VALUES (14, 14, 1, 'Práci s tělesně postiženými se věnuji skoro 15 let. První zkušenosti jsem nasbírala v Kontaktu bB. Velkou školou a inspirací mi byla práce fyzioterapeuta v Centru Paraple, kde jsem se zároveň seznámila s nevyhovujícím systémem zdravotní péče, která je tělesně postiženým věnována a rozhodla jsme se k založení vlastní organizace, která bude poskytovat neomezenou rehabilitační péči všem tělesně postiženým, bez ohledu na diagnózu či stupeň postižení. REHAFIT, o.p.s. vedu téměř osm let, za tu dobu se nám podařilo vyjednat nemalé kroky u zdravotních pojišťoven v systému hrazené zdravotní péče u tělesně postižených. V těchto a mnoha jiných aktivitách bych ráda pokračovala.', 'Organizaci CZEPA bych byla ráda přínosem zejména z pohledu terapeuta, který léta pracuje s tělesně postiženými, zná jejich potřeby. Aktivně se mezi nimi pohybuje. Zároveň jsem za 8 let vedení neziskové organizace nasbírala bohaté zkušenosti s legislativou a s ní spojenými problémy, které je potřeba řešit, ve prospěch tělesně postižených. ', NULL, '2016-08-11 08:01:50.756209', '2016-08-11 08:01:50.756209', 14);
INSERT INTO candidate_participations VALUES (22, 21, 1, 'Pocházím z Českého Krumlova, ale nyní žiji v Českých Budějovicích a zde také pracuji jako manažer IT podpory v energetické společnosti. Od roku 2001 jsem po motonehodě na vozíku. V současné době se aktivně zapojuji do politického dění v Jihočeském kraji a jsem členem Sociální komise Rady města. Dalšími aktivitami, jejichž základem je sport, se snažím přispět k přirozené integraci a odbourávání předsudků intaktní veřejnosti - kampaň “Děláme věci stejně jako Vy…“, zapojování vozíčkářů do aktivního života – projekty Aktivně s vozíkem a Aktivity kemp, ke vstupu tématu života vozíčkářů do veřejného prostoru – mediální projekt “Záložka vozíčkáři”.', 'Do předsednictva CZEPA kandiduji, protože bych rád přispěl ke zkvalitnění života lidí s hendikepem, zejména co se dostupnosti kompenzačních pomůcek týče a není mi lhostejná aktuální politická situace především v sociální oblasti.', NULL, '2016-08-11 08:12:40.602626', '2016-08-11 08:12:40.602626', 22);


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 193
-- Name: candidate_participations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mat
--

SELECT pg_catalog.setval('candidate_participations_id_seq', 23, true);


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 185
-- Name: candidates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mat
--

SELECT pg_catalog.setval('candidates_id_seq', 22, true);


--
-- TOC entry 2464 (class 0 OID 0)
-- Dependencies: 189
-- Name: election_parts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mat
--

SELECT pg_catalog.setval('election_parts_id_seq', 2, true);


--
-- TOC entry 2465 (class 0 OID 0)
-- Dependencies: 187
-- Name: elections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mat
--

SELECT pg_catalog.setval('elections_id_seq', 1, true);


--
-- TOC entry 2445 (class 0 OID 33747)
-- Dependencies: 184
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mat
--

INSERT INTO users VALUES (1, '2016-08-03 19:59:34.6654', '2016-08-12 14:39:21.363842', 'admin@clockstar.cz', '$2a$10$OU7Qo2qFZtcs8DZBBRSbreDHhI6Q.k/ofV.v2FL0mOHFes26toqHu', NULL, NULL, NULL, 5, '2016-08-12 14:39:21.358635', '2016-08-12 13:53:25.872445', '::1', '::1', NULL, '', '', 'admin', NULL, NULL, NULL);


--
-- TOC entry 2466 (class 0 OID 0)
-- Dependencies: 183
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mat
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- TOC entry 2453 (class 0 OID 42009)
-- Dependencies: 192
-- Data for Name: voters; Type: TABLE DATA; Schema: public; Owner: mat
--



--
-- TOC entry 2467 (class 0 OID 0)
-- Dependencies: 191
-- Name: voters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mat
--

SELECT pg_catalog.setval('voters_id_seq', 1, false);


--
-- TOC entry 2457 (class 0 OID 42049)
-- Dependencies: 196
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: mat
--



--
-- TOC entry 2468 (class 0 OID 0)
-- Dependencies: 195
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mat
--

SELECT pg_catalog.setval('votes_id_seq', 1, false);


-- Completed on 2016-08-15 10:20:18 CEST

--
-- PostgreSQL database dump complete
--

