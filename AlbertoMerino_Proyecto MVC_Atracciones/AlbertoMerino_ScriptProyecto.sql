/*ELIMINACI�N DE TABLAS ANTERIORES PARA EVITAR FALLOS*/
DROP TABLE ENTRADAS CASCADE CONSTRAINTS;
DROP TABLE CLIENTES CASCADE CONSTRAINTS;
DROP TABLE ATRACCIONES CASCADE CONSTRAINTS;
DROP TABLE MECANICOS CASCADE CONSTRAINTS;
DROP TABLE COMERCIOS CASCADE CONSTRAINTS;
DROP TABLE ZONAS_TEMATICAS CASCADE CONSTRAINTS;
DROP TABLE EMPLEADOS CASCADE CONSTRAINTS;
DROP TABLE AREA_DESCANSO CASCADE CONSTRAINTS;

      
/*CREACI�N DE TABLAS*/

CREATE TABLE ENTRADAS (
    numeracion VARCHAR2(5) NOT NULL,
    tipo VARCHAR2(40) NOT NULL CHECK (tipo = UPPER(tipo)),
    precio NUMBER(2) NOT NULL
);
CREATE TABLE CLIENTES (
    dni VARCHAR2(9) NOT NULL,
    nombre_completo VARCHAR2(60) NOT NULL CHECK (nombre_completo = UPPER(nombre_completo)),
    edad NUMBER(2) NOT NULL,
    discapacidad VARCHAR2(2) NOT NULL CHECK (discapacidad = UPPER(discapacidad)),
    numeracion VARCHAR2(5) NOT NULL,
    numero_serie VARCHAR2(6) NOT NULL
);
CREATE TABLE ATRACCIONES (
    numero_serie VARCHAR(10) NOT NULL,
    nombre VARCHAR2(50) NOT NULL CHECK (nombre = UPPER(nombre)),
    numero_vagones NUMBER(3) NOT NULL,
    ultima_revision DATE NOT NULL,
    numero_zona NUMBER(1) NOT NULL
);
CREATE TABLE MECANICOS (
    identificacion VARCHAR2(6) NOT NULL,
    fecha_inspeccion DATE NOT NULL
);

CREATE TABLE COMERCIOS (
    nombre VARCHAR2(60) NOT NULL CHECK (nombre = UPPER(nombre)),
    horario VARCHAR2(10),
    tipo VARCHAR2(25) NOT NULL CHECK (tipo = UPPER(tipo)),
    ingreso_diario_media NUMBER(8,2) NOT NULL,
    menus VARCHAR2(2) NOT NULL CHECK (menus = UPPER(menus)),
    numero_zona NUMBER(1) NOT NULL
);

CREATE TABLE ZONAS_TEMATICAS (
    numero_zona NUMBER(1) NOT NULL,
    nombre_zona VARCHAR2(40) NOT NULL,
    aforo NUMBER(4) NOT NULL,
    extension_km NUMBER(1) NOT NULL
);

CREATE TABLE EMPLEADOS (
    nnss NUMBER(11) NOT NULL,
    nombre VARCHAR2(15) NOT NULL CHECK (nombre = UPPER(nombre)),
    apellido VARCHAR2(20) NOT NULL CHECK (apellido = UPPER(apellido)),
    salario NUMBER(4) NOT NULL,
    num_id NUMBER(4),
    es_jefe VARCHAR2(3) NOT NULL CHECK (es_jefe = UPPER(es_jefe))
);

CREATE TABLE AREA_DESCANSO (
    num_id NUMBER(4) NOT NULL,
    bebida VARCHAR2(15) NOT NULL CHECK (bebida = UPPER(bebida)),
    existencias NUMBER(1) NOT NULL,
    taquilla NUMBER(1) NOT NULL,
    hora VARCHAR2(5)
);


/*CREACI�N DE LAS CONSTRAINTS*/
        /*PRIMARY KEYS*/
