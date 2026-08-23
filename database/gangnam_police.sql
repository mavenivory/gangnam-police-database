-- ==========================================
-- Gangnam Police Department Investigation DB
-- Fictional Crime Investigation Database
-- ==========================================


CREATE DATABASE gangnam_police_database;

USE gangnam_police_database;


-- ==========================================
-- TABLE CASE
-- Menyimpan informasi perkara utama
-- ==========================================

CREATE TABLE cases (

    case_id VARCHAR(20) PRIMARY KEY,
    case_name VARCHAR(100),
    department VARCHAR(100),
    case_type VARCHAR(50),
    status VARCHAR(50),
    opening_date DATE,
    closing_date DATE

);


INSERT INTO cases VALUES (

'GPD-2016-INS-001',
'The Grand Casino Murder',
'Gangnam Major Crime Investigation Unit',
'Serial Murder',
'Closed',
'2016-01-25',
'2016-08-26'

);



-- ==========================================
-- TABLE SUSPECT
-- Data pelaku
-- ==========================================

CREATE TABLE suspects (

    suspect_id VARCHAR(20) PRIMARY KEY,
    case_id VARCHAR(20),
    name VARCHAR(100),
    role VARCHAR(50),
    status VARCHAR(50),

    FOREIGN KEY(case_id)
    REFERENCES cases(case_id)

);


INSERT INTO suspects VALUES (

'SUS-001',
'GPD-2016-INS-001',
'Mona',
'Primary Suspect',
'Detained'

);



-- ==========================================
-- TABLE VICTIMS
-- Data korban
-- ==========================================

CREATE TABLE victims (

    victim_id VARCHAR(20) PRIMARY KEY,
    case_id VARCHAR(20),
    victim_name VARCHAR(100),
    incident_date DATE,
    cause_of_death TEXT,

    FOREIGN KEY(case_id)
    REFERENCES cases(case_id)

);



INSERT INTO victims VALUES

(
'VIC-001',
'GPD-2016-INS-001',
'Rico',
'2016-01-25',
'Insulin intoxication causing severe hypoglycemia'
),

(
'VIC-002',
'GPD-2016-INS-001',
'Jeanne Jun',
'2016-02-05',
'Death caused by insulin injection complication'
),

(
'VIC-003',
'GPD-2016-INS-001',
'Julian Lee',
'2016-04-25',
'Death caused by insulin intoxication'
),

(
'VIC-004',
'GPD-2016-INS-001',
'Jayden Lee',
'2016-05-05',
'Death caused by repeated murder method'
),

(
'VIC-005',
'GPD-2016-INS-001',
'Hunter',
'2016-07-15',
'Death caused by insulin intoxication'
);



-- ==========================================
-- TABLE EVIDENCE
-- Barang bukti
-- ==========================================

CREATE TABLE evidence (

    evidence_id VARCHAR(20) PRIMARY KEY,
    case_id VARCHAR(20),
    evidence_name VARCHAR(100),
    description TEXT,

    FOREIGN KEY(case_id)
    REFERENCES cases(case_id)

);



INSERT INTO evidence VALUES

(
'EVD-001',
'GPD-2016-INS-001',
'Casino Chip',
'Chip kasino ditemukan pada korban sebagai simbol tertentu'
),

(
'EVD-002',
'GPD-2016-INS-001',
'Portable MP3 Player',
'Pemutar musik ditemukan dengan lagu Tonight You Belong to Me'
),

(
'EVD-003',
'GPD-2016-INS-001',
'Insulin Injection Evidence',
'Barang bukti terkait penyebab kematian korban'
);



-- ==========================================
-- TABLE TIMELINE
-- Kronologi kasus
-- ==========================================

CREATE TABLE timeline (

    timeline_id VARCHAR(20) PRIMARY KEY,
    case_id VARCHAR(20),
    event_date DATE,
    description TEXT,

    FOREIGN KEY(case_id)
    REFERENCES cases(case_id)

);



INSERT INTO timeline VALUES

(
'T-001',
'GPD-2016-INS-001',
'2016-01-25',
'Rico bertemu pelaku setelah menerima ajakan pertemuan'
),

(
'T-002',
'GPD-2016-INS-001',
'2016-02-05',
'Jeanne Jun menjadi korban kedua dengan pola serupa'
),

(
'T-003',
'GPD-2016-INS-001',
'2016-04-25',
'Julian Lee menjadi korban ketiga'
),

(
'T-004',
'GPD-2016-INS-001',
'2016-05-05',
'Jayden Lee menjadi korban keempat'
),

(
'T-005',
'GPD-2016-INS-001',
'2016-07-15',
'Hunter menjadi korban kelima'
),

(
'T-006',
'GPD-2016-INS-001',
'2016-08-26',
'Pelaku menyerahkan diri kepada pihak berwenang'
);



-- ==========================================
-- TABLE DOCUMENTS
-- File PDF yang tersedia
-- ==========================================

CREATE TABLE documents (

    document_id VARCHAR(20) PRIMARY KEY,
    case_id VARCHAR(20),
    document_name VARCHAR(150),
    description TEXT,

    FOREIGN KEY(case_id)
    REFERENCES cases(case_id)

);



INSERT INTO documents VALUES

(
'DOC-001',
'GPD-2016-INS-001',
'280816_BAB IV.pdf',
'Rekonstruksi Mekanisme Pembunuhan'
),

(
'DOC-002',
'GPD-2016-INS-001',
'280816_BAB V.pdf',
'Kronologi Tindak Pidana Pembunuhan'
);
