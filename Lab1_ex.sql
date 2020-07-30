IF EXISTS (SELECT * FROM sys.databaSes WHERE Name='Example5')
	DROP DATABASE Example5
	GO
	CREATE DATABASE Example5
	GO
	USE Example5
	GO
	--TAO BANG LOP HOC
	CREATE TABLE LopHoc(
	MaLopHoc int PRIMARY KEY IDENTITY,
	TenLopHoc VARCHAR(10)
	)
	GO
	--TAO BANG SINH VIEN CO KHOA NGOAI LA COT MALOHOC<NOIBANG LOPHOC
	CREATE TABLE SinhVien(
	MaSV int PRIMARY KEY,
	TenSV VARCHAR(40),
	MaLopHoc	int,
	CONSTRAINT fk FOREIGN KEY  (MaLopHoc) REFERENCES LopHoc (MaLopHoc)
	)
	GO
	--Tao bang SanPham voi cot NULL,mot cot not null
	CREATE TABLE SanPham(
	MaSP int NOT NUll,
	TenSP VARCHAR(40) NULL
	)
	GO
	--Tao bang voi thuoc tinh default cho cot price
	CREATE TABLE StoreProduct(
	ProductID int NOT  NULL,
	Name varchar(40) NOT NULL,
	Price money NOT NULL DEFAULT (100)
	)
	--Thu kiem tra xem gia tri default co duoc su dung hay khong
	INSERT INTO StoreProduct(ProductID,Name) VALUES (111,Rivets)
	GO
	--Tao bang ContactPhone voi thuoc tinh IDENTITY
	CREATE TABLE ContactPhone(
	Person_ID int IDENTITY(500,1) not null,
	MobileNumber bigint NOT NULL
)
	GO
	--Tạo cột nhận dạng duy nhất tổng thể
	CREATE TABLE CellularPhone(
	Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
	PersonName varchar(60) NOT NULL
	)
	--Chèn một record vào
	INSERT INTO CellularPhone(PersonName) VALUES('William Smith')
	GO
	--Kiểm tra giá trị của cột Person_ID tự động sinh
	SELECT * FROM CellularPhone
	GO
	--Tạo bảng ContactPhone với cột MobileNumber có thuộc tính UNIQUE
	CREATE TABLE ContactPhone (
	Person_ID int PRIMARY KEY,
	MobileNumber bigint UNIQUE,
	ServiceProvider varchar(30),
	LandlineNumber bigint UNIQUE
	)
	--Chèn 2 bản ghi có giá trị giống nhau ở cột MobileNumber và LanlieNumber để quan sát lỗi
	
	INSERT INTO ContactPhone values (101, 983345674, 'Hutch', NULL)
	INSERT INTO ContactPhone values (102, 983345674, 'Alex', NULL)
	GO
	--Tạo bảng PhoneExpenses có một CHECT ở cột Amount
	CREATE TABLE PhoneExpenses (
	Expense_ID int PRIMARY KEY,
	MobileNumber bigint FOREIGN KEY REFERENCES ContactPhone
	(MobileNumber),
	Amount bigint CHECK (Amount >0)
	)
	GO
		--Chỉnh sửa cột trong bảng
	ALTER TABLE ContactPhone
	ALTER COLUMN ServiceProvider varchar(45)
	GO
	--Xóa cột trong bảng
	ALTER TABLE ContactPhone
	DROP COLUMN ServiceProvider
	GO
	---Them một ràng buộc vào bảng
	ALTER TABLE ContactPhone ADD CONSTRAINT CHK_RC CHECK(RentalCharges >0)
	GO
	--Xóa một ràng buộc
	ALTER TABLE Person.ContactPhone
	DROP CONSTRAINT CHK_RC



	