ALTER TABLE ENTRADAS ADD CONSTRAINT ENTRADAS_PK PRIMARY KEY (numeracion);
ALTER TABLE CLIENTES ADD CONSTRAINT CLIENTES_PK PRIMARY KEY (dni);
ALTER TABLE ATRACCIONES ADD CONSTRAINT ATRACCIONES_PK PRIMARY KEY (numero_serie);
ALTER TABLE MECANICOS ADD CONSTRAINT MECANICOS_PK PRIMARY KEY (identificacion, fecha_inspeccion);
ALTER TABLE COMERCIOS ADD CONSTRAINT COMERCIOS_PK PRIMARY KEY (nombre);
ALTER TABLE ZONAS_TEMATICAS ADD CONSTRAINT ZONAS_TEMATICAS_PK PRIMARY KEY (numero_zona);
ALTER TABLE EMPLEADOS ADD CONSTRAINT EMPLEADOS_PK PRIMARY KEY (nnss);
ALTER TABLE AREA_DESCANSO ADD CONSTRAINT AREA_DESCANSO_PK PRIMARY KEY (num_id);

        /*FOREIGN KEYS*/
        
ALTER TABLE CLIENTES ADD CONSTRAINT ATRACCIONES_FK FOREIGN KEY (numero_serie)
    REFERENCES ATRACCIONES (numero_serie);
ALTER TABLE CLIENTES ADD CONSTRAINT ENTRADAS_FK FOREIGN KEY (numeracion)
    REFERENCES ENTRADAS (numeracion);
ALTER TABLE ATRACCIONES ADD CONSTRAINT MECANICOS_FK FOREIGN KEY (ultima_revision)
    REFERENCES MECANICOS (fecha_inspeccion);
ALTER TABLE ATRACCIONES ADD CONSTRAINT ZONA_TEMATICA_FK FOREIGN KEY (numero_zona)
    REFERENCES ZONAS_TEMATICAS (numero_zona);
ALTER TABLE COMERCIOS ADD CONSTRAINT ZONA_TEMATICA_COM_FK FOREIGN KEY (numero_zona)
    REFERENCES ZONAS_TEMATICAS (numero_zona);
ALTER TABLE EMPLEADOS ADD CONSTRAINT AREA_DESCANSO_FK FOREIGN KEY (num_id)
    REFERENCES AREA_DESCANSO (num_id);

    
/*DATOS DE ENTRADAS*/
INSERT INTO ENTRADAS VALUES(55410, 'NORMAL', 30); 
INSERT INTO ENTRADAS VALUES(68971, 'VIP', 50); 
INSERT INTO ENTRADAS VALUES(59979, 'VIP', 50); 
INSERT INTO ENTRADAS VALUES(89416, 'NI�O', 20); 
INSERT INTO ENTRADAS VALUES(32695, 'NORMAL', 30);
INSERT INTO ENTRADAS VALUES(88434, 'NI�O', 20);
INSERT INTO ENTRADAS VALUES(02610, 'NORMAL', 30); 
INSERT INTO ENTRADAS VALUES(08030, 'VIP', 50); 

/*DATOS DE LOS MEC�NICOS*/
INSERT INTO MECANICOS VALUES('ME-557','20-05-2018');
INSERT INTO MECANICOS VALUES('ME-557','13-01-2019');
INSERT INTO MECANICOS VALUES('ME-557','15-11-2018');
INSERT INTO MECANICOS VALUES('ME-557','14-02-2019');
INSERT INTO MECANICOS VALUES('ME-557','14-05-2019');
INSERT INTO MECANICOS VALUES('ME-890','06-11-2018');
INSERT INTO MECANICOS VALUES('ME-890','25-01-2019');
INSERT INTO MECANICOS VALUES('ME-890','10-05-2019');
INSERT INTO MECANICOS VALUES('ME-890','15-07-2019');
INSERT INTO MECANICOS VALUES('ME-890','31-12-2019');
INSERT INTO MECANICOS VALUES('ME-935','01-11-2018');
INSERT INTO MECANICOS VALUES('ME-935','24-01-2019');
INSERT INTO MECANICOS VALUES('ME-935','13-03-2019');
INSERT INTO MECANICOS VALUES('ME-935','23-06-2018');
INSERT INTO MECANICOS VALUES('ME-935','17-12-2018');

 /*DATOS DE LAS ZONAS TEM�TICAS*/
