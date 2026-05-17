USE ImageDatabase;
GO

INSERT INTO Users (OwnerUid, TelegramChatId, ReportFrequency, ReportEnabled)
VALUES
('user-001', 'telegram-1001', 7, 1),
('user-002', 'telegram-1002', 3, 1),
('user-003', 'telegram-1003', 14, 0);

GO

INSERT INTO Images (
    Id,
    TimeStamp,
    ImageType,
    ImageData,
    Description,
    Confidence,
    DetectedObject,
    OwnerUid
)
VALUES
(
    'img-001',
    '2026-05-15T10:00:00Z',
    'jpg',
    0xFFD8FFE000104A464946,
    'Person walking in street',
    0.95,
    'Person',
    'user-001'
),
(
    'img-002',
    '2026-05-15T10:05:00Z',
    'png',
    0x89504E470D0A1A0A,
    'Car detected near parking lot',
    0.88,
    'Car',
    'user-001'
),
(
    'img-003',
    '2026-05-15T10:10:00Z',
    'jpg',
    0xFFD8FFE000104A464946,
    'Dog in backyard',
    0.97,
    'Dog',
    'user-002'
);

GO