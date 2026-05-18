IF EXISTS (SELECT * FROM sys.databases WHERE name = 'ImageDatabase')
BEGIN
    ALTER DATABASE ImageDatabase SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ImageDatabase;
END
GO

CREATE DATABASE ImageDatabase;
GO

USE ImageDatabase;
GO

-- Create Users table
CREATE TABLE Images (
    Id VARCHAR(50) NOT NULL PRIMARY KEY,
    TimeStamp datetime NOT NULL,
    ImageType VARCHAR(50) NOT NULL,
    ImagePath VARCHAR(255) NOT NULL,
    Description VARCHAR(500) NULL,
    Confidence REAL NULL DEFAULT 0.0,
    DetectedObject VARCHAR(200) NULL,
    OwnerUid VARCHAR(128) NULL,

    CONSTRAINT FK_Images_Users_OwnerUid
        FOREIGN KEY (OwnerUid)
        REFERENCES Users(OwnerUid)
        ON DELETE SET NULL
);


CREATE TABLE Users (
    OwnerUid VARCHAR(128) NOT NULL PRIMARY KEY,
    TelegramChatId VARCHAR(128) NULL,
    ReportFrequency INT NOT NULL DEFAULT 7,
    ReportEnabled BIT NOT NULL DEFAULT 1
);

CREATE INDEX IX_Images_OwnerUid ON Images(OwnerUid);
CREATE INDEX IX_Images_TimeStamp ON Images(TimeStamp);
GO