INSERT INTO ZONAS_TEMATICAS VALUES(1, 'EMOCIONES FUERTES',900, 3); 
INSERT INTO ZONAS_TEMATICAS VALUES(2, 'FAMILIAR', 1200, 2); 
INSERT INTO ZONAS_TEMATICAS VALUES(3, 'COMERCIOS', 1000, 2); 
INSERT INTO ZONAS_TEMATICAS VALUES(4, 'PARA LOS PEQUES', 1300, 4); 

/*DATOS DE LAS ATRACCIONES*/
INSERT INTO ATRACCIONES VALUES('EF-487','TORNADO',7,'20-05-2018',1);
INSERT INTO ATRACCIONES VALUES('EF-641','ASERRADERO',10,'13-01-2019',1);
INSERT INTO ATRACCIONES VALUES('EF-201','ABISMO',8,'15-11-2018',1);
INSERT INTO ATRACCIONES VALUES('EF-404','LANZADERA',4,'14-02-2019',1);
INSERT INTO ATRACCIONES VALUES('EF-632','LA M�QUINA',5,'14-05-2019',1);
INSERT INTO ATRACCIONES VALUES('FA-141','SILLAS VOLADORAS',20,'06-11-2018',2);
INSERT INTO ATRACCIONES VALUES('FA-456','ANFITEATRO',600,'25-01-2019',2);
INSERT INTO ATRACCIONES VALUES('FA-321','SIMULADOR VIRTUAL',15,'10-05-2019',2);
INSERT INTO ATRACCIONES VALUES('FA-111','PASEO EN CANOA TEM�TICO',4,'15-07-2019',2);
INSERT INTO ATRACCIONES VALUES('FA-357','COCHES DE CHOQUE',12,'31-12-2019',2);
INSERT INTO ATRACCIONES VALUES('PP-487','FIORDOS', 6,'01-11-2018',4);
INSERT INTO ATRACCIONES VALUES('PP-641','EL DRAGON',5,'24-01-2019',4);
INSERT INTO ATRACCIONES VALUES('PP-367','EL PERRO LOCO',7,'13-03-2019',4);
INSERT INTO ATRACCIONES VALUES('PP-878','RAT�N VACIL�N',9,'23-06-2018',4);
INSERT INTO ATRACCIONES VALUES('PP-600','KARTS',20,'17-12-2018',4);

 /*DATOS DE LOS COMERCIOS*/
INSERT INTO COMERCIOS VALUES('ATRACONES EN ATRACCIONES', '11:00-16:00', 'RESTAURACION', 7000, 'S�', 3);
INSERT INTO COMERCIOS VALUES('EL MENU LOCO', '11:00-14:00', 'RESTAURACION', 13000, 'S�', 3);
INSERT INTO COMERCIOS VALUES('COME Y BEBE', '11:-21:00', 'RESTAURACION', 17000, 'NO', 3);
INSERT INTO COMERCIOS VALUES('UN REGALO PARA LA FAMILIA', '10:00-20:00', 'SOUVENIR', 20000, 'NO', 3);
INSERT INTO COMERCIOS VALUES('ESTAMPITAS DE LA VIRGEN', '16:00-20:00', 'SOUVENIR', 5000, 'NO', 3);
INSERT INTO COMERCIOS VALUES('TAZAS Y CAMISETAS', '09:00-20:00', 'SOUVENIR', 8000, 'NO', 3);
INSERT INTO COMERCIOS VALUES('TIRO AL PATO', '09:00-20:00', 'PUESTO DE FERIA', 8000, 'NO', 3);
INSERT INTO COMERCIOS VALUES('LOS DARDOS', '09:00-20:00', 'PUESTO DE FERIA', 6000, 'NO', 3);
INSERT INTO COMERCIOS VALUES('LOS BOLOS', '09:00-20:00', 'PUESTO DE FERIA', 8300, 'NO', 3);

