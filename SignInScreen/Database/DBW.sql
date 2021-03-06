CREATE DATABASE DBW
GO
USE DBW
GO
-------- THISINH
CREATE TABLE THISINH
(
	SBD VARCHAR(10) NOT NULL,-- PRIMARY KEY,
	HOTEN NVARCHAR(50) NOT NULL,
	NGAYSINH DATETIME NOT NULL,
	USERNAME VARCHAR(10) NOT NULL,
	_PASSWORD VARCHAR(20) NOT NULL,
	RESETPASS VARCHAR(20),
	DIEM FLOAT
	CONSTRAINT PK_THISINH PRIMARY KEY (SBD) 
)
SELECT * FROM THISINH
INSERT THISINH (SBD, HOTEN, NGAYSINH, USERNAME, _PASSWORD, RESETPASS, DIEM) 
VALUES 
(4501104127, N'Trần Thị Tứ Linh', 2000-11-28, 'linhttt', '127', '127', 0),
(4501104218, N'Võ Thị Phương Thắm', 2001-06-14, 'thamvtp', '218', '218', 10),
(4501104276, N'Trịnh Thị Phương Vi', 2001-01-01, 'vittp', '276', '276', 10), --17/12 --> 2901
(4501104064, N'Phan Thị Thu Hà', 2001-08-21, 'haptt', '064', '064', 10),
(4501104009, N'Nguyễn Thị Vân Anh', 2001-02-27, 'anhntv', '009', '009', 10), --29/1
(4501104163, N'Phạm Nguyễn Hồng Nguyên', 2001-05-25, 'nguyenpnh', '163', 'BRVT', 10),
(4501104249, N'Sầm Thị Hoàng Trang', 2001-10-18, 'trangsth', '249', '249', 10)


-------- TRUY VAN
GO
--CREATE PROC UserAdd
ALTER PROC UserAdd
@SBD VARCHAR(10),
@HOTEN NVARCHAR(50),
@NGAYSINH DATETIME,
@USERNAME VARCHAR(10),
@_PASSWORD VARCHAR(20)
AS
	INSERT INTO THISINH(SBD, HOTEN, NGAYSINH, USERNAME, _PASSWORD)
	VALUES (@SBD, @HOTEN, @NGAYSINH, @USERNAME, @_PASSWORD)
