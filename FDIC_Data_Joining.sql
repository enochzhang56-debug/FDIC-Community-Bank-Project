-- Table 1: institutions 
CREATE TABLE institutions (
    CERT        VARCHAR(20) PRIMARY KEY,
    NAME        VARCHAR(255),
    CITY        VARCHAR(100),
    STALP       VARCHAR(2),
    ESTYMD      DATE,
    ACTIVE      BOOLEAN,
    BKCLASS     VARCHAR(10)
);

-- Table 2: financials 
CREATE TABLE financials (
    CERT        VARCHAR(20),
    REPDTE      DATE,
    ASSET       FLOAT,
    DEP         FLOAT,
    NETINC      FLOAT,
    ROA         FLOAT,
    ROE         FLOAT,
    EEFFR       FLOAT,
    LNRE        FLOAT,
    LNCI        FLOAT,
    LNCON       FLOAT,
    NUMEMP      INT,
    PRIMARY KEY (CERT, REPDTE),
    FOREIGN KEY (CERT) REFERENCES institutions(CERT)
);

-- Table 3: state_gdp 
CREATE TABLE state_gdp (
    STALP       VARCHAR(2),
    TimePeriod  VARCHAR(6),   -- e.g. '2023Q1'
    RealGDP     FLOAT,
    Industry    VARCHAR(100),
    PRIMARY KEY (STALP, TimePeriod)
);


CREATE TABLE merged_bank_data AS
SELECT 
    i.CERT,
    i.NAME,
    i.CITY,
    i.STALP,
    i.ESTYMD,
    i.BKCLASS,
    f.REPDTE,
    TO_CHAR(f.REPDTE, 'YYYY') || 'Q' || TO_CHAR(f.REPDTE, 'Q') AS TimePeriod,
    f.ASSET,
    f.DEP,
    f.NETINC,
    f.ROA,
    f.ROE,
    f.EEFFR,
    f.LNRE,
    f.LNCI,
    f.LNCON,
    f.NUMEMP,
    g.datavalue as realgdp
FROM institutions i
JOIN financials f 
    ON i.CERT = f.CERT
LEFT JOIN state_gdp g 
    ON i.STALP = g.STALP 
    AND TO_CHAR(f.REPDTE, 'YYYY') || 'Q' || TO_CHAR(f.REPDTE, 'Q') = g.TimePeriod;