/*DATOS DE CLIENTES*/
INSERT INTO CLIENTES VALUES(04854314A,'ALBERTO MERINO CHICO',20,'NO',55410,'EF-487'); 
INSERT INTO CLIENTES VALUES(04121978R,'RICARDO MONTES G�MEZ',30,'S�',68971,'FA-111'); 
INSERT INTO CLIENTES VALUES(03947874Q,'IZAN MART�NEZ BALB�S',18,'NO',59979,'EF-632'); 
INSERT INTO CLIENTES VALUES(04516378B,'JORGE LUENGO CAMACHO',10,'NO',89416,'PP-487'); 
INSERT INTO CLIENTES VALUES(04652219R,'RAM�N MANSILLA CEDENILLA',25,'S�',32695,'FA-456');
INSERT INTO CLIENTES VALUES(05239741A,'AITOR VEL�ZQUEZ LOSAS',13,'NO',88434,'PP-600');
INSERT INTO CLIENTES VALUES(04121978R,'RICARDO MONTES G�MEZ',30,'S�',68971,'FA-456'); 
INSERT INTO CLIENTES VALUES(04854314A,'ALBERTO MERINO CHICO',20,'NO',55410,'CO-666'); 
INSERT INTO CLIENTES VALUES(04854314A,'ALBERTO MERINO CHICO',20,'NO',55410,'FA-321'); 
INSERT INTO CLIENTES VALUES(04121978R,'RICARDO MONTES G�MEZ',30,'S�',68971,'EF-641'); 
INSERT INTO CLIENTES VALUES(05316741D,'BRUNO ROJAS PINERO',23,'NO',02610,'EF-487'); 
INSERT INTO CLIENTES VALUES(05239741A,'AITOR VEL�ZQUEZ LOSAS',13,'NO',88434,'PP-600');
INSERT INTO CLIENTES VALUES(04951234W,'LUIS EDUARDO MART�NEZ',22,'NO',08030,'FA-357');
INSERT INTO CLIENTES VALUES(04951234W,'LUIS EDUARDO MART�NEZ',22,'NO',08030,'PP-487'); 
INSERT INTO CLIENTES VALUES(05239741A,'AITOR VEL�ZQUEZ LOSAS',13,'NO',88434,'PP-600');
INSERT INTO CLIENTES VALUES(04516378B,'JORGE LUENGO CAMACHO',10,'NO',89416,'CO-111'); 
INSERT INTO CLIENTES VALUES(03947874Q,'IZAN MART�NEZ BALB�S',18,'NO',59979,'CO-222'); 
INSERT INTO CLIENTES VALUES(04854314A,'ALBERTO MERINO CHICO',20,'NO',55410,'CO-777');
INSERT INTO CLIENTES VALUES(05316741D,'BRUNO ROJAS PINERO',23,'NO',02610,'EF-641');
INSERT INTO CLIENTES VALUES(05316741D,'BRUNO ROJAS PINERO',23,'NO',02610,'CO-333'); 
INSERT INTO CLIENTES VALUES(04121978R,'RICARDO MONTES G�MEZ',30,'S�',68971,'EF-404');
INSERT INTO CLIENTES VALUES(04652219R,'RAM�N MANSILLA CEDENILLA',25,'S�',32695,'FA-111');
INSERT INTO CLIENTES VALUES(05316741D,'BRUNO ROJAS PINERO',23,'NO',02610,'EF-201'); 
INSERT INTO CLIENTES VALUES(04516378B,'JORGE LUENGO CAMACHO',10,'NO',89416,'PP-641'); 
INSERT INTO CLIENTES VALUES(03947874Q,'IZAN MART�NEZ BALB�S',18,'NO',59979,'EF-201'); 
INSERT INTO CLIENTES VALUES(03947874Q,'IZAN MART�NEZ BALB�S',18,'NO',59979,'EF-641');
INSERT INTO CLIENTES VALUES(04951234W,'LUIS EDUARDO MART�NEZ',22,'NO',08030,'EF-404'); 
INSERT INTO CLIENTES VALUES(05316741D,'BRUNO ROJAS PINERO',23,'NO',02610,'EF-632'); 
INSERT INTO CLIENTES VALUES(04652219R,'RAM�N MANSILLA CEDENILLA',25,'S�',32695,'CO-333');
INSERT INTO CLIENTES VALUES(04652219R,'RAM�N MANSILLA CEDENILLA',25,'S�',32695,'CO-888');
INSERT INTO CLIENTES VALUES(04121978R,'RICARDO MONTES G�MEZ',30,'S�',68971,'FA-111'); 
INSERT INTO CLIENTES VALUES(04951234W,'LUIS EDUARDO MART�NEZ',22,'NO',08030,'FA-141'); 
INSERT INTO CLIENTES VALUES(04516378B,'JORGE LUENGO CAMACHO',10,'NO',89416,'PP-367'); 
INSERT INTO CLIENTES VALUES(04854314A,'ALBERTO MERINO CHICO',20,'NO',55410,'EF-487'); 
INSERT INTO CLIENTES VALUES(04121978R,'RICARDO MONTES G�MEZ',30,'S�',68971,'EF-201');
INSERT INTO CLIENTES VALUES(04951234W,'LUIS EDUARDO MART�NEZ',22,'NO',08030,'FA-111'); 
INSERT INTO CLIENTES VALUES(03947874Q,'IZAN MART�NEZ BALB�S',18,'NO',59979,'PP-878'); 
INSERT INTO CLIENTES VALUES(04516378B,'JORGE LUENGO CAMACHO',10,'NO',89416,'PP-878'); 
INSERT INTO CLIENTES VALUES(04516378B,'JORGE LUENGO CAMACHO',10,'NO',89416,'PP-600'); 
INSERT INTO CLIENTES VALUES(04951234W,'LUIS EDUARDO MART�NEZ',22,'NO',08030,'EF-201'); 
INSERT INTO CLIENTES VALUES(03947874Q,'IZAN MART�NEZ BALB�S',18,'NO',59979,'FA-321'); 
INSERT INTO CLIENTES VALUES(05239741A,'AITOR VEL�ZQUEZ LOSAS',13,'NO',88434,'PP-600');
INSERT INTO CLIENTES VALUES(04854314A,'ALBERTO MERINO CHICO',20,'NO',55410,'EF-404'); 
INSERT INTO CLIENTES VALUES(04121978R,'RICARDO MONTES G�MEZ',30,'S�',68971,'FA-456'); 
INSERT INTO CLIENTES VALUES(03947874Q,'IZAN MART�NEZ BALB�S',18,'NO',59979,'CO-555'); 