-------- DETHI
GO
CREATE TABLE DETHI 
(
	MADE VARCHAR(10) NOT NULL, --PRIMARY KEY,
	NGAYTHI DATETIME NOT NULL,
	THOILUONG INT NOT NULL,
	TEPDT TEXT NOT NULL,
	GIOITHIEU NTEXT NOT NULL
	CONSTRAINT PK_DETHI PRIMARY KEY (MADE) 
)
INSERT DETHI (MADE, NGAYTHI, THOILUONG, TEPDT, GIOITHIEU) 
VALUES 
--('MD01', 2021-11-21, 90, N'F:\Study\3rdyrs_1st\C#Windows\MSW\Database\DeThi\DT01.docx', N'Giới thiệu của mã đề 01'),
('MD01', 2021-11-21, 90, N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\DeThi\DT01.docx', N'Book Title: Ensure your title is memorable and grabs the attention of readers. The title should clarify what the book is about and must be easy to say.'),
('MD02', 2021-11-21, 90, N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\DeThi\DT02.docx', N'Computer Care: A local computer reseller provides flyers on computer care to its customers. You work as a technician for this store and have been tasked to prepare a new flyer.'),
('MD03', 2021-11-21, 90, N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\DeThi\DT03.docx', N'Giới thiệu của mã đề 03'),
('MD04', 2021-11-21, 90, N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\DeThi\DT04.docx', N'Giới thiệu của mã đề 04'),
('MD05', 2021-11-21, 90, N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\DeThi\DT05.docx', N'Giới thiệu của mã đề 05')

-------- CHAMDIEM
GO
CREATE TABLE CHAMDIEM
(
	MACAU VARCHAR(10) NOT NULL, -- PRIMARY KEY,
	MADE VARCHAR(10) NOT NULL,
	--CAUTRALOI NTEXT NOT NULL,
	KETQUA BIT NOT NULL
	CONSTRAINT PK_CHAMDIEM PRIMARY KEY( MACAU , MADE) 
)
INSERT CHAMDIEM (MACAU, MADE, KETQUA) 
VALUES
('C001', 'MD01', 1),
('C002', 'MD01', 1),
('C003', 'MD01', 1),
('C004', 'MD01', 1),
('C005', 'MD01', 1)


-------- CAUHOI
CREATE TABLE CAUHOI
(
	MACAU VARCHAR(10) NOT NULL, -- PRIMARY KEY,
	MADE VARCHAR(10) NOT NULL,
	NOIDUNG NTEXT NOT NULL,
	GOIY TEXT NOT NULL,
	DIEM FLOAT NOT NULL
	CONSTRAINT PK_CAUHOI PRIMARY KEY( MACAU , MADE) 
)
INSERT CAUHOI (MACAU, MADE, NOIDUNG, GOIY, DIEM) 
VALUES
('C001', 'MD01', N'Đổi màu chữ thành màu đỏ từ chữ "Capitalize" đến "subtitle"', N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\GoiY\GY01.docx', 10),
('C002', 'MD01', N'Đổi cỡ chữ 13 từ chữ "Capitalize" đến "subtitle"', N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\GoiY\GY02.docx', 10),
('C003', 'MD01', N'In đậm từ chữ "Capitalize" đến "subtitle"', N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\GoiY\GY03.docx', 10),
('C004', 'MD01', N'Đổi font chữ từ "Capitalize" đến "subtitle"', N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\GoiY\GY04.docx', 10),
('C005', 'MD01', N'Nội dung của câu C005', N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\GoiY\GY05.docx', 10)


-------- BAILAM
CREATE TABLE BAILAM
(
	MACAU NVARCHAR(10) NOT NULL, -- PRIMARY KEY,
	MADE VARCHAR(10) NOT NULL,
	SBD VARCHAR(10) NOT NULL,
	CAUTRALOI NTEXT NOT NULL
	CONSTRAINT PK_BAILAM PRIMARY KEY( MACAU , MADE, SBD) 
)
INSERT BAILAM (MACAU, MADE, SBD, CAUTRALOI) 
VALUES
('C001', N'MD01', '4501104127', N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\BaiGiai\BG01.docx'),
('C002', N'MD01', '4501104127', N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\BaiGiai\BG02.docx'),
('C003', N'MD01', '4501104127', N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\BaiGiai\BG03.docx'),
('C004', N'MD01', '4501104127', N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\BaiGiai\BG04.docx'),
('C005', N'MD01', '4501104127', N'F:\Study\3rdyrs_1st\C#Windows\MSW\MOS_MockTestSoftware\SignInScreen\Database\BaiGiai\BG05.docx')

CREATE TABLE RSPASS
(
	_MAIL NVARCHAR(50) NOT NULL,
	SBD VARCHAR(10) NOT NULL,-- PRIMARY KEY,
	USERNAME VARCHAR(10) NOT NULL,
	_PASSWORD VARCHAR(20) NOT NULL
	CONSTRAINT PK_RSPASS PRIMARY KEY(_MAIL) 
)
INSERT RSPASS (_MAIL, SBD, USERNAME, _PASSWORD) 
VALUES
('tranthitulinh1305@gmail.com', '4501104127', 'linhttt', '123' ),
('tranthitulinh2811@gmail.com', '4501104218', 'thamvtp', '123' ),
('4501104127@student.hcmue.edu.vn', '4501104276', 'vittp', '123'),
('four.retail28@gmail.com','4501104064','haptt','123'),
('thankgod.peacesky@gmail.com', '4501104276', 'anhntv', '123'),
('tranbaothienan2992', '4501104163', 'nguyenpnh', '123'),
('ductaitailor@gmail.com', '4501104249', 'trangsth', '123')

-- FK_CHAMDIEM_DETHI
ALTER TABLE CHAMDIEM ADD CONSTRAINT FK_CHAMDIEM_DETHI FOREIGN KEY (MADE) REFERENCES DETHI(MADE)
-- FK_CAUHOI_DETHI
ALTER TABLE CAUHOI ADD CONSTRAINT FK_CAUHOI_DETHI FOREIGN KEY (MADE) REFERENCES DETHI(MADE)
-- FK_BAILAM_CAUHOI
ALTER TABLE BAILAM ADD CONSTRAINT FK_BAILAM_CAUHOI FOREIGN KEY (MACAU) REFERENCES CAUHOI(MACAU)
-- FK_BAILAM_DETHI
ALTER TABLE BAILAM ADD CONSTRAINT FK_BAILAM_DETHI FOREIGN KEY (MADE) REFERENCES DETHI(MADE)
-- FK_BAILAM_THISINH
ALTER TABLE BAILAM ADD CONSTRAINT FK_BAILAM_THISINH FOREIGN KEY (SBD) REFERENCES THISINH(SBD)

--ALTER TABLE BAILAM DROP CONSTRAINT FK_BAILAM_THISINH 

SELECT COUNT(*) FROM DETHI

SELECT NOIDUNG FROM CAUHOI

SELECT CAUTRALOI
FROM BAILAM