/*AREA DE DESCANSO*/
INSERT INTO AREA_DESCANSO VALUES(4040,'COCA-COLA',2,4,'13:00'); 
INSERT INTO AREA_DESCANSO VALUES(9619,'COCA-COLA',1,2,'12:30'); 
INSERT INTO AREA_DESCANSO VALUES(4314,'FANTA NARANJA',2,5,'13:00'); 
INSERT INTO AREA_DESCANSO VALUES(4514,'AGUA',3,1,'15:00'); 
INSERT INTO AREA_DESCANSO VALUES(8367,'COCA-COLA',4,6,'11:00'); 
INSERT INTO AREA_DESCANSO VALUES(2356,'SPRITE',2,3,'12:45'); 
 
/*EMPLEADOS*/
INSERT INTO EMPLEADOS VALUES(89924934692,'ALEJANDRO','GARRIDO',1000,4040,'S�'); 
INSERT INTO EMPLEADOS VALUES(79614907143,'LIDIA','AMOR',1200,9619,'S�'); 
INSERT INTO EMPLEADOS VALUES(61924458273,'I�IGO','RODR�GUEZ',900,4314,'NO'); 
INSERT INTO EMPLEADOS VALUES(61404083835,'HUGO','HURTADO',950,4514,'S�'); 
INSERT INTO EMPLEADOS VALUES(94506251187,'JUAN','COLLADO',1000,8367,'NO'); 
INSERT INTO EMPLEADOS VALUES(46493471116,'MARCOS','GARC�A',900,2356,'NO'); 
COMMIT;
