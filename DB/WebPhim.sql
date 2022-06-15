USE [master]
GO
/****** Object:  Database [WEB_PHIM]    Script Date: 6/11/2022 12:53:31 PM ******/
CREATE DATABASE [WEB_PHIM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WEB_PHIM', FILENAME = N'D:\CAIDAT\Program Files\Microsoft SQL Server\MSSQL11.DUYVOSQLSERVER\MSSQL\DATA\WebPhim.mdf' , SIZE = 122880KB , MAXSIZE = 90971520KB , FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'WEB_PHIM_log', FILENAME = N'D:\CAIDAT\Program Files\Microsoft SQL Server\MSSQL11.DUYVOSQLSERVER\MSSQL\DATA\WebPhim_log.ldf' , SIZE = 5120KB , MAXSIZE = 904832KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [WEB_PHIM] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WEB_PHIM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WEB_PHIM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WEB_PHIM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WEB_PHIM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WEB_PHIM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WEB_PHIM] SET ARITHABORT OFF 
GO
ALTER DATABASE [WEB_PHIM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WEB_PHIM] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WEB_PHIM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WEB_PHIM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WEB_PHIM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WEB_PHIM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WEB_PHIM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WEB_PHIM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WEB_PHIM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WEB_PHIM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WEB_PHIM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WEB_PHIM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WEB_PHIM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WEB_PHIM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WEB_PHIM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WEB_PHIM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WEB_PHIM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WEB_PHIM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WEB_PHIM] SET RECOVERY FULL 
GO
ALTER DATABASE [WEB_PHIM] SET  MULTI_USER 
GO
ALTER DATABASE [WEB_PHIM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WEB_PHIM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WEB_PHIM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WEB_PHIM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WEB_PHIM', N'ON'
GO
USE [WEB_PHIM]
GO
/****** Object:  User [webphim]    Script Date: 6/11/2022 12:53:31 PM ******/
CREATE USER [webphim] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [duyvo]    Script Date: 6/11/2022 12:53:31 PM ******/
CREATE USER [duyvo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [webphim]
GO
ALTER ROLE [db_owner] ADD MEMBER [duyvo]
GO
/****** Object:  StoredProcedure [dbo].[CapNhatAllThongBao]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CapNhatAllThongBao] @id int
as
begin
update DB_THONGBAO set truy_cap = 'true' where id_user = @id
end



GO
/****** Object:  StoredProcedure [dbo].[CapNhatCauHinh]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CapNhatCauHinh] (@ten_web nvarchar (100),@logo_web nvarchar (1000),@thanhtoan_online nvarchar (1000),@email_lh nvarchar (100),@diachi_lh nvarchar (100)
,@sdt_lh nvarchar (100),@lh_fb nvarchar (100),@lh_zalo nvarchar (100),@lh_itg nvarchar (100),@copyright nvarchar (100))
as
begin 
update DB_CAUHINH
set ten_web= @ten_web ,logo_web=@logo_web,thanhtoan_online=@thanhtoan_online ,email_lh=@email_lh,diachi_lh=@diachi_lh,sdt_lh=@sdt_lh,
lh_fb=@lh_fb,lh_zalo=@lh_zalo,lh_itg=@lh_itg,copyright=@copyright
where id_cauhinh=0
end







GO
/****** Object:  StoredProcedure [dbo].[CapNhatCoinUser]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CapNhatCoinUser] (@id_user int ,@coin int)
as
begin 
Update DB_USER 
set coin=@coin 
where id_user=@id_user

end








GO
/****** Object:  StoredProcedure [dbo].[Capnhatnguoidung]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Capnhatnguoidung] (@id_users int,@fullname nvarchar (50),@mail varchar (50),@img_user nvarchar (1000))
as 
begin 
UPDATE DB_USER 
Set fullname=@fullname,mail=@mail,img_user=@img_user
where id_user=@id_users

end










GO
/****** Object:  StoredProcedure [dbo].[CapNhatPhim]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CapNhatPhim](
@id_user int,
@ten_phim nvarchar(250),
@tac_gia nvarchar(250),
@quoc_gia nvarchar(200),
@nam_sx char(10),
@tomtat_phim nvarchar(1500),
@img_phim nvarchar(1000),
@coin_phim char(20),
@link_raw  nvarchar(1000),
@id_phim int
)
as
begin
update DB_PHIM set id_user = @id_user 
, ten_phim =  @ten_phim
, tac_gia = @tac_gia
, quoc_gia = @quoc_gia
, nam_sx = @nam_sx
, tomtat_phim = @tomtat_phim
, img_phim = @img_phim
, coin_phim = @coin_phim
, link_raw = @link_raw  where id_phim = @id_phim
end












GO
/****** Object:  StoredProcedure [dbo].[CapNhatQuyenHan]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CapNhatQuyenHan](
@id_user int,
@quyen int
)
as
begin
update DB_USER set quyen_han = @quyen where id_user = @id_user
end







GO
/****** Object:  StoredProcedure [dbo].[CapnhatTapPhim]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CapnhatTapPhim] (@id_tap_phim int, @id_user int, @ten_tap_phim nvarchar (250), @noidung_tap_phim nvarchar (max))
as
begin

update DB_TAP_PHIM set ten_tap_phim = @ten_tap_phim, noidung_tap_phim = @noidung_tap_phim where id_tap_phim = @id_tap_phim and id_user= @id_user

end











GO
/****** Object:  StoredProcedure [dbo].[CapNhatThuVien]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CapNhatThuVien] (@id_user int,@id_phim int,@id_tap_phim int)
as
begin
update DB_THUVIEN
set id_tap_phim= @id_tap_phim,  updated_at = GETDATE()
where id_user = @id_user and id_phim = @id_phim
end








GO
/****** Object:  StoredProcedure [dbo].[CapNhatThuVienDoc]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CapNhatThuVienDoc] (@id_user int ,@id_phim int,@id_tap_phim int)
as
 begin
 Update DB_THUVIEN
 set id_tap_phim =@id_tap_phim, updated_at = GETDATE()
 where id_phim= @id_phim and id_user = @id_user;
 end









GO
/****** Object:  StoredProcedure [dbo].[DangKyNguoiDung]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DangKyNguoiDung](
@fullname nvarchar(20),
@ten_dangnhap varchar(14),
@mail varchar(50),
@matkhau_user varchar(50),
@ma_khoa varchar(50)
)
as
begin
insert into DB_USER(fullname, ten_dangnhap, mail, matkhau_user, ma_khoa)
values
(@fullname, @ten_dangnhap, @mail, @matkhau_user, @ma_khoa)
end;












GO
/****** Object:  StoredProcedure [dbo].[DelUser]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DelUser] (@id_user int,@quyen_han int)
as
begin
Delete  from DB_USER where id_user= @id_user and quyen_han < @quyen_han;
end







GO
/****** Object:  StoredProcedure [dbo].[LayLuotXem]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LayLuotXem]
as
begin
select  COUNT(id_tap_phim) as sum, id_phim from DB_LUOTXEM group by id_phim ORDER BY COUNT(id_tap_phim) DESC
end


GO
/****** Object:  StoredProcedure [dbo].[LayPhimRand]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LayPhimRand]
as
begin
SELECT TOP 10 * FROM DB_PHIM
ORDER BY NEWID()
end












GO
/****** Object:  StoredProcedure [dbo].[LayPhimTheLoai]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LayPhimTheLoai](
@id_phim int
)
as
begin
select * from DB_THELOAI inner join DB_PHIM_THELOAI on DB_THELOAI.id_theloai = DB_PHIM_THELOAI.id_theloai
where DB_PHIM_THELOAI.id_phim = @id_phim
end












GO
/****** Object:  StoredProcedure [dbo].[LayThongTinBinhLuan]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LayThongTinBinhLuan](
@id_phim int
)
as
begin

if @id_phim = 0
begin
select top 20 DB_USER.id_user,DB_USER.img_user , DB_COMMENT.id_cmt, DB_COMMENT.id_phim ,DB_COMMENT.id_tap_phim, DB_COMMENT.id_phim, DB_USER.fullname, DB_COMMENT.status_, DB_COMMENT.noidung_cmt, DB_COMMENT.created_at  from DB_COMMENT inner join DB_USER on DB_COMMENT.id_user = DB_USER.id_user
where DB_COMMENT.id_phanhoi is NULL order by DB_COMMENT.created_at DESC
end
else
begin
select top 20 DB_USER.id_user, DB_USER.img_user ,DB_COMMENT.id_cmt, DB_COMMENT.id_phim ,DB_COMMENT.id_tap_phim,  DB_USER.fullname, DB_COMMENT.status_, DB_COMMENT.noidung_cmt, DB_COMMENT.created_at  from DB_COMMENT inner join DB_USER on DB_COMMENT.id_user = DB_USER.id_user
where DB_COMMENT.id_phim = @id_phim and DB_COMMENT.id_phanhoi is NULL
order by DB_COMMENT.created_at DESC
end

end













GO
/****** Object:  StoredProcedure [dbo].[LayThongTinBinhLuanTapPhim]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LayThongTinBinhLuanTapPhim](
@id_tap_phim int
)
as
begin


select top 20 DB_USER.id_user, DB_COMMENT.id_cmt, DB_COMMENT.id_phanhoi, DB_COMMENT.id_phim ,DB_COMMENT.id_tap_phim,  DB_USER.fullname, DB_COMMENT.status_, DB_COMMENT.noidung_cmt, DB_COMMENT.created_at, DB_USER.img_user from DB_COMMENT inner join DB_USER on DB_COMMENT.id_user = DB_USER.id_user
where DB_COMMENT.id_tap_phim = @id_tap_phim and DB_COMMENT.id_phanhoi IS NULL
order by DB_COMMENT.created_at DESC
end









GO
/****** Object:  StoredProcedure [dbo].[LayThuVienDoc]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[LayThuVienDoc] (@id_user int)
as
begin
select DB_PHIM.id_user,DB_PHIM.ten_phim,DB_PHIM.link_raw,DB_PHIM.img_phim, DB_THUVIEN.id_phim,DB_THUVIEN.id_tap_phim,DB_THUVIEN.id_thuvien from DB_THUVIEN 
inner join DB_PHIM
on DB_PHIM.id_phim = DB_THUVIEN.id_phim
where DB_THUVIEN.id_user = @id_user ORDER BY DB_THUVIEN.updated_at desc
end








GO
/****** Object:  StoredProcedure [dbo].[Them_cmt]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Them_cmt] (@id_user int ,@id_phim int, @id_tap_phim int,@noidung_cmt nvarchar(300))
as 
begin 
insert into DB_COMMENT (id_user,id_phim,id_tap_phim,noidung_cmt) values (@id_user,@id_phim,@id_tap_phim,@noidung_cmt)
end









GO
/****** Object:  StoredProcedure [dbo].[ThemPhim]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[ThemPhim](
@id_user int,
@ten_phim nvarchar(250),
@tac_gia nvarchar(250),
@quoc_gia nvarchar(200),
@nam_sx char(10),
@tomtat_phim nvarchar(1500),
@img_phim nvarchar(1000),
@coin_phim char(20),
@link_raw  nvarchar(1000)
)
as
begin
if (LEN(@tac_gia) = 0)
print N'Đang cập nhật';

insert into DB_PHIM (id_user, ten_phim, tac_gia, quoc_gia, nam_sx, tomtat_phim, img_phim, coin_phim, link_raw)
values (@id_user, @ten_phim, @tac_gia, @quoc_gia, @nam_sx, @tomtat_phim, @img_phim,@coin_phim, @link_raw)


end







GO
/****** Object:  StoredProcedure [dbo].[ThemPhimTheLoai]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemPhimTheLoai](
@id_phim int,
@id_theloai int
)
as
begin
insert into DB_PHIM_THELOAI(id_phim, id_theloai)
values (@id_phim, @id_theloai)
end












GO
/****** Object:  StoredProcedure [dbo].[ThemTapPhim]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemTapPhim] (@id_phim int, @id_user int, @ten_tap_phim nvarchar(250), @noidung_tap_phim nvarchar(max) )
as
begin

insert into DB_TAP_PHIM(id_phim, id_user, ten_tap_phim, noidung_tap_phim) values (@id_phim,@id_user,@ten_tap_phim,@noidung_tap_phim);
update DB_PHIM set updated_at = getdate() where id_phim = @id_phim
end












GO
/****** Object:  StoredProcedure [dbo].[ThemThuVien]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemThuVien] (@id_user int,@id_phim int,@id_tap_phim int)
as
begin 
insert into DB_THUVIEN (id_user,id_phim,id_tap_phim) values (@id_user,@id_phim,@id_tap_phim)  

end








GO
/****** Object:  StoredProcedure [dbo].[TimKiem]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[TimKiem](
@Data varchar,
@TheLoai varchar
)
as
begin
select  DB_PHIM.ten_phim,DB_PHIM.tac_gia,DB_PHIM.id_phim,DB_PHIM.link_raw,DB_PHIM.img_phim
, DB_THELOAI.ten_theloai  from DB_PHIM inner join DB_PHIM_THELOAI on DB_PHIM.id_phim = DB_PHIM_THELOAI.id_phim inner join DB_THELOAI on DB_THELOAI.id_theloai = DB_PHIM_THELOAI.id_theloai 
where DB_PHIM.ten_phim LIKE '%' + @Data + '%' or DB_THELOAI.ten_theloai LIKE '%' + @TheLoai + '%'
end












GO
/****** Object:  StoredProcedure [dbo].[TimKiemTheoTen]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[TimKiemTheoTen]
(
@TenPhim nvarchar(MAX)
)
as
begin

select *
from DB_PHIM
where ten_phim like N'%' + @TenPhim + '%' or tac_gia like N'%' + @TenPhim + '%' or quoc_gia like N'%' + @TenPhim + '%'or nam_sx like N'%' + @TenPhim + '%'

end














GO
/****** Object:  StoredProcedure [dbo].[TimKiemTheoTheLoai]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TimKiemTheoTheLoai]
(
@data nvarchar(max)
)
as
begin

select * from DB_PHIM where id_phim in (
select id_phim from DB_PHIM_THELOAI where id_theloai  = @data
)

end




GO
/****** Object:  StoredProcedure [dbo].[TimKiemTheoTheLoais]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TimKiemTheoTheLoais]
(
@data nvarchar(max)
)
as
begin

select * from DB_PHIM where id_phim in (
select id_phim from DB_PHIM_THELOAI where id_theloai  in  (select * FROM StringSplit(@data,','))
)

end




GO
/****** Object:  StoredProcedure [dbo].[XoaPhim]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[XoaPhim](
@id_phim int
)
as
begin

delete from DB_PHIM where id_phim = @id_phim;


end












GO
/****** Object:  StoredProcedure [dbo].[XoaPhimTL]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaPhimTL](
@id_phim int
)
as
begin
delete from DB_PHIM_THELOAI where id_phim = @id_phim
end;











GO
/****** Object:  StoredProcedure [dbo].[XoaTapPhim]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[XoaTapPhim] (@id_tap_phim int, @id_user int)
as
begin
update DB_THUVIEN set id_tap_phim = null where id_tap_phim = @id_tap_phim;
delete from DB_TAP_PHIM where id_user = @id_user and id_tap_phim= @id_tap_phim;
end







GO
/****** Object:  StoredProcedure [dbo].[XoaTapPhimAdmin]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[XoaTapPhimAdmin] (@id_tap_phim int)
as
begin
update DB_THUVIEN set id_tap_phim = null where id_tap_phim = @id_tap_phim;
delete from DB_TAP_PHIM where  id_tap_phim= @id_tap_phim;
end







GO
/****** Object:  StoredProcedure [dbo].[XoaThuVien]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[XoaThuVien](
@id_user int,
@id_thuvien int
)
as
begin
delete from DB_THUVIEN where id_thuvien = @id_thuvien and id_user = @id_user
end








GO
/****** Object:  UserDefinedFunction [dbo].[StringSplit]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[StringSplit]
(
    @String  VARCHAR(MAX), @Separator CHAR(1)
)
RETURNS @RESULT TABLE(Value VARCHAR(MAX))
AS
BEGIN     
 DECLARE @SeparatorPosition INT = CHARINDEX(@Separator, @String ),
        @Value VARCHAR(MAX), @StartPosition INT = 1
 
 IF @SeparatorPosition = 0  
  BEGIN
   INSERT INTO @RESULT VALUES(@String)
   RETURN
  END
     
 SET @String = @String + @Separator
 WHILE @SeparatorPosition > 0
  BEGIN
   SET @Value = SUBSTRING(@String , @StartPosition, @SeparatorPosition- @StartPosition)
 
   IF( @Value <> ''  ) 
    INSERT INTO @RESULT VALUES(@Value)
   
   SET @StartPosition = @SeparatorPosition + 1
   SET @SeparatorPosition = CHARINDEX(@Separator, @String , @StartPosition)
  END    
     
 RETURN
END



GO
/****** Object:  Table [dbo].[DB_CAUHINH]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_CAUHINH](
	[id_cauhinh] [int] NOT NULL,
	[ten_web] [nvarchar](100) NULL,
	[logo_web] [nvarchar](1000) NULL,
	[thanhtoan_online] [nvarchar](1000) NULL,
	[email_lh] [nvarchar](100) NULL,
	[diachi_lh] [nvarchar](100) NULL,
	[sdt_lh] [nvarchar](100) NULL,
	[lh_fb] [nvarchar](100) NULL,
	[lh_zalo] [nvarchar](100) NULL,
	[lh_itg] [nvarchar](100) NULL,
	[copyright] [nvarchar](100) NULL,
	[img_404] [nvarchar](1000) NULL,
	[img_nhanvat] [nvarchar](1000) NULL,
	[img_nen] [nvarchar](1000) NULL,
	[img_chu] [nvarchar](1000) NULL,
	[Fb_mess] [nvarchar](max) NULL,
	[Fb_page] [nvarchar](max) NULL,
	[Cm_FB] [nvarchar](max) NULL,
	[event_noel] [nvarchar](1000) NULL,
	[event_tet] [nvarchar](1000) NULL,
	[anh_video] [nvarchar](1000) NULL,
	[video_quangcao] [nvarchar](1000) NULL,
	[Time_Ads] [nchar](10) NULL,
	[updated_at] [datetime] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK__DB_CAUHI__5F1E7193E1259BE4] PRIMARY KEY CLUSTERED 
(
	[id_cauhinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DB_COMMENT]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_COMMENT](
	[id_cmt] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[id_phim] [int] NOT NULL,
	[id_tap_phim] [int] NOT NULL,
	[noidung_cmt] [nvarchar](max) NOT NULL,
	[status_] [int] NOT NULL,
	[id_phanhoi] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK__DB_COMME__D696612FA34781BE] PRIMARY KEY CLUSTERED 
(
	[id_cmt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DB_LOG_COIN]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DB_LOG_COIN](
	[id_log] [int] IDENTITY(1,1) NOT NULL,
	[id_user_nhan] [int] NULL,
	[id_user_chuyen] [int] NULL,
	[coin] [char](20) NULL,
	[ghichu] [nvarchar](1000) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_LogPhim] PRIMARY KEY CLUSTERED 
(
	[id_log] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DB_LUOTXEM]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_LUOTXEM](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NULL,
	[id_phim] [int] NULL,
	[id_tap_phim] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_DB_LUOTXEM] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DB_PHIM]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DB_PHIM](
	[id_phim] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[ten_phim] [nvarchar](250) NOT NULL,
	[tac_gia] [nvarchar](250) NOT NULL,
	[quoc_gia] [nvarchar](200) NULL,
	[nam_sx] [char](10) NULL,
	[tomtat_phim] [nvarchar](max) NOT NULL,
	[link_raw] [nvarchar](200) NULL,
	[status_] [int] NULL,
	[img_phim] [nvarchar](1000) NOT NULL,
	[coin_phim] [char](20) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK__DB_TRUYE__E9EF74F3C65FEEE4] PRIMARY KEY CLUSTERED 
(
	[id_phim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DB_PHIM_THELOAI]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_PHIM_THELOAI](
	[id_phim_theloai] [int] IDENTITY(1,1) NOT NULL,
	[id_phim] [int] NOT NULL,
	[id_theloai] [int] NOT NULL,
	[status_] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK__DB_TRUYE__A7EA5BAFDB197165] PRIMARY KEY CLUSTERED 
(
	[id_phim_theloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DB_TAP_PHIM]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_TAP_PHIM](
	[id_tap_phim] [int] IDENTITY(1,1) NOT NULL,
	[id_phim] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[ten_tap_phim] [nvarchar](250) NOT NULL,
	[noidung_tap_phim] [nvarchar](max) NOT NULL,
	[status_] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK__DB_CHUON__B9DCE8E432F3E3B2] PRIMARY KEY CLUSTERED 
(
	[id_tap_phim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DB_THELOAI]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_THELOAI](
	[id_theloai] [int] IDENTITY(1,1) NOT NULL,
	[ten_theloai] [nvarchar](200) NOT NULL,
	[mota_theloai] [nvarchar](1000) NULL,
	[status_] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK__DB_THELO__80AF8C6EC787253B] PRIMARY KEY CLUSTERED 
(
	[id_theloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DB_THONGBAO]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DB_THONGBAO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[noi_dung] [nvarchar](max) NULL,
	[url] [nvarchar](max) NULL,
	[truy_cap] [char](10) NULL,
	[id_user_phanhoi] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_DB_THONGBAO] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DB_THUVIEN]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_THUVIEN](
	[id_thuvien] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[id_phim] [int] NOT NULL,
	[id_tap_phim] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK__DB_THUVI__514FB55A48EFFBF2] PRIMARY KEY CLUSTERED 
(
	[id_thuvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DB_USER]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DB_USER](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](20) NOT NULL,
	[ten_dangnhap] [varchar](14) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[matkhau_user] [varchar](50) NOT NULL,
	[quyen_han] [varchar](14) NULL,
	[coin] [int] NULL,
	[ma_khoa] [varchar](50) NULL,
	[img_user] [nvarchar](1000) NULL,
	[status_] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK__DB_USER__D2D146377B544414] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DB_VOTE]    Script Date: 6/11/2022 12:53:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DB_VOTE](
	[id_vote] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[id_phim] [int] NOT NULL,
	[giatri] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_vote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[DB_CAUHINH] ([id_cauhinh], [ten_web], [logo_web], [thanhtoan_online], [email_lh], [diachi_lh], [sdt_lh], [lh_fb], [lh_zalo], [lh_itg], [copyright], [img_404], [img_nhanvat], [img_nen], [img_chu], [Fb_mess], [Fb_page], [Cm_FB], [event_noel], [event_tet], [anh_video], [video_quangcao], [Time_Ads], [updated_at], [created_at]) VALUES (0, N'Website Phim KDA', N'614910012.png', N'70831660z3347097734115_eac97980ce115b8c885d664db815ec4d.jpg', N'kdamovie@mail.com', N'Cần thơ', N'01698404880', N'fb.com', N'zalo.com', N'ig.com', N'@2022', N'35553821404page.gif', N'2413160570e259a0cfd92014977351d92cd2a603.gif', N'24131181nennoel.png', N'24133502KDA01.png', N'<!-- Messenger Plugin chat Code --> <div id="fb-root"></div> <!-- Your Plugin chat code --> <div id="fb-customer-chat" class="fb-customerchat"> </div> <script> var chatbox = document.getElementById(''fb-customer-chat''); chatbox.setAttribute("page_id", "100395972506274"); chatbox.setAttribute("attribution", "biz_inbox"); </script> <!-- Your SDK code --> <script> window.fbAsyncInit = function() { FB.init({ xfbml : true, version : ''v14.0'' }); }; (function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) return; js = d.createElement(s); js.id = id; js.src = ''https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js''; fjs.parentNode.insertBefore(js, fjs); }(document, ''script'', ''facebook-jssdk'')); </script>', N'<iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FStudio-KDA-100395972506274&tabs=timeline&width=340&height=150&small_header=true&adapt_container_width=false&hide_cover=false&show_facepile=false&appId=399935675342875" width="340" height="150" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>', N'<div id="fb-root"></div> <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v14.0&appId=399935675342875&autoLogAppEvents=1" nonce="QA2212ep"></script>', N'false', N'true', N'7291logo.png', N'7083welcome.mp4', N'5000      ', NULL, CAST(0x0000AE5401660A20 AS DateTime))
SET IDENTITY_INSERT [dbo].[DB_COMMENT] ON 

INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (2, 2, 6, 32, N'<p>test cm 2</p>
<p>&nbsp;</p>', 0, NULL, CAST(0x0000AE8D018463AC AS DateTime), CAST(0x0000AE8D018463AC AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (3, 2, 6, 32, N'<p>test cm 3</p>', 0, NULL, CAST(0x0000AE8D01846D0C AS DateTime), CAST(0x0000AE8D01846D0C AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (4, 2, 6, 32, N'<p>test cm 4</p>', 0, NULL, CAST(0x0000AE8D01847641 AS DateTime), CAST(0x0000AE8D01847641 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (5, 2, 6, 32, N'<p>test cm 5</p>', 0, NULL, CAST(0x0000AE8D01847F77 AS DateTime), CAST(0x0000AE8D01847F77 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (6, 2, 6, 32, N'<p>test cm 6</p>', 0, NULL, CAST(0x0000AE8D01848AF7 AS DateTime), CAST(0x0000AE8D01848AF7 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (7, 2, 6, 32, N'<p>test cm 7</p>', 0, NULL, CAST(0x0000AE8D018494A2 AS DateTime), CAST(0x0000AE8D018494A2 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (8, 2, 6, 32, N'<p>test cm 8</p>', 0, NULL, CAST(0x0000AE8D01849D21 AS DateTime), CAST(0x0000AE8D01849D21 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (9, 2, 6, 32, N'<p>test cm 9</p>', 0, NULL, CAST(0x0000AE8D0184A698 AS DateTime), CAST(0x0000AE8D0184A698 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (10, 2, 6, 32, N'<p>test cm 10</p>', 0, NULL, CAST(0x0000AE8D0184B03F AS DateTime), CAST(0x0000AE8D0184B03F AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (11, 2, 6, 32, N'<p>.....😝💯</p>', 0, NULL, CAST(0x0000AE8D0184BE5D AS DateTime), CAST(0x0000AE8D0184BE5D AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (14, 2, 6, 32, N'<p>alo 123😍</p>', 0, NULL, CAST(0x0000AE8D0189C0E9 AS DateTime), CAST(0x0000AE8D0189C0E9 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (17, 2013, 5, 12, N'<p>phim hay lam</p>', 0, NULL, CAST(0x0000AE8E00051586 AS DateTime), CAST(0x0000AE8E00051586 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (19, 2, 1, 131, N'<p>tập n&agrave;y hay n&egrave;</p>', 0, NULL, CAST(0x0000AE9700B7A305 AS DateTime), CAST(0x0000AE9700B7A305 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1014, 2, 8, 57, N'<p>m&aacute; m</p>', 0, NULL, CAST(0x0000AE9F00B87A8B AS DateTime), CAST(0x0000AE9F00B87A8B AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1015, 2, 6, 32, N'<p>alo</p>
<p>&nbsp;</p>', 0, NULL, CAST(0x0000AE9F00E5A754 AS DateTime), CAST(0x0000AE9F00E5A754 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1016, 2, 1004, 1008, N'<p>alo alo</p>', 0, NULL, CAST(0x0000AE9F00FF86FC AS DateTime), CAST(0x0000AE9F00FF86FC AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1018, 2013, 5, 12, N'<p>m&aacute;</p>', 1, NULL, CAST(0x0000AE9F0185C3D2 AS DateTime), CAST(0x0000AE9F0185C3D2 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1019, 2013, 5, 12, N'<p>địt m&aacute;</p>
<p>&nbsp;</p>', 0, NULL, CAST(0x0000AE9F0185D02E AS DateTime), CAST(0x0000AE9F0185D02E AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1020, 2013, 5, 12, N'<p>wần w&egrave;</p>', 0, NULL, CAST(0x0000AE9F01865C5B AS DateTime), CAST(0x0000AE9F01865C5B AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1021, 2013, 5, 12, N'<p>m&aacute; em l&agrave; 1 người n&ocirc;ng d&acirc;n</p>', 0, NULL, CAST(0x0000AEA00000AC58 AS DateTime), CAST(0x0000AEA00000AC58 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1022, 2013, 5, 12, N'<p>lol</p>
<p>&nbsp;</p>', 1, NULL, CAST(0x0000AEA000069C92 AS DateTime), CAST(0x0000AEA000069C92 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1023, 2013, 5, 12, N'<p>quần qu&egrave;</p>', 0, NULL, CAST(0x0000AEA000081E10 AS DateTime), CAST(0x0000AEA000081E10 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1024, 2013, 5, 12, N'<p>quần qu&egrave;</p>', 0, NULL, CAST(0x0000AEA0000835DA AS DateTime), CAST(0x0000AEA0000835DA AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1025, 2013, 7, 60, N'<p>alo</p>
<p>&nbsp;</p>', 0, NULL, CAST(0x0000AEA000104200 AS DateTime), CAST(0x0000AEA000104200 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1026, 3014, 5, 12, N'<p>thằng đăng thể loại phim sida qu&aacute;</p>', 1, NULL, CAST(0x0000AEA000E963B4 AS DateTime), CAST(0x0000AEA000E963B4 AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1027, 2, 5, 12, N'<p>alo</p>', 0, NULL, CAST(0x0000AEA0010FD5CE AS DateTime), CAST(0x0000AEA0010FD5CE AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1032, 1013, 4, 8, N'<p>b&acirc;y giờ mới c&oacute; phần 4 đợi m&atilde;i</p> <p>&nbsp;</p>', 0, NULL, CAST(0x0000AEA100A15F2A AS DateTime), CAST(0x0000AEA100A15F2A AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (1033, 2, 1007, 1012, N'<p>Kết buồn 2đ</p>', 0, NULL, CAST(0x0000AEA301791B5B AS DateTime), CAST(0x0000AEA301791B5B AS DateTime))
INSERT [dbo].[DB_COMMENT] ([id_cmt], [id_user], [id_phim], [id_tap_phim], [noidung_cmt], [status_], [id_phanhoi], [created_at], [updated_at]) VALUES (2033, 3015, 2013, 2039, N'<p>Chất lượng ổn, kết ổn 😐</p>', 0, NULL, CAST(0x0000AEA700EA695A AS DateTime), CAST(0x0000AEA700EA695A AS DateTime))
SET IDENTITY_INSERT [dbo].[DB_COMMENT] OFF
SET IDENTITY_INSERT [dbo].[DB_LOG_COIN] ON 

INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (1229, 2, 2, N'131313              ', N'duy võ_Nap_Coin_duy võ', CAST(0x0000AEA200B2A632 AS DateTime), CAST(0x0000AEA200B2A633 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (1230, 2, 0, N'2                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA200B2C3D4 AS DateTime), CAST(0x0000AEA200B2C3D4 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (1231, 2, 2, N'-4242               ', N'duy võ_Giam_Coin_duy võ', CAST(0x0000AEA200B2D0A6 AS DateTime), CAST(0x0000AEA200B2D0A6 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (1232, 2, 0, N'5                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA2010EC447 AS DateTime), CAST(0x0000AEA2010EC447 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (1233, 2, 0, N'5                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA3015A39ED AS DateTime), CAST(0x0000AEA3015A39ED AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (1234, 2, 0, N'9                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA301674CC4 AS DateTime), CAST(0x0000AEA301674CC4 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (1235, 2, 0, N'8                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA30172D620 AS DateTime), CAST(0x0000AEA30172D620 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2235, 2, 0, N'9                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA500C76EB0 AS DateTime), CAST(0x0000AEA500C76EB0 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2236, 2, 0, N'9                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA500C85DBB AS DateTime), CAST(0x0000AEA500C85DBB AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2237, 2, 0, N'8                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA5010A1726 AS DateTime), CAST(0x0000AEA5010A1726 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2238, 2, 0, N'8                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA5010A98FD AS DateTime), CAST(0x0000AEA5010A98FD AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2239, 2, 0, N'7                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA5012BEFDA AS DateTime), CAST(0x0000AEA5012BEFDA AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2240, 2, 0, N'9                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA601021234 AS DateTime), CAST(0x0000AEA601021234 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2241, 2, 0, N'4                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA700C251F6 AS DateTime), CAST(0x0000AEA700C251F6 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2242, 2, 0, N'4                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA700DC174E AS DateTime), CAST(0x0000AEA700DC174E AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2243, 2, 0, N'9                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEA700E12D3D AS DateTime), CAST(0x0000AEA700E12D3D AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2244, 3015, 0, N'9                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA700EA26AA AS DateTime), CAST(0x0000AEA700EA26AA AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2245, 2, 3015, N'0                   ', N'Mua_Phim_Mahouka Koukou No Rettousei 2', CAST(0x0000AEA700EB77D1 AS DateTime), CAST(0x0000AEA700EB77D1 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2246, 3015, 0, N'3                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA700F36612 AS DateTime), CAST(0x0000AEA700F36612 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2247, 3015, 0, N'9                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA700F3844C AS DateTime), CAST(0x0000AEA700F3844C AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2248, 3015, 0, N'3                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA700F397A7 AS DateTime), CAST(0x0000AEA700F397A7 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2249, 3015, 0, N'9                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA700F3C3F2 AS DateTime), CAST(0x0000AEA700F3C3F2 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2250, 3015, 0, N'4                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA700F3D6EF AS DateTime), CAST(0x0000AEA700F3D6EF AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2251, 3015, 0, N'1                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA700F3E752 AS DateTime), CAST(0x0000AEA700F3E752 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2252, 3015, 0, N'3                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA700F3FD9F AS DateTime), CAST(0x0000AEA700F3FD9F AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2253, 3015, 0, N'9                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA700F4240E AS DateTime), CAST(0x0000AEA700F4240E AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2254, 3015, 0, N'7                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA700F441F5 AS DateTime), CAST(0x0000AEA700F441F5 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2255, 2, 3015, N'10                  ', N'Mua_Phim_ẤU TRÙNG TINH NGHỊCH: MẶT DÂY CHUYỀN', CAST(0x0000AEA701453B69 AS DateTime), CAST(0x0000AEA701453B69 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2256, 3015, 0, N'0                   ', N'Khuyen_Mai_Mua_Phim_ẤU TRÙNG TINH NGHỊCH: MẶT DÂY CHUYỀN', CAST(0x0000AEA701453B72 AS DateTime), CAST(0x0000AEA701453B72 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2257, 2, 3015, N'7                   ', N'Mua_Phim_Phu Quân Phản Diện Của Ta Vietsub, Wo De Fan Pai Fu Jun (2022)', CAST(0x0000AEA7017FA001 AS DateTime), CAST(0x0000AEA7017FA001 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2258, 2, 3015, N'3                   ', N'Mua_Phim_Cảnh Sát Tập Sự - Midnight Runners', CAST(0x0000AEA7017FB4AD AS DateTime), CAST(0x0000AEA7017FB4AD AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2259, 2, 3015, N'10                  ', N'Mua_Phim_ẤU TRÙNG TINH NGHỊCH: MẶT DÂY CHUYỀN', CAST(0x0000AEA800B15FBE AS DateTime), CAST(0x0000AEA800B15FBE AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2260, 3015, 0, N'9                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA800B1761A AS DateTime), CAST(0x0000AEA800B1761A AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2261, 3015, 0, N'8                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA800B23B11 AS DateTime), CAST(0x0000AEA800B23B11 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2262, 3015, 0, N'4                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA800B3EDE2 AS DateTime), CAST(0x0000AEA800B3EDE2 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2263, 3015, 0, N'6                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA800B4967C AS DateTime), CAST(0x0000AEA800B4967C AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2264, 2, 3015, N'7                   ', N'Mua_Phim_Phu Quân Phản Diện Của Ta Vietsub, Wo De Fan Pai Fu Jun (2022)', CAST(0x0000AEA800B523D3 AS DateTime), CAST(0x0000AEA800B523D3 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2265, 2, 3015, N'7                   ', N'Mua_Phim_Phu Quân Phản Diện Của Ta Vietsub, Wo De Fan Pai Fu Jun (2022)', CAST(0x0000AEA800B62F17 AS DateTime), CAST(0x0000AEA800B62F17 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2266, 3015, 2, N'100                 ', N'duy võ_Nap_Coin_duyvo26', CAST(0x0000AEA801560154 AS DateTime), CAST(0x0000AEA801560154 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2267, 2, 3015, N'6                   ', N'Mua_Phim_NHỮNG KẺ NGUYỀN RỦA', CAST(0x0000AEA8015625D2 AS DateTime), CAST(0x0000AEA8015625D2 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2268, 3015, 0, N'0                   ', N'Khuyen_Mai_Mua_Phim_NHỮNG KẺ NGUYỀN RỦA', CAST(0x0000AEA8015625D7 AS DateTime), CAST(0x0000AEA8015625D7 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2269, 2, 3015, N'6                   ', N'Mua_Phim_NHỮNG KẺ NGUYỀN RỦA', CAST(0x0000AEA90094C338 AS DateTime), CAST(0x0000AEA90094C338 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2270, 3015, 0, N'0                   ', N'Khuyen_Mai_Mua_Phim_NHỮNG KẺ NGUYỀN RỦA', CAST(0x0000AEA90094C341 AS DateTime), CAST(0x0000AEA90094C341 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2271, 3015, 0, N'3                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA90094DD00 AS DateTime), CAST(0x0000AEA90094DD00 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2272, 3015, 0, N'7                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA900955E37 AS DateTime), CAST(0x0000AEA900955E37 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2273, 3015, 0, N'9                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEA9009B3800 AS DateTime), CAST(0x0000AEA9009B3800 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2274, 2, 0, N'4                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEAA00ADC577 AS DateTime), CAST(0x0000AEAA00ADC577 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2275, 2, 0, N'4                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEAA01172BA4 AS DateTime), CAST(0x0000AEAA01172BA4 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2276, 3015, 0, N'1                   ', N'_Nhan_Coin_Xem_Phim_duyvo26', CAST(0x0000AEAB00525112 AS DateTime), CAST(0x0000AEAB00525112 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2277, 2, 0, N'8                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEAA0132E62B AS DateTime), CAST(0x0000AEAA0132E62B AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2278, 2, 0, N'3                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEAB006B5D9F AS DateTime), CAST(0x0000AEAB006B5D9F AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2279, 2, 0, N'5                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEAB0128E00B AS DateTime), CAST(0x0000AEAB0128E00B AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2280, 2, 0, N'1                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEAD013C9B2F AS DateTime), CAST(0x0000AEAD013C9B2F AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2281, 2, 0, N'5                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEAD013D1D5F AS DateTime), CAST(0x0000AEAD013D1D5F AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2282, 2, 0, N'4                   ', N'_Nhan_Coin_Xem_Phim_duy võ', CAST(0x0000AEAE00AAB313 AS DateTime), CAST(0x0000AEAE00AAB313 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2283, 1013, 0, N'8                   ', N'_Nhan_Coin_Xem_Phim_Elite Shion', CAST(0x0000AEAE01870967 AS DateTime), CAST(0x0000AEAE01870967 AS DateTime))
INSERT [dbo].[DB_LOG_COIN] ([id_log], [id_user_nhan], [id_user_chuyen], [coin], [ghichu], [created_at], [updated_at]) VALUES (2284, 1013, 0, N'7                   ', N'_Nhan_Coin_Xem_Phim_Elite Shion', CAST(0x0000AEAF00206596 AS DateTime), CAST(0x0000AEAF00206596 AS DateTime))
SET IDENTITY_INSERT [dbo].[DB_LOG_COIN] OFF
SET IDENTITY_INSERT [dbo].[DB_LUOTXEM] ON 

INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1, NULL, 1, 1, CAST(0x0000AE88016541AF AS DateTime), CAST(0x0000AE88016541B0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2, NULL, 1, 1, CAST(0x0000AE88016544BB AS DateTime), CAST(0x0000AE88016544BB AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3, NULL, 1, 1, CAST(0x0000AE8801655B10 AS DateTime), CAST(0x0000AE8801655B10 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (4, 2, 1, 1, CAST(0x0000AE8801655D0F AS DateTime), CAST(0x0000AE8801655D0F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (5, NULL, 1, 1, CAST(0x0000AE8801655D39 AS DateTime), CAST(0x0000AE8801655D39 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (6, NULL, 1, 1, CAST(0x0000AE8801655FD3 AS DateTime), CAST(0x0000AE8801655FD3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (7, NULL, 1, 1, CAST(0x0000AE8801656214 AS DateTime), CAST(0x0000AE8801656214 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (8, NULL, 1, 1, CAST(0x0000AE880168FB7B AS DateTime), CAST(0x0000AE880168FB7B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (9, NULL, 1, 1, CAST(0x0000AE8801690068 AS DateTime), CAST(0x0000AE8801690068 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (10, NULL, 1, 1, CAST(0x0000AE88016902BC AS DateTime), CAST(0x0000AE88016902BC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (11, NULL, 1, 1, CAST(0x0000AE89001AE374 AS DateTime), CAST(0x0000AE89001AE374 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (12, 2, 1, 2, CAST(0x0000AE89001B1E37 AS DateTime), CAST(0x0000AE89001B1E37 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (13, NULL, 1, 2, CAST(0x0000AE89001B1E40 AS DateTime), CAST(0x0000AE89001B1E40 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (14, NULL, 1, 2, CAST(0x0000AE89001B209D AS DateTime), CAST(0x0000AE89001B209D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (15, 2, 1, 3, CAST(0x0000AE89001B8DC7 AS DateTime), CAST(0x0000AE89001B8DC7 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1011, NULL, 1, 1, CAST(0x0000AE8901533433 AS DateTime), CAST(0x0000AE8901533433 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1012, NULL, 1, 1, CAST(0x0000AE89015337E2 AS DateTime), CAST(0x0000AE89015337E2 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1013, NULL, 1, 2, CAST(0x0000AE890171C8D8 AS DateTime), CAST(0x0000AE890171C8D8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1014, NULL, 1, 3, CAST(0x0000AE890171D24F AS DateTime), CAST(0x0000AE890171D24F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1015, NULL, 1, 3, CAST(0x0000AE890171D478 AS DateTime), CAST(0x0000AE890171D478 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1016, NULL, 2, 7, CAST(0x0000AE8A00F4EBB3 AS DateTime), CAST(0x0000AE8A00F4EBB4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1017, NULL, 2, 7, CAST(0x0000AE8A00F4EE92 AS DateTime), CAST(0x0000AE8A00F4EE92 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1018, 2, 2, 7, CAST(0x0000AE8A00F5222C AS DateTime), CAST(0x0000AE8A00F5222C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1019, NULL, 4, 9, CAST(0x0000AE8C01646C29 AS DateTime), CAST(0x0000AE8C01646C32 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1020, NULL, 4, 9, CAST(0x0000AE8C01646ED5 AS DateTime), CAST(0x0000AE8C01646ED5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1021, 2, 4, 9, CAST(0x0000AE8C01649099 AS DateTime), CAST(0x0000AE8C01649099 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1022, NULL, 4, 11, CAST(0x0000AE8C016493B1 AS DateTime), CAST(0x0000AE8C016493B1 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1023, NULL, 4, 11, CAST(0x0000AE8C016495D1 AS DateTime), CAST(0x0000AE8C016495D1 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1024, NULL, 6, 33, CAST(0x0000AE8D015A3F05 AS DateTime), CAST(0x0000AE8D015A3F05 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1025, NULL, 6, 33, CAST(0x0000AE8D015A42B7 AS DateTime), CAST(0x0000AE8D015A42B7 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1026, NULL, 6, 32, CAST(0x0000AE8D015A9158 AS DateTime), CAST(0x0000AE8D015A9158 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1027, NULL, 6, 32, CAST(0x0000AE8D015A93CC AS DateTime), CAST(0x0000AE8D015A93CC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1028, 2, 6, 32, CAST(0x0000AE8D015AB1EF AS DateTime), CAST(0x0000AE8D015AB1EF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1029, NULL, 6, 32, CAST(0x0000AE8D017DD2D0 AS DateTime), CAST(0x0000AE8D017DD2D0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1030, 2013, 5, 12, CAST(0x0000AE8E00051C51 AS DateTime), CAST(0x0000AE8E00051C51 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1031, 2013, 5, 13, CAST(0x0000AE8E00055987 AS DateTime), CAST(0x0000AE8E00055987 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1032, 2013, 5, 14, CAST(0x0000AE8E0006153B AS DateTime), CAST(0x0000AE8E0006153B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1033, NULL, 1, 1, CAST(0x0000AE8E00072D8C AS DateTime), CAST(0x0000AE8E00072D8C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1034, 2013, 5, 16, CAST(0x0000AE8E0008AFA9 AS DateTime), CAST(0x0000AE8E0008AFA9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1035, 2013, 5, 26, CAST(0x0000AE8E00091496 AS DateTime), CAST(0x0000AE8E00091496 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1036, 2, 5, 13, CAST(0x0000AE8E000ACC3B AS DateTime), CAST(0x0000AE8E000ACC3B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1037, 2013, 5, 46, CAST(0x0000AE8E000AF2CE AS DateTime), CAST(0x0000AE8E000AF2CE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1038, 2013, 1, 2, CAST(0x0000AE8E000C4F5D AS DateTime), CAST(0x0000AE8E000C4F5D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1039, 2013, 1, 1, CAST(0x0000AE8E000C53E8 AS DateTime), CAST(0x0000AE8E000C53E8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1040, 2013, 6, 32, CAST(0x0000AE8E000CA2FD AS DateTime), CAST(0x0000AE8E000CA2FD AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1041, 2013, 6, 45, CAST(0x0000AE8E000CD8FC AS DateTime), CAST(0x0000AE8E000CD8FC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1042, 2013, 6, 33, CAST(0x0000AE8E000CDC85 AS DateTime), CAST(0x0000AE8E000CDC85 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1043, 2, 6, 45, CAST(0x0000AE8E000F637D AS DateTime), CAST(0x0000AE8E000F637D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1044, 2, 7, 52, CAST(0x0000AE8E0012C9EA AS DateTime), CAST(0x0000AE8E0012C9EA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1045, 2, 5, 47, CAST(0x0000AE8E00151C16 AS DateTime), CAST(0x0000AE8E00151C16 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1046, 2, 5, 49, CAST(0x0000AE8E00152F39 AS DateTime), CAST(0x0000AE8E00152F39 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1047, 2, 5, 53, CAST(0x0000AE8E001533A3 AS DateTime), CAST(0x0000AE8E001533A3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1048, 2, 5, 14, CAST(0x0000AE8E0016C24F AS DateTime), CAST(0x0000AE8E0016C24F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1049, 2, 5, 15, CAST(0x0000AE8E001701FF AS DateTime), CAST(0x0000AE8E001701FF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1050, 2, 6, 33, CAST(0x0000AE8E01274E46 AS DateTime), CAST(0x0000AE8E01274E46 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1051, 2, 6, 41, CAST(0x0000AE8E012762DB AS DateTime), CAST(0x0000AE8E012762DB AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1052, 2, 6, 34, CAST(0x0000AE8E01280325 AS DateTime), CAST(0x0000AE8E01280325 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1053, 2, 8, 57, CAST(0x0000AE8E01282819 AS DateTime), CAST(0x0000AE8E01282819 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1054, 2, 4, 59, CAST(0x0000AE8E01283F68 AS DateTime), CAST(0x0000AE8E01283F68 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1055, 2013, 4, 9, CAST(0x0000AE8E0128A207 AS DateTime), CAST(0x0000AE8E0128A207 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1056, 2013, 4, 10, CAST(0x0000AE8E0128C4D1 AS DateTime), CAST(0x0000AE8E0128C4D1 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1057, 2013, 4, 8, CAST(0x0000AE8E0128D9B6 AS DateTime), CAST(0x0000AE8E0128D9B6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1058, NULL, 4, 8, CAST(0x0000AE8E012FEDF7 AS DateTime), CAST(0x0000AE8E012FEDF7 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1059, NULL, 4, 59, CAST(0x0000AE8E012FFC99 AS DateTime), CAST(0x0000AE8E012FFC99 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1060, 2, 7, 60, CAST(0x0000AE8E017D93D5 AS DateTime), CAST(0x0000AE8E017D93D5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1061, NULL, 7, 60, CAST(0x0000AE8E017F4956 AS DateTime), CAST(0x0000AE8E017F4956 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1062, 2, 5, 12, CAST(0x0000AE8F0117DD1B AS DateTime), CAST(0x0000AE8F0117DD1B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1063, 2, 5, 16, CAST(0x0000AE8F01250885 AS DateTime), CAST(0x0000AE8F01250885 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1064, 2, 5, 17, CAST(0x0000AE8F01263CAF AS DateTime), CAST(0x0000AE8F01263CAF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1065, 2, 5, 18, CAST(0x0000AE8F012769D2 AS DateTime), CAST(0x0000AE8F012769D2 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1066, 2, 5, 19, CAST(0x0000AE8F0127CD73 AS DateTime), CAST(0x0000AE8F0127CD73 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1067, 2, 5, 20, CAST(0x0000AE8F012B2D38 AS DateTime), CAST(0x0000AE8F012B2D38 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1068, 2, 5, 21, CAST(0x0000AE8F012C3A5E AS DateTime), CAST(0x0000AE8F012C3A5E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1069, 2, 5, 22, CAST(0x0000AE8F012D96A7 AS DateTime), CAST(0x0000AE8F012D96A7 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1070, 2, 5, 23, CAST(0x0000AE8F012ECB96 AS DateTime), CAST(0x0000AE8F012ECB96 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1071, 2, 5, 24, CAST(0x0000AE8F013003AC AS DateTime), CAST(0x0000AE8F013003AC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1072, 2, 5, 25, CAST(0x0000AE8F01322110 AS DateTime), CAST(0x0000AE8F01322110 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1073, 2, 5, 26, CAST(0x0000AE8F0138C06B AS DateTime), CAST(0x0000AE8F0138C06B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1074, 2, 5, 27, CAST(0x0000AE8F01407FFC AS DateTime), CAST(0x0000AE8F01407FFC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1075, 2, 5, 28, CAST(0x0000AE8F0144FE53 AS DateTime), CAST(0x0000AE8F0144FE53 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1076, 2, 5, 29, CAST(0x0000AE8F01463775 AS DateTime), CAST(0x0000AE8F01463775 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1077, 2, 5, 31, CAST(0x0000AE8F0146B901 AS DateTime), CAST(0x0000AE8F0146B901 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1078, 2, 5, 46, CAST(0x0000AE8F0146E16B AS DateTime), CAST(0x0000AE8F0146E16B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1079, 2, 5, 48, CAST(0x0000AE8F01486E35 AS DateTime), CAST(0x0000AE8F01486E35 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1080, NULL, 3, 5, CAST(0x0000AE90003B2020 AS DateTime), CAST(0x0000AE90003B2020 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1081, NULL, 7, 52, CAST(0x0000AE9000486F8C AS DateTime), CAST(0x0000AE9000486F8C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1082, NULL, 7, 60, CAST(0x0000AE90004B5B7B AS DateTime), CAST(0x0000AE90004B5B7B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1083, NULL, 2, 7, CAST(0x0000AE900063DE3B AS DateTime), CAST(0x0000AE900063DE3B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1084, NULL, 2, 7, CAST(0x0000AE900083B543 AS DateTime), CAST(0x0000AE900083B543 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1085, NULL, 3, 5, CAST(0x0000AE90008D6259 AS DateTime), CAST(0x0000AE90008D6259 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1086, NULL, 7, 52, CAST(0x0000AE900091E34A AS DateTime), CAST(0x0000AE900091E34A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1087, NULL, 7, 60, CAST(0x0000AE900095097C AS DateTime), CAST(0x0000AE900095097C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1088, NULL, 8, 54, CAST(0x0000AE9000A31887 AS DateTime), CAST(0x0000AE9000A31887 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1089, NULL, 8, 55, CAST(0x0000AE9000A65DC7 AS DateTime), CAST(0x0000AE9000A65DC7 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1090, NULL, 8, 56, CAST(0x0000AE9000A978C4 AS DateTime), CAST(0x0000AE9000A978C4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1091, NULL, 8, 57, CAST(0x0000AE9000ABE3EC AS DateTime), CAST(0x0000AE9000ABE3EC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1092, NULL, 8, 58, CAST(0x0000AE9000AE352A AS DateTime), CAST(0x0000AE9000AE352A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1093, NULL, 1, 1, CAST(0x0000AE9000C052AA AS DateTime), CAST(0x0000AE9000C052AA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1094, NULL, 1, 2, CAST(0x0000AE9000C3A75F AS DateTime), CAST(0x0000AE9000C3A75F AS DateTime))
GO
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1095, NULL, 1, 3, CAST(0x0000AE9000C6B6FB AS DateTime), CAST(0x0000AE9000C6B6FB AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1096, NULL, 1, 4, CAST(0x0000AE9000C9B499 AS DateTime), CAST(0x0000AE9000C9B499 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1097, NULL, 8, 54, CAST(0x0000AE9000DB4EA9 AS DateTime), CAST(0x0000AE9000DB4EA9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1098, NULL, 8, 55, CAST(0x0000AE9000DEA34A AS DateTime), CAST(0x0000AE9000DEA34A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1099, NULL, 8, 56, CAST(0x0000AE9000E14BD2 AS DateTime), CAST(0x0000AE9000E14BD2 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1100, NULL, 8, 57, CAST(0x0000AE9000E3AB41 AS DateTime), CAST(0x0000AE9000E3AB41 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1101, NULL, 8, 58, CAST(0x0000AE9000E4E33B AS DateTime), CAST(0x0000AE9000E4E33B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1102, NULL, 1, 1, CAST(0x0000AE9000E638AA AS DateTime), CAST(0x0000AE9000E638AA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1103, NULL, 1, 61, CAST(0x0000AE9000EBB4BE AS DateTime), CAST(0x0000AE9000EBB4BE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1104, NULL, 4, 10, CAST(0x0000AE9000F5D438 AS DateTime), CAST(0x0000AE9000F5D438 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1105, NULL, 4, 11, CAST(0x0000AE9000F89E2B AS DateTime), CAST(0x0000AE9000F89E2B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1106, NULL, 4, 59, CAST(0x0000AE9000FB6983 AS DateTime), CAST(0x0000AE9000FB6983 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1107, NULL, 4, 8, CAST(0x0000AE9000FE3ABF AS DateTime), CAST(0x0000AE9000FE3ABF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1108, NULL, 4, 9, CAST(0x0000AE900101354A AS DateTime), CAST(0x0000AE900101354A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1109, NULL, 5, 12, CAST(0x0000AE900116CA1B AS DateTime), CAST(0x0000AE900116CA1B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1110, NULL, 1, 4, CAST(0x0000AE900118F5BC AS DateTime), CAST(0x0000AE900118F5BC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1111, NULL, 1, 61, CAST(0x0000AE90011B076C AS DateTime), CAST(0x0000AE90011B076C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1112, NULL, 1, 2, CAST(0x0000AE90011D3200 AS DateTime), CAST(0x0000AE90011D3200 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1113, NULL, 1, 3, CAST(0x0000AE90011F7C8F AS DateTime), CAST(0x0000AE90011F7C8F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1114, NULL, 6, 32, CAST(0x0000AE90012188DD AS DateTime), CAST(0x0000AE90012188DD AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1115, NULL, 6, 33, CAST(0x0000AE900123C971 AS DateTime), CAST(0x0000AE900123C971 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1116, NULL, 6, 34, CAST(0x0000AE9001261FEC AS DateTime), CAST(0x0000AE9001261FEC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1117, NULL, 6, 35, CAST(0x0000AE9001282EA5 AS DateTime), CAST(0x0000AE9001282EA5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1118, NULL, 6, 36, CAST(0x0000AE90012A0A1F AS DateTime), CAST(0x0000AE90012A0A1F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1119, NULL, 6, 37, CAST(0x0000AE90012BC52B AS DateTime), CAST(0x0000AE90012BC52B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1120, NULL, 6, 38, CAST(0x0000AE90012CB4F1 AS DateTime), CAST(0x0000AE90012CB4F1 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1121, NULL, 6, 39, CAST(0x0000AE90012DAB8D AS DateTime), CAST(0x0000AE90012DAB8D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1122, NULL, 6, 40, CAST(0x0000AE90012EA4D4 AS DateTime), CAST(0x0000AE90012EA4D4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1123, NULL, 6, 45, CAST(0x0000AE90012FA829 AS DateTime), CAST(0x0000AE90012FA829 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1124, NULL, 7, 52, CAST(0x0000AE9001387048 AS DateTime), CAST(0x0000AE9001387048 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1125, NULL, 5, 12, CAST(0x0000AE9001398503 AS DateTime), CAST(0x0000AE9001398503 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1126, NULL, 5, 13, CAST(0x0000AE90013A9427 AS DateTime), CAST(0x0000AE90013A9427 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1127, NULL, 5, 14, CAST(0x0000AE90013B9980 AS DateTime), CAST(0x0000AE90013B9980 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1128, NULL, 5, 15, CAST(0x0000AE90013C96F9 AS DateTime), CAST(0x0000AE90013C96F9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1129, NULL, 5, 16, CAST(0x0000AE90013DA3CF AS DateTime), CAST(0x0000AE90013DA3CF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1130, NULL, 5, 17, CAST(0x0000AE90013EC8CF AS DateTime), CAST(0x0000AE90013EC8CF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1131, NULL, 5, 18, CAST(0x0000AE90013FCEB0 AS DateTime), CAST(0x0000AE90013FCEB0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1132, NULL, 5, 19, CAST(0x0000AE900140DF01 AS DateTime), CAST(0x0000AE900140DF01 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1133, NULL, 5, 20, CAST(0x0000AE900141F1EF AS DateTime), CAST(0x0000AE900141F1EF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1134, NULL, 5, 21, CAST(0x0000AE9001430211 AS DateTime), CAST(0x0000AE9001430211 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1135, NULL, 6, 41, CAST(0x0000AE9001640A28 AS DateTime), CAST(0x0000AE9001640A28 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1136, NULL, 6, 42, CAST(0x0000AE900165EE8B AS DateTime), CAST(0x0000AE900165EE8B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1137, NULL, 6, 43, CAST(0x0000AE90016793C2 AS DateTime), CAST(0x0000AE90016793C2 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1138, NULL, 6, 44, CAST(0x0000AE900169727D AS DateTime), CAST(0x0000AE900169727D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1139, NULL, 7, 52, CAST(0x0000AE9001792CD9 AS DateTime), CAST(0x0000AE9001792CD9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1140, NULL, 5, 12, CAST(0x0000AE90017B189D AS DateTime), CAST(0x0000AE90017B189D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1141, NULL, 4, 10, CAST(0x0000AE90017CE4DE AS DateTime), CAST(0x0000AE90017CE4DE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1142, NULL, 4, 11, CAST(0x0000AE90017EEF52 AS DateTime), CAST(0x0000AE90017EEF52 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1143, NULL, 4, 59, CAST(0x0000AE9001816889 AS DateTime), CAST(0x0000AE9001816889 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1144, NULL, 4, 8, CAST(0x0000AE9001838D8F AS DateTime), CAST(0x0000AE9001838D8F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1145, NULL, 4, 9, CAST(0x0000AE9001865481 AS DateTime), CAST(0x0000AE9001865481 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1146, NULL, 6, 33, CAST(0x0000AE9001888DF2 AS DateTime), CAST(0x0000AE9001888DF2 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1147, NULL, 6, 34, CAST(0x0000AE90018AE731 AS DateTime), CAST(0x0000AE90018AE731 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1148, NULL, 6, 35, CAST(0x0000AE9100017C14 AS DateTime), CAST(0x0000AE9100017C14 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1149, NULL, 6, 36, CAST(0x0000AE91000402D8 AS DateTime), CAST(0x0000AE91000402D8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1150, NULL, 6, 37, CAST(0x0000AE910005FCE0 AS DateTime), CAST(0x0000AE910005FCE0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1151, NULL, 6, 38, CAST(0x0000AE9100082748 AS DateTime), CAST(0x0000AE9100082748 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1152, NULL, 6, 39, CAST(0x0000AE91000A3B18 AS DateTime), CAST(0x0000AE91000A3B18 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1153, NULL, 5, 47, CAST(0x0000AE91000F96B3 AS DateTime), CAST(0x0000AE91000F96B3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1154, NULL, 5, 48, CAST(0x0000AE910010F5EA AS DateTime), CAST(0x0000AE910010F5EA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1155, NULL, 5, 49, CAST(0x0000AE910012062C AS DateTime), CAST(0x0000AE910012062C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1156, NULL, 5, 50, CAST(0x0000AE910013218C AS DateTime), CAST(0x0000AE910013218C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1157, NULL, 5, 51, CAST(0x0000AE9100148105 AS DateTime), CAST(0x0000AE9100148105 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1158, NULL, 5, 53, CAST(0x0000AE9100159D6B AS DateTime), CAST(0x0000AE9100159D6B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1159, NULL, 5, 22, CAST(0x0000AE910016AC11 AS DateTime), CAST(0x0000AE910016AC11 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1160, NULL, 5, 23, CAST(0x0000AE910017DA80 AS DateTime), CAST(0x0000AE910017DA80 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1161, NULL, 5, 24, CAST(0x0000AE9100190CEE AS DateTime), CAST(0x0000AE9100190CEE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1162, NULL, 5, 25, CAST(0x0000AE91001A3024 AS DateTime), CAST(0x0000AE91001A3024 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1163, NULL, 5, 26, CAST(0x0000AE91001B5050 AS DateTime), CAST(0x0000AE91001B5050 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1164, NULL, 5, 27, CAST(0x0000AE91001C7637 AS DateTime), CAST(0x0000AE91001C7637 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1165, NULL, 5, 28, CAST(0x0000AE91001DA5A3 AS DateTime), CAST(0x0000AE91001DA5A3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1166, NULL, 5, 29, CAST(0x0000AE91001EE9C5 AS DateTime), CAST(0x0000AE91001EE9C5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1167, NULL, 5, 31, CAST(0x0000AE9100202DE3 AS DateTime), CAST(0x0000AE9100202DE3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1168, NULL, 5, 46, CAST(0x0000AE9100218EC0 AS DateTime), CAST(0x0000AE9100218EC0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1169, NULL, 5, 12, CAST(0x0000AE910026B640 AS DateTime), CAST(0x0000AE910026B640 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1170, NULL, 5, 12, CAST(0x0000AE910027F98A AS DateTime), CAST(0x0000AE910027F98A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1171, NULL, 6, 40, CAST(0x0000AE91002946AA AS DateTime), CAST(0x0000AE91002946AA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1172, NULL, 6, 45, CAST(0x0000AE91002A8748 AS DateTime), CAST(0x0000AE91002A8748 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1173, NULL, 6, 32, CAST(0x0000AE91002BDFAF AS DateTime), CAST(0x0000AE91002BDFAF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1174, NULL, 6, 32, CAST(0x0000AE91002D2E3D AS DateTime), CAST(0x0000AE91002D2E3D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1175, NULL, 7, 52, CAST(0x0000AE91002EA225 AS DateTime), CAST(0x0000AE91002EA225 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1176, NULL, 5, 12, CAST(0x0000AE910032C57C AS DateTime), CAST(0x0000AE910032C57C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1177, NULL, 7, 52, CAST(0x0000AE91003426BA AS DateTime), CAST(0x0000AE91003426BA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1178, NULL, 5, 12, CAST(0x0000AE91003E6BAC AS DateTime), CAST(0x0000AE91003E6BAC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1179, NULL, 5, 13, CAST(0x0000AE91003FF89C AS DateTime), CAST(0x0000AE91003FF89C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1180, NULL, 5, 14, CAST(0x0000AE910041683F AS DateTime), CAST(0x0000AE910041683F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1181, NULL, 5, 15, CAST(0x0000AE910042EA1E AS DateTime), CAST(0x0000AE910042EA1E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1182, NULL, 5, 16, CAST(0x0000AE9100446B80 AS DateTime), CAST(0x0000AE9100446B80 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1183, NULL, 5, 17, CAST(0x0000AE910045EEC5 AS DateTime), CAST(0x0000AE910045EEC5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1184, NULL, 5, 18, CAST(0x0000AE91004771B0 AS DateTime), CAST(0x0000AE91004771B0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1185, NULL, 5, 19, CAST(0x0000AE91004C6915 AS DateTime), CAST(0x0000AE91004C6915 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1186, NULL, 5, 20, CAST(0x0000AE91004D8DA6 AS DateTime), CAST(0x0000AE91004D8DA6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1187, NULL, 5, 21, CAST(0x0000AE91004EB57D AS DateTime), CAST(0x0000AE91004EB57D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1188, NULL, 6, 41, CAST(0x0000AE91004FFFED AS DateTime), CAST(0x0000AE91004FFFED AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1189, NULL, 6, 42, CAST(0x0000AE91005112EF AS DateTime), CAST(0x0000AE91005112EF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1190, NULL, 6, 43, CAST(0x0000AE910052409E AS DateTime), CAST(0x0000AE910052409E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1191, NULL, 6, 44, CAST(0x0000AE910053509E AS DateTime), CAST(0x0000AE910053509E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1192, NULL, 5, 12, CAST(0x0000AE91005CD055 AS DateTime), CAST(0x0000AE91005CD055 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1193, NULL, 5, 12, CAST(0x0000AE910083B15F AS DateTime), CAST(0x0000AE910083B15F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1194, NULL, 5, 22, CAST(0x0000AE910087225E AS DateTime), CAST(0x0000AE910087225E AS DateTime))
GO
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1195, NULL, 5, 23, CAST(0x0000AE91008856CE AS DateTime), CAST(0x0000AE91008856CE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1196, NULL, 5, 24, CAST(0x0000AE910089729A AS DateTime), CAST(0x0000AE910089729A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1197, NULL, 5, 25, CAST(0x0000AE91008AA422 AS DateTime), CAST(0x0000AE91008AA422 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1198, NULL, 5, 26, CAST(0x0000AE91008C10D7 AS DateTime), CAST(0x0000AE91008C10D7 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1199, NULL, 5, 27, CAST(0x0000AE91008D64EC AS DateTime), CAST(0x0000AE91008D64EC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1200, NULL, 5, 28, CAST(0x0000AE91008EAFFA AS DateTime), CAST(0x0000AE91008EAFFA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1201, NULL, 5, 29, CAST(0x0000AE91008FDA96 AS DateTime), CAST(0x0000AE91008FDA96 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1202, NULL, 5, 31, CAST(0x0000AE9100911C6E AS DateTime), CAST(0x0000AE9100911C6E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1203, NULL, 5, 46, CAST(0x0000AE9100927B43 AS DateTime), CAST(0x0000AE9100927B43 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1204, NULL, 5, 47, CAST(0x0000AE910093C8AD AS DateTime), CAST(0x0000AE910093C8AD AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1205, NULL, 5, 48, CAST(0x0000AE9100952643 AS DateTime), CAST(0x0000AE9100952643 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1206, NULL, 5, 49, CAST(0x0000AE9100966DE9 AS DateTime), CAST(0x0000AE9100966DE9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1207, NULL, 5, 50, CAST(0x0000AE910097B942 AS DateTime), CAST(0x0000AE910097B942 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1208, NULL, 5, 51, CAST(0x0000AE9100991FDF AS DateTime), CAST(0x0000AE9100991FDF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1209, NULL, 5, 53, CAST(0x0000AE91009CD237 AS DateTime), CAST(0x0000AE91009CD237 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1210, NULL, 5, 12, CAST(0x0000AE9100B25A35 AS DateTime), CAST(0x0000AE9100B25A35 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1211, 2, 6, 35, CAST(0x0000AE9400974F60 AS DateTime), CAST(0x0000AE9400974F60 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1212, NULL, 1, 3, CAST(0x0000AE95016BAEF8 AS DateTime), CAST(0x0000AE95016BAEF8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1213, 2, 17, 71, CAST(0x0000AE95017D382A AS DateTime), CAST(0x0000AE95017D382A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1214, 2, 18, 83, CAST(0x0000AE9501804FE9 AS DateTime), CAST(0x0000AE9501804FE9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1215, 2, 18, 90, CAST(0x0000AE950181E97B AS DateTime), CAST(0x0000AE950181E97B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1216, 2, 17, 66, CAST(0x0000AE950181F371 AS DateTime), CAST(0x0000AE950181F371 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1217, 2, 23, 119, CAST(0x0000AE96013ABD76 AS DateTime), CAST(0x0000AE96013ABD76 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1218, 2, 17, 64, CAST(0x0000AE96013DA65E AS DateTime), CAST(0x0000AE96013DA65E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1219, 2, 1, 131, CAST(0x0000AE9700B7961D AS DateTime), CAST(0x0000AE9700B7961D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1220, 2, 18, 94, CAST(0x0000AE9700B9BB31 AS DateTime), CAST(0x0000AE9700B9BB31 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1221, NULL, 5, 15, CAST(0x0000AE9800B025FD AS DateTime), CAST(0x0000AE9800B02602 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1222, NULL, 5, 15, CAST(0x0000AE9800B02822 AS DateTime), CAST(0x0000AE9800B02822 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1223, NULL, 5, 15, CAST(0x0000AE9800B03019 AS DateTime), CAST(0x0000AE9800B03019 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1224, NULL, 5, 15, CAST(0x0000AE9800B03056 AS DateTime), CAST(0x0000AE9800B03056 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1225, NULL, 5, 15, CAST(0x0000AE9800B46286 AS DateTime), CAST(0x0000AE9800B46286 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1226, NULL, 5, 15, CAST(0x0000AE9800B46391 AS DateTime), CAST(0x0000AE9800B46391 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1227, NULL, 5, 15, CAST(0x0000AE9800B46927 AS DateTime), CAST(0x0000AE9800B46927 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1228, NULL, 5, 15, CAST(0x0000AE9800B46CF6 AS DateTime), CAST(0x0000AE9800B46CF6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1229, NULL, 5, 15, CAST(0x0000AE9800B47282 AS DateTime), CAST(0x0000AE9800B47282 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1230, NULL, 1, 1, CAST(0x0000AE9800BF7650 AS DateTime), CAST(0x0000AE9800BF7650 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1231, NULL, 1, 1, CAST(0x0000AE9800BF7778 AS DateTime), CAST(0x0000AE9800BF7778 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1232, 2, 7, 176, CAST(0x0000AE9800C8252D AS DateTime), CAST(0x0000AE9800C8252D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1233, NULL, 17, 64, CAST(0x0000AE98014C1DC4 AS DateTime), CAST(0x0000AE98014C1DC4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1234, NULL, 17, 65, CAST(0x0000AE98014D1B88 AS DateTime), CAST(0x0000AE98014D1B88 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1235, NULL, 17, 66, CAST(0x0000AE98014E2E36 AS DateTime), CAST(0x0000AE98014E2E36 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1236, NULL, 17, 67, CAST(0x0000AE98014F6574 AS DateTime), CAST(0x0000AE98014F6574 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1237, NULL, 17, 68, CAST(0x0000AE9801509920 AS DateTime), CAST(0x0000AE9801509920 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1238, NULL, 17, 69, CAST(0x0000AE980151CB63 AS DateTime), CAST(0x0000AE980151CB63 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1239, NULL, 17, 70, CAST(0x0000AE9801532708 AS DateTime), CAST(0x0000AE9801532708 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1240, NULL, 17, 71, CAST(0x0000AE9801547B05 AS DateTime), CAST(0x0000AE9801547B05 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1241, NULL, 17, 72, CAST(0x0000AE980155B45E AS DateTime), CAST(0x0000AE980155B45E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1242, NULL, 17, 73, CAST(0x0000AE980156EC33 AS DateTime), CAST(0x0000AE980156EC33 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1243, NULL, 18, 83, CAST(0x0000AE98016050D0 AS DateTime), CAST(0x0000AE98016050D0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1244, NULL, 18, 84, CAST(0x0000AE9801618512 AS DateTime), CAST(0x0000AE9801618512 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1245, NULL, 18, 85, CAST(0x0000AE980162AB8A AS DateTime), CAST(0x0000AE980162AB8A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1246, NULL, 18, 86, CAST(0x0000AE980163E4E8 AS DateTime), CAST(0x0000AE980163E4E8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1247, NULL, 18, 87, CAST(0x0000AE980164FFC5 AS DateTime), CAST(0x0000AE980164FFC5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1248, NULL, 18, 88, CAST(0x0000AE9801662FED AS DateTime), CAST(0x0000AE9801662FED AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1249, NULL, 18, 89, CAST(0x0000AE9801678D58 AS DateTime), CAST(0x0000AE9801678D58 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1250, NULL, 18, 90, CAST(0x0000AE980168E38C AS DateTime), CAST(0x0000AE980168E38C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1251, NULL, 18, 91, CAST(0x0000AE98016A220E AS DateTime), CAST(0x0000AE98016A220E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1252, NULL, 18, 92, CAST(0x0000AE98016B5D9C AS DateTime), CAST(0x0000AE98016B5D9C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1253, NULL, 10, 100, CAST(0x0000AE9801763D16 AS DateTime), CAST(0x0000AE9801763D16 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1254, NULL, 10, 101, CAST(0x0000AE9801779A1F AS DateTime), CAST(0x0000AE9801779A1F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1255, NULL, 10, 102, CAST(0x0000AE980178F5FC AS DateTime), CAST(0x0000AE980178F5FC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1256, NULL, 12, 152, CAST(0x0000AE98017A729C AS DateTime), CAST(0x0000AE98017A729C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1257, NULL, 12, 153, CAST(0x0000AE98017BE090 AS DateTime), CAST(0x0000AE98017BE090 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1258, NULL, 12, 154, CAST(0x0000AE98017D1775 AS DateTime), CAST(0x0000AE98017D1775 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1259, NULL, 12, 155, CAST(0x0000AE98017E3AB9 AS DateTime), CAST(0x0000AE98017E3AB9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1260, NULL, 12, 156, CAST(0x0000AE98017F661B AS DateTime), CAST(0x0000AE98017F661B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1261, NULL, 12, 157, CAST(0x0000AE9801809D79 AS DateTime), CAST(0x0000AE9801809D79 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1262, NULL, 12, 158, CAST(0x0000AE980181C8FA AS DateTime), CAST(0x0000AE980181C8FA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1263, NULL, 12, 159, CAST(0x0000AE9801831CD2 AS DateTime), CAST(0x0000AE9801831CD2 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1264, NULL, 12, 160, CAST(0x0000AE980184521F AS DateTime), CAST(0x0000AE980184521F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1265, NULL, 12, 161, CAST(0x0000AE980185AA11 AS DateTime), CAST(0x0000AE980185AA11 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1266, NULL, 9, 164, CAST(0x0000AE9900036783 AS DateTime), CAST(0x0000AE9900036783 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1267, NULL, 9, 165, CAST(0x0000AE9900049723 AS DateTime), CAST(0x0000AE9900049723 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1268, NULL, 9, 166, CAST(0x0000AE990005C572 AS DateTime), CAST(0x0000AE990005C572 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1269, NULL, 9, 167, CAST(0x0000AE990006F4D1 AS DateTime), CAST(0x0000AE990006F4D1 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1270, NULL, 9, 168, CAST(0x0000AE9900082DF6 AS DateTime), CAST(0x0000AE9900082DF6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1271, NULL, 9, 169, CAST(0x0000AE9900095E93 AS DateTime), CAST(0x0000AE9900095E93 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1272, NULL, 9, 170, CAST(0x0000AE99000AA6A0 AS DateTime), CAST(0x0000AE99000AA6A0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1273, NULL, 17, 74, CAST(0x0000AE99000BB46F AS DateTime), CAST(0x0000AE99000BB46F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1274, NULL, 17, 75, CAST(0x0000AE99000CAB01 AS DateTime), CAST(0x0000AE99000CAB01 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1275, NULL, 18, 93, CAST(0x0000AE99000DDC3D AS DateTime), CAST(0x0000AE99000DDC3D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1276, NULL, 18, 94, CAST(0x0000AE99000EF778 AS DateTime), CAST(0x0000AE99000EF778 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1277, NULL, 12, 162, CAST(0x0000AE9900102BF2 AS DateTime), CAST(0x0000AE9900102BF2 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1278, NULL, 12, 163, CAST(0x0000AE99001153C0 AS DateTime), CAST(0x0000AE99001153C0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1279, NULL, 10, 105, CAST(0x0000AE99001E7376 AS DateTime), CAST(0x0000AE99001E7376 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1280, NULL, 10, 106, CAST(0x0000AE99001FDAE1 AS DateTime), CAST(0x0000AE99001FDAE1 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1281, NULL, 9, 174, CAST(0x0000AE9900247F66 AS DateTime), CAST(0x0000AE9900247F66 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1282, NULL, 9, 175, CAST(0x0000AE990025FDDA AS DateTime), CAST(0x0000AE990025FDDA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1283, NULL, 9, 171, CAST(0x0000AE99002E2A69 AS DateTime), CAST(0x0000AE99002E2A69 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1284, NULL, 9, 172, CAST(0x0000AE99002FBCC5 AS DateTime), CAST(0x0000AE99002FBCC5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1285, NULL, 9, 173, CAST(0x0000AE9900314B47 AS DateTime), CAST(0x0000AE9900314B47 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1286, NULL, 10, 103, CAST(0x0000AE9900408AE3 AS DateTime), CAST(0x0000AE9900408AE3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1287, NULL, 10, 104, CAST(0x0000AE9900424C28 AS DateTime), CAST(0x0000AE9900424C28 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1288, NULL, 10, 95, CAST(0x0000AE9900441116 AS DateTime), CAST(0x0000AE9900441116 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1289, NULL, 10, 96, CAST(0x0000AE990045F4A6 AS DateTime), CAST(0x0000AE990045F4A6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1290, NULL, 10, 97, CAST(0x0000AE990047D7D4 AS DateTime), CAST(0x0000AE990047D7D4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1291, NULL, 10, 98, CAST(0x0000AE99004982CB AS DateTime), CAST(0x0000AE99004982CB AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1292, NULL, 10, 99, CAST(0x0000AE99004AF6DD AS DateTime), CAST(0x0000AE99004AF6DD AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1293, NULL, 23, 119, CAST(0x0000AE9900554F6F AS DateTime), CAST(0x0000AE9900554F6F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1294, NULL, 23, 120, CAST(0x0000AE990056A0D3 AS DateTime), CAST(0x0000AE990056A0D3 AS DateTime))
GO
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1295, NULL, 23, 121, CAST(0x0000AE9900581A42 AS DateTime), CAST(0x0000AE9900581A42 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1296, NULL, 23, 122, CAST(0x0000AE9900598387 AS DateTime), CAST(0x0000AE9900598387 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1297, NULL, 23, 123, CAST(0x0000AE99005AF4EC AS DateTime), CAST(0x0000AE99005AF4EC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1298, NULL, 23, 124, CAST(0x0000AE99005C525C AS DateTime), CAST(0x0000AE99005C525C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1299, NULL, 23, 125, CAST(0x0000AE99005DE090 AS DateTime), CAST(0x0000AE99005DE090 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1300, NULL, 23, 126, CAST(0x0000AE99005F5180 AS DateTime), CAST(0x0000AE99005F5180 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1301, NULL, 23, 127, CAST(0x0000AE990060CBE8 AS DateTime), CAST(0x0000AE990060CBE8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1302, NULL, 23, 128, CAST(0x0000AE9900623DAB AS DateTime), CAST(0x0000AE9900623DAB AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1303, NULL, 23, 129, CAST(0x0000AE990075BF15 AS DateTime), CAST(0x0000AE990075BF15 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1304, NULL, 23, 130, CAST(0x0000AE990077C39A AS DateTime), CAST(0x0000AE990077C39A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1305, NULL, 22, 107, CAST(0x0000AE9900801B0E AS DateTime), CAST(0x0000AE9900801B0E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1306, NULL, 22, 108, CAST(0x0000AE9900818229 AS DateTime), CAST(0x0000AE9900818229 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1307, NULL, 22, 109, CAST(0x0000AE990082E102 AS DateTime), CAST(0x0000AE990082E102 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1308, NULL, 22, 110, CAST(0x0000AE99008437E4 AS DateTime), CAST(0x0000AE99008437E4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1309, NULL, 22, 111, CAST(0x0000AE990085C02D AS DateTime), CAST(0x0000AE990085C02D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1310, NULL, 22, 112, CAST(0x0000AE9900871EA9 AS DateTime), CAST(0x0000AE9900871EA9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1311, NULL, 22, 113, CAST(0x0000AE990088833E AS DateTime), CAST(0x0000AE990088833E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1312, NULL, 22, 114, CAST(0x0000AE990089F225 AS DateTime), CAST(0x0000AE990089F225 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1313, NULL, 22, 115, CAST(0x0000AE99008B6EF8 AS DateTime), CAST(0x0000AE99008B6EF8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1314, NULL, 22, 116, CAST(0x0000AE99008CDEEB AS DateTime), CAST(0x0000AE99008CDEEB AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1315, NULL, 11, 132, CAST(0x0000AE99009708AF AS DateTime), CAST(0x0000AE99009708AF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1316, NULL, 11, 133, CAST(0x0000AE990098886F AS DateTime), CAST(0x0000AE990098886F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1317, NULL, 11, 134, CAST(0x0000AE99009A19B6 AS DateTime), CAST(0x0000AE99009A19B6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1318, NULL, 11, 135, CAST(0x0000AE99009BCDC2 AS DateTime), CAST(0x0000AE99009BCDC2 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1319, NULL, 11, 138, CAST(0x0000AE99009D75DE AS DateTime), CAST(0x0000AE99009D75DE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1320, NULL, 11, 139, CAST(0x0000AE99009F13BE AS DateTime), CAST(0x0000AE99009F13BE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1321, NULL, 11, 140, CAST(0x0000AE9900A0C331 AS DateTime), CAST(0x0000AE9900A0C331 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1322, NULL, 11, 141, CAST(0x0000AE9900A25F08 AS DateTime), CAST(0x0000AE9900A25F08 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1323, NULL, 22, 117, CAST(0x0000AE9900A817EA AS DateTime), CAST(0x0000AE9900A817EA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1324, NULL, 22, 118, CAST(0x0000AE9900A9172A AS DateTime), CAST(0x0000AE9900A9172A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1325, NULL, 11, 136, CAST(0x0000AE9900AD013E AS DateTime), CAST(0x0000AE9900AD013E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1326, NULL, 11, 137, CAST(0x0000AE9900ADF9CB AS DateTime), CAST(0x0000AE9900ADF9CB AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1327, NULL, 11, 142, CAST(0x0000AE9900AEDCE6 AS DateTime), CAST(0x0000AE9900AEDCE6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1328, NULL, 11, 143, CAST(0x0000AE9900AFC932 AS DateTime), CAST(0x0000AE9900AFC932 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1329, NULL, 11, 144, CAST(0x0000AE9900B0BCD6 AS DateTime), CAST(0x0000AE9900B0BCD6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1330, NULL, 11, 145, CAST(0x0000AE9900B1B1BD AS DateTime), CAST(0x0000AE9900B1B1BD AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1331, NULL, 11, 146, CAST(0x0000AE9900B2A5D6 AS DateTime), CAST(0x0000AE9900B2A5D6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1332, NULL, 11, 147, CAST(0x0000AE9900B39735 AS DateTime), CAST(0x0000AE9900B39735 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1333, NULL, 11, 148, CAST(0x0000AE9900B4935D AS DateTime), CAST(0x0000AE9900B4935D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1334, NULL, 11, 149, CAST(0x0000AE9900B5865C AS DateTime), CAST(0x0000AE9900B5865C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1335, NULL, 11, 150, CAST(0x0000AE9900B68072 AS DateTime), CAST(0x0000AE9900B68072 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1336, NULL, 11, 151, CAST(0x0000AE9900B77B27 AS DateTime), CAST(0x0000AE9900B77B27 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1337, NULL, 18, 83, CAST(0x0000AE9900C26A16 AS DateTime), CAST(0x0000AE9900C26A16 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1338, NULL, 5, 47, CAST(0x0000AE9D0030C2E3 AS DateTime), CAST(0x0000AE9D0030C2E3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2011, NULL, 7, 176, CAST(0x0000AE9D011F2B3F AS DateTime), CAST(0x0000AE9D011F2B3F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2012, 2, 11, 139, CAST(0x0000AE9E01482217 AS DateTime), CAST(0x0000AE9E01482217 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2013, 2, 11, 140, CAST(0x0000AE9E014A8699 AS DateTime), CAST(0x0000AE9E014A8699 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2043, NULL, 7, 176, CAST(0x0000AE9E01831E03 AS DateTime), CAST(0x0000AE9E01831E03 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2044, NULL, 6, 32, CAST(0x0000AE9F0006CBD3 AS DateTime), CAST(0x0000AE9F0006CBD3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2045, NULL, 7, 176, CAST(0x0000AE9F0006D8DC AS DateTime), CAST(0x0000AE9F0006D8DC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2046, NULL, 7, 60, CAST(0x0000AE9F0006DDD5 AS DateTime), CAST(0x0000AE9F0006DDD5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2047, NULL, 7, 52, CAST(0x0000AE9F0006E133 AS DateTime), CAST(0x0000AE9F0006E133 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2048, NULL, 7, 52, CAST(0x0000AE9F0007B8B1 AS DateTime), CAST(0x0000AE9F0007B8B1 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2049, NULL, 7, 52, CAST(0x0000AE9F0007E4CD AS DateTime), CAST(0x0000AE9F0007E4CD AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2050, NULL, 7, 52, CAST(0x0000AE9F0007FA7C AS DateTime), CAST(0x0000AE9F0007FA7C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2051, NULL, 7, 52, CAST(0x0000AE9F0007FA7C AS DateTime), CAST(0x0000AE9F0007FA7C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2052, NULL, 7, 52, CAST(0x0000AE9F000840F0 AS DateTime), CAST(0x0000AE9F000840F0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2053, 2, 1, 4, CAST(0x0000AE9F00191351 AS DateTime), CAST(0x0000AE9F00191356 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2054, 2, 1004, 1008, CAST(0x0000AE9F00FF40E9 AS DateTime), CAST(0x0000AE9F00FF40E9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2055, 2, 1, 1007, CAST(0x0000AE9F0152449E AS DateTime), CAST(0x0000AE9F0152449E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2056, 2, 8, 56, CAST(0x0000AEA0000F9521 AS DateTime), CAST(0x0000AEA0000F9521 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2057, 2013, 7, 176, CAST(0x0000AEA000103153 AS DateTime), CAST(0x0000AEA000103153 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2058, 2013, 7, 60, CAST(0x0000AEA000103498 AS DateTime), CAST(0x0000AEA000103498 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2059, 3014, 5, 12, CAST(0x0000AEA000E92F19 AS DateTime), CAST(0x0000AEA000E92F19 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2060, NULL, 7, 176, CAST(0x0000AEA00108AA54 AS DateTime), CAST(0x0000AEA00108AA54 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2061, 3014, 7, 60, CAST(0x0000AEA0010903F5 AS DateTime), CAST(0x0000AEA0010903F5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2062, 3014, 7, 52, CAST(0x0000AEA00109225A AS DateTime), CAST(0x0000AEA00109225A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2063, 3014, 7, 176, CAST(0x0000AEA001093032 AS DateTime), CAST(0x0000AEA001093032 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2064, 3014, 5, 13, CAST(0x0000AEA0010BD311 AS DateTime), CAST(0x0000AEA0010BD311 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2065, 3014, 1, 1, CAST(0x0000AEA0010BF977 AS DateTime), CAST(0x0000AEA0010BF977 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2066, 3014, 1, 2, CAST(0x0000AEA0010C020D AS DateTime), CAST(0x0000AEA0010C020D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2067, 3014, 4, 8, CAST(0x0000AEA0010C952D AS DateTime), CAST(0x0000AEA0010C952D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2068, 2, 4, 8, CAST(0x0000AEA0010CF402 AS DateTime), CAST(0x0000AEA0010CF402 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2069, NULL, 7, 60, CAST(0x0000AEA0017B8C31 AS DateTime), CAST(0x0000AEA0017B8C31 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2073, NULL, 7, 52, CAST(0x0000AEA1001AF3B9 AS DateTime), CAST(0x0000AEA1001AF3BA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2074, NULL, 5, 12, CAST(0x0000AEA10021D4D8 AS DateTime), CAST(0x0000AEA10021D4D8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2075, 3013, 18, 84, CAST(0x0000AEA1002A93E4 AS DateTime), CAST(0x0000AEA1002A93E5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2076, 2, 4, 11, CAST(0x0000AEA1003FD442 AS DateTime), CAST(0x0000AEA1003FD442 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2077, 1013, 5, 12, CAST(0x0000AEA1009DBAD4 AS DateTime), CAST(0x0000AEA1009DBAD4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2078, 1013, 4, 8, CAST(0x0000AEA100A09FE4 AS DateTime), CAST(0x0000AEA100A09FE4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2079, 1013, 5, 13, CAST(0x0000AEA100A54A6B AS DateTime), CAST(0x0000AEA100A54A6B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2080, NULL, 8, 57, CAST(0x0000AEA100E740FB AS DateTime), CAST(0x0000AEA100E740FB AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2081, NULL, 8, 54, CAST(0x0000AEA100E7549C AS DateTime), CAST(0x0000AEA100E7549C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2082, NULL, 5, 12, CAST(0x0000AEA100E7A1B2 AS DateTime), CAST(0x0000AEA100E7A1B2 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2083, NULL, 5, 13, CAST(0x0000AEA100E7BBCE AS DateTime), CAST(0x0000AEA100E7BBCE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2084, 2014, 1, 1, CAST(0x0000AEA100E81C23 AS DateTime), CAST(0x0000AEA100E81C23 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2085, 2, 1005, 1010, CAST(0x0000AEA1011775E9 AS DateTime), CAST(0x0000AEA1011775E9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2086, NULL, 1005, 1010, CAST(0x0000AEA200E588D8 AS DateTime), CAST(0x0000AEA200E588D8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2116, NULL, 9, 175, CAST(0x0000AEA2015E38CC AS DateTime), CAST(0x0000AEA2015E38CC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2117, NULL, 1, 1007, CAST(0x0000AEA2015E8D39 AS DateTime), CAST(0x0000AEA2015E8D39 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2118, NULL, 1, 1007, CAST(0x0000AEA201641C2C AS DateTime), CAST(0x0000AEA201641C2C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2125, NULL, 1004, 1008, CAST(0x0000AEA300641C18 AS DateTime), CAST(0x0000AEA300641C18 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2126, NULL, 5, 12, CAST(0x0000AEA300A0A6B0 AS DateTime), CAST(0x0000AEA300A0A6B0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2127, NULL, 5, 13, CAST(0x0000AEA300D31B2E AS DateTime), CAST(0x0000AEA300D31B2E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2128, NULL, 5, 14, CAST(0x0000AEA300DA075E AS DateTime), CAST(0x0000AEA300DA0762 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2129, NULL, 5, 15, CAST(0x0000AEA300E049F6 AS DateTime), CAST(0x0000AEA300E049F6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2130, NULL, 5, 16, CAST(0x0000AEA300E6A87A AS DateTime), CAST(0x0000AEA300E6A87A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2131, NULL, 5, 17, CAST(0x0000AEA300E9E27C AS DateTime), CAST(0x0000AEA300E9E27C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2132, NULL, 5, 18, CAST(0x0000AEA300ECEDC8 AS DateTime), CAST(0x0000AEA300ECEDC8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2133, NULL, 5, 19, CAST(0x0000AEA300F06AE8 AS DateTime), CAST(0x0000AEA300F06AE8 AS DateTime))
GO
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2134, NULL, 5, 20, CAST(0x0000AEA300F3DBD9 AS DateTime), CAST(0x0000AEA300F3DBD9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2135, NULL, 5, 21, CAST(0x0000AEA300F7A331 AS DateTime), CAST(0x0000AEA300F7A331 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2136, 2, 1007, 1012, CAST(0x0000AEA3015F0A0B AS DateTime), CAST(0x0000AEA3015F0A23 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2137, 2, 4, 1022, CAST(0x0000AEA3015F6777 AS DateTime), CAST(0x0000AEA3015F6777 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2138, 2, 4, 1023, CAST(0x0000AEA3015F7F24 AS DateTime), CAST(0x0000AEA3015F7F24 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2139, 2, 1011, 1037, CAST(0x0000AEA30172C6BE AS DateTime), CAST(0x0000AEA30172C6BE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2140, NULL, 5, 47, CAST(0x0000AEA40004EE52 AS DateTime), CAST(0x0000AEA40004EE52 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2141, NULL, 5, 48, CAST(0x0000AEA4000AA458 AS DateTime), CAST(0x0000AEA4000AA458 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2142, NULL, 5, 49, CAST(0x0000AEA40010B954 AS DateTime), CAST(0x0000AEA40010B954 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2143, NULL, 5, 50, CAST(0x0000AEA40016E56F AS DateTime), CAST(0x0000AEA40016E56F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2144, NULL, 5, 51, CAST(0x0000AEA4001D9346 AS DateTime), CAST(0x0000AEA4001D9346 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2145, NULL, 5, 53, CAST(0x0000AEA40024AC8F AS DateTime), CAST(0x0000AEA40024AC8F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2146, NULL, 5, 22, CAST(0x0000AEA4002B6F46 AS DateTime), CAST(0x0000AEA4002B6F46 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2147, NULL, 6, 33, CAST(0x0000AEA40032381F AS DateTime), CAST(0x0000AEA40032381F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2148, NULL, 5, 23, CAST(0x0000AEA40038D34D AS DateTime), CAST(0x0000AEA40038D34D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2149, NULL, 5, 24, CAST(0x0000AEA4004347F7 AS DateTime), CAST(0x0000AEA4004347F7 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2150, NULL, 6, 34, CAST(0x0000AEA40049B4A1 AS DateTime), CAST(0x0000AEA40049B4A1 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2151, NULL, 5, 25, CAST(0x0000AEA40050A475 AS DateTime), CAST(0x0000AEA40050A475 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2152, NULL, 5, 26, CAST(0x0000AEA40057976D AS DateTime), CAST(0x0000AEA40057976D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2153, NULL, 6, 35, CAST(0x0000AEA4005E8C5D AS DateTime), CAST(0x0000AEA4005E8C5D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2154, NULL, 5, 27, CAST(0x0000AEA400656890 AS DateTime), CAST(0x0000AEA400656890 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2155, NULL, 6, 36, CAST(0x0000AEA4006C8DF4 AS DateTime), CAST(0x0000AEA4006C8DF4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2156, NULL, 5, 28, CAST(0x0000AEA40073BF5D AS DateTime), CAST(0x0000AEA40073BF5D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2157, NULL, 1, 4, CAST(0x0000AEA40104AB26 AS DateTime), CAST(0x0000AEA40104AB26 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2158, NULL, 5, 29, CAST(0x0000AEA4010CAB0A AS DateTime), CAST(0x0000AEA4010CAB0A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2159, NULL, 6, 37, CAST(0x0000AEA4010ED608 AS DateTime), CAST(0x0000AEA4010ED608 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2160, NULL, 6, 38, CAST(0x0000AEA40110F7B4 AS DateTime), CAST(0x0000AEA40110F7B4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2161, NULL, 5, 31, CAST(0x0000AEA40113234B AS DateTime), CAST(0x0000AEA40113234B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2162, NULL, 6, 39, CAST(0x0000AEA40115477B AS DateTime), CAST(0x0000AEA40115477B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2163, NULL, 5, 46, CAST(0x0000AEA401178A5E AS DateTime), CAST(0x0000AEA401178A5E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2164, NULL, 3, 5, CAST(0x0000AEA40119E399 AS DateTime), CAST(0x0000AEA40119E399 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2165, NULL, 6, 40, CAST(0x0000AEA4011C23C2 AS DateTime), CAST(0x0000AEA4011C23C2 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2166, NULL, 6, 45, CAST(0x0000AEA4011E7428 AS DateTime), CAST(0x0000AEA4011E7428 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2167, NULL, 7, 52, CAST(0x0000AEA401210159 AS DateTime), CAST(0x0000AEA401210159 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2168, NULL, 7, 60, CAST(0x0000AEA401237C7D AS DateTime), CAST(0x0000AEA401237C7D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2169, NULL, 8, 54, CAST(0x0000AEA4012AB2BE AS DateTime), CAST(0x0000AEA4012AB2BE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2170, NULL, 8, 55, CAST(0x0000AEA4012D2460 AS DateTime), CAST(0x0000AEA4012D2460 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2171, NULL, 6, 41, CAST(0x0000AEA4015D580D AS DateTime), CAST(0x0000AEA4015D580D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2172, NULL, 1, 61, CAST(0x0000AEA4015FBB9B AS DateTime), CAST(0x0000AEA4015FBB9B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2173, NULL, 8, 56, CAST(0x0000AEA401623AB3 AS DateTime), CAST(0x0000AEA401623AB3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2174, NULL, 6, 42, CAST(0x0000AEA40164A4E6 AS DateTime), CAST(0x0000AEA40164A4E6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2175, NULL, 6, 43, CAST(0x0000AEA401670C64 AS DateTime), CAST(0x0000AEA401670C64 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2176, NULL, 8, 57, CAST(0x0000AEA40169972A AS DateTime), CAST(0x0000AEA40169972A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2177, NULL, 6, 44, CAST(0x0000AEA4016C421E AS DateTime), CAST(0x0000AEA4016C421E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2178, NULL, 8, 58, CAST(0x0000AEA401717C48 AS DateTime), CAST(0x0000AEA401717C48 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2179, NULL, 1, 1, CAST(0x0000AEA401740C8D AS DateTime), CAST(0x0000AEA401740C8D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2180, NULL, 1, 2, CAST(0x0000AEA40176D22D AS DateTime), CAST(0x0000AEA40176D22D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2181, NULL, 1, 3, CAST(0x0000AEA4017BE75D AS DateTime), CAST(0x0000AEA4017BE75D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2182, NULL, 4, 10, CAST(0x0000AEA5000B1261 AS DateTime), CAST(0x0000AEA5000B1261 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2183, NULL, 4, 11, CAST(0x0000AEA5000E450B AS DateTime), CAST(0x0000AEA5000E450B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2184, NULL, 4, 59, CAST(0x0000AEA500116E6D AS DateTime), CAST(0x0000AEA500116E6D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2185, NULL, 4, 8, CAST(0x0000AEA50014712C AS DateTime), CAST(0x0000AEA50014712C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2186, NULL, 4, 9, CAST(0x0000AEA500178D1D AS DateTime), CAST(0x0000AEA500178D1D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2187, NULL, 2, 7, CAST(0x0000AEA5004B13C3 AS DateTime), CAST(0x0000AEA5004B13C3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3139, 2, 1, 1039, CAST(0x0000AEA501237D44 AS DateTime), CAST(0x0000AEA501237D44 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3140, NULL, 2, 7, CAST(0x0000AEA5012DADCE AS DateTime), CAST(0x0000AEA5012DADCE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3141, NULL, 3, 5, CAST(0x0000AEA5013D8CE6 AS DateTime), CAST(0x0000AEA5013D8CE6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3142, NULL, 7, 52, CAST(0x0000AEA5013FAAD6 AS DateTime), CAST(0x0000AEA5013FAAD6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3143, NULL, 7, 60, CAST(0x0000AEA50146087E AS DateTime), CAST(0x0000AEA50146087E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3144, 2, 2011, 2037, CAST(0x0000AEA6000A2CCF AS DateTime), CAST(0x0000AEA6000A2CCF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3145, NULL, 1, 61, CAST(0x0000AEA600151B78 AS DateTime), CAST(0x0000AEA600151B78 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3146, NULL, 1, 2, CAST(0x0000AEA60018EA69 AS DateTime), CAST(0x0000AEA60018EA69 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3147, NULL, 1, 3, CAST(0x0000AEA6001CD81A AS DateTime), CAST(0x0000AEA6001CD81A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3148, NULL, 7, 52, CAST(0x0000AEA60020E434 AS DateTime), CAST(0x0000AEA60020E434 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3149, NULL, 6, 40, CAST(0x0000AEA6009E48FE AS DateTime), CAST(0x0000AEA6009E48FE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3150, NULL, 4, 10, CAST(0x0000AEA600A61B30 AS DateTime), CAST(0x0000AEA600A61B30 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3151, NULL, 6, 45, CAST(0x0000AEA600AA5CA6 AS DateTime), CAST(0x0000AEA600AA5CA6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3152, NULL, 6, 33, CAST(0x0000AEA600AEA45F AS DateTime), CAST(0x0000AEA600AEA45F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3153, NULL, 4, 11, CAST(0x0000AEA600B7CB80 AS DateTime), CAST(0x0000AEA600B7CB80 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3154, NULL, 6, 34, CAST(0x0000AEA600C166A4 AS DateTime), CAST(0x0000AEA600C166A4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3155, NULL, 6, 42, CAST(0x0000AEA600CFF8E9 AS DateTime), CAST(0x0000AEA600CFF8E9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3156, NULL, 6, 43, CAST(0x0000AEA600D3A985 AS DateTime), CAST(0x0000AEA600D3A985 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3157, NULL, 6, 44, CAST(0x0000AEA600D78A42 AS DateTime), CAST(0x0000AEA600D78A42 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3158, NULL, 4, 59, CAST(0x0000AEA600E3D6D9 AS DateTime), CAST(0x0000AEA600E3D6D9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3159, NULL, 6, 35, CAST(0x0000AEA600E83D50 AS DateTime), CAST(0x0000AEA600E83D50 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3160, NULL, 4, 8, CAST(0x0000AEA600ECDDD7 AS DateTime), CAST(0x0000AEA600ECDDD7 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3161, NULL, 5, 12, CAST(0x0000AEA600F17943 AS DateTime), CAST(0x0000AEA600F17943 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3162, NULL, 6, 36, CAST(0x0000AEA600FB58A1 AS DateTime), CAST(0x0000AEA600FB58A1 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3163, NULL, 5, 12, CAST(0x0000AEA6010000D3 AS DateTime), CAST(0x0000AEA6010000D3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3164, NULL, 5, 12, CAST(0x0000AEA60105138B AS DateTime), CAST(0x0000AEA60105138B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3165, NULL, 5, 13, CAST(0x0000AEA6010A14C0 AS DateTime), CAST(0x0000AEA6010A14C0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3166, NULL, 4, 9, CAST(0x0000AEA6010F7340 AS DateTime), CAST(0x0000AEA6010F7340 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3167, NULL, 6, 37, CAST(0x0000AEA6011488BD AS DateTime), CAST(0x0000AEA6011488BD AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3168, NULL, 5, 14, CAST(0x0000AEA6011F3C15 AS DateTime), CAST(0x0000AEA6011F3C15 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3169, NULL, 6, 38, CAST(0x0000AEA60129AE8E AS DateTime), CAST(0x0000AEA60129AE8E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3170, NULL, 5, 47, CAST(0x0000AEA60144942E AS DateTime), CAST(0x0000AEA60144942E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3171, NULL, 5, 49, CAST(0x0000AEA60154001E AS DateTime), CAST(0x0000AEA60154001E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3172, NULL, 5, 50, CAST(0x0000AEA6015A9115 AS DateTime), CAST(0x0000AEA6015A9115 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3173, NULL, 5, 51, CAST(0x0000AEA601619313 AS DateTime), CAST(0x0000AEA601619313 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3174, NULL, 5, 53, CAST(0x0000AEA60168EEF9 AS DateTime), CAST(0x0000AEA60168EEF9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3175, NULL, 5, 12, CAST(0x0000AEA601703DB6 AS DateTime), CAST(0x0000AEA601703DB6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3176, NULL, 5, 12, CAST(0x0000AEA60173F51C AS DateTime), CAST(0x0000AEA60173F51C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3177, NULL, 5, 48, CAST(0x0000AEA60177EB88 AS DateTime), CAST(0x0000AEA60177EB88 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3178, NULL, 5, 15, CAST(0x0000AEA601839A10 AS DateTime), CAST(0x0000AEA601839A10 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3179, NULL, 5, 16, CAST(0x0000AEA6018B1000 AS DateTime), CAST(0x0000AEA6018B1000 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3180, NULL, 6, 39, CAST(0x0000AEA70003565A AS DateTime), CAST(0x0000AEA70003565A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3181, NULL, 5, 17, CAST(0x0000AEA70015D397 AS DateTime), CAST(0x0000AEA70015D397 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3182, NULL, 5, 18, CAST(0x0000AEA700279AFD AS DateTime), CAST(0x0000AEA700279AFD AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3183, NULL, 7, 52, CAST(0x0000AEA700405F0D AS DateTime), CAST(0x0000AEA700405F0D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3184, NULL, 5, 19, CAST(0x0000AEA7004EE898 AS DateTime), CAST(0x0000AEA7004EE898 AS DateTime))
GO
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3185, NULL, 5, 20, CAST(0x0000AEA700543E43 AS DateTime), CAST(0x0000AEA700543E43 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3186, NULL, 6, 32, CAST(0x0000AEA7005F5E3C AS DateTime), CAST(0x0000AEA7005F5E3C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3187, NULL, 5, 21, CAST(0x0000AEA70069C32D AS DateTime), CAST(0x0000AEA70069C32D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3188, NULL, 5, 12, CAST(0x0000AEA70072CB58 AS DateTime), CAST(0x0000AEA70072CB58 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3189, NULL, 7, 52, CAST(0x0000AEA70077C271 AS DateTime), CAST(0x0000AEA70077C271 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3190, NULL, 6, 32, CAST(0x0000AEA7007CC8F5 AS DateTime), CAST(0x0000AEA7007CC8F5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3191, NULL, 2011, 2037, CAST(0x0000AEA7009F5175 AS DateTime), CAST(0x0000AEA7009F5175 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3192, NULL, 5, 22, CAST(0x0000AEA700BACB3B AS DateTime), CAST(0x0000AEA700BACB3B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3193, NULL, 5, 23, CAST(0x0000AEA700DA7181 AS DateTime), CAST(0x0000AEA700DA7181 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3194, NULL, 8, 54, CAST(0x0000AEA700DFBAB0 AS DateTime), CAST(0x0000AEA700DFBAB0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3195, 2, 2013, 2039, CAST(0x0000AEA700E9B769 AS DateTime), CAST(0x0000AEA700E9B769 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3196, 3015, 2013, 2039, CAST(0x0000AEA700EA693E AS DateTime), CAST(0x0000AEA700EA693E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3197, NULL, 5, 24, CAST(0x0000AEA700EB2CD6 AS DateTime), CAST(0x0000AEA700EB2CD6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3198, 3015, 6, 32, CAST(0x0000AEA700F3363E AS DateTime), CAST(0x0000AEA700F3363E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3199, NULL, 5, 25, CAST(0x0000AEA7010E79DC AS DateTime), CAST(0x0000AEA7010E79DC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3200, NULL, 5, 26, CAST(0x0000AEA701204903 AS DateTime), CAST(0x0000AEA701204903 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3201, NULL, 8, 55, CAST(0x0000AEA7012639E3 AS DateTime), CAST(0x0000AEA7012639E8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3202, NULL, 6, 41, CAST(0x0000AEA7012C4C40 AS DateTime), CAST(0x0000AEA7012C4C40 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3203, NULL, 5, 27, CAST(0x0000AEA701327B10 AS DateTime), CAST(0x0000AEA701327B10 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3204, 3015, 1006, 1011, CAST(0x0000AEA701454EA3 AS DateTime), CAST(0x0000AEA701454EA3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3205, NULL, 5, 28, CAST(0x0000AEA8004A8FEB AS DateTime), CAST(0x0000AEA8004A8FEB AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3206, NULL, 8, 56, CAST(0x0000AEA800532178 AS DateTime), CAST(0x0000AEA800532178 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3207, NULL, 5, 29, CAST(0x0000AEA800562E6E AS DateTime), CAST(0x0000AEA800562E6E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3208, NULL, 5, 31, CAST(0x0000AEA8005955F2 AS DateTime), CAST(0x0000AEA8005955F2 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3209, NULL, 8, 57, CAST(0x0000AEA8005C8F54 AS DateTime), CAST(0x0000AEA8005C8F54 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3210, NULL, 8, 58, CAST(0x0000AEA800634C62 AS DateTime), CAST(0x0000AEA800634C62 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3211, NULL, 5, 46, CAST(0x0000AEA80066BA48 AS DateTime), CAST(0x0000AEA80066BA48 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3212, NULL, 1, 1, CAST(0x0000AEA800698799 AS DateTime), CAST(0x0000AEA800698799 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3213, NULL, 5, 12, CAST(0x0000AEA8006E7058 AS DateTime), CAST(0x0000AEA8006E7058 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3214, NULL, 5, 12, CAST(0x0000AEA80073A7D7 AS DateTime), CAST(0x0000AEA80073A7D7 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3215, NULL, 6, 32, CAST(0x0000AEA8009D7081 AS DateTime), CAST(0x0000AEA8009D7081 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3216, NULL, 5, 12, CAST(0x0000AEA800A00AC0 AS DateTime), CAST(0x0000AEA800A00AC0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3217, NULL, 7, 52, CAST(0x0000AEA800A2D105 AS DateTime), CAST(0x0000AEA800A2D105 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3218, NULL, 1, 4, CAST(0x0000AEA800A59D9A AS DateTime), CAST(0x0000AEA800A59D9A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3219, NULL, 4, 1022, CAST(0x0000AEA800AE9578 AS DateTime), CAST(0x0000AEA800AE9578 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3220, NULL, 4, 1023, CAST(0x0000AEA800B19F3A AS DateTime), CAST(0x0000AEA800B19F3A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3221, NULL, 1006, 1011, CAST(0x0000AEA800B1C063 AS DateTime), CAST(0x0000AEA800B1C063 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3222, NULL, 1, 1007, CAST(0x0000AEA800B4C669 AS DateTime), CAST(0x0000AEA800B4C669 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3223, 3015, 1009, 1013, CAST(0x0000AEA800B52AD8 AS DateTime), CAST(0x0000AEA800B52AD8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3224, NULL, 1009, 1013, CAST(0x0000AEA800B5FAF0 AS DateTime), CAST(0x0000AEA800B5FAF1 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3225, NULL, 1011, 1037, CAST(0x0000AEA800B70FAA AS DateTime), CAST(0x0000AEA800B70FAA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3226, NULL, 1, 131, CAST(0x0000AEA800B82EE8 AS DateTime), CAST(0x0000AEA800B82EE8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3227, NULL, 8, 1024, CAST(0x0000AEA800BB6D88 AS DateTime), CAST(0x0000AEA800BB6D88 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3228, NULL, 8, 177, CAST(0x0000AEA800C44F4E AS DateTime), CAST(0x0000AEA800C44F4E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3229, NULL, 8, 63, CAST(0x0000AEA800C7FFA6 AS DateTime), CAST(0x0000AEA800C7FFA6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3230, NULL, 7, 176, CAST(0x0000AEA800CC2945 AS DateTime), CAST(0x0000AEA800CC2945 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3231, NULL, 1, 1039, CAST(0x0000AEA800D0A41D AS DateTime), CAST(0x0000AEA800D0A41D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3232, NULL, 4, 1021, CAST(0x0000AEA800E3B2E3 AS DateTime), CAST(0x0000AEA800E3B2E3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3233, NULL, 5, 12, CAST(0x0000AEA801191E90 AS DateTime), CAST(0x0000AEA801191E90 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3234, NULL, 5, 12, CAST(0x0000AEA8011E4C79 AS DateTime), CAST(0x0000AEA8011E4C79 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3235, NULL, 5, 12, CAST(0x0000AEA801243135 AS DateTime), CAST(0x0000AEA801243135 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3236, NULL, 5, 12, CAST(0x0000AEA80134ED61 AS DateTime), CAST(0x0000AEA80134ED61 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3237, NULL, 5, 12, CAST(0x0000AEA8014BB675 AS DateTime), CAST(0x0000AEA8014BB675 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3238, 3015, 1012, 2041, CAST(0x0000AEA90094CDBF AS DateTime), CAST(0x0000AEA90094CDBF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3239, NULL, 1, 1, CAST(0x0000AEA901295C1E AS DateTime), CAST(0x0000AEA901295C1E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3240, NULL, 4, 8, CAST(0x0000AEA9012BE861 AS DateTime), CAST(0x0000AEA9012BE861 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3241, 2, 4, 2042, CAST(0x0000AEAA00ADB742 AS DateTime), CAST(0x0000AEAA00ADB742 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3242, 3015, 4, 8, CAST(0x0000AEAB00528FAD AS DateTime), CAST(0x0000AEAB00528FAD AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3243, 2, 2015, 2043, CAST(0x0000AEAA0127ED83 AS DateTime), CAST(0x0000AEAA0127ED83 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3244, 2, 8, 1024, CAST(0x0000AEAB006A66B4 AS DateTime), CAST(0x0000AEAB006A66B4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3245, 2, 8, 2044, CAST(0x0000AEAB006B5131 AS DateTime), CAST(0x0000AEAB006B5131 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3246, 2, 1, 2045, CAST(0x0000AEAB01285D87 AS DateTime), CAST(0x0000AEAB01285D87 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3247, NULL, 17, 64, CAST(0x0000AEAC0166CA3E AS DateTime), CAST(0x0000AEAC0166CA3E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3248, NULL, 17, 65, CAST(0x0000AEAC0169FFEE AS DateTime), CAST(0x0000AEAC0169FFEE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3249, NULL, 17, 66, CAST(0x0000AEAC016CCC43 AS DateTime), CAST(0x0000AEAC016CCC43 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3250, NULL, 17, 67, CAST(0x0000AEAC016F89A8 AS DateTime), CAST(0x0000AEAC016F89A8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3251, NULL, 17, 68, CAST(0x0000AEAC0171E264 AS DateTime), CAST(0x0000AEAC0171E264 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3252, NULL, 17, 69, CAST(0x0000AEAC0174732C AS DateTime), CAST(0x0000AEAC0174732C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3253, NULL, 17, 70, CAST(0x0000AEAC0176E523 AS DateTime), CAST(0x0000AEAC0176E523 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3254, NULL, 17, 71, CAST(0x0000AEAC01795C98 AS DateTime), CAST(0x0000AEAC01795C98 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3255, NULL, 17, 72, CAST(0x0000AEAC017BC953 AS DateTime), CAST(0x0000AEAC017BC953 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3256, NULL, 17, 73, CAST(0x0000AEAC017ECD30 AS DateTime), CAST(0x0000AEAC017ECD30 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3257, NULL, 10, 100, CAST(0x0000AEAC0183C00F AS DateTime), CAST(0x0000AEAC0183C00F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3258, NULL, 12, 152, CAST(0x0000AEAC01852FC0 AS DateTime), CAST(0x0000AEAC01852FC0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3259, NULL, 10, 101, CAST(0x0000AEAC0186CC7D AS DateTime), CAST(0x0000AEAC0186CC7D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3260, NULL, 12, 153, CAST(0x0000AEAC0188BA45 AS DateTime), CAST(0x0000AEAC0188BA45 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3261, NULL, 10, 102, CAST(0x0000AEAC018A69A1 AS DateTime), CAST(0x0000AEAC018A69A1 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3262, NULL, 12, 154, CAST(0x0000AEAD00009647 AS DateTime), CAST(0x0000AEAD00009647 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3263, NULL, 12, 155, CAST(0x0000AEAD0002167C AS DateTime), CAST(0x0000AEAD0002167C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3264, NULL, 12, 156, CAST(0x0000AEAD000381E4 AS DateTime), CAST(0x0000AEAD000381E4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3265, NULL, 12, 157, CAST(0x0000AEAD0005290C AS DateTime), CAST(0x0000AEAD0005290C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3266, NULL, 12, 158, CAST(0x0000AEAD0006906D AS DateTime), CAST(0x0000AEAD0006906D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3267, NULL, 12, 159, CAST(0x0000AEAD00081CB9 AS DateTime), CAST(0x0000AEAD00081CB9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3268, NULL, 12, 160, CAST(0x0000AEAD0009DB80 AS DateTime), CAST(0x0000AEAD0009DB80 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3269, NULL, 12, 161, CAST(0x0000AEAD000B3E8B AS DateTime), CAST(0x0000AEAD000B3E8B AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3270, NULL, 18, 83, CAST(0x0000AEAD000C9E82 AS DateTime), CAST(0x0000AEAD000C9E82 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3271, NULL, 18, 84, CAST(0x0000AEAD000DEC37 AS DateTime), CAST(0x0000AEAD000DEC37 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3272, NULL, 18, 85, CAST(0x0000AEAD000F67FA AS DateTime), CAST(0x0000AEAD000F67FA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3273, NULL, 9, 164, CAST(0x0000AEAD0010E868 AS DateTime), CAST(0x0000AEAD0010E868 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3274, NULL, 18, 86, CAST(0x0000AEAD00124A26 AS DateTime), CAST(0x0000AEAD00124A26 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3275, NULL, 9, 165, CAST(0x0000AEAD001374AA AS DateTime), CAST(0x0000AEAD001374AA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3276, NULL, 18, 87, CAST(0x0000AEAD0014818A AS DateTime), CAST(0x0000AEAD0014818A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3277, NULL, 9, 166, CAST(0x0000AEAD0015D2CD AS DateTime), CAST(0x0000AEAD0015D2CD AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3278, NULL, 18, 88, CAST(0x0000AEAD0016FDF5 AS DateTime), CAST(0x0000AEAD0016FDF5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3279, NULL, 9, 167, CAST(0x0000AEAD00182BFD AS DateTime), CAST(0x0000AEAD00182BFD AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3280, NULL, 18, 89, CAST(0x0000AEAD001962FF AS DateTime), CAST(0x0000AEAD001962FF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3281, NULL, 9, 168, CAST(0x0000AEAD001A9B77 AS DateTime), CAST(0x0000AEAD001A9B77 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3282, NULL, 18, 90, CAST(0x0000AEAD001BE282 AS DateTime), CAST(0x0000AEAD001BE282 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3283, NULL, 9, 169, CAST(0x0000AEAD001D4EA2 AS DateTime), CAST(0x0000AEAD001D4EA2 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3284, NULL, 18, 91, CAST(0x0000AEAD001EC243 AS DateTime), CAST(0x0000AEAD001EC243 AS DateTime))
GO
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3285, NULL, 9, 170, CAST(0x0000AEAD00203391 AS DateTime), CAST(0x0000AEAD00203391 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3286, NULL, 18, 92, CAST(0x0000AEAD0021B982 AS DateTime), CAST(0x0000AEAD0021B982 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3287, NULL, 17, 74, CAST(0x0000AEAD0023228A AS DateTime), CAST(0x0000AEAD0023228A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3288, NULL, 17, 75, CAST(0x0000AEAD0024CBEE AS DateTime), CAST(0x0000AEAD0024CBEE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3289, NULL, 11, 132, CAST(0x0000AEAD00264BD4 AS DateTime), CAST(0x0000AEAD00264BD4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3290, NULL, 9, 171, CAST(0x0000AEAD00290B44 AS DateTime), CAST(0x0000AEAD00290B44 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3291, NULL, 9, 172, CAST(0x0000AEAD002A2B82 AS DateTime), CAST(0x0000AEAD002A2B82 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3292, NULL, 9, 173, CAST(0x0000AEAD002B66B0 AS DateTime), CAST(0x0000AEAD002B66B0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3293, NULL, 18, 93, CAST(0x0000AEAD002C7976 AS DateTime), CAST(0x0000AEAD002C7976 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3294, NULL, 18, 94, CAST(0x0000AEAD002DA911 AS DateTime), CAST(0x0000AEAD002DA911 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3295, NULL, 12, 162, CAST(0x0000AEAD002ECA19 AS DateTime), CAST(0x0000AEAD002ECA19 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3296, NULL, 12, 163, CAST(0x0000AEAD00301D23 AS DateTime), CAST(0x0000AEAD00301D23 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3297, NULL, 10, 103, CAST(0x0000AEAD00357BBF AS DateTime), CAST(0x0000AEAD00357BBF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3298, NULL, 10, 104, CAST(0x0000AEAD0036C675 AS DateTime), CAST(0x0000AEAD0036C675 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3299, NULL, 10, 95, CAST(0x0000AEAD0037E558 AS DateTime), CAST(0x0000AEAD0037E558 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3300, NULL, 10, 96, CAST(0x0000AEAD00394A79 AS DateTime), CAST(0x0000AEAD00394A79 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3301, NULL, 10, 97, CAST(0x0000AEAD003A94D5 AS DateTime), CAST(0x0000AEAD003A94D5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3302, NULL, 10, 98, CAST(0x0000AEAD003C0F7A AS DateTime), CAST(0x0000AEAD003C0F7A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3303, NULL, 10, 99, CAST(0x0000AEAD003D59DA AS DateTime), CAST(0x0000AEAD003D59DA AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3304, NULL, 11, 133, CAST(0x0000AEAD003ED74C AS DateTime), CAST(0x0000AEAD003ED74C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3305, NULL, 11, 134, CAST(0x0000AEAD004040FC AS DateTime), CAST(0x0000AEAD004040FC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3306, NULL, 11, 135, CAST(0x0000AEAD00419529 AS DateTime), CAST(0x0000AEAD00419529 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3307, NULL, 11, 138, CAST(0x0000AEAD0042F381 AS DateTime), CAST(0x0000AEAD0042F381 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3308, NULL, 11, 139, CAST(0x0000AEAD00445C99 AS DateTime), CAST(0x0000AEAD00445C99 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3309, NULL, 11, 140, CAST(0x0000AEAD0045C738 AS DateTime), CAST(0x0000AEAD0045C738 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3310, NULL, 9, 174, CAST(0x0000AEAD004710BC AS DateTime), CAST(0x0000AEAD004710BC AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3311, NULL, 11, 141, CAST(0x0000AEAD004880AF AS DateTime), CAST(0x0000AEAD004880AF AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3312, NULL, 9, 175, CAST(0x0000AEAD0049EB3C AS DateTime), CAST(0x0000AEAD0049EB3C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3313, NULL, 10, 105, CAST(0x0000AEAD0057FE99 AS DateTime), CAST(0x0000AEAD0057FE99 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3314, NULL, 10, 106, CAST(0x0000AEAD00593F61 AS DateTime), CAST(0x0000AEAD00593F61 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3315, NULL, 11, 142, CAST(0x0000AEAD005BEBAE AS DateTime), CAST(0x0000AEAD005BEBAE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3316, NULL, 11, 143, CAST(0x0000AEAD005D3E64 AS DateTime), CAST(0x0000AEAD005D3E64 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3317, NULL, 11, 144, CAST(0x0000AEAD005E67A1 AS DateTime), CAST(0x0000AEAD005E67A1 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3318, NULL, 11, 145, CAST(0x0000AEAD005FB081 AS DateTime), CAST(0x0000AEAD005FB081 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3319, NULL, 11, 146, CAST(0x0000AEAD00610593 AS DateTime), CAST(0x0000AEAD00610593 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3320, NULL, 11, 147, CAST(0x0000AEAD00624A2F AS DateTime), CAST(0x0000AEAD00624A2F AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3321, NULL, 11, 148, CAST(0x0000AEAD00639F58 AS DateTime), CAST(0x0000AEAD00639F58 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3322, NULL, 11, 149, CAST(0x0000AEAD006500DE AS DateTime), CAST(0x0000AEAD006500DE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3323, NULL, 11, 150, CAST(0x0000AEAD00666742 AS DateTime), CAST(0x0000AEAD00666742 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3324, NULL, 11, 151, CAST(0x0000AEAD00676EA3 AS DateTime), CAST(0x0000AEAD00676EA3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3325, NULL, 23, 119, CAST(0x0000AEAD0069D6C0 AS DateTime), CAST(0x0000AEAD0069D6C0 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3326, NULL, 23, 120, CAST(0x0000AEAD006B0AD8 AS DateTime), CAST(0x0000AEAD006B0AD8 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3327, NULL, 23, 121, CAST(0x0000AEAD006C80C4 AS DateTime), CAST(0x0000AEAD006C80C4 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3328, NULL, 11, 136, CAST(0x0000AEAD006DD887 AS DateTime), CAST(0x0000AEAD006DD887 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3329, NULL, 11, 137, CAST(0x0000AEAD006F57C9 AS DateTime), CAST(0x0000AEAD006F57C9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3330, NULL, 23, 122, CAST(0x0000AEAD0070A349 AS DateTime), CAST(0x0000AEAD0070A349 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3331, NULL, 23, 123, CAST(0x0000AEAD0071FB37 AS DateTime), CAST(0x0000AEAD0071FB37 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3332, NULL, 23, 124, CAST(0x0000AEAD007393A6 AS DateTime), CAST(0x0000AEAD007393A6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3333, NULL, 23, 125, CAST(0x0000AEAD00754688 AS DateTime), CAST(0x0000AEAD00754688 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3334, NULL, 23, 126, CAST(0x0000AEAD0077030E AS DateTime), CAST(0x0000AEAD0077030E AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3335, NULL, 23, 127, CAST(0x0000AEAD0078C178 AS DateTime), CAST(0x0000AEAD0078C178 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3336, NULL, 23, 128, CAST(0x0000AEAD007AA638 AS DateTime), CAST(0x0000AEAD007AA638 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3337, NULL, 23, 129, CAST(0x0000AEAD00849200 AS DateTime), CAST(0x0000AEAD00849200 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3338, NULL, 23, 130, CAST(0x0000AEAD0086B422 AS DateTime), CAST(0x0000AEAD0086B422 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3339, NULL, 22, 107, CAST(0x0000AEAD008A7342 AS DateTime), CAST(0x0000AEAD008A7342 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3340, NULL, 22, 108, CAST(0x0000AEAD008BFA18 AS DateTime), CAST(0x0000AEAD008BFA18 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3341, NULL, 22, 109, CAST(0x0000AEAD008D8559 AS DateTime), CAST(0x0000AEAD008D8559 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3342, NULL, 22, 110, CAST(0x0000AEAD008F1845 AS DateTime), CAST(0x0000AEAD008F1845 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3343, NULL, 22, 111, CAST(0x0000AEAD0090C618 AS DateTime), CAST(0x0000AEAD0090C618 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3344, NULL, 22, 112, CAST(0x0000AEAD0092485A AS DateTime), CAST(0x0000AEAD0092485A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3345, NULL, 22, 113, CAST(0x0000AEAD00944704 AS DateTime), CAST(0x0000AEAD00944704 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3346, NULL, 22, 114, CAST(0x0000AEAD0095EBC1 AS DateTime), CAST(0x0000AEAD0095EBC1 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3347, NULL, 22, 115, CAST(0x0000AEAD00977508 AS DateTime), CAST(0x0000AEAD00977508 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3348, NULL, 22, 116, CAST(0x0000AEAD00991421 AS DateTime), CAST(0x0000AEAD00991421 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3349, NULL, 17, 64, CAST(0x0000AEAD00A2BB6A AS DateTime), CAST(0x0000AEAD00A2BB6A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3350, NULL, 18, 83, CAST(0x0000AEAD00A82DB9 AS DateTime), CAST(0x0000AEAD00A82DB9 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3351, NULL, 12, 152, CAST(0x0000AEAD00AE34E2 AS DateTime), CAST(0x0000AEAD00AE34E2 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3352, NULL, 22, 117, CAST(0x0000AEAD00B11CB6 AS DateTime), CAST(0x0000AEAD00B11CB6 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3353, NULL, 22, 118, CAST(0x0000AEAD00B23E91 AS DateTime), CAST(0x0000AEAD00B23E91 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3354, NULL, 2013, 2039, CAST(0x0000AEAD00E31C06 AS DateTime), CAST(0x0000AEAD00E31C06 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3355, NULL, 2015, 2043, CAST(0x0000AEAD00EB9B03 AS DateTime), CAST(0x0000AEAD00EB9B03 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3356, NULL, 2015, 2043, CAST(0x0000AEAD00F59B2A AS DateTime), CAST(0x0000AEAD00F59B2A AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3357, NULL, 17, 74, CAST(0x0000AEAD01027CC5 AS DateTime), CAST(0x0000AEAD01027CC5 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3358, NULL, 9, 164, CAST(0x0000AEAD0107A059 AS DateTime), CAST(0x0000AEAD0107A059 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3359, NULL, 18, 93, CAST(0x0000AEAD010C4561 AS DateTime), CAST(0x0000AEAD010C4561 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3360, NULL, 10, 95, CAST(0x0000AEAD010DAE4C AS DateTime), CAST(0x0000AEAD010DAE4C AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3361, NULL, 23, 119, CAST(0x0000AEAD0112155D AS DateTime), CAST(0x0000AEAD0112155D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3362, NULL, 22, 107, CAST(0x0000AEAD01167317 AS DateTime), CAST(0x0000AEAD01167317 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3363, NULL, 11, 132, CAST(0x0000AEAD011A942D AS DateTime), CAST(0x0000AEAD011A942D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3364, 2, 2016, 2046, CAST(0x0000AEAD013C8D52 AS DateTime), CAST(0x0000AEAD013C8D52 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3365, NULL, 1, 1, CAST(0x0000AEAE00B27364 AS DateTime), CAST(0x0000AEAE00B27364 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3366, NULL, 7, 176, CAST(0x0000AEAE00B2B11D AS DateTime), CAST(0x0000AEAE00B2B11D AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3367, NULL, 1, 1, CAST(0x0000AEAE00BED5D3 AS DateTime), CAST(0x0000AEAE00BED5D3 AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3368, NULL, 1007, 1012, CAST(0x0000AEAE0184C4FE AS DateTime), CAST(0x0000AEAE0184C4FE AS DateTime))
INSERT [dbo].[DB_LUOTXEM] ([id], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (3369, 1013, 2017, 2047, CAST(0x0000AEAE0186FB17 AS DateTime), CAST(0x0000AEAE0186FB17 AS DateTime))
SET IDENTITY_INSERT [dbo].[DB_LUOTXEM] OFF
SET IDENTITY_INSERT [dbo].[DB_PHIM] ON 

INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (1, 2, N'Spy x Family', N'Cập nhật', N'Nhật Bản', N'2022      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Đặc vụ &amp;quot;Twilight&amp;quot; của Westalis được cử tr&amp;agrave; trộn v&amp;agrave;o nước địch để th&amp;aacute;m s&amp;aacute;t kẻ th&amp;ugrave; đang c&amp;oacute; &amp;acirc;m mưu ph&amp;aacute; hoại nền h&amp;ograve;a b&amp;igrave;nh đ&amp;ocirc;ng t&amp;acirc;y. V&amp;igrave; t&amp;iacute;nh chất của nhiệm vụ, bậc thầy cải trang Twilight bắt buộc phải lập gia đ&amp;igrave;nh v&amp;agrave; c&amp;oacute; con th&amp;igrave; mới c&amp;oacute; thể tiếp cận được mục ti&amp;ecirc;u. Với một kẻ chưa từng c&amp;oacute; người th&amp;acirc;n v&amp;agrave; lu&amp;ocirc;n l&amp;agrave;m việc một m&amp;igrave;nh, Twilight sớm t&amp;igrave;m thấy m&amp;igrave;nh mắc kẹt trong chuyện gia đ&amp;igrave;nh dở kh&amp;oacute;c dở cười.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'spy-x-family-141141', 1, N'141image_processing20220424-5848-1mbxhr3.jpg', N'0                   ', CAST(0x0000AE88016332CD AS DateTime), CAST(0x0000AEAB01284DB5 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (2, 2, N'One Piece Movie 2012- One Piece Film Z Tập Full', N'Nagamine Tatsuya', N'Nhật Bản', N'2012      ', N'&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;One Piece Film: Z l&amp;agrave; t&amp;aacute;c phẩm điện ảnh thứ 12 trong loạt c&amp;acirc;u chuyện về băng đảng hải tặc Mũ rơm do ch&amp;iacute;nh thuyền trưởng Monkey D. Luffy dẫn đầu. One Piece Film Z được sản xuất bởi ch&amp;iacute;nh t&amp;aacute;c giả truyện tranh Oda Eiichiro, với sự trợ gi&amp;uacute;p kịch bản từ Suzuki Osamu, đạo diễn Nagamine Tatsuya.&amp;nbsp;&lt;/span&gt;&lt;/p&gt;
', N'one-piece-movie-2012--one-piece-film-z-tap-full-81928192', 1, N'8192one-piece-film-z.png', N'0                   ', CAST(0x0000AE880166152A AS DateTime), CAST(0x0000AE8A00F4BE37 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (3, 2, N'Cơ Trưởng Sully.', N'Cập nhật', N'Mỹ', N'2018      ', N'&lt;p&gt;.&lt;/p&gt;
', N'co-truong-sully--86998699', 1, N'8699sully-poster.jpg', N'2                   ', CAST(0x0000AE8801669D80 AS DateTime), CAST(0x0000AEA8014C5304 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (4, 2, N'Date A Live IV', N'Cập nhật', N'Nhật Bản', N'2022      ', N'&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;Phần thứ tư của series Date a Live&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'date-a-live-iv-62276227', 1, N'5355xbHnwRm.png', N'0                   ', CAST(0x0000AE8C01603648 AS DateTime), CAST(0x0000AEAA00AD5868 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (5, 2, N'Mahouka Koukou No Rettousei', N'Cập nhật', N'Nhật Bản', N'2014      ', N'&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Ph&amp;eacute;p thuật, đ&amp;oacute; kh&amp;ocirc;ng c&amp;ograve;n l&amp;agrave; truyền thuyết hay một c&amp;acirc;u chuyện cổ t&amp;iacute;ch nữa.N&amp;oacute; đ&amp;atilde; trở th&amp;agrave;nh một c&amp;ocirc;ng nghệ thực tiễn từ gần một thế kỷ nay. Ph&amp;aacute;p sư, đ&amp;oacute; l&amp;agrave; c&amp;aacute;ch m&amp;agrave; người ta gọi những con người mang trong m&amp;igrave;nh một t&amp;agrave;i năng ph&amp;eacute;p thuật ưu việt. Đối với c&amp;aacute;c quốc gia, sự tồn tại của con người n&amp;agrave;y ch&amp;iacute;nh l&amp;agrave; những vũ kh&amp;iacute; mạnh mẽ. Nhiều quốc gia tr&amp;ecirc;n thế giới đ&amp;atilde; bị cuốn v&amp;agrave;o v&amp;ograve;ng xo&amp;aacute;y của cuộc chạy đua tr&amp;ecirc;n lĩnh vực đ&amp;agrave;o tạo ma ph&amp;aacute;p.&lt;/span&gt;&lt;/p&gt;
', N'mahouka-koukou-no-rettousei-71147114', 1, N'7114mahouka-koukou-no-rettousei-truong-hoc-phap-thuat.jpg', N'0                   ', CAST(0x0000AE8C016378E5 AS DateTime), CAST(0x0000AE8E0012E79F AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (6, 2, N'Mahouka Koukou No Rettousei 2', N'Cập nhật', N'Nhật Bản', N'2022      ', N'&lt;p&gt;Phần 2 của tựa phim&amp;nbsp;Mahouka Koukou no Rettousei.&lt;/p&gt;
', N'mahouka-koukou-no-rettousei-2-93129312', 1, N'93122c295504c5b69763_0e80b0a0a2dbb71e_12526615703623268185710.jpg', N'0                   ', CAST(0x0000AE8D01599589 AS DateTime), CAST(0x0000AE8D015D45AB AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (7, 2, N'Nhạc sưu tầm', N'Cập nhật', N'Nhật Bản', N'2022      ', N'&lt;p&gt;danh s&amp;aacute;ch nhạc nghe&lt;/p&gt;
', N'muon-em-la---keyo-k-ut-nhi-cover-386386', 1, N'3831pioneer-5450710_12801.png', N'0                   ', CAST(0x0000AE8E0012556A AS DateTime), CAST(0x0000AE9800FDD88E AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (8, 2, N'Kaguya-sama wa Kokurasetai Phần 3', N'Cập nhật', N'Nhật Bản', N'2022      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;img alt=&quot;&quot; src=&quot;/public/nguoidung/Images/duyvo/images/hlz6G90.png&quot; style=&quot;height:40px; width:40px&quot; /&gt;Phần thứ của series Kaguya-sama.&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'kaguya-sama-wa-kokurasetai-phan-3-30453045', 1, N'1228big.jpg', N'0                   ', CAST(0x0000AE8E01053EEF AS DateTime), CAST(0x0000AEAB006B3293 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (9, 2, N'One-Punch Man', N'Natsume Shingo', N'Nhật Bản', N'2015      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Ở một&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/wiki/Si%C3%AAu_l%E1%BB%A5c_%C4%91%E1%BB%8Ba&quot; title=&quot;Si&#234;u lục địa&quot;&gt;si&amp;ecirc;u lục địa&lt;/a&gt;&amp;nbsp;tr&amp;ecirc;n Tr&amp;aacute;i Đất giả tưởng, những con qu&amp;aacute;i vật v&amp;agrave; kẻ độc &amp;aacute;c đ&amp;atilde; v&amp;agrave; đang t&amp;agrave;n ph&amp;aacute; nhiều th&amp;agrave;nh phố. Để đối ph&amp;oacute; với ch&amp;uacute;ng, triệu ph&amp;uacute; Agoni đ&amp;atilde; s&amp;aacute;ng lập n&amp;ecirc;n Hiệp hội Anh H&amp;ugrave;ng để tập hợp c&amp;aacute;c si&amp;ecirc;u anh h&amp;ugrave;ng chiến đấu chống lại c&amp;aacute;i &amp;aacute;c. Saitama l&amp;agrave; c&amp;ocirc;ng d&amp;acirc;n của th&amp;agrave;nh phố Z, ban đầu l&amp;agrave; một anh h&amp;ugrave;ng tự xưng kh&amp;ocirc;ng thuộc tổ chức. Anh ra tay diệt qu&amp;aacute;i như một bậc trượng nghĩa chủ yếu v&amp;igrave; sở th&amp;iacute;ch c&amp;aacute; nh&amp;acirc;n. Trong 3 năm, Saitama r&amp;egrave;n luyện bản th&amp;acirc;n đến mức c&amp;oacute; thể đ&amp;aacute;nh bại bất kỳ kẻ th&amp;ugrave; n&amp;agrave;o chỉ bằng một đấm, nhưng sức mạnh v&amp;ocirc; song kh&amp;ocirc;ng đối thủ n&amp;agrave;y khiến anh cảm thấy ch&amp;aacute;n nản v&amp;ocirc; c&amp;ugrave;ng. Cuộc đời buồn ch&amp;aacute;n của Saitama trở n&amp;ecirc;n khởi sắc hơn một ch&amp;uacute;t kể từ l&amp;uacute;c anh l&amp;amp;agra &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'one-punch-man-75247524', 1, N'6369742318.jpg', N'0                   ', CAST(0x0000AE9501409EFF AS DateTime), CAST(0x0000AE9700FF604C AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (10, 2, N'Gakusen Toshi Asterisk', N'Kenji Seto', N'Nhật Bản', N'2015      ', N'&lt;p style=&quot;margin-left:0px; margin-right:0px; text-align:start&quot;&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Gakusen Toshi Asterisk | The Asterisk War: The Academy City on the Water | Academy Battle City Asterisk l&amp;agrave; bộ tiểu thuyết thuộc thể loại h&amp;agrave;nh động, khoa học viễn tưởng do Miyazaki Yuu s&amp;aacute;ng t&amp;aacute;c v&amp;agrave; okiura vẽ minh hoạ. Bối cảnh diễn ra c&amp;acirc;u chuyện l&amp;agrave; Học viện Seidokan nằm tr&amp;ecirc;n th&amp;agrave;nh phố nổi Rikka, nơi tổ chức sự kiện Star Wars. Đ&amp;oacute; l&amp;agrave; một sự kiện trọng đại của thế giới, tập trung những chiến binh trẻ tuổi t&amp;agrave;i giỏi đến từ 6 ng&amp;ocirc;i trường kh&amp;aacute;c nhau nhằm t&amp;igrave;m ra người đứng đầu.&amp;nbsp;&lt;br /&gt;
&lt;br /&gt;
Nh&amp;acirc;n vật ch&amp;iacute;nh l&amp;agrave; Ayato Amagiri đ&amp;atilde; chuyển đến Rikka sau khi nhận được lời mời của Chủ tịch Hội học sinh trường Seidoukan. Nhưng ngay ng&amp;agrave;y đầu ti&amp;ecirc;n nhập học, anh đ&amp;atilde; v&amp;ocirc; t&amp;igrave;nh chọc giận c&amp;ocirc; n&amp;agrave;ng hung dữ Julis với biệt danh &amp;ldquo;Hoả c&amp;ocirc;ng ch&amp;uacute;a&amp;rdquo;.&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;span style=&quot;color:#202122&quot;&gt;&lt;span style=&quot;background-color:#ffffff&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'gakusen-toshi-asterisk-84238423', 1, N'8423Gakusen-Toshi-Asterisk-ss1.jpg', N'0                   ', CAST(0x0000AE9501422779 AS DateTime), CAST(0x0000AE9600AEB6DD AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (11, 2, N'NiseKoi Phần 1', N'Cập nhật', N'Nhật Bản', N'2014      ', N'&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;em&gt;Nisekoi&lt;/em&gt;&amp;nbsp;kể về chuyện t&amp;igrave;nh tay ba xoay quanh Ichijō Raku, Kirisaki Chitoge v&amp;agrave; Onodera Kosaki. Raku l&amp;agrave; con trai của &amp;ocirc;ng tr&amp;ugrave;m băng đảng&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/wiki/Yakuza&quot; title=&quot;Yakuza&quot;&gt;yakuza&lt;/a&gt;&amp;nbsp;t&amp;ecirc;n Shuei-gumi v&amp;agrave; cậu đang thầm th&amp;iacute;ch bạn học c&amp;ugrave;ng lớp Kosaki. Trong ng&amp;agrave;y đầu ti&amp;ecirc;n đi học, một c&amp;ocirc; g&amp;aacute;i đ&amp;atilde; nhảy qua bức tường để v&amp;agrave;o kịp giờ học, v&amp;agrave; kh&amp;ocirc;ng may đạp đầu gối v&amp;agrave;o mặt Raku. Sau khi xin lỗi, c&amp;ocirc; liền vội chạy đi. Một l&amp;uacute;c sau, ở trong lớp học, Raku mới nhận ra rằng m&amp;igrave;nh l&amp;agrave;m rơi mất kỉ vật l&amp;agrave; chiếc ổ kh&amp;oacute;a của c&amp;ocirc; b&amp;eacute; đ&amp;atilde; trao tặng c&amp;aacute;ch đ&amp;acirc;y 10 năm với lời hứa:&amp;nbsp;&lt;em&gt;&amp;quot;Cậu giữ kh&amp;oacute;a... Tớ giữ ch&amp;igrave;a... Sau khi ch&amp;uacute;ng ta xa nhau rồi, cậu phải lu&amp;ocirc;n cẩn thận mang theo n&amp;oacute; nh&amp;eacute;... Khi lớn l&amp;ecirc;n, nếu cậu thấy c&amp;oacute; ai đ&amp;oacute; cầm ch&amp;igrave;a, h&amp;atilde;y mở kho&amp;aacute;...V&amp;agrave; c&amp;ugrave;ng kết h&amp;ocirc;n nh&amp;eacute;...&amp;quot;&lt;/em&gt;, m&amp;agrave; Raku đang hi vọng rằng Kosaki c&amp;oacute; thể l&amp;agrave; &lt;/span&gt;&lt;/p&gt;
', N'nisekoi-phan-1-74447444', 1, N'7444nisekoi-banner-nisekoi-40315777-702-336.jpg', N'0                   ', CAST(0x0000AE9501439ECB AS DateTime), CAST(0x0000AE9800FDFED7 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (12, 2, N'NiseKoi Phần 2', N'Cập nhật', N'Nhật Bản', N'2014      ', N'&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;M&amp;ugrave;a 2 của&amp;nbsp;NiseKoi&amp;nbsp;&lt;/span&gt;&lt;/p&gt;
', N'nisekoi-phan-2-14611461', 1, N'5048Nisekoi-False-Love-ss1.jpg', N'0                   ', CAST(0x0000AE9501457711 AS DateTime), CAST(0x0000AE9800FE129D AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (17, 2, N'Kaguya-sama wa Kokurasetai Phần 1', N'Cập nhật', N'Nhật Bản', N'2019      ', N'&lt;p&gt;Shirogane Miyuki v&amp;agrave; Shinomiya Kaguya l&amp;agrave; hai th&amp;agrave;nh vi&amp;ecirc;n của Hội Học Sinh thuộc Học Viện&amp;nbsp;Shuchiin cao qu&amp;yacute; d&amp;agrave;nh cho c&amp;aacute;c thi&amp;ecirc;n t&amp;agrave;i v&amp;agrave; con c&amp;aacute;i nh&amp;agrave; gi&amp;agrave;u c&amp;oacute;. Hai c&amp;ocirc; cậu n&amp;agrave;y c&amp;oacute; một quy luật trong t&amp;igrave;nh y&amp;ecirc;u, &amp;quot;Ai y&amp;ecirc;u trước sẽ l&amp;agrave; người thua cuộc.&amp;quot;, v&amp;agrave; do đ&amp;oacute; chẳng ai d&amp;aacute;m thổ lộ với ai cả. C&amp;aacute;ch duy nhất để họ đến với nhau l&amp;agrave; &amp;eacute;p đối phương&amp;nbsp;tự tỏ t&amp;igrave;nh với m&amp;igrave;nh, v&amp;agrave; từ đ&amp;oacute; họ vạch ra nhiều thủ đoạn chơi khăm nhau, nhiều tr&amp;ograve; dở kh&amp;oacute;c dở cười để đạt được điều đ&amp;oacute;.&lt;/p&gt;
', N'kaguya-sama-wa-kokurasetai-phan-1-91889188', 1, N'9188W56RVO6IONAP7IBWMJZGSH5P74.jpg', N'0                   ', CAST(0x0000AE95016FF242 AS DateTime), CAST(0x0000AE95017C9610 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (18, 2, N'Kaguya-sama wa Kokurasetai Phần 2', N'Cập nhật', N'Nhật Bản', N'2020      ', N'&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Phần 2 của Kaguya-sama wa Kokurasetai&lt;/span&gt;&lt;/p&gt;
', N'kaguya-sama-wa-kokurasetai-phan-2-84938493', 1, N'659253611344_289293033065077_3970176217112146227_n.jpg', N'0                   ', CAST(0x0000AE95017279D9 AS DateTime), CAST(0x0000AE9700F4C663 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (22, 2, N' Gakusen Toshi Asterisk Phần 2', N'Cập nhật', N'Nhật Bản', N'2016      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Tiếp c&amp;acirc;u truyện SS1.&amp;nbsp;Nh&amp;acirc;n vật ch&amp;iacute;nh l&amp;agrave; Ayato Amagiri đ&amp;atilde; chuyển đến Rikka sau khi nhận được lời mời của Chủ tịch Hội học sinh trường Seidoukan. Nhưng ngay ng&amp;agrave;y đầu ti&amp;ecirc;n nhập học, anh đ&amp;atilde; v&amp;ocirc; t&amp;igrave;nh chọc giận c&amp;ocirc; n&amp;agrave;ng hung dữ Julis với biệt danh &amp;ldquo;Hoả c&amp;ocirc;ng ch&amp;uacute;a&amp;rdquo;.&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'-gakusen-toshi-asterisk-phan-2-82318231', 1, N'8231Gakusen-Toshi-Asterisk-ss2.jpg', N'0                   ', CAST(0x0000AE9600A85F23 AS DateTime), CAST(0x0000AE9600B2E542 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (23, 2, N'Rakudai Kishi no Cavalry | Sử Thi Về Một Hiệp Sĩ Lưu Ban', N'Cập nhật', N'Nhật Bản', N'2015      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;T&amp;ecirc;n kh&amp;aacute;c : A Chivalry of the Failed Knight, Rakudai Kishi no Eiyuutan, A Tale of Worst One. C&amp;acirc;u truyện xoay quanh những Hiệp sĩ Ph&amp;aacute;p thuật &amp;ndash; những người c&amp;oacute; thể sử dụng ma thuật v&amp;agrave; chiến đấu bằng thứ vũ kh&amp;iacute; được tạo ra bởi ch&amp;iacute;nh linh hồn của họ. Kurogane Ikki đ&amp;atilde; ghi danh v&amp;agrave;o học tại một ng&amp;ocirc;i trường d&amp;agrave;nh cho những người như vậy, nhưng cậu lại bị coi l&amp;agrave; &amp;ldquo;một thất bại&amp;rdquo; hay &amp;ldquo;Hiệp sĩ tệ nhất&amp;rdquo; bởi kh&amp;ocirc;ng hề c&amp;oacute; kỹ năng sử dụng ma thuật. Thế rồi, một ng&amp;agrave;y nọ, Kurogane đ&amp;atilde; bị Stella &amp;ndash; c&amp;ocirc;ng ch&amp;uacute;a đến từ vương quốc kh&amp;aacute;c, v&amp;agrave; cũng l&amp;agrave; người c&amp;oacute; th&amp;agrave;nh t&amp;iacute;ch đứng đầu của học viện &amp;ndash; th&amp;aacute;ch đấu. Trong trận đấu tay đ&amp;ocirc;i n&amp;agrave;y, &amp;ldquo;kẻ thua sẽ phải tu&amp;acirc;n theo người thắng suốt phần đời c&amp;ograve;n lại&amp;rdquo;, v&amp;agrave; h&amp;atilde;y thử đo&amp;aacute;n xem ai đ&amp;atilde; chiến thắng?&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'rakudai-kishi-no-cavalry-k-su-thi-ve-mot-hiep-si-luu-ban-81788178', 1, N'817843be674677fb835d0c7f0fec4e402910.jpg', N'0                   ', CAST(0x0000AE9600AADD7F AS DateTime), CAST(0x0000AE9600B7CD54 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (24, 2, N'Overlord Phần 1', N'Cập nhật', N'Nhật Bản', N'2015      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;em&gt;Overlord&lt;/em&gt;&amp;nbsp;lấy bối cảnh v&amp;agrave;o năm 2138 trong tương lai, khi khoa học c&amp;ocirc;ng nghệ ph&amp;aacute;t triển vượt bậc v&amp;agrave; ng&amp;agrave;nh game thực tế ảo đang nở rộ hơn bao giờ hết. C&amp;acirc;u chuyện bắt đầu trong những gi&amp;acirc;y ph&amp;uacute;t cuối tại tại Yggdrasil, một game online đ&amp;igrave;nh đ&amp;aacute;m sắp phải đ&amp;oacute;ng cửa. Nh&amp;acirc;n vật ch&amp;iacute;nh Momonga quyết định ở lại đến tận những ph&amp;uacute;t cuối c&amp;ugrave;ng với tr&amp;ograve; chơi y&amp;ecirc;u th&amp;iacute;ch của m&amp;igrave;nh v&amp;agrave; chờ server down. Bất ngờ, server kh&amp;ocirc;ng shutdown, Momonga bị mắc kẹt trong nh&amp;acirc;n vật của ch&amp;iacute;nh m&amp;igrave;nh v&amp;agrave; dịch chuyển tới một thế giới kh&amp;aacute;c. Vị ch&amp;uacute;a tể h&amp;ugrave;ng mạnh của đại lăng tẩm Nazarick giờ đ&amp;acirc;y lại tiếp tục đi kh&amp;aacute;m ph&amp;aacute; thế giới mới v&amp;agrave; đối mặt với những thử th&amp;aacute;ch mới. Kh&amp;ocirc;ng gia đ&amp;igrave;nh, bạn b&amp;egrave;, địa vị x&amp;atilde; hội, người đ&amp;agrave;n &amp;ocirc;ng b&amp;igrave;nh thường ấy sẽ cố gắng hết sức để thống trị thế giới mới n&amp;agrave;y.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'overlord-phan-1-49074907', 1, N'4907overlord-1.jpg', N'0                   ', CAST(0x0000AE9800EDB025 AS DateTime), CAST(0x0000AE9800F395C7 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (25, 2, N'Overlord Phần 2', N'Cập nhật', N'Nhật Bản', N'2018      ', N'&lt;p&gt;Overlord phần 2, SS2&lt;/p&gt;
', N'overlord-phan-2-60756075', 1, N'6075sieu-pham-isekai-overlord-se-co-season-4-va-anime-movie.jpg', N'0                   ', CAST(0x0000AE9800EE12A5 AS DateTime), CAST(0x0000AE9800F3A18D AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (1004, 2, N'Nhím Sonic', N'Jeff Fowler', N'Mỹ', N'2020      ', N'&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;Nh&amp;iacute;m Sonic&amp;nbsp;(t&amp;ecirc;n gốc&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/wiki/Ti%E1%BA%BFng_Anh&quot; title=&quot;Tiếng Anh&quot;&gt;tiếng Anh&lt;/a&gt;:&amp;nbsp;Sonic the Hedgehog) l&amp;agrave; phim điện ảnh&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/wiki/Phim_h%C3%A0i&quot; title=&quot;Phim h&#224;i&quot;&gt;h&amp;agrave;i hước&lt;/a&gt;&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/wiki/Phim_phi%C3%AAu_l%C6%B0u&quot; title=&quot;Phim phi&#234;u lưu&quot;&gt;phi&amp;ecirc;u lưu h&amp;agrave;nh động&lt;/a&gt;&amp;nbsp;của Mỹ v&amp;agrave; Nhật Bản năm 2020 dựa tr&amp;ecirc;n loạt video game&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/w/index.php?title=Sonic_the_Hedgehog&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Sonic the Hedgehog (trang kh&#244;ng tồn tại)&quot;&gt;Sonic the Hedgehog&lt;/a&gt;&amp;nbsp;do h&amp;atilde;ng&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/wiki/Sega&quot; title=&quot;Sega&quot;&gt;Sega&lt;/a&gt;&amp;nbsp;ph&amp;aacute;t h&amp;agrave;nh. Đ&amp;acirc;y l&amp;agrave; phim điện ảnh đạo diễn đầu tay của&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/w/index.php?title=Jeff_Fowler&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Jeff Fowler (trang kh&#244;ng tồn tại)&quot;&gt;Jeff Fowler&lt;/a&gt;, với phần kịch bản do&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/w/index.php?title=Patrick_Casey_(nh%C3%A0_v%C4%83n)&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Patrick Casey (nh&#224; văn) (trang kh&#244;ng tồn tại)&quot;&gt;Pat Casey&lt;/a&gt;&amp;nbsp;v&amp;agrave;&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/w/index.php?title=Josh_Miller_(nh%C3%A0_l%C3%A0m_phim)&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Josh Miller (nh&#224; l&#224;m phim) (trang kh&#244;ng tồn tại)&quot;&gt;Josh Miller&lt;/a&gt;&amp;nbsp;đảm nhiệm. Bộ phim c&amp;oacute; sự g&amp;oacute;p mặt của&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/wiki/James_Marsden&quot; title=&quot;James Marsden&quot;&gt;James Marsden&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/wiki/Jim_Carrey&quot; title=&quot;Jim Carrey&quot;&gt;Jim Carrey&lt;/a&gt;, v&amp;agrave;&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/w/index.php?title=Ben_Schwartz&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Ben Schwartz (trang kh&#244;ng tồn tại)&quot;&gt;Ben Schwartz&lt;/a&gt;&amp;nbsp;lồng tiếng cho&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/wiki/Nh%C3%ADm_Sonic_(nh%C3%A2n_v%E1%BA%ADt)&quot; title=&quot;Nh&#237;m Sonic (nh&#226;n vật)&quot;&gt;nh&amp;iacute;m Sonic&lt;/a&gt;. Trong phim, Sonic đồng h&amp;agrave;nh với một cảnh s&amp;aacute;t trưởng t&amp;ecirc;n Tom của một thị trấn nhỏ trong khi đang cố trốn tho&amp;aacute;t&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/w/index.php?title=B%C3%A1c_s%C4%A9_Eggman&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;B&#225;c sĩ Eggman (trang kh&#244;ng tồn tại)&quot;&gt;Tiến sĩ Robotnik&lt;/a&gt;&amp;nbsp;v&amp;agrave; ch&amp;iacute;nh phủ.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p style=&quot;text-align:justify&quot;&gt;&amp;nbsp;&lt;/p&gt;

&lt;p style=&quot;text-align:justify&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;Qu&amp;aacute; tr&amp;igrave;nh thai ngh&amp;eacute;n một bộ phim điện ảnh về nh&amp;acirc;n vật Sonic bắt đầu từ những năm 1990, tuy nhi&amp;ecirc;n mọi thứ vẫn chỉ ở kh&amp;acirc;u lập kế hoạch cho đến khi&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/wiki/Sony_Pictures&quot; title=&quot;Sony Pictures&quot;&gt;Sony Pictures&lt;/a&gt;&amp;nbsp;mua lại quyền thương mại phim v&amp;agrave;o năm 2013. Đến năm 2014, bộ phim chuyển thể đang trong giai đoạn ph&amp;aacute;t triển, với Fowler được thu&amp;ecirc; l&amp;agrave;m đạo diễn cho phim v&amp;agrave;o năm 2016. Sau khi Sony đưa dự &amp;aacute;n v&amp;agrave;o&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/w/index.php?title=Turnaround_(filmmaking)&amp;amp;action=edit&amp;amp;redlink=1&quot; title=&quot;Turnaround (filmmaking) (trang kh&#244;ng tồn tại)&quot;&gt;chuyển nhượng&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/wiki/Paramount_Pictures&quot; title=&quot;Paramount Pictures&quot;&gt;Paramount Pictures&lt;/a&gt;&amp;nbsp;đ&amp;atilde; mua lại n&amp;oacute; v&amp;agrave;o năm 2017 v&amp;agrave; phần lớn c&amp;aacute;c diễn vi&amp;ecirc;n đ&amp;atilde; k&amp;yacute; kết v&amp;agrave;o th&amp;aacute;ng 8 năm 2018. Việc quay phim diễn ra từ th&amp;aacute;ng 7 đến th&amp;aacute;ng 10 năm 2018 tại Ladysmith v&amp;agrave; parkville đều tr&amp;ecirc;n&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/wiki/%C4%90%E1%BA%A3o_Vancouver&quot; title=&quot;Đảo Vancouver&quot;&gt;đảo Vancouver&lt;/a&gt;&amp;nbsp;v&amp;agrave;&amp;nbsp;&lt;a href=&quot;https://vi.wikipedia.org/wiki/Vancouver&quot; title=&quot;Vancouver&quot;&gt;Vancouver&lt;/a&gt;, British Columbia, Canada. Đ&amp;acirc;y l&amp;agrave; phim đầu ti&amp;ecirc;n trong một loạt phim theo kế hoạch.&lt;sup&gt;&lt;a href=&quot;https://vi.wikipedia.org/wiki/Nh%C3%ADm_Sonic_(phim)#cite_note-5&quot;&gt;[5]&lt;/a&gt;&lt;/sup&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'nhim-sonic-56645664', 1, N'5664NSThumbnail.jpg', N'10000               ', CAST(0x0000AE9F00D43343 AS DateTime), CAST(0x0000AEA700EE31FF AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (1005, 2, N'Trùm, Cớm và Ác Quỷ - The Gangster, the Cop, the Devil', N'Cập nhật', N'Hàn Quốc', N'2019      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Sẵn s&amp;agrave;ng l&amp;agrave;m t&amp;acirc;́t cả để bắt t&amp;ecirc;n sát nh&amp;acirc;n h&amp;agrave;ng loạt kh&amp;oacute; đoán, tay tr&amp;ugrave;m tội phạm mu&amp;ocirc;́n b&amp;aacute;o th&amp;ugrave; b&amp;acirc;́t đắc dĩ phải hợp tác với m&amp;ocirc;̣t vi&amp;ecirc;n cảnh s&amp;aacute;t gan l&amp;igrave;.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Xe của một người đ&amp;agrave;n &amp;ocirc;ng bị kẻ lạ đ&amp;acirc;m v&amp;agrave;o người, giết chết anh ta khi anh ta xuống để chụp ảnh thiệt hại để đ&amp;ograve;i tiền bảo hiểm xe.&amp;nbsp;Jung Tae-suk l&amp;agrave; một cảnh s&amp;aacute;t đi qua hiện trường vụ &amp;aacute;n v&amp;agrave; nghi ngờ đ&amp;oacute; l&amp;agrave; t&amp;aacute;c phẩm của một kẻ giết người h&amp;agrave;ng loạt, nhưng tiền bối của anh ta kh&amp;ocirc;ng tin anh ta.&amp;nbsp;Gangster Jang Dong-soo đang tr&amp;ecirc;n đường về nh&amp;agrave; sau cuộc họp th&amp;igrave; c&amp;ugrave;ng một t&amp;ecirc;n s&amp;aacute;t nh&amp;acirc;n t&amp;ocirc;ng v&amp;agrave;o xe của anh ta v&amp;agrave; cuối c&amp;ugrave;ng cố gắng giết anh ta.&amp;nbsp;Một cuộc chiến t&amp;agrave;n bạo xảy ra sau đ&amp;oacute;, khiến cả hai đều bị thương.&amp;nbsp;Cuối c&amp;ugrave;ng, kẻ giết người trốn tho&amp;aacute;t sau khi d&amp;ugrave;ng xe của Dong-soo đ&amp;acirc;m gục.&amp;nbsp;Dong-soo được đưa v&amp;agrave;o bệnh viện, v&amp;agrave; c&amp;aacute;c tay sai của anh ta cho rằng cuộc tấn c&amp;ocirc;ng l&amp;agrave; do một băng đảng đối thủ thực hiện, những kẻ m&amp;agrave; họ phản c&amp;ocirc;ng.&amp;nbsp;Tuy nhi&amp;ecirc;n, Dong-soo tin rằng kẻ giết người kh&amp;ocirc;ng phải l&amp;agrave; một th&amp;agrave;nh vi&amp;ecirc;n băng đảng đối thủ v&amp;igrave; h&amp;agrave;nh động của hắn dường như l&amp;agrave; ngẫu nhi&amp;ecirc;n v&amp;agrave; kh&amp;ocirc;ng c&amp;oacute; mục đ&amp;iacute;ch.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'trum--com-va-ac-quy-24892489', 1, N'2489AAAABcysjFCRYJj6vFBYMAwdl9VwRM7E3zH4QQphcD9j83pZ7xLlpDTjJK2rCUzhBYeV6D5VoE5WboJfRKIIMuJrLx8sGbapeWYWexEO.jpg', N'0                   ', CAST(0x0000AEA10116950E AS DateTime), CAST(0x0000AEA20086C5AD AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (1006, 2, N'ẤU TRÙNG TINH NGHỊCH: MẶT DÂY CHUYỀN', N'Cập nhật', N'Hàn Quốc', N'0         ', N'&lt;h2&gt;Ấu Tr&amp;ugrave;ng Tinh Nghịch: Mặt D&amp;acirc;y Truyền VietSub, Larva Pendant (2022)&lt;/h2&gt;

&lt;p&gt;Phần phim ngắn ngớ ngẩn tiếp theo của &amp;quot;Đảo ấu tr&amp;ugrave;ng&amp;quot; v&amp;agrave; &amp;quot;Bộ phim Đảo ấu tr&amp;ugrave;ng&amp;quot; xoay quanh những sự cố vụng về của đ&amp;ocirc;i bạn hay x&amp;igrave; hơi Đỏ v&amp;agrave; V&amp;agrave;ng trong th&amp;agrave;nh phố.&lt;/p&gt;
', N'au-trung-tinh-nghichk-mat-day-chuyen-58455845', 1, N'5845AAAABUMCbGoyUTi-VjXDO7BzPI3VZP9y7v4U772tpFwjyFhQyqUOjVY-9BPLzo6TUSTLIus2oTZHVRPh9u1EPK-lroXULT33mk_7-w_d.jpg', N'10                  ', CAST(0x0000AEA3014FDE11 AS DateTime), CAST(0x0000AEA700EB2B92 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (1007, 2, N'Sự Thức Tỉnh Của Vũ Khí Thần Bút Cửu Long Full Vietsub, The Treasure Code (2022)', N'Cập nhật', N'Trung Quốc', N'0         ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Thiếu Khanh K&amp;igrave; Lăng nhận được chỉ dụ b&amp;iacute; mật của ho&amp;agrave;ng đế truy t&amp;igrave;m &amp;quot;Cửu Long B&amp;uacute;t&amp;quot; với sức mạnh ma thuật si&amp;ecirc;u nhi&amp;ecirc;n đồng thời ph&amp;aacute; vỡ c&amp;aacute;c cơ mật. Sau nhiều lần điều tra, K&amp;igrave; Lăng ph&amp;aacute;t hiện ra rằng thứ n&amp;agrave;y thực sự c&amp;oacute; li&amp;ecirc;n quan đến c&amp;aacute;i chết của cha. C&amp;ugrave;ng với việc c&amp;aacute;c cơ quan của &amp;quot;Cửu Long B&amp;uacute;t&amp;quot; được mở ra, th&amp;igrave; vụ &amp;aacute;n cũng dần dần được l&amp;agrave;m r&amp;otilde;. Nhưng l&amp;uacute;c n&amp;agrave;y c&amp;aacute;c thế lực trong triều cũng đang c&amp;oacute; những động th&amp;aacute;i h&amp;agrave;nh động ngầm, mọi chuyện kh&amp;ocirc;ng hề đơn giản như vậy.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'su-thuc-tinh-cua-vu-khi-than-but-cuu-long-full-vietsub--the-treasure-code-2022-10351035', 1, N'6715628a48a5f85f7ee7d2d4d659_BUT-1.jpg', N'0                   ', CAST(0x0000AEA301572AFC AS DateTime), CAST(0x0000AEA3016B65FD AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (1008, 2, N'Tề Thiên Đại Thánh 2022 Full Vietsub, The Monkey King (2022)', N'Cập nhật', N'Trung Quốc', N'0         ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;T&amp;ocirc;n Ngộ Kh&amp;ocirc;ng bị giam giữ ở Ngũ Chỉ Sơn 400 năm, t&amp;igrave;nh cờ được A Nhất cứu tho&amp;aacute;t. Cha mẹ của A Nhất bị Long th&amp;aacute;i tử giết hại, n&amp;agrave;ng ấy muốn T&amp;ocirc;n Ngộ Kh&amp;ocirc;ng dẫn n&amp;agrave;ng đi đến thi&amp;ecirc;n cung để c&amp;aacute;o trạng. Long th&amp;aacute;i tử biết được T&amp;ocirc;n Ngộ Kh&amp;ocirc;ng đ&amp;atilde; tho&amp;aacute;t khỏi Ngũ Chỉ Sơn, chuẩn bị bẩm b&amp;aacute;o việc năm đ&amp;oacute; Đ&amp;ocirc;ng Hải Long Cung bị ph&amp;aacute; hủy, lợi dụng huynh đệ tốt của Ngộ Kh&amp;ocirc;ng l&amp;agrave; Ma Vương để giết hại Ngộ Kh&amp;ocirc;ng. Mặc d&amp;ugrave; ph&amp;aacute;p lực của Ngộ Kh&amp;ocirc;ng bị khống chế nhưng Ma vương vẫn &amp;aacute;m s&amp;aacute;t thất bại. V&amp;igrave; vậy đ&amp;atilde; bắt A Nhất, để cứu A Nhất, Ngộ Kh&amp;ocirc;ng đ&amp;aacute;nh đến Long cung. Ngộ Kh&amp;ocirc;ng v&amp;agrave; th&amp;aacute;i tử giao tranh từ biển cho đến tận Nam Thi&amp;ecirc;n M&amp;ocirc;n. Cuối c&amp;ugrave;ng Ngộ Kh&amp;ocirc;ng được A Nhất cảm h&amp;oacute;a, trở về Ngũ Chỉ Sơn tiếp tục tu h&amp;agrave;nh, chờ đợi người c&amp;oacute; cơ duy&amp;ecirc;n đ&amp;atilde; định.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'te-thien-dai-thanh-2022-full-vietsub--the-monkey-king-2022-36803680', 1, N'3680f9My7jjUjZ8QadIvtQ3QCTQ0a5E.jpg', N'0                   ', CAST(0x0000AEA30158134B AS DateTime), CAST(0x0000AEA3015EF03E AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (1009, 2, N'Phu Quân Phản Diện Của Ta Vietsub, Wo De Fan Pai Fu Jun (2022)', N'Cập nhật', N'Trung Quốc', N'2022      ', N'&lt;p&gt;Bạch Tiểu Đường ngo&amp;agrave;i &amp;yacute; muốn xuy&amp;ecirc;n v&amp;agrave;o s&amp;aacute;ch, trở th&amp;agrave;nh nương tử của phản diện &amp;eacute;p hắn ly h&amp;ocirc;n v&amp;agrave;o l&amp;uacute;c hắn sa s&amp;uacute;t nhất, để tr&amp;aacute;nh sau c&amp;ugrave;ng chết trong tay ophản diện, n&amp;agrave;ng quyết định b&amp;aacute;m riết lấy hắn.&lt;/p&gt;
', N'phu-quan-phan-dien-cua-ta-vietsub--wo-de-fan-pai-fu-jun-2022-62736273', 1, N'6273banner_phu-quan-55348_poster.jpg', N'7                   ', CAST(0x0000AEA30159B890 AS DateTime), CAST(0x0000AEA7017F6894 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (1011, 2, N'VẠCH TRẦN ĐỊA NGỤC SỐ: PHÒNG CHAT THỨ N', N'Cập nhật', N'Hàn Quốc', N'2022      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Ẩn danh v&amp;agrave; b&amp;oacute;c lột, một mạng lưới c&amp;aacute;c ph&amp;ograve;ng chat trực tuyến lan tr&amp;agrave;n tội phạm t&amp;igrave;nh dục. Cuộc săn l&amp;ugrave;ng nhằm hạ bệ những kẻ điều h&amp;agrave;nh đ&amp;ograve;i hỏi sự gan dạ v&amp;agrave; ki&amp;ecirc;n tr&amp;igrave;.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'vach-tran-dia-nguc-sok-phong-chat-thu-n-46894689', 1, N'4689AAAABSjtkpuMo5neSg0mJI8xsEslUCwmNGAhZADNwqhRmWHqVpa7G_-XB8BZOUiH6U0qtbvgmLDvR4T0214xYtZhmevQ5Bht7XMkN5kp.jpg', N'8                   ', CAST(0x0000AEA3016C82B7 AS DateTime), CAST(0x0000AEA800C3C809 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (1012, 2, N'NHỮNG KẺ NGUYỀN RỦA', N'Cập nhật', N'Hàn Quốc', N'2021      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;N&lt;strong&gt;hững Kẻ Nguyền Rủa&lt;/strong&gt;&amp;nbsp;n&amp;oacute;i về một vụ &amp;aacute;n giết người h&amp;agrave;ng loạt b&amp;iacute; ẩn xảy ra bởi Jaechaui (x&amp;aacute;c chết sống lại từ c&amp;otilde;i chết v&amp;agrave; c&amp;oacute; thể n&amp;oacute;i chuyện). Tuy nhi&amp;ecirc;n, sự thật v&amp;agrave; những cơ thể n&amp;agrave;y được thao t&amp;uacute;ng bởi một ai đ&amp;oacute;. Vậy đ&amp;oacute; l&amp;agrave; ai? Liệu họ c&amp;oacute; bị đưa ra &amp;aacute;nh s&amp;aacute;ng?&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'nhung-ke-nguyen-rua-85008500', 1, N'8500nguyenRua.png', N'6                   ', CAST(0x0000AEA3016D61F5 AS DateTime), CAST(0x0000AEA80155EAB3 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (1013, 2, N'  THOÁT KHỎI MOGADISHU', N'Cập nhật', N'Hàn Quốc', N'2021      ', N'&lt;p&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;Tho&amp;aacute;t Khỏi Mogadishu&lt;/strong&gt;&amp;nbsp;dựa tr&amp;ecirc;n c&amp;acirc;u chuyện c&amp;oacute; thật về cuộc chạy trốn sinh tử của c&amp;aacute;c nh&amp;acirc;n vi&amp;ecirc;n đại sứ qu&amp;aacute;n H&amp;agrave;n Quốc v&amp;agrave; Triều Ti&amp;ecirc;n tại thủ đ&amp;ocirc; Somalia trong cuộc nội chiến năm 1991.&lt;/span&gt;&lt;/p&gt;
', N'--thoat-khoi-mogadishu-53135313', 1, N'5313616ed2f84798f8fcc2540f02_giai-thoat-khoi-mod-1.jpg', N'3                   ', CAST(0x0000AEA3017015CF AS DateTime), CAST(0x0000AEA800C3B760 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (2011, 2, N'Cảnh Sát Tập Sự - Midnight Runners', N'Park Seo-joon, Kang Ha-neul', N'Hàn Quốc', N'2017      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Bộ phim kể về 2 nh&amp;acirc;n vật ch&amp;iacute;nh l&amp;agrave;&amp;nbsp;&lt;strong&gt;Ki-joon v&amp;agrave; Hee-yeol&lt;/strong&gt;, cả 2 c&amp;oacute; ho&amp;agrave;n cảnh, t&amp;iacute;nh c&amp;aacute;ch kh&amp;aacute;c biệt nhưng lại&amp;nbsp;&lt;strong&gt;trở n&amp;ecirc;n th&amp;acirc;n thiết khi c&amp;ugrave;ng học tại Đại học Cảnh s&amp;aacute;t Quốc gia H&amp;agrave;n Quốc.&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Một lần nghỉ ph&amp;eacute;p ra ngo&amp;agrave;i chơi, cả 2 đ&amp;atilde;&amp;nbsp;&lt;strong&gt;chứng kiến một vụ bắt c&amp;oacute;c, cả 2 quyết định lần theo dấu vết đ&amp;oacute; để truy t&amp;igrave;m hung thủ.&lt;/strong&gt;&amp;nbsp;Tuy c&amp;oacute; nhiều kh&amp;oacute; khăn nhưng v&amp;igrave; muốn đưa vụ việc ra &amp;aacute;nh s&amp;aacute;ng m&amp;agrave; họ&lt;strong&gt;&amp;nbsp;đ&amp;atilde; kh&amp;ocirc;ng cần trợ gi&amp;uacute;p từ ai, tự m&amp;igrave;nh ti&amp;ecirc;u trừ tổ chức tội phạm.&lt;/strong&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'canh-sat-tap-su---midnight-runners-19211921', 1, N'1921image001.jpg', N'3                   ', CAST(0x0000AEA6000715A1 AS DateTime), CAST(0x0000AEA7017F54DB AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (2012, 2, N'Đội Cứu Hộ Của Chip và Dale  - Chip ''n Dale: Rescue Rangers (2022)', N'Akiva Schaffer', N'Mỹ', N'2022      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;Đội Cứu Hộ Của Chip v&amp;agrave; Dale - Chip &amp;#39;n Dale: Rescue Rangers (2022)&amp;nbsp;&lt;/strong&gt;l&amp;agrave; bộ phim thuộc thể loại hoạt h&amp;igrave;nh, phi&amp;ecirc;u lưu, h&amp;agrave;i hước của Mỹ. T&amp;aacute;c phẩm do đạo diễn Akiva Schaffer chịu tr&amp;aacute;ch nhiệm chỉ đạo, với sự tham gia của c&amp;aacute;c diễn vi&amp;ecirc;n Andy Samberg, John Mulaney v&amp;agrave; KiKi Layne.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Bộ phim lấy bối cảnh v&amp;agrave;o năm 1982, khi Chip (John Mulaney) v&amp;agrave; Dale (Andy Samberg) c&amp;oacute; quan hệ t&amp;igrave;nh cảm với nhau trong một cuộc hẹn h&amp;ograve; đ&amp;atilde; trở n&amp;ecirc;n tồi tệ khi họ chung lớp, v&amp;agrave; hai người bạn đ&amp;atilde; kh&amp;ocirc;ng gặp nhau trong thời gian d&amp;agrave;i.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Dale n&amp;oacute;i rằng Chip rất vui t&amp;iacute;nh v&amp;agrave; chu đ&amp;aacute;o về mọi thứ, v&amp;agrave; anh ch&amp;agrave;ng cảm thấy cả hai trở n&amp;ecirc;n ho&amp;agrave;n hảo khi ở cạnh nhau. Họ đến LA, thực hiện phần thử giọng với c&amp;aacute;c phần bit. V&amp;agrave; sau đ&amp;oacute; l&amp;agrave; bước đột ph&amp;aacute; lớn của họ, được tham gia chương tr&amp;igrave;nh Disney Afternoons Rescue Rangersc&amp;ugrave;ng với Monterey Jack (Eric Bana), Gadget Hackwrench (Tress MacNeille) v&amp;agrave; Zipper the Fly (Dennis Haysbert).&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Đ&amp;oacute; l&amp;agrave; năm 1990, v&amp;agrave;&amp;nbsp; Chip c&amp;ugrave;ng Dale đang sống trong một giấc mơ, tiệc t&amp;ugrave;ng với những ch&amp;uacute; ch&amp;oacute; con trong một bữa tiệc kết th&amp;uacute;c chương tr&amp;igrave;nh, nhưng khi tất cả rời đi, Dale cố gắng đi một m&amp;igrave;nh. Nhiều năm sau đ&amp;oacute;, Dale trượt d&amp;agrave;i với danh tiếng v&amp;agrave; nỗi nhớ tuyệt vọng. Anh ch&amp;agrave;ng cũng l&amp;agrave; người nhận phẫu thuật CG ba chiều, trong thế giới n&amp;agrave;y, con người v&amp;agrave; c&amp;aacute;c nh&amp;acirc;n vật hoạt hoạ c&amp;ugrave;ng tồn tại.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'doi-cuu-ho-cua-chip-va-dale---chip-n-dalek-rescue-rangers-2022-30313031', 1, N'3031628cfc6cc2887e458281c7f6_chip-1.jpg', N'11100               ', CAST(0x0000AEA600075B52 AS DateTime), CAST(0x0000AEA700EF2BF2 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (2013, 2, N'Tuyết Ưng Lĩnh Chủ - Dongbo Xueying Land (2022)', N'Xin Chen', N'Trung Quốc', N'2022      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Chất lượng: Bản đẹp&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;Tuyết Ưng Lĩnh Chủ - Dong Bo Xue Ying Land (2022)&lt;/strong&gt;&amp;nbsp;l&amp;agrave; bộ phim thuộc thể loại cổ trang, kiếm hiệp, v&amp;otilde; thuật của Trung Quốc. T&amp;aacute;c phẩm do đạo diễn Xin Chen chịu tr&amp;aacute;ch nhiệm chỉ đạo, với sự tham gia của c&amp;aacute;c diễn vi&amp;ecirc;n Thịnh Anh H&amp;agrave;o,T&amp;ocirc;n Nhuế v&amp;agrave; Ph&amp;iacute; Thấm Nguy&amp;ecirc;n.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;T&amp;aacute;c phẩm xoay quanh Đ&amp;ocirc;ng b&amp;aacute; tuyết ưng thiếu chủ Tuyết Thạch Bảo, khi c&amp;ograve;n thời ni&amp;ecirc;n thiếu v&amp;igrave; cha mẹ tốt bụng n&amp;ecirc;n đ&amp;atilde; nhận nu&amp;ocirc;i một b&amp;eacute; g&amp;aacute;i kh&amp;ocirc;ng r&amp;otilde; lai lịch, ngược lại khiến cho gia đ&amp;igrave;nh bị mưu hại, tan cửa n&amp;aacute;t nh&amp;agrave;.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Sau khi Tuyết Ưng trưởng th&amp;agrave;nh, đ&amp;atilde; quyết t&amp;acirc;m bước đi tr&amp;ecirc;n con đường t&amp;igrave;m kiếm hung thủ, rửa sạch nỗi oan khuất cho cha mẹ của m&amp;igrave;nh, bắt những kẻ đứng sau &amp;acirc;m mưu độc &amp;aacute;c phải đền tội, t&amp;igrave;m lại c&amp;ocirc;ng l&amp;yacute;.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'tuyet-ung-linh-chu---dongbo-xueying-land-2022-85238523', 1, N'8523big1.jpg', N'7                   ', CAST(0x0000AEA700E61082 AS DateTime), CAST(0x0000AEA800C399F3 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (2014, 2, N'Doraemon: Nobita Và Đảo Giấu Vàng', N'Kazuaki Imai', N'Nhật Bản', N'2018      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;Doraemon: Nobita V&amp;agrave; Đảo Giấu V&amp;agrave;ng&lt;/strong&gt;&amp;nbsp;Doraemon: Nobita&amp;#39;s Treasure Island 2018 Full HD Vietsub Thuyết Minh Doraemon: Nobita v&amp;agrave; Đảo giấu v&amp;agrave;ng, Doraemon: Đảo kho b&amp;aacute;u của Nobita 2018 Phim Doraemon: Nobita v&amp;agrave; Đảo giấu v&amp;agrave;ng &amp;ldquo;M&amp;igrave;nh sẽ t&amp;igrave;m ra Đảo kho b&amp;aacute;u!&amp;rdquo;&amp;hellip; Quyết t&amp;acirc;m thực hiện kế hoạch sau khi h&amp;ugrave;ng hồn tuy&amp;ecirc;n bố với nh&amp;oacute;m bạn Jaian, Suneo v&amp;agrave; Shizuka nhờ c&amp;oacute; kho b&amp;aacute;u &amp;quot;Bản đồ kho b&amp;aacute;u&amp;quot; của Doraemon, Nobita đ&amp;atilde; t&amp;igrave;m được một h&amp;ograve;n đảo mới bất ngờ xuất hiện giữa Th&amp;aacute;i B&amp;igrave;nh Dương ... Nobita v&amp;agrave; c&amp;aacute;c bạn bắt đầu cuộc phi&amp;ecirc;u lưu của m&amp;igrave;nh. hướng đến h&amp;ograve;n đảo kho b&amp;aacute;u tr&amp;ecirc;n con t&amp;agrave;u mang t&amp;ecirc;n &amp;quot;Halo Nobita&amp;quot;. Tuy nhi&amp;ecirc;n, trước khi hạ c&amp;aacute;nh, nh&amp;oacute;m đ&amp;atilde; bị tấn c&amp;ocirc;ng bởi những t&amp;ecirc;n cướp biển! Trong khi chiến đấu chống lại kẻ th&amp;ugrave;, Shizuka đ&amp;atilde; bị bọn cướp biển bắt c&amp;oacute;c l&amp;ecirc;n t&amp;agrave;u của ch&amp;uacute;ng! Sau khi trốn tho&amp;aacute;t khỏi bọn cướp biển, c&amp;aacute;c bạn của Nobita t&amp;igrave;nh cờ gặp một cậu b&amp;eacute; t&amp;ecirc;n l&amp;agrave; Flock đang tr&amp;ocirc;i dạt tr&amp;ecirc;n biển c&amp;ugrave;ng với một con vẹt robot t&amp;ecirc;n l&amp;agrave; Quiz. Flock l&amp;agrave; một người thợ m&amp;aacute;y vừa tho&amp;aacute;t khỏi một con t&amp;agrave;u cướp biển, anh ta biết được b&amp;iacute; mật quan trọng của h&amp;ograve;n đảo kho b&amp;aacute;u! Liệu Nobita v&amp;agrave; những người bạn c&amp;oacute; thể giải cứu Shizuka khỏi những t&amp;ecirc;n cướp biển độc &amp;aacute;c v&amp;agrave; kh&amp;aacute;m ph&amp;aacute; ra b&amp;iacute; mật được cất giấu tr&amp;ecirc;n h&amp;ograve;n đảo kho b&amp;aacute;u đang ngủ qu&amp;ecirc;n kh&amp;ocirc;ng !?&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'doraemonk-nobita-va-dao-giau-vang-29592959', 1, N'2959CGKXm39.jpg', N'3                   ', CAST(0x0000AEA7017DDF7D AS DateTime), CAST(0x0000AEA7017F3D9A AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (2015, 2, N'Hải Tặc - The Pirates (2014)', N'Seok-hoon Lee', N'Hàn Quốc', N'2014      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;Hải Tặc&lt;/strong&gt;&amp;nbsp;The Pirates 2014 Full HD Vietsub Thuyết Minh Cướp biển - The Pirates (2014) l&amp;agrave; một bộ phim thuộc thể loại phim phi&amp;ecirc;u lưu mạo hiểm của điện ảnh H&amp;agrave;n Quốc, nội dung diễn ra với bối cảnh l&amp;agrave; thời kỳ nguy&amp;ecirc;n thủy của triều đại Chosun. Một con c&amp;aacute; voi đ&amp;atilde; nuốt chửng hải cẩu ho&amp;agrave;ng gia. C&amp;aacute;c hải tặc lừng danh, hải tặc tứ phương v&amp;agrave; cả triều đ&amp;igrave;nh đều tụ họp về đ&amp;acirc;y để t&amp;igrave;m kiếm phong ấn quyền lực. V&amp;igrave; sở hữu n&amp;oacute;, l&amp;agrave; sở hữu vương triều.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'hai-tac---the-pirates-2014-62946294', 1, N'6294untitled-129-10-2020_05g41-15.jpg', N'0                   ', CAST(0x0000AEAA0122D939 AS DateTime), CAST(0x0000AEAA0126F978 AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (2016, 2, N'Iron Man Phần 1 - Người sắt 2008', N'Jon Favreau', N'Mỹ', N'2008      ', N'&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;&lt;strong&gt;Người sắt - Iron Man&lt;/strong&gt;&amp;nbsp;l&amp;agrave; bộ phim điện ảnh thuộc thể loại viễn tưởng - si&amp;ecirc;u anh h&amp;ugrave;ng của Hollywood, được ph&amp;aacute;t h&amp;agrave;nh v&amp;agrave;o năm 2008 dựa tr&amp;ecirc;n nh&amp;acirc;n vật truyện tranh của Marvel Comics. Bộ phim do Marvel Studio sản xuất, Paramount Pictures chịu tr&amp;aacute;ch nhiệm xuất bản. Đ&amp;acirc;y cũng l&amp;agrave; bộ phim đầu ti&amp;ecirc;n đ&amp;aacute;nh dấu cho sự trỗi dậy của đế chế Marvel.&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Iron Man do đạo diễn Jon Favreau cầm trịch, với phần kịch bản gồm đội ngũ bi&amp;ecirc;n kịch Mark Fergus, Hawk Ostby c&amp;ugrave;ng Art Marcum v&amp;agrave; Matt Holloway chắp b&amp;uacute;t. Bộ phim xoay quanh nh&amp;acirc;n vật người sắt Tony Stark do t&amp;agrave;i tử Robert Downey Jr thủ vai, anh l&amp;agrave; một kỹ sư thi&amp;ecirc;n t&amp;agrave;i, sau khi trải qua một tai nạn nguy hiểm đến t&amp;iacute;nh mạng, anh đ&amp;atilde; d&amp;agrave;y c&amp;ocirc;ng chế tạo n&amp;ecirc;n một bộ gi&amp;aacute;p sắt với nhiều năng lực tuyệt vời v&amp;agrave; trở th&amp;agrave;nh Người Sắt, một si&amp;ecirc;u anh h&amp;ugrave;ng với những cỗ m&amp;aacute;y hiện đại gắn l&amp;ecirc;n người.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Người sắt được ra mắt đầu ti&amp;ecirc;n tại Sydney v&amp;agrave;o ng&amp;agrave;y 14 th&amp;aacute;ng 11 năm 2008, bắt đầu khởi chiếu tại c&amp;aacute;c rạp tr&amp;ecirc;n nước Mỹ v&amp;agrave;o ng&amp;agrave;y 2/5/2008. Tại Việt Nam, phim được c&amp;ocirc;ng chiếu v&amp;agrave;o ng&amp;agrave;y 16/5/2008, doanh thu của bộ phim đạt hơn 585 triệu USD so với kinh ph&amp;iacute; sản xuất 140 triệu USD. Viện phim mỹ đ&amp;atilde; lựa chọn Iron Man v&amp;agrave;o top 10 phim hay nhất năm 2008, đồng thời phim cũng nhận 2 giải Oscar cho bi&amp;ecirc;n tập xuất sắc v&amp;agrave; hiệu ứng xuất sắc nhất.&amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Cũng từ bộ phim n&amp;agrave;y, vai diễn Tony Stark của Downey đưa t&amp;ecirc;n tuổi của anh l&amp;ecirc;n một tầm cao mới, mở m&amp;agrave;n cho những bộ phim về người sắt, cũng như c&amp;aacute;c phần phim trong vũ trụ Marvel c&amp;oacute; sự g&amp;oacute;p mặt của Iron Man. Phim cũng được c&amp;aacute;c nh&amp;agrave; ph&amp;ecirc; b&amp;igrave;nh đ&amp;aacute;nh gi&amp;aacute; cao về mặt nội dung, h&amp;igrave;nh ảnh cũng như c&amp;aacute;c ph&amp;acirc;n cảnh h&amp;agrave;nh động.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Tr&amp;ecirc;n Rotten Tomatoes - hệ thống tổng hợp kết quả đ&amp;aacute;nh gi&amp;aacute;, phim nhận được 94% phiếu b&amp;igrave;nh chọn dựa v&amp;agrave;o 286 b&amp;agrave;i đ&amp;aacute;nh gi&amp;aacute;, điểm trung b&amp;igrave;nh 7,7/10. C&amp;aacute;c chuy&amp;ecirc;n gia d&amp;agrave;nh nhiều lời khen c&amp;oacute; c&amp;aacute;nh cho Robert Downey : &amp;ldquo;Nhờ sức h&amp;uacute;t tuyệt vời của Robert Downey Jr, Iron Man đ&amp;atilde; mở ra một hướng đi mới cho d&amp;ograve;ng phim si&amp;ecirc;u anh h&amp;ugrave;ng bằng sự sắc sảo. h&amp;agrave;i hước v&amp;agrave; l&amp;ocirc;i cuốn&amp;rdquo;. Trang Metacritic cũng đ&amp;atilde; đ&amp;aacute;nh gi&amp;aacute; phim 79/100 điểm, dựa tr&amp;ecirc;n 38 nhận x&amp;eacute;t, chủ yếu l&amp;agrave; c&amp;aacute;c lời khen ngợi.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Hai nh&amp;agrave; ph&amp;ecirc; b&amp;igrave;nh Roger Ebert v&amp;agrave; Richard Corliss cũng đ&amp;atilde; chọn Người Sắt v&amp;agrave;o danh s&amp;aacute;ch phim y&amp;ecirc;u th&amp;iacute;ch của họ trong năm 2008. Tony Stark được tạp ch&amp;iacute; Empire lựa chọn l&amp;agrave; một trong 500 phim điện ảnh vĩ đại nhất mọi thời đại. v&amp;agrave; 100 nh&amp;acirc;n vật hư cấu vĩ đại nhất.&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;
', N'iron-man-phan-1---nguoi-sat-2008-14631463', 1, N'14635fe2d564b3fa643970a1229f_Iron-man-1-2.jpg', N'7                   ', CAST(0x0000AEAD0137F790 AS DateTime), CAST(0x0000AEAD013C548F AS DateTime))
INSERT [dbo].[DB_PHIM] ([id_phim], [id_user], [ten_phim], [tac_gia], [quoc_gia], [nam_sx], [tomtat_phim], [link_raw], [status_], [img_phim], [coin_phim], [created_at], [updated_at]) VALUES (2017, 1013, N'Báo cáo đồ án', N'Cập nhật', N'Nhật Bản', N'2012      ', N'&lt;h1&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Video Demo b&amp;aacute;o c&amp;aacute;o đồ &amp;aacute;n&lt;/span&gt;&lt;/span&gt;&lt;/h1&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Server 1 video ở local&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;span style=&quot;font-family:Times New Roman,Times,serif&quot;&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Server 2,3&amp;nbsp;video b&amp;ecirc;n thứ 3&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;

&lt;p&gt;&lt;br /&gt;
&amp;nbsp;&lt;/p&gt;
', N'bao-cao-31073107', 1, N'45logo.png', N'0                   ', CAST(0x0000AEAE01869C2E AS DateTime), CAST(0x0000AEAF00214F0E AS DateTime))
SET IDENTITY_INSERT [dbo].[DB_PHIM] OFF
SET IDENTITY_INSERT [dbo].[DB_PHIM_THELOAI] ON 

INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (1, 1, 32, 1, CAST(0x0000AE88016332E9 AS DateTime), CAST(0x0000AE88016332E9 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2, 1, 4, 1, CAST(0x0000AE88016332EE AS DateTime), CAST(0x0000AE88016332EE AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (3, 1, 1, 1, CAST(0x0000AE88016332F2 AS DateTime), CAST(0x0000AE88016332F2 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (4, 1, 42, 1, CAST(0x0000AE88016332F7 AS DateTime), CAST(0x0000AE88016332F7 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (5, 1, 13, 1, CAST(0x0000AE88016332FE AS DateTime), CAST(0x0000AE88016332FE AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (6, 1, 5, 1, CAST(0x0000AE8801633302 AS DateTime), CAST(0x0000AE8801633302 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (7, 2, 32, 1, CAST(0x0000AE8801661531 AS DateTime), CAST(0x0000AE8801661531 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (8, 2, 4, 1, CAST(0x0000AE8801661541 AS DateTime), CAST(0x0000AE8801661541 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (9, 2, 1, 1, CAST(0x0000AE8801661542 AS DateTime), CAST(0x0000AE8801661542 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (10, 2, 5, 1, CAST(0x0000AE8801661543 AS DateTime), CAST(0x0000AE8801661543 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (11, 2, 35, 1, CAST(0x0000AE8801661544 AS DateTime), CAST(0x0000AE8801661544 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (12, 2, 9, 1, CAST(0x0000AE8801661545 AS DateTime), CAST(0x0000AE8801661545 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (29, 5, 32, 1, CAST(0x0000AE8C016378EA AS DateTime), CAST(0x0000AE8C016378EA AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (30, 5, 7, 1, CAST(0x0000AE8C016378EC AS DateTime), CAST(0x0000AE8C016378EC AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (31, 5, 34, 1, CAST(0x0000AE8C016378EC AS DateTime), CAST(0x0000AE8C016378EC AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (32, 5, 27, 1, CAST(0x0000AE8C016378ED AS DateTime), CAST(0x0000AE8C016378ED AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (33, 5, 4, 1, CAST(0x0000AE8C016378EE AS DateTime), CAST(0x0000AE8C016378EE AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (34, 5, 1, 1, CAST(0x0000AE8C016378EF AS DateTime), CAST(0x0000AE8C016378EF AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (35, 5, 33, 1, CAST(0x0000AE8C016378EF AS DateTime), CAST(0x0000AE8C016378EF AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (36, 5, 21, 1, CAST(0x0000AE8C016378F0 AS DateTime), CAST(0x0000AE8C016378F0 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (37, 5, 13, 1, CAST(0x0000AE8C016378F1 AS DateTime), CAST(0x0000AE8C016378F1 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (38, 5, 26, 1, CAST(0x0000AE8C016378F2 AS DateTime), CAST(0x0000AE8C016378F2 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (39, 5, 35, 1, CAST(0x0000AE8C016378F7 AS DateTime), CAST(0x0000AE8C016378F7 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (40, 5, 9, 1, CAST(0x0000AE8C016378F8 AS DateTime), CAST(0x0000AE8C016378F8 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (65, 6, 4, 1, CAST(0x0000AE8D015995EF AS DateTime), CAST(0x0000AE8D015995EF AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (66, 6, 1, 1, CAST(0x0000AE8D015995F0 AS DateTime), CAST(0x0000AE8D015995F0 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (67, 6, 33, 1, CAST(0x0000AE8D015995F1 AS DateTime), CAST(0x0000AE8D015995F1 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (68, 6, 42, 1, CAST(0x0000AE8D015995F2 AS DateTime), CAST(0x0000AE8D015995F2 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (69, 6, 21, 1, CAST(0x0000AE8D015995F3 AS DateTime), CAST(0x0000AE8D015995F3 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (70, 6, 26, 1, CAST(0x0000AE8D015995F4 AS DateTime), CAST(0x0000AE8D015995F4 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (71, 6, 5, 1, CAST(0x0000AE8D015995F5 AS DateTime), CAST(0x0000AE8D015995F5 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (72, 6, 35, 1, CAST(0x0000AE8D015995F6 AS DateTime), CAST(0x0000AE8D015995F6 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (73, 6, 9, 1, CAST(0x0000AE8D015995F7 AS DateTime), CAST(0x0000AE8D015995F7 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (89, 9, 7, 1, CAST(0x0000AE950140F5E0 AS DateTime), CAST(0x0000AE950140F5E0 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (90, 9, 4, 1, CAST(0x0000AE950140F5E4 AS DateTime), CAST(0x0000AE950140F5E4 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (91, 9, 1, 1, CAST(0x0000AE950140F5E9 AS DateTime), CAST(0x0000AE950140F5E9 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (93, 10, 34, 1, CAST(0x0000AE9501422789 AS DateTime), CAST(0x0000AE9501422789 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (94, 10, 4, 1, CAST(0x0000AE950142278A AS DateTime), CAST(0x0000AE950142278A AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (95, 10, 1, 1, CAST(0x0000AE950142278B AS DateTime), CAST(0x0000AE950142278B AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (96, 10, 33, 1, CAST(0x0000AE950142278C AS DateTime), CAST(0x0000AE950142278C AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (127, 18, 4, 0, CAST(0x0000AE950177783E AS DateTime), CAST(0x0000AE950177783E AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (128, 18, 33, 0, CAST(0x0000AE9501777844 AS DateTime), CAST(0x0000AE9501777844 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (129, 18, 13, 0, CAST(0x0000AE9501777846 AS DateTime), CAST(0x0000AE9501777846 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (131, 17, 13, 0, CAST(0x0000AE9501778289 AS DateTime), CAST(0x0000AE9501778289 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (135, 17, 33, 0, CAST(0x0000AE950177ECAC AS DateTime), CAST(0x0000AE950177ECAC AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (136, 17, 13, 0, CAST(0x0000AE950177ECAF AS DateTime), CAST(0x0000AE950177ECAF AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (137, 18, 4, 0, CAST(0x0000AE95017A83DC AS DateTime), CAST(0x0000AE95017A83DC AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (138, 18, 33, 0, CAST(0x0000AE95017A83E2 AS DateTime), CAST(0x0000AE95017A83E2 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (139, 18, 13, 0, CAST(0x0000AE95017A83E2 AS DateTime), CAST(0x0000AE95017A83E2 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (150, 17, 33, 0, CAST(0x0000AE95017C9602 AS DateTime), CAST(0x0000AE95017C9602 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (151, 17, 13, 0, CAST(0x0000AE95017C9606 AS DateTime), CAST(0x0000AE95017C9606 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (152, 10, 7, 0, CAST(0x0000AE9600A795E3 AS DateTime), CAST(0x0000AE9600A795E3 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (153, 10, 34, 0, CAST(0x0000AE9600A79608 AS DateTime), CAST(0x0000AE9600A79608 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (154, 10, 4, 0, CAST(0x0000AE9600A79608 AS DateTime), CAST(0x0000AE9600A79608 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (155, 10, 1, 0, CAST(0x0000AE9600A7960D AS DateTime), CAST(0x0000AE9600A7960D AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (156, 10, 33, 0, CAST(0x0000AE9600A7960D AS DateTime), CAST(0x0000AE9600A7960D AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (157, 22, 34, 0, CAST(0x0000AE9600A85F94 AS DateTime), CAST(0x0000AE9600A85F94 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (158, 22, 4, 0, CAST(0x0000AE9600A85F94 AS DateTime), CAST(0x0000AE9600A85F94 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (159, 22, 1, 0, CAST(0x0000AE9600A85F98 AS DateTime), CAST(0x0000AE9600A85F98 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (160, 22, 6, 0, CAST(0x0000AE9600A85F98 AS DateTime), CAST(0x0000AE9600A85F98 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (161, 22, 33, 0, CAST(0x0000AE9600A85F9D AS DateTime), CAST(0x0000AE9600A85F9D AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (162, 22, 21, 0, CAST(0x0000AE9600A85F9D AS DateTime), CAST(0x0000AE9600A85F9D AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (163, 22, 13, 0, CAST(0x0000AE9600A85F9D AS DateTime), CAST(0x0000AE9600A85F9D AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (164, 22, 5, 0, CAST(0x0000AE9600A85FA2 AS DateTime), CAST(0x0000AE9600A85FA2 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (165, 23, 7, 0, CAST(0x0000AE9600AADD9C AS DateTime), CAST(0x0000AE9600AADD9C AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (166, 23, 34, 0, CAST(0x0000AE9600AADD9C AS DateTime), CAST(0x0000AE9600AADD9C AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (167, 23, 4, 0, CAST(0x0000AE9600AADDA0 AS DateTime), CAST(0x0000AE9600AADDA0 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (168, 23, 1, 0, CAST(0x0000AE9600AADDA0 AS DateTime), CAST(0x0000AE9600AADDA0 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (169, 23, 33, 0, CAST(0x0000AE9600AADDA5 AS DateTime), CAST(0x0000AE9600AADDA5 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (170, 18, 4, 0, CAST(0x0000AE9700F4C63E AS DateTime), CAST(0x0000AE9700F4C63E AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (171, 18, 33, 0, CAST(0x0000AE9700F4C64C AS DateTime), CAST(0x0000AE9700F4C64C AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (172, 18, 13, 0, CAST(0x0000AE9700F4C64C AS DateTime), CAST(0x0000AE9700F4C64C AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (284, 24, 34, 0, CAST(0x0000AE9800F395BE AS DateTime), CAST(0x0000AE9800F395BE AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (285, 24, 29, 0, CAST(0x0000AE9800F395BE AS DateTime), CAST(0x0000AE9800F395BE AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (286, 24, 4, 0, CAST(0x0000AE9800F395C2 AS DateTime), CAST(0x0000AE9800F395C2 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (287, 24, 1, 0, CAST(0x0000AE9800F395C2 AS DateTime), CAST(0x0000AE9800F395C2 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (288, 24, 26, 0, CAST(0x0000AE9800F395C2 AS DateTime), CAST(0x0000AE9800F395C2 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (289, 24, 5, 0, CAST(0x0000AE9800F395C7 AS DateTime), CAST(0x0000AE9800F395C7 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (290, 24, 35, 0, CAST(0x0000AE9800F395C7 AS DateTime), CAST(0x0000AE9800F395C7 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (291, 25, 29, 0, CAST(0x0000AE9800F3A184 AS DateTime), CAST(0x0000AE9800F3A184 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (292, 25, 4, 0, CAST(0x0000AE9800F3A184 AS DateTime), CAST(0x0000AE9800F3A184 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (293, 25, 1, 0, CAST(0x0000AE9800F3A188 AS DateTime), CAST(0x0000AE9800F3A188 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (294, 25, 26, 0, CAST(0x0000AE9800F3A188 AS DateTime), CAST(0x0000AE9800F3A188 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (295, 25, 35, 0, CAST(0x0000AE9800F3A18D AS DateTime), CAST(0x0000AE9800F3A18D AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (296, 7, 14, 0, CAST(0x0000AE9800FDD884 AS DateTime), CAST(0x0000AE9800FDD884 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (297, 7, 42, 0, CAST(0x0000AE9800FDD889 AS DateTime), CAST(0x0000AE9800FDD889 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (298, 11, 7, 0, CAST(0x0000AE9800FDFECC AS DateTime), CAST(0x0000AE9800FDFECC AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (299, 11, 34, 0, CAST(0x0000AE9800FDFECF AS DateTime), CAST(0x0000AE9800FDFECF AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (300, 11, 4, 0, CAST(0x0000AE9800FDFED0 AS DateTime), CAST(0x0000AE9800FDFED0 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (301, 11, 1, 0, CAST(0x0000AE9800FDFED2 AS DateTime), CAST(0x0000AE9800FDFED2 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (302, 11, 6, 0, CAST(0x0000AE9800FDFED4 AS DateTime), CAST(0x0000AE9800FDFED4 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (303, 11, 33, 0, CAST(0x0000AE9800FDFED5 AS DateTime), CAST(0x0000AE9800FDFED5 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (304, 12, 7, 0, CAST(0x0000AE9800FE1297 AS DateTime), CAST(0x0000AE9800FE1297 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (305, 12, 34, 0, CAST(0x0000AE9800FE1299 AS DateTime), CAST(0x0000AE9800FE1299 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (306, 12, 4, 0, CAST(0x0000AE9800FE129B AS DateTime), CAST(0x0000AE9800FE129B AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (307, 12, 6, 0, CAST(0x0000AE9800FE129C AS DateTime), CAST(0x0000AE9800FE129C AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (308, 4, 7, 0, CAST(0x0000AE980144AA15 AS DateTime), CAST(0x0000AE980144AA15 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (309, 4, 34, 0, CAST(0x0000AE980144ABBB AS DateTime), CAST(0x0000AE980144ABBB AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (310, 4, 4, 0, CAST(0x0000AE980144ABDC AS DateTime), CAST(0x0000AE980144ABDC AS DateTime))
GO
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (311, 4, 1, 0, CAST(0x0000AE980144ABDC AS DateTime), CAST(0x0000AE980144ABDC AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (312, 4, 6, 0, CAST(0x0000AE980144ABDC AS DateTime), CAST(0x0000AE980144ABDC AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (313, 4, 33, 0, CAST(0x0000AE980144ABE1 AS DateTime), CAST(0x0000AE980144ABE1 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (314, 4, 42, 0, CAST(0x0000AE980144ABE1 AS DateTime), CAST(0x0000AE980144ABE1 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (315, 4, 21, 0, CAST(0x0000AE980144ABE1 AS DateTime), CAST(0x0000AE980144ABE1 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (316, 4, 11, 0, CAST(0x0000AE980144ABE5 AS DateTime), CAST(0x0000AE980144ABE5 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (317, 4, 5, 0, CAST(0x0000AE980144ABE5 AS DateTime), CAST(0x0000AE980144ABE5 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (318, 4, 9, 0, CAST(0x0000AE980144ABE5 AS DateTime), CAST(0x0000AE980144ABE5 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (1019, 8, 7, 0, CAST(0x0000AE9F00237D76 AS DateTime), CAST(0x0000AE9F00237D76 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (1020, 8, 4, 0, CAST(0x0000AE9F00237D7B AS DateTime), CAST(0x0000AE9F00237D7B AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (1021, 8, 33, 0, CAST(0x0000AE9F00237D7F AS DateTime), CAST(0x0000AE9F00237D7F AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (1022, 8, 13, 0, CAST(0x0000AE9F00237D7F AS DateTime), CAST(0x0000AE9F00237D7F AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (1041, 1005, 4, 0, CAST(0x0000AEA20086C5A8 AS DateTime), CAST(0x0000AEA20086C5A8 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (1042, 1005, 1, 0, CAST(0x0000AEA20086C5A8 AS DateTime), CAST(0x0000AEA20086C5A8 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (1043, 1005, 5, 0, CAST(0x0000AEA20086C5A8 AS DateTime), CAST(0x0000AEA20086C5A8 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (1044, 1005, 1001, 0, CAST(0x0000AEA20086C5A8 AS DateTime), CAST(0x0000AEA20086C5A8 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (1052, 1008, 1, 0, CAST(0x0000AEA301581354 AS DateTime), CAST(0x0000AEA301581354 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (1062, 1007, 1, 0, CAST(0x0000AEA3016B65C0 AS DateTime), CAST(0x0000AEA3016B65C0 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (1063, 1007, 1003, 0, CAST(0x0000AEA3016B65D2 AS DateTime), CAST(0x0000AEA3016B65D2 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2068, 1006, 4, 0, CAST(0x0000AEA700EB2B92 AS DateTime), CAST(0x0000AEA700EB2B92 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2069, 1004, 21, 0, CAST(0x0000AEA700EE31D6 AS DateTime), CAST(0x0000AEA700EE31D6 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2070, 1004, 5, 0, CAST(0x0000AEA700EE31E8 AS DateTime), CAST(0x0000AEA700EE31E8 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2071, 1004, 1001, 0, CAST(0x0000AEA700EE31F3 AS DateTime), CAST(0x0000AEA700EE31F3 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2076, 2012, 4, 0, CAST(0x0000AEA700EF2BE7 AS DateTime), CAST(0x0000AEA700EF2BE7 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2079, 2014, 7, 0, CAST(0x0000AEA7017DF12D AS DateTime), CAST(0x0000AEA7017DF12D AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2080, 2014, 4, 0, CAST(0x0000AEA7017DF131 AS DateTime), CAST(0x0000AEA7017DF131 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2081, 2011, 4, 0, CAST(0x0000AEA7017F54D7 AS DateTime), CAST(0x0000AEA7017F54D7 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2082, 2011, 1, 0, CAST(0x0000AEA7017F54DB AS DateTime), CAST(0x0000AEA7017F54DB AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2083, 1009, 1003, 0, CAST(0x0000AEA7017F6894 AS DateTime), CAST(0x0000AEA7017F6894 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2084, 2013, 1, 0, CAST(0x0000AEA800C399E9 AS DateTime), CAST(0x0000AEA800C399E9 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2085, 2013, 1003, 0, CAST(0x0000AEA800C399F3 AS DateTime), CAST(0x0000AEA800C399F3 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2089, 1013, 1, 0, CAST(0x0000AEA800C3B756 AS DateTime), CAST(0x0000AEA800C3B756 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2090, 1013, 5, 0, CAST(0x0000AEA800C3B75B AS DateTime), CAST(0x0000AEA800C3B75B AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2091, 1013, 35, 0, CAST(0x0000AEA800C3B75B AS DateTime), CAST(0x0000AEA800C3B75B AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2092, 1011, 42, 0, CAST(0x0000AEA800C3C77D AS DateTime), CAST(0x0000AEA800C3C77D AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2093, 1011, 1004, 0, CAST(0x0000AEA800C3C7DF AS DateTime), CAST(0x0000AEA800C3C7DF AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2094, 1012, 32, 0, CAST(0x0000AEA800C3E022 AS DateTime), CAST(0x0000AEA800C3E022 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2095, 1012, 16, 0, CAST(0x0000AEA800C3E022 AS DateTime), CAST(0x0000AEA800C3E022 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2096, 3, 7, 0, CAST(0x0000AEA8014C52B4 AS DateTime), CAST(0x0000AEA8014C52B4 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2097, 3, 42, 0, CAST(0x0000AEA8014C52CB AS DateTime), CAST(0x0000AEA8014C52CB AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2098, 2015, 4, 0, CAST(0x0000AEAA0122D95A AS DateTime), CAST(0x0000AEAA0122D95A AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2099, 2015, 1, 0, CAST(0x0000AEAA0122D972 AS DateTime), CAST(0x0000AEAA0122D972 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2100, 2016, 7, 0, CAST(0x0000AEAD0137F7C8 AS DateTime), CAST(0x0000AEAD0137F7C8 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2101, 2016, 4, 0, CAST(0x0000AEAD0137F7CC AS DateTime), CAST(0x0000AEAD0137F7CC AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2102, 2016, 1, 0, CAST(0x0000AEAD0137F7CC AS DateTime), CAST(0x0000AEAD0137F7CC AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2103, 2016, 11, 0, CAST(0x0000AEAD0137F7D1 AS DateTime), CAST(0x0000AEAD0137F7D1 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2104, 2016, 5, 0, CAST(0x0000AEAD0137F7D6 AS DateTime), CAST(0x0000AEAD0137F7D6 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2105, 2016, 1001, 0, CAST(0x0000AEAD0137F7D6 AS DateTime), CAST(0x0000AEAD0137F7D6 AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2106, 2016, 35, 0, CAST(0x0000AEAD0137F7DB AS DateTime), CAST(0x0000AEAD0137F7DB AS DateTime))
INSERT [dbo].[DB_PHIM_THELOAI] ([id_phim_theloai], [id_phim], [id_theloai], [status_], [created_at], [updated_at]) VALUES (2109, 2017, 42, 0, CAST(0x0000AEAF001FCA39 AS DateTime), CAST(0x0000AEAF001FCA39 AS DateTime))
SET IDENTITY_INSERT [dbo].[DB_PHIM_THELOAI] OFF
SET IDENTITY_INSERT [dbo].[DB_TAP_PHIM] ON 

INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1, 1, 2, N'Tập 1', N'/05-01-2022/Tap01SpyxFamilySpyxFamily2022HD-VietSub20223606369.mp4|&lt;iframe width=&quot;640&quot; height=&quot;360&quot; src=&quot;https://short.ink/DvTCsGiln5&quot; frameborder=&quot;0&quot; scrolling=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;', 1, CAST(0x0000AE880164F095 AS DateTime), CAST(0x0000AE880164F095 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2, 1, 2, N'Tập 2', N'&lt;iframe width=&quot;640&quot; height=&quot;360&quot; src=&quot;https://short.ink/cmFMICbW_&quot; frameborder=&quot;0&quot; scrolling=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;', 1, CAST(0x0000AE88016505CA AS DateTime), CAST(0x0000AE88016505CA AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (3, 1, 2, N'Tập 3', N'&lt;iframe width=&quot;640&quot; height=&quot;360&quot; src=&quot;https://short.ink/yMWq1nhyC&quot; frameborder=&quot;0&quot; scrolling=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;', 1, CAST(0x0000AE88016512D4 AS DateTime), CAST(0x0000AE88016512D4 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (4, 1, 2, N'Tập 4', N'/05-01-2022/PhimSpyxFamilyTap420224057594.mp4|&lt;iframe width=&quot;640&quot; height=&quot;360&quot; src=&quot;https://short.ink/sBbUuXpvG&quot; frameborder=&quot;0&quot; scrolling=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;', 1, CAST(0x0000AE8801658BCA AS DateTime), CAST(0x0000AE8801658BCA AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (5, 3, 2, N'English', N'&lt;iframe width=&quot;640&quot; height=&quot;360&quot; src=&quot;https://short.ink/YWkM_t1nvL&quot; frameborder=&quot;0&quot; scrolling=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;', 1, CAST(0x0000AE880166CC49 AS DateTime), CAST(0x0000AE880166CC49 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (7, 2, 2, N'Full', N'/one-piece-movie-2012--one-piece-film-z-tap-full-81928192/PhimOnePieceMovie2012-OnePieceFilmZTapFull20224858326.mp4', 1, CAST(0x0000AE8A00F4BE36 AS DateTime), CAST(0x0000AE8A00F4BE36 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (8, 4, 2, N'Tập 1', N'/date-a-live-iv-62276227/PhimDateALiveIVTap120222337369.mp4', 1, CAST(0x0000AE8C016099C6 AS DateTime), CAST(0x0000AE8C016099C6 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (9, 4, 2, N'Tập 2', N'/date-a-live-iv-62276227/PhimDateALiveIVTap220222522104.mp4', 1, CAST(0x0000AE8C01612798 AS DateTime), CAST(0x0000AE8C01612798 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (10, 4, 2, N'Tập 3', N'/date-a-live-iv-62276227/PhimDateALiveIVTap320222843526.mp4', 1, CAST(0x0000AE8C016276C1 AS DateTime), CAST(0x0000AE8C016276C1 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (11, 4, 2, N'Tập 4', N'/date-a-live-iv-62276227/PhimDateALiveIVTap420223224057.mp4', 1, CAST(0x0000AE8C0162FF40 AS DateTime), CAST(0x0000AE8C0162FF40 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (12, 5, 2, N'Tập 1', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap120223523463.mp4', 1, CAST(0x0000AE8C0163E1F4 AS DateTime), CAST(0x0000AE8C0163E1F4 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (13, 5, 2, N'Tập 2', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap220223716979.mp4', 1, CAST(0x0000AE8C016467C6 AS DateTime), CAST(0x0000AE8C016467C6 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (14, 5, 2, N'Tập 3', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap320223852682.mp4', 1, CAST(0x0000AE8C0164D40B AS DateTime), CAST(0x0000AE8C0164D40B AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (15, 5, 2, N'Tập 4', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap420224002401.mp4', 1, CAST(0x0000AE8C01653736 AS DateTime), CAST(0x0000AE8C01653736 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (16, 5, 2, N'Tập 5', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap520224145619.mp4', 1, CAST(0x0000AE8C0165C494 AS DateTime), CAST(0x0000AE8C0165C494 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (17, 5, 2, N'Tập 6', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap620224325244.mp4', 1, CAST(0x0000AE8C01661BE4 AS DateTime), CAST(0x0000AE8C01661BE4 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (18, 5, 2, N'Tập 7', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap720224435510.mp4', 1, CAST(0x0000AE8C01666526 AS DateTime), CAST(0x0000AE8C01666526 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (19, 5, 2, N'Tập 8', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap820224545776.mp4', 1, CAST(0x0000AE8C0166C59F AS DateTime), CAST(0x0000AE8C0166C59F AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (20, 5, 2, N'Tập 9', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap920224930588.mp4', 1, CAST(0x0000AE8C0167BAF1 AS DateTime), CAST(0x0000AE8C0167BAF1 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (21, 5, 2, N'Tập 10', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap1020225037713.mp4', 1, CAST(0x0000AE8C01680312 AS DateTime), CAST(0x0000AE8C01680312 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (22, 5, 2, N'Tập 11', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap1120225348916.mp4', 1, CAST(0x0000AE8C0168E476 AS DateTime), CAST(0x0000AE8C0168E476 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (23, 5, 2, N'Tập 12', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap1220225556463.mp4', 1, CAST(0x0000AE8C01697513 AS DateTime), CAST(0x0000AE8C01697513 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (24, 5, 2, N'Tập 13', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap1320225636213.mp4', 1, CAST(0x0000AE8C0169A3A8 AS DateTime), CAST(0x0000AE8C0169A3A8 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (25, 5, 2, N'Tập 14', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap1420225751307.mp4', 1, CAST(0x0000AE8C0169FD30 AS DateTime), CAST(0x0000AE8C0169FD30 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (26, 5, 2, N'Tập 15', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap1520220054596.mp4', 1, CAST(0x0000AE8C016AD5C6 AS DateTime), CAST(0x0000AE8C016AD5C6 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (27, 5, 2, N'Tập 16', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap1620221018602.mp4', 1, CAST(0x0000AE8C016D7716 AS DateTime), CAST(0x0000AE8C016D7716 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (28, 5, 2, N'Tập 17', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap1720221017008.mp4', 1, CAST(0x0000AE8C016D7D8A AS DateTime), CAST(0x0000AE8C016D7D8A AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (29, 5, 2, N'Tập 18', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap1820221040071.mp4', 1, CAST(0x0000AE8C016D8286 AS DateTime), CAST(0x0000AE8C016D8286 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (31, 5, 2, N'Tập 19', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap1920224120211.mp4', 1, CAST(0x0000AE8C0175F5F8 AS DateTime), CAST(0x0000AE8C0175F5F8 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (32, 6, 2, N'Tập 1', N'/mahouka-koukou-no-rettousei-2-93129312/PhimMahoukaKoukounoRettousei-Raihousha-henTap120225918456.mp4', 1, CAST(0x0000AE8D0159EE59 AS DateTime), CAST(0x0000AE8D0159EE59 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (33, 6, 2, N'Tập 2', N'/mahouka-koukou-no-rettousei-2-93129312/PhimMahoukaKoukounoRettousei-Raihousha-henTap220220013706.mp4', 1, CAST(0x0000AE8D015A2C01 AS DateTime), CAST(0x0000AE8D015A2C01 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (34, 6, 2, N'Tập 3', N'/mahouka-koukou-no-rettousei-2-93129312/PhimMahoukaKoukounoRettousei-Raihousha-henTap320220112597.mp4', 1, CAST(0x0000AE8D015A80A6 AS DateTime), CAST(0x0000AE8D015A80A6 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (35, 6, 2, N'Tập 4', N'/mahouka-koukou-no-rettousei-2-93129312/PhimMahoukaKoukounoRettousei-Raihousha-henTap420220224425.mp4', 1, CAST(0x0000AE8D015AEA37 AS DateTime), CAST(0x0000AE8D015AEA37 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (36, 6, 2, N'Tập 5', N'/mahouka-koukou-no-rettousei-2-93129312/PhimMahoukaKoukounoRettousei-Raihousha-henTap520220357190.mp4', 1, CAST(0x0000AE8D015B6A29 AS DateTime), CAST(0x0000AE8D015B6A29 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (37, 6, 2, N'Tập 6', N'/mahouka-koukou-no-rettousei-2-93129312/PhimMahoukaKoukounoRettousei-Raihousha-henTap620220536878.mp4', 1, CAST(0x0000AE8D015BCA05 AS DateTime), CAST(0x0000AE8D015BCA05 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (38, 6, 2, N'Tập 7', N'/mahouka-koukou-no-rettousei-2-93129312/PhimMahoukaKoukounoRettousei-Raihousha-henTap720220755456.mp4', 1, CAST(0x0000AE8D015C567A AS DateTime), CAST(0x0000AE8D015C567A AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (39, 6, 2, N'Tập 8', N'/mahouka-koukou-no-rettousei-2-93129312/PhimMahoukaKoukounoRettousei-Raihousha-henTap820220752737.mp4', 1, CAST(0x0000AE8D015C5A63 AS DateTime), CAST(0x0000AE8D015C5A63 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (40, 6, 2, N'Tập 9', N'/mahouka-koukou-no-rettousei-2-93129312/PhimMahoukaKoukounoRettousei-Raihousha-henTap920220808347.mp4', 1, CAST(0x0000AE8D015C5CE7 AS DateTime), CAST(0x0000AE8D015C5CE7 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (41, 6, 2, N'Tập 10', N'/mahouka-koukou-no-rettousei-2-93129312/PhimMahoukaKoukounoRettousei-Raihousha-henTap1020220925659.mp4', 1, CAST(0x0000AE8D015CACFE AS DateTime), CAST(0x0000AE8D015CACFE AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (42, 6, 2, N'Tập 11', N'/mahouka-koukou-no-rettousei-2-93129312/PhimMahoukaKoukounoRettousei-Raihousha-henTap1120221113753.mp4', 1, CAST(0x0000AE8D015D3084 AS DateTime), CAST(0x0000AE8D015D3084 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (43, 6, 2, N'Tập 12', N'/mahouka-koukou-no-rettousei-2-93129312/PhimMahoukaKoukounoRettousei-Raihousha-henTap1220221106800.mp4', 1, CAST(0x0000AE8D015D358A AS DateTime), CAST(0x0000AE8D015D358A AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (44, 6, 2, N'Tập 13', N'/mahouka-koukou-no-rettousei-2-93129312/PhimMahoukaKoukounoRettousei-Raihousha-henTap1320221122800.mp4', 1, CAST(0x0000AE8D015D3955 AS DateTime), CAST(0x0000AE8D015D3955 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (45, 6, 2, N'Tập 1.1', N'test', 1, CAST(0x0000AE8D015D45AA AS DateTime), CAST(0x0000AE8D015D45AA AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (46, 5, 2, N'Tập 20', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap2020223244585.mp4', 1, CAST(0x0000AE8D0184231E AS DateTime), CAST(0x0000AE8D0184231E AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (47, 5, 2, N'Tập 21', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap2120225621835.mp4', 1, CAST(0x0000AE8E0010DBDB AS DateTime), CAST(0x0000AE8E0010DBDB AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (48, 5, 2, N'Tập 22', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap2220220207820.mp4', 1, CAST(0x0000AE8E00112C90 AS DateTime), CAST(0x0000AE8E00112C90 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (49, 5, 2, N'Tập 23', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap2320220313585.mp4', 1, CAST(0x0000AE8E001167A8 AS DateTime), CAST(0x0000AE8E001167A8 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (50, 5, 2, N'Tập 24', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap2420220407788.mp4', 1, CAST(0x0000AE8E0011B303 AS DateTime), CAST(0x0000AE8E0011B303 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (51, 5, 2, N'Tập 25', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap2520220517695.mp4', 1, CAST(0x0000AE8E00121887 AS DateTime), CAST(0x0000AE8E00121887 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (52, 7, 2, N'Ep 3 - MUỐN EM LÀ - KEYO | ÚT NHỊ COVER', N'&lt;iframe width=&quot;640&quot; height=&quot;360&quot; src=&quot;https://short.ink/O3sL4VTsl&quot; frameborder=&quot;0&quot; scrolling=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;', 1, CAST(0x0000AE8E0012C05C AS DateTime), CAST(0x0000AEA0017A5801 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (53, 5, 2, N'Tập 26', N'/mahouka-koukou-no-rettousei-71147114/PhimMahoukaKoukouNoRettouseiTap2620220641523.mp4', 1, CAST(0x0000AE8E0012E78F AS DateTime), CAST(0x0000AE8E0012E78F AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (54, 8, 2, N'Tập 2', N'/kaguya-sama-wa-kokurasetai-phan-3-30453045/PhimKaguya-samawaKokurasetai-UltraRomanticTap220225423597.mp4', 1, CAST(0x0000AE8E01062D45 AS DateTime), CAST(0x0000AE8E01062D45 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (55, 8, 2, N'Tập 3', N'/kaguya-sama-wa-kokurasetai-phan-3-30453045/PhimKaguya-samawaKokurasetai-UltraRomanticTap320225428571.mp4', 1, CAST(0x0000AE8E01063191 AS DateTime), CAST(0x0000AE8E01063191 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (56, 8, 2, N'Tập 4', N'/kaguya-sama-wa-kokurasetai-phan-3-30453045/PhimKaguya-samawaKokurasetai-UltraRomanticTap420225417128.mp4', 1, CAST(0x0000AE8E01063542 AS DateTime), CAST(0x0000AE8E01063542 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (57, 8, 2, N'Tập 1', N'/kaguya-sama-wa-kokurasetai-phan-3-30453045/PhimKaguya-samawaKokurasetai-UltraRomanticTap120225429472.mp4', 1, CAST(0x0000AE8E01063B61 AS DateTime), CAST(0x0000AE8E01063B61 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (58, 8, 2, N'Tập 5', N'/kaguya-sama-wa-kokurasetai-phan-3-30453045/PhimKaguya-samawaKokurasetai-UltraRomanticTap520225549643.mp4', 1, CAST(0x0000AE8E010728BF AS DateTime), CAST(0x0000AE8E010728BF AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (59, 4, 2, N'Tập 5', N'/date-a-live-iv-62276227/PhimDateALiveIVTap520225821576.mp4', 1, CAST(0x0000AE8E0120AE42 AS DateTime), CAST(0x0000AE8E0120AE42 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (60, 7, 2, N'Ep 2 - MASHUP 9X | Giấc Mơ Tuyết Trắng - Ngôi Nhà Hạnh Phúc - Cô Bé Mùa Đông | Chu Duyên Cover', N'&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/XtbiqGhJoLg?start=3&quot; title=&quot;YouTube video player&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;', 1, CAST(0x0000AE8E017D84CA AS DateTime), CAST(0x0000AE9800C8DC6C AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (61, 1, 2, N'Tập 5', N'/spy-x-family-141141/PhimSpyxFamilyTap520223157263.mp4', 1, CAST(0x0000AE8F01004887 AS DateTime), CAST(0x0000AE8F01004887 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (63, 8, 2, N'Tập 6', N'/kaguya-sama-wa-kokurasetai-phan-3-30453045/PhimKaguya-samawaKokurasetai-UltraRomanticTap620221411084.mp4', NULL, CAST(0x0000AE95016F891A AS DateTime), CAST(0x0000AE95016F891A AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (64, 17, 2, N'Tập 1', N'/kaguya-sama-wa-kokurasetai-phan-1-91889188/PhimKaguya-samawaKokurasetai-Tensai-tachinoRenaiZunousenTap120222624443.mp4', NULL, CAST(0x0000AE950171DC73 AS DateTime), CAST(0x0000AE950171DC73 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (65, 17, 2, N'Tập 2', N'/kaguya-sama-wa-kokurasetai-phan-1-91889188/PhimKaguya-samawaKokurasetai-Tensai-tachinoRenaiZunousenTap220222735881.mp4', NULL, CAST(0x0000AE9501722B42 AS DateTime), CAST(0x0000AE9501722B42 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (66, 17, 2, N'Tập 3', N'/kaguya-sama-wa-kokurasetai-phan-1-91889188/PhimKaguya-samawaKokurasetai-Tensai-tachinoRenaiZunousenTap320222825849.mp4', NULL, CAST(0x0000AE9501727BFD AS DateTime), CAST(0x0000AE9501727BFD AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (67, 17, 2, N'Tập 4', N'/kaguya-sama-wa-kokurasetai-phan-1-91889188/PhimKaguya-samawaKokurasetai-Tensai-tachinoRenaiZunousenTap420222953615.mp4', NULL, CAST(0x0000AE950172F59C AS DateTime), CAST(0x0000AE950172F59C AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (68, 17, 2, N'Tập 5', N'/kaguya-sama-wa-kokurasetai-phan-1-91889188/PhimKaguya-samawaKokurasetai-Tensai-tachinoRenaiZunousenTap520223115693.mp4', NULL, CAST(0x0000AE95017326CF AS DateTime), CAST(0x0000AE95017326CF AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (69, 17, 2, N'Tập 6', N'/kaguya-sama-wa-kokurasetai-phan-1-91889188/PhimKaguya-samawaKokurasetai-Tensai-tachinoRenaiZunousenTap620223254303.mp4', NULL, CAST(0x0000AE950173A77A AS DateTime), CAST(0x0000AE950173A77A AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (70, 17, 2, N'Tập 7', N'/kaguya-sama-wa-kokurasetai-phan-1-91889188/PhimKaguya-samawaKokurasetai-Tensai-tachinoRenaiZunousenTap720223356662.mp4', NULL, CAST(0x0000AE950173EC2E AS DateTime), CAST(0x0000AE950173EC2E AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (71, 17, 2, N'Tập 8', N'/kaguya-sama-wa-kokurasetai-phan-1-91889188/PhimKaguya-samawaKokurasetai-Tensai-tachinoRenaiZunousenTap820223419912.mp4', NULL, CAST(0x0000AE95017571F9 AS DateTime), CAST(0x0000AE95017571F9 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (72, 17, 2, N'Tập 9', N'/kaguya-sama-wa-kokurasetai-phan-1-91889188/PhimKaguya-samawaKokurasetai-Tensai-tachinoRenaiZunousenTap920223525318.mp4', NULL, CAST(0x0000AE950175729D AS DateTime), CAST(0x0000AE950175729D AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (73, 17, 2, N'Tập 10', N'/kaguya-sama-wa-kokurasetai-phan-1-91889188/PhimKaguya-samawaKokurasetai-Tensai-tachinoRenaiZunousenTap1020223522662.mp4', NULL, CAST(0x0000AE95017573C4 AS DateTime), CAST(0x0000AE95017573C4 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (74, 17, 2, N'Tập 11', N'/kaguya-sama-wa-kokurasetai-phan-1-91889188/PhimKaguya-samawaKokurasetai-Tensai-tachinoRenaiZunousenTap1120223515849.mp4', NULL, CAST(0x0000AE9501757618 AS DateTime), CAST(0x0000AE9501757618 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (75, 17, 2, N'Tập 12', N'/kaguya-sama-wa-kokurasetai-phan-1-91889188/PhimKaguya-samawaKokurasetai-Tensai-tachinoRenaiZunousenTap1220223541162.mp4', NULL, CAST(0x0000AE95017577DA AS DateTime), CAST(0x0000AE95017577DA AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (83, 18, 2, N'Tập 1', N'/kaguya-sama-wa-kokurasetai-phan-2-84938493/PhimKaguya-samawaKokurasetai--Tensai-tachinoRenaiZunousenSeason2Tap120221053209.mp4', NULL, CAST(0x0000AE95017E52EA AS DateTime), CAST(0x0000AE95017E52EA AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (84, 18, 2, N'Tập 2', N'/kaguya-sama-wa-kokurasetai-phan-2-84938493/PhimKaguya-samawaKokurasetai--Tensai-tachinoRenaiZunousenSeason2Tap220221315576.mp4', NULL, CAST(0x0000AE95017F1AFF AS DateTime), CAST(0x0000AE95017F1AFF AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (85, 18, 2, N'Tập 3', N'/kaguya-sama-wa-kokurasetai-phan-2-84938493/PhimKaguya-samawaKokurasetai--Tensai-tachinoRenaiZunousenSeason2Tap320221533676.mp4', NULL, CAST(0x0000AE95017F78F2 AS DateTime), CAST(0x0000AE95017F78F2 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (86, 18, 2, N'Tập 4', N'/kaguya-sama-wa-kokurasetai-phan-2-84938493/PhimKaguya-samawaKokurasetai--Tensai-tachinoRenaiZunousenSeason2Tap420221704239.mp4', NULL, CAST(0x0000AE95017FD581 AS DateTime), CAST(0x0000AE95017FD581 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (87, 18, 2, N'Tập 5', N'/kaguya-sama-wa-kokurasetai-phan-2-84938493/PhimKaguya-samawaKokurasetai--Tensai-tachinoRenaiZunousenSeason2Tap620221829598.mp4', NULL, CAST(0x0000AE9501804A41 AS DateTime), CAST(0x0000AE9501804A41 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (88, 18, 2, N'Tập 6', N'/kaguya-sama-wa-kokurasetai-phan-2-84938493/PhimKaguya-samawaKokurasetai--Tensai-tachinoRenaiZunousenSeason2Tap620222017239.mp4', NULL, CAST(0x0000AE950180A0F9 AS DateTime), CAST(0x0000AE950180A0F9 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (89, 18, 2, N'Tập 7', N'/kaguya-sama-wa-kokurasetai-phan-2-84938493/PhimKaguya-samawaKokurasetai--Tensai-tachinoRenaiZunousenSeason2Tap720222125458.mp4', NULL, CAST(0x0000AE950180F0FD AS DateTime), CAST(0x0000AE950180F0FD AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (90, 18, 2, N'Tập 8', N'/kaguya-sama-wa-kokurasetai-phan-2-84938493/PhimKaguya-samawaKokurasetai--Tensai-tachinoRenaiZunousenSeason2Tap8_20222326473.mp4', NULL, CAST(0x0000AE9501818333 AS DateTime), CAST(0x0000AE9501818333 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (91, 18, 2, N'Tập 9', N'/kaguya-sama-wa-kokurasetai-phan-2-84938493/PhimKaguya-samawaKokurasetai--Tensai-tachinoRenaiZunousenSeason2Tap9_20222427520.mp4', NULL, CAST(0x0000AE950181C4CA AS DateTime), CAST(0x0000AE950181C4CA AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (92, 18, 2, N'Tập 10', N'/kaguya-sama-wa-kokurasetai-phan-2-84938493/PhimKaguya-samawaKokurasetai--Tensai-tachinoRenaiZunousenSeason2Tap10_20222612458.mp4', NULL, CAST(0x0000AE950182490B AS DateTime), CAST(0x0000AE950182490B AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (93, 18, 2, N'Tập 11', N'/kaguya-sama-wa-kokurasetai-phan-2-84938493/PhimKaguya-samawaKokurasetai--Tensai-tachinoRenaiZunousenSeason2Tap11_20222717020.mp4', NULL, CAST(0x0000AE9501829009 AS DateTime), CAST(0x0000AE9501829009 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (94, 18, 2, N'Tập 12', N'/kaguya-sama-wa-kokurasetai-phan-2-84938493/PhimKaguya-samawaKokurasetai--Tensai-tachinoRenaiZunousenSeason2Tap12_20222812770.mp4', NULL, CAST(0x0000AE950182D777 AS DateTime), CAST(0x0000AE950182D777 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (95, 10, 2, N'Tập 1', N'/gakusen-toshi-asterisk-84238423/PhimGakusenToshiAsteriskTap1_20222507437.mp4', NULL, CAST(0x0000AE9600ABBCEC AS DateTime), CAST(0x0000AE9600ABBCF1 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (96, 10, 2, N'Tập 2', N'/gakusen-toshi-asterisk-84238423/PhimGakusenToshiAsteriskTap2_20222554906.mp4', NULL, CAST(0x0000AE9600ABEEAC AS DateTime), CAST(0x0000AE9600ABEEAC AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (97, 10, 2, N'Tập 3', N'/gakusen-toshi-asterisk-84238423/PhimGakusenToshiAsteriskTap3_20222635000.mp4', NULL, CAST(0x0000AE9600AC1BF9 AS DateTime), CAST(0x0000AE9600AC1BF9 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (98, 10, 2, N'Tập 4', N'/gakusen-toshi-asterisk-84238423/PhimGakusenToshiAsteriskTap4_20222714813.mp4', NULL, CAST(0x0000AE9600AC4BEE AS DateTime), CAST(0x0000AE9600AC4BEE AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (99, 10, 2, N'Tập 5', N'/gakusen-toshi-asterisk-84238423/PhimGakusenToshiAsteriskTap5_20222759078.mp4', NULL, CAST(0x0000AE9600AC7FA8 AS DateTime), CAST(0x0000AE9600AC7FA8 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (100, 10, 2, N'Tập 6', N'/gakusen-toshi-asterisk-84238423/PhimGakusenToshiAsteriskTap6_20222840250.mp4', NULL, CAST(0x0000AE9600AD10D7 AS DateTime), CAST(0x0000AE9600AD10D7 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (101, 10, 2, N'Tập 7', N'/gakusen-toshi-asterisk-84238423/PhimGakusenToshiAsteriskTap7_20223045234.mp4', NULL, CAST(0x0000AE9600AD968B AS DateTime), CAST(0x0000AE9600AD968B AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (102, 10, 2, N'Tập 8', N'/gakusen-toshi-asterisk-84238423/PhimGakusenToshiAsteriskTap8_20223245031.mp4', NULL, CAST(0x0000AE9600ADE05B AS DateTime), CAST(0x0000AE9600ADE05B AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (103, 10, 2, N'Tập 9', N'/gakusen-toshi-asterisk-84238423/PhimGakusenToshiAsteriskTap9_20223346765.mp4', NULL, CAST(0x0000AE9600AE1AC8 AS DateTime), CAST(0x0000AE9600AE1AC8 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (104, 10, 2, N'Tập 10', N'/gakusen-toshi-asterisk-84238423/PhimGakusenToshiAsteriskTap10_20223413047.mp4', NULL, CAST(0x0000AE9600AE65D3 AS DateTime), CAST(0x0000AE9600AE65D3 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (105, 10, 2, N'Tập 11', N'/gakusen-toshi-asterisk-84238423/PhimGakusenToshiAsteriskTap11_20223522250.mp4', NULL, CAST(0x0000AE9600AE944F AS DateTime), CAST(0x0000AE9600AE944F AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (106, 10, 2, N'Tập 12', N'/gakusen-toshi-asterisk-84238423/PhimGakusenToshiAsteriskTap12_20223558687.mp4', NULL, CAST(0x0000AE9600AEB6DD AS DateTime), CAST(0x0000AE9600AEB6DD AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (107, 22, 2, N'Tập 1', N'/-gakusen-toshi-asterisk-phan-2-82318231/PhimGakusenToshiAsteriskSS2Tap1_20223750375.mp4', NULL, CAST(0x0000AE9600AF42A0 AS DateTime), CAST(0x0000AE9600AF42A0 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (108, 22, 2, N'Tập 2', N'/-gakusen-toshi-asterisk-phan-2-82318231/PhimGakusenToshiAsteriskSS2Tap2_20223911156.mp4', NULL, CAST(0x0000AE9600AF94E5 AS DateTime), CAST(0x0000AE9600AF94E5 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (109, 22, 2, N'Tập 3', N'/-gakusen-toshi-asterisk-phan-2-82318231/PhimGakusenToshiAsteriskSS2Tap3_20224004156.mp4', NULL, CAST(0x0000AE9600B0131C AS DateTime), CAST(0x0000AE9600B0131C AS DateTime))
GO
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (110, 22, 2, N'Tập 4', N'/-gakusen-toshi-asterisk-phan-2-82318231/PhimGakusenToshiAsteriskSS2Tap4_20224159031.mp4', NULL, CAST(0x0000AE9600B07F2E AS DateTime), CAST(0x0000AE9600B07F2E AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (111, 22, 2, N'Tập 5', N'/-gakusen-toshi-asterisk-phan-2-82318231/PhimGakusenToshiAsteriskSS2Tap5_20224334843.mp4', NULL, CAST(0x0000AE9600B0E8A1 AS DateTime), CAST(0x0000AE9600B0E8A1 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (112, 22, 2, N'Tập 6', N'/-gakusen-toshi-asterisk-phan-2-82318231/PhimGakusenToshiAsteriskSS2Tap6_20224452281.mp4', NULL, CAST(0x0000AE9600B128CA AS DateTime), CAST(0x0000AE9600B128CA AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (113, 22, 2, N'Tập 7', N'/-gakusen-toshi-asterisk-phan-2-82318231/PhimGakusenToshiAsteriskSS2Tap7_20224547812.mp4', NULL, CAST(0x0000AE9600B186DA AS DateTime), CAST(0x0000AE9600B186DA AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (114, 22, 2, N'Tập 8', N'/-gakusen-toshi-asterisk-phan-2-82318231/PhimGakusenToshiAsteriskSS2Tap8_20224712468.mp4', NULL, CAST(0x0000AE9600B1C985 AS DateTime), CAST(0x0000AE9600B1C985 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (115, 22, 2, N'Tập 9', N'/-gakusen-toshi-asterisk-phan-2-82318231/PhimGakusenToshiAsteriskSS2Tap9_20224808015.mp4', NULL, CAST(0x0000AE9600B20ADA AS DateTime), CAST(0x0000AE9600B20ADA AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (116, 22, 2, N'Tập 10', N'/-gakusen-toshi-asterisk-phan-2-82318231/PhimGakusenToshiAsteriskSS2Tap10_20224857015.mp4', NULL, CAST(0x0000AE9600B2482C AS DateTime), CAST(0x0000AE9600B2482C AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (117, 22, 2, N'Tập 11', N'/-gakusen-toshi-asterisk-phan-2-82318231/PhimGakusenToshiAsteriskSS2Tap11_20225001093.mp4', NULL, CAST(0x0000AE9600B29491 AS DateTime), CAST(0x0000AE9600B29491 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (118, 22, 2, N'Tập 12', N'/-gakusen-toshi-asterisk-phan-2-82318231/PhimGakusenToshiAsteriskSS2Tap12_20225058343.mp4', NULL, CAST(0x0000AE9600B2E542 AS DateTime), CAST(0x0000AE9600B2E542 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (119, 23, 2, N'Tập 1', N'/rakudai-kishi-no-cavalry-k-su-thi-ve-mot-hiep-si-luu-ban-81788178/PhimSuThiVeMotHiepSiLuuBanTap1_20225251218.mp4', NULL, CAST(0x0000AE9600B36FD1 AS DateTime), CAST(0x0000AE9600B36FD1 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (120, 23, 2, N'Tập 2', N'/rakudai-kishi-no-cavalry-k-su-thi-ve-mot-hiep-si-luu-ban-81788178/PhimSuThiVeMotHiepSiLuuBanTap2_20225355328.mp4', NULL, CAST(0x0000AE9600B3D602 AS DateTime), CAST(0x0000AE9600B3D602 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (121, 23, 2, N'Tập 3', N'/rakudai-kishi-no-cavalry-k-su-thi-ve-mot-hiep-si-luu-ban-81788178/PhimSuThiVeMotHiepSiLuuBanTap3_20225520890.mp4', NULL, CAST(0x0000AE9600B4125C AS DateTime), CAST(0x0000AE9600B4125C AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (122, 23, 2, N'Tập 4', N'/rakudai-kishi-no-cavalry-k-su-thi-ve-mot-hiep-si-luu-ban-81788178/PhimSuThiVeMotHiepSiLuuBanTap4_20225633375.mp4', NULL, CAST(0x0000AE9600B4651F AS DateTime), CAST(0x0000AE9600B4651F AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (123, 23, 2, N'Tập 5', N'/rakudai-kishi-no-cavalry-k-su-thi-ve-mot-hiep-si-luu-ban-81788178/PhimSuThiVeMotHiepSiLuuBanTap5_20225703953.mp4', NULL, CAST(0x0000AE9600B4D65B AS DateTime), CAST(0x0000AE9600B4D65B AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (124, 23, 2, N'Tập 6', N'/rakudai-kishi-no-cavalry-k-su-thi-ve-mot-hiep-si-luu-ban-81788178/PhimSuThiVeMotHiepSiLuuBanTap6_20225900562.mp4', NULL, CAST(0x0000AE9600B504B7 AS DateTime), CAST(0x0000AE9600B504B7 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (125, 23, 2, N'Tập 7', N'/rakudai-kishi-no-cavalry-k-su-thi-ve-mot-hiep-si-luu-ban-81788178/PhimSuThiVeMotHiepSiLuuBanTap7_20225949250.mp4', NULL, CAST(0x0000AE9600B59487 AS DateTime), CAST(0x0000AE9600B59487 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (126, 23, 2, N'Tập 8', N'/rakudai-kishi-no-cavalry-k-su-thi-ve-mot-hiep-si-luu-ban-81788178/PhimSuThiVeMotHiepSiLuuBanTap8_20220151453.mp4', NULL, CAST(0x0000AE9600B5FCC0 AS DateTime), CAST(0x0000AE9600B5FCC0 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (127, 23, 2, N'Tập 9', N'/rakudai-kishi-no-cavalry-k-su-thi-ve-mot-hiep-si-luu-ban-81788178/PhimSuThiVeMotHiepSiLuuBanTap9_20220323375.mp4', NULL, CAST(0x0000AE9600B64C0E AS DateTime), CAST(0x0000AE9600B64C0E AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (128, 23, 2, N'Tập 10', N'/rakudai-kishi-no-cavalry-k-su-thi-ve-mot-hiep-si-luu-ban-81788178/PhimSuThiVeMotHiepSiLuuBanTap10_20220434750.mp4', NULL, CAST(0x0000AE9600B6BE2A AS DateTime), CAST(0x0000AE9600B6BE2A AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (129, 23, 2, N'Tập 11', N'/rakudai-kishi-no-cavalry-k-su-thi-ve-mot-hiep-si-luu-ban-81788178/PhimSuThiVeMotHiepSiLuuBanTap11_20220556250.mp4', NULL, CAST(0x0000AE9600B6EE65 AS DateTime), CAST(0x0000AE9600B6EE65 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (130, 23, 2, N'Tập 12', N'/rakudai-kishi-no-cavalry-k-su-thi-ve-mot-hiep-si-luu-ban-81788178/PhimSuThiVeMotHiepSiLuuBanTap12_20220653375.mp4', NULL, CAST(0x0000AE9600B7CD54 AS DateTime), CAST(0x0000AE9600B7CD54 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (131, 1, 2, N'Tập 6', N'/spy-x-family-141141/PhimSpyxFamilyTap6_20222615926.mp4', NULL, CAST(0x0000AE9600BC8229 AS DateTime), CAST(0x0000AE9600BC8229 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (132, 11, 1013, N'Tập 1', N'/nisekoi-phan-1-74447444/Nisekoi-Ep01_20224503402.mp4', NULL, CAST(0x0000AE9700E54A3F AS DateTime), CAST(0x0000AE9700E54A3F AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (133, 11, 1013, N'Tập 2', N'/nisekoi-phan-1-74447444/Nisekoi-Ep02_20225650027.mp4', NULL, CAST(0x0000AE9700E69836 AS DateTime), CAST(0x0000AE9700E69836 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (134, 11, 1013, N'Tập 3', N'/nisekoi-phan-1-74447444/Nisekoi-Ep03_20220110340.mp4', NULL, CAST(0x0000AE9700E74962 AS DateTime), CAST(0x0000AE9700E74962 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (135, 11, 1013, N'Tập 4', N'/nisekoi-phan-1-74447444/Nisekoi-Ep04_20220301668.mp4', NULL, CAST(0x0000AE9700E96427 AS DateTime), CAST(0x0000AE9700E96427 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (136, 11, 1013, N'Tập 5', N'/nisekoi-phan-1-74447444/Nisekoi-Ep05_20221104043.mp4', NULL, CAST(0x0000AE9700E9CAE9 AS DateTime), CAST(0x0000AE9700E9CAE9 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (137, 11, 1013, N'Tập 6', N'/nisekoi-phan-1-74447444/Nisekoi-Ep06_20221204277.mp4', NULL, CAST(0x0000AE9700EA1F6A AS DateTime), CAST(0x0000AE9700EA1F6A AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (138, 11, 1013, N'Tập 7', N'/nisekoi-phan-1-74447444/Nisekoi-Ep07_20221333999.mp4', NULL, CAST(0x0000AE9700EA7BFE AS DateTime), CAST(0x0000AE9700EA7BFE AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (139, 11, 1013, N'Tập 8', N'/nisekoi-phan-1-74447444/Nisekoi-Ep08_20221454753.mp4', NULL, CAST(0x0000AE9700EADF80 AS DateTime), CAST(0x0000AE9700EADF80 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (140, 11, 1013, N'Tập 9', N'/nisekoi-phan-1-74447444/Nisekoi-Ep09_20221618032.mp4', NULL, CAST(0x0000AE9700EB6258 AS DateTime), CAST(0x0000AE9700EB6258 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (141, 11, 1013, N'Tập 10', N'/nisekoi-phan-1-74447444/Nisekoi-Ep10_20221855376.mp4', NULL, CAST(0x0000AE9700ECA338 AS DateTime), CAST(0x0000AE9700ECA338 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (142, 11, 1013, N'Tập 11', N'/nisekoi-phan-1-74447444/Nisekoi-Ep11_20222241595.mp4', NULL, CAST(0x0000AE9700ED29E1 AS DateTime), CAST(0x0000AE9700ED29E1 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (143, 11, 1013, N'Tập 12', N'/nisekoi-phan-1-74447444/Nisekoi-Ep12_20222450669.mp4', NULL, CAST(0x0000AE9700ED9479 AS DateTime), CAST(0x0000AE9700ED9479 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (144, 11, 1013, N'Tập 13', N'/nisekoi-phan-1-74447444/Nisekoi-Ep13_20222559715.mp4', NULL, CAST(0x0000AE9700EDE20F AS DateTime), CAST(0x0000AE9700EDE20F AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (145, 11, 1013, N'Tập 14', N'/nisekoi-phan-1-74447444/Nisekoi-Ep14_20222711590.mp4', NULL, CAST(0x0000AE9700EE3AEF AS DateTime), CAST(0x0000AE9700EE3AEF AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (146, 11, 1013, N'Tập 15', N'/nisekoi-phan-1-74447444/Nisekoi-Ep15_20222815028.mp4', NULL, CAST(0x0000AE9700EEFCC1 AS DateTime), CAST(0x0000AE9700EEFCC1 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (147, 11, 1013, N'Tập 16', N'/nisekoi-phan-1-74447444/Nisekoi-Ep16_20223059606.mp4', NULL, CAST(0x0000AE9700EF95C1 AS DateTime), CAST(0x0000AE9700EF95C1 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (148, 11, 1013, N'Tập 17', N'/nisekoi-phan-1-74447444/Nisekoi-Ep17_20223520419.mp4', NULL, CAST(0x0000AE9700F090D4 AS DateTime), CAST(0x0000AE9700F090D4 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (149, 11, 1013, N'Tập 18', N'/nisekoi-phan-1-74447444/Nisekoi-Ep18_20223824262.mp4', NULL, CAST(0x0000AE9700F14BE9 AS DateTime), CAST(0x0000AE9700F14BE9 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (150, 11, 1013, N'Tập 19', N'/nisekoi-phan-1-74447444/Nisekoi-Ep19_20223921325.mp4', NULL, CAST(0x0000AE9700F18B56 AS DateTime), CAST(0x0000AE9700F18B56 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (151, 11, 1013, N'Tập 20', N'/nisekoi-phan-1-74447444/Nisekoi-Ep20_20224031919.mp4', NULL, CAST(0x0000AE9700F1DF2E AS DateTime), CAST(0x0000AE9700F1DF2E AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (152, 12, 1013, N'Tập 1', N'/nisekoi-phan-2-14611461/NisekoiSS2-Ep01_20224204122.mp4', NULL, CAST(0x0000AE9700F2E1BE AS DateTime), CAST(0x0000AE9700F2E1BE AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (153, 12, 1013, N'Tập 2', N'/nisekoi-phan-2-14611461/NisekoiSS2-Ep02_20224510840.mp4', NULL, CAST(0x0000AE9700F38C3C AS DateTime), CAST(0x0000AE9700F38C3C AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (154, 12, 1013, N'Tập 3', N'/nisekoi-phan-2-14611461/NisekoiSS2-Ep03_20224736497.mp4', NULL, CAST(0x0000AE9700F44933 AS DateTime), CAST(0x0000AE9700F44933 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (155, 12, 1013, N'Tập 4', N'/nisekoi-phan-2-14611461/NisekoiSS2-Ep04_20225022544.mp4', NULL, CAST(0x0000AE9700F4EC4F AS DateTime), CAST(0x0000AE9700F4EC4F AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (156, 12, 1013, N'Tập 5', N'/nisekoi-phan-2-14611461/NisekoiSS2-Ep05_20225257512.mp4', NULL, CAST(0x0000AE9700F552CB AS DateTime), CAST(0x0000AE9700F552CB AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (157, 12, 1013, N'Tập 6', N'/nisekoi-phan-2-14611461/NisekoiSS2-Ep06_20225400481.mp4', NULL, CAST(0x0000AE9700F5960C AS DateTime), CAST(0x0000AE9700F5960C AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (158, 12, 1013, N'Tập 7', N'/nisekoi-phan-2-14611461/NisekoiSS2-Ep07_20225505465.mp4', NULL, CAST(0x0000AE9700F5E1BE AS DateTime), CAST(0x0000AE9700F5E1BE AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (159, 12, 1013, N'Tập 8', N'/nisekoi-phan-2-14611461/NisekoiSS2-Ep08_20225556965.mp4', NULL, CAST(0x0000AE9700F61D0D AS DateTime), CAST(0x0000AE9700F61D0D AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (160, 12, 1013, N'Tập 9', N'/nisekoi-phan-2-14611461/NisekoiSS2-Ep09_20225706247.mp4', NULL, CAST(0x0000AE9700F6A1B1 AS DateTime), CAST(0x0000AE9700F6A1B1 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (161, 12, 1013, N'Tập 10', N'/nisekoi-phan-2-14611461/NisekoiSS2-Ep10_20225844215.mp4', NULL, CAST(0x0000AE9700F6F1D6 AS DateTime), CAST(0x0000AE9700F6F1D6 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (162, 12, 1013, N'Tập 11', N'/nisekoi-phan-2-14611461/NisekoiSS2-Ep11_20220012965.mp4', NULL, CAST(0x0000AE9700F74377 AS DateTime), CAST(0x0000AE9700F74377 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (163, 12, 1013, N'Tập 12', N'/nisekoi-phan-2-14611461/NisekoiSS2-Ep12_END_20220118497.mp4', NULL, CAST(0x0000AE9700F7A6CD AS DateTime), CAST(0x0000AE9700F7A6CD AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (164, 9, 1013, N'Tập 1', N'/one-punch-man-75247524/1_20220359419.mp4', NULL, CAST(0x0000AE9700F8558A AS DateTime), CAST(0x0000AE9700F8558A AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (165, 9, 1013, N'Tập 2', N'/one-punch-man-75247524/2_20220450965.mp4', NULL, CAST(0x0000AE9700F88E48 AS DateTime), CAST(0x0000AE9700F88E48 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (166, 9, 1013, N'Tập 3', N'/one-punch-man-75247524/3_20220602794.mp4', NULL, CAST(0x0000AE9700F8FE29 AS DateTime), CAST(0x0000AE9700F8FE29 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (167, 9, 1013, N'Tập 4', N'/one-punch-man-75247524/4_20220738840.mp4', NULL, CAST(0x0000AE9700FA649B AS DateTime), CAST(0x0000AE9700FA649B AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (168, 9, 1013, N'Tập 5', N'/one-punch-man-75247524/5_20221220762.mp4', NULL, CAST(0x0000AE9700FADF5C AS DateTime), CAST(0x0000AE9700FADF5C AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (169, 9, 1013, N'Tập 6', N'/one-punch-man-75247524/6_20221404372.mp4', NULL, CAST(0x0000AE9700FB2122 AS DateTime), CAST(0x0000AE9700FB2122 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (170, 9, 1013, N'Tập 7', N'/one-punch-man-75247524/7_20221540906.mp4', NULL, CAST(0x0000AE9700FBD38D AS DateTime), CAST(0x0000AE9700FBD38D AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (171, 9, 1013, N'Tập 8', N'/one-punch-man-75247524/8_20221744902.mp4', NULL, CAST(0x0000AE9700FDADA5 AS DateTime), CAST(0x0000AE9700FDADA5 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (172, 9, 1013, N'Tập 9', N'/one-punch-man-75247524/9_20222415378.mp4', NULL, CAST(0x0000AE9700FDEAC6 AS DateTime), CAST(0x0000AE9700FDEAC6 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (173, 9, 1013, N'Tập 10', N'/one-punch-man-75247524/10_20222524601.mp4', NULL, CAST(0x0000AE9700FEBE7D AS DateTime), CAST(0x0000AE9700FEBE7D AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (174, 9, 1013, N'Tập 11', N'/one-punch-man-75247524/11_20222807461.mp4', NULL, CAST(0x0000AE9700FEF9AB AS DateTime), CAST(0x0000AE9700FEF9AB AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (175, 9, 1013, N'Tập 12', N'/one-punch-man-75247524/12_20222859195.mp4', NULL, CAST(0x0000AE9700FF604C AS DateTime), CAST(0x0000AE9700FF604C AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (176, 7, 2, N'Ep 1 - Lỡ Yêu Người Đậm Sâu Remix TikTok - Linh Hương Luz - Em Gặp Anh Giữa Thu Mơ Màng', N'/muon-em-la---keyo-k-ut-nhi-cover-386386/LoYeuNguoiDamSauRemixTikTok-LinhHuongLuz-EmGapAnhGiuaThuMoMang_20220757907.mp4', NULL, CAST(0x0000AE9800C7F2EA AS DateTime), CAST(0x0000AE9800C8D378 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (177, 8, 2, N'Tập 7', N'/kaguya-sama-wa-kokurasetai-phan-3-30453045/PhimKaguya-samawaKokurasetai-UltraRomanticTap7_20224132824.mp4', NULL, CAST(0x0000AE9C01869D3A AS DateTime), CAST(0x0000AE9C01869D3A AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1007, 1, 2, N'Tập 7', N'/spy-x-family-141141/PhimSpyxFamilyTap7_20224749977.mp4', NULL, CAST(0x0000AE9D0136EA50 AS DateTime), CAST(0x0000AE9D0136EA50 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1008, 1004, 2, N'Full', N'/nhim-sonic-56645664/XemPhimNhimSonicFullHD-PhimSonictheHedgehogFullHDVietsubThuyetMinh_20225340138.mp4', NULL, CAST(0x0000AE9F00D5CAE4 AS DateTime), CAST(0x0000AE9F0147FE66 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1010, 1005, 2, N'Full', N'/trum--com-va-ac-quy-24892489/[VIETSUB]Trum,ComvaAcQuy-PhimHanhDongToiPhamHotNhat2019_20225657031.mp4|/trum--com-va-ac-quy-24892489/trumcomvaacquy_20225942263.mp4', NULL, CAST(0x0000AEA101175E4E AS DateTime), CAST(0x0000AEA101392BF5 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1011, 1006, 2, N'Full', N'/au-trung-tinh-nghichk-mat-day-chuyen-58455845/XemphimAuTrungTinhNghichMatDayChuyen-LarvaPendant2022[FullHD-Vietsub+Thuyetminh]PhimMoi_20224452377.mp4', NULL, CAST(0x0000AEA30155FB53 AS DateTime), CAST(0x0000AEA30155FB53 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1012, 1007, 2, N'Full', N'/su-thuc-tinh-cua-vu-khi-than-but-cuu-long-full-vietsub--the-treasure-code-2022-10351035/SuThucTinhCuaVuKhiThanButCuuLongFullVietsub,TheTreasureCode2022_20225724752.mp4', NULL, CAST(0x0000AEA3015967C2 AS DateTime), CAST(0x0000AEA3015967C2 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1013, 1009, 2, N'Tập 1', N'/phu-quan-phan-dien-cua-ta-vietsub--wo-de-fan-pai-fu-jun-2022-62736273/PhuQuanPhanDienCuaTaTap1Vietsub,WoDeFanPaiFuJun2022_20220010018.mp4', NULL, CAST(0x0000AEA3015A251C AS DateTime), CAST(0x0000AEA3015A251C AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1014, 1009, 2, N'Tập 2', N'/phu-quan-phan-dien-cua-ta-vietsub--wo-de-fan-pai-fu-jun-2022-62736273/PhuQuanPhanDienCuaTaTap2Vietsub,WoDeFanPaiFuJun2022_20220101377.mp4', NULL, CAST(0x0000AEA3015AAB5C AS DateTime), CAST(0x0000AEA3015AAB5C AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1015, 1009, 2, N'Tập 3', N'/phu-quan-phan-dien-cua-ta-vietsub--wo-de-fan-pai-fu-jun-2022-62736273/PhuQuanPhanDienCuaTaTap3Vietsub,WoDeFanPaiFuJun2022_20220228909.mp4', NULL, CAST(0x0000AEA3015AD083 AS DateTime), CAST(0x0000AEA3015AD083 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1016, 1009, 2, N'Tập 4', N'/phu-quan-phan-dien-cua-ta-vietsub--wo-de-fan-pai-fu-jun-2022-62736273/PhuQuanPhanDienCuaTaTap4Vietsub,WoDeFanPaiFuJun2022_20220513752.mp4', NULL, CAST(0x0000AEA3015BCC31 AS DateTime), CAST(0x0000AEA3015BCC31 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1017, 1009, 2, N'Tập 5', N'/phu-quan-phan-dien-cua-ta-vietsub--wo-de-fan-pai-fu-jun-2022-62736273/PhuQuanPhanDienCuaTaTap5Vietsub,WoDeFanPaiFuJun2022_20220636346.mp4', NULL, CAST(0x0000AEA3015C1927 AS DateTime), CAST(0x0000AEA3015C1927 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1018, 1009, 2, N'Tập 6', N'/phu-quan-phan-dien-cua-ta-vietsub--wo-de-fan-pai-fu-jun-2022-62736273/PhuQuanPhanDienCuaTaTap6Vietsub,WoDeFanPaiFuJun2022_20220741627.mp4', NULL, CAST(0x0000AEA3015C3173 AS DateTime), CAST(0x0000AEA3015C3173 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1019, 1009, 2, N'Tập 7', N'/phu-quan-phan-dien-cua-ta-vietsub--wo-de-fan-pai-fu-jun-2022-62736273/PhuQuanPhanDienCuaTaTap7Vietsub,WoDeFanPaiFuJun2022_20220804190.mp4', NULL, CAST(0x0000AEA3015C5DDA AS DateTime), CAST(0x0000AEA3015C5DDA AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1020, 1009, 2, N'Tập 8', N'/phu-quan-phan-dien-cua-ta-vietsub--wo-de-fan-pai-fu-jun-2022-62736273/PhuQuanPhanDienCuaTaTap8Vietsub,WoDeFanPaiFuJun2022_20220837596.mp4', NULL, CAST(0x0000AEA3015C72DF AS DateTime), CAST(0x0000AEA3015C72DF AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1021, 4, 2, N'Tập 6', N'/date-a-live-iv-62276227/DateALiveIVTap6--AnimeHay_20221142784.mp4', NULL, CAST(0x0000AEA3015D5446 AS DateTime), CAST(0x0000AEA3015D5446 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1022, 4, 2, N'Tập 7', N'/date-a-live-iv-62276227/DateALiveIVTap7--AnimeHay_20221230018.mp4', NULL, CAST(0x0000AEA3015D92F4 AS DateTime), CAST(0x0000AEA3015D92F4 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1023, 4, 2, N'Tập 8', N'/te-thien-dai-thanh-2022-full-vietsub--the-monkey-king-2022-36803680/DateALiveIVTap8--AnimeHay1_20221433643.mp4', NULL, CAST(0x0000AEA3015E538B AS DateTime), CAST(0x0000AEA3015E538B AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1024, 8, 2, N'Tập 8', N'/kaguya-sama-wa-kokurasetai-phan-3-30453045/Kaguya-samawaKokurasetai-UltraRomanticTap8--AnimeHay_20221706018.mp4', NULL, CAST(0x0000AEA3015EDC8F AS DateTime), CAST(0x0000AEA3015EDC8F AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1025, 1008, 2, N'Full', N'/te-thien-dai-thanh-2022-full-vietsub--the-monkey-king-2022-36803680/TeThienDaiThanh2022FullVietsub,TheMonkeyKing20221_20221728706.mp4', NULL, CAST(0x0000AEA3015EF03E AS DateTime), CAST(0x0000AEA3015EF03E AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1037, 1011, 2, N'Full', N'/vach-tran-dia-nguc-sok-phong-chat-thu-n-46894689/VachTranDiaNgucSo-PhongChatThuN_20221006260.mp4', NULL, CAST(0x0000AEA3016D6EFF AS DateTime), CAST(0x0000AEA3016D6EFF AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1038, 1013, 2, N'Full', N'/--thoat-khoi-mogadishu-53135313/ThoatKhoiMogadishuTapFullVietSub-ThuyetMinh_20223550405.mp4', NULL, CAST(0x0000AEA30176B5F8 AS DateTime), CAST(0x0000AEA30176B5F8 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (1039, 1, 2, N'Tập 8', N'/spy-x-family-141141/SpyxFamilyTap8--AnimeHay_20223433517.mp4', NULL, CAST(0x0000AEA5009E5C4E AS DateTime), CAST(0x0000AEA5009E5C4E AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2037, 2011, 2, N'Full', N'/canh-sat-tap-su---midnight-runners-19211921/XemPhimCanhSatTapSu-MidnightRunners[FullHD-Vietsub]-ssPhim_20223616223.mp4|&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/7mvU1BdKknY?start=419&quot; title=&quot;YouTube video player&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;| &lt;iframe width=&quot;640&quot; height=&quot;360&quot; src=&quot;https://short.ink/R1rnqMOie&quot; frameborder=&quot;0&quot; scrolling=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;|&lt;iframe width=&quot;560&quot; height=&quot;315&quot; src=&quot;https://www.youtube.com/embed/7mvU1BdKknY?start=419&quot; title=&quot;YouTube video player&quot; frameborder=&quot;0&quot; allow=&quot;accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture&quot; allowfullscreen&gt;&lt;/iframe&gt;', NULL, CAST(0x0000AEA6000A0767 AS DateTime), CAST(0x0000AEA700C20B35 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2038, 2012, 2, N'Full', N'/doi-cuu-ho-cua-chip-va-dale---chip-n-dalek-rescue-rangers-2022-30313031/DoiCuuHoCuaChipvaDale-ChipnDale-RescueRangers2022[FullHD-Vietsub]-ss_20225149823.mp4', NULL, CAST(0x0000AEA700E4ABAC AS DateTime), CAST(0x0000AEA700E4ABAC AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2039, 2013, 2, N'Full', N'/tuyet-ung-linh-chu---dongbo-xueying-land-2022-85238523/TuyetUngLinhChu-DongBoXueYingLand2022[FullHD-Vietsub]-ss_20220821854.mp4', NULL, CAST(0x0000AEA700E9A1D7 AS DateTime), CAST(0x0000AEA700E9A1D7 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2040, 2014, 2, N'Full', N'/doraemonk-nobita-va-dao-giau-vang-29592959/Doraemon-NobitaVaDaoGiauVangFullHD-Doraemon-NobitasTreasureIslandFullHDVietsubThuyetMinh_20221415803.mp4', NULL, CAST(0x0000AEA7017F3D9A AS DateTime), CAST(0x0000AEA7017F3D9A AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2041, 1012, 2, N'Full', N'/nhung-ke-nguyen-rua-85008500/XemPhimNhungKebiNguyenRuaFullHD-PhimTheCursed-DeadsMansPreyFullHDVietsubThuyetMinh_20221512532.mp4', NULL, CAST(0x0000AEA80155EAA4 AS DateTime), CAST(0x0000AEA80155EAA9 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2042, 4, 2, N'Tập 9', N'/date-a-live-iv-62276227/DateALiveIVTap9--AnimeHay1_20222957492.mp4|/date-a-live-iv-62276227/DateALiveIVTap9--AnimeHay_20222901789.mp4|/date-a-live-iv-62276227/FDownloader.net-_426686735682429-720p_20221355003.mp4', NULL, CAST(0x0000AEAA00AD5864 AS DateTime), CAST(0x0000AEAA011C634A AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2043, 2015, 2, N'Full', N'&lt;iframe width=&quot;640&quot; height=&quot;360&quot; src=&quot;https://short.ink/hzVXCYARb&quot; frameborder=&quot;0&quot; scrolling=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;', NULL, CAST(0x0000AEAA0126F978 AS DateTime), CAST(0x0000AEAA01282E5E AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2044, 8, 2, N'Tập 9', N'/kaguya-sama-wa-kokurasetai-phan-3-30453045/Kaguya-samawaKokurasetai-UltraRomanticTap9--AnimeHay_20222832726.mp4', NULL, CAST(0x0000AEAB006B328E AS DateTime), CAST(0x0000AEAB006B328E AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2045, 1, 2, N'Tập 9', N'/spy-x-family-141141/SpyxFamilyTap9--AnimeHay_20225844308.mp4', NULL, CAST(0x0000AEAB01284DB0 AS DateTime), CAST(0x0000AEAB01284DB0 AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2046, 2016, 2, N'Full', N'/iron-man-phan-1---nguoi-sat-2008-14631463/NguoiSatTapFullVietSub-ThuyetMinh_20221038097.mp4', NULL, CAST(0x0000AEAD013C548F AS DateTime), CAST(0x0000AEAD013C548F AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2047, 2017, 1013, N'Demo 1', N'/bao-cao-31073107/Reno7Z5G-Batmosieutrainghiem_20225713315.mp4|&lt;iframe width=&quot;640&quot; height=&quot;360&quot; src=&quot;https://short.ink/hzVXCYARb&quot; frameborder=&quot;0&quot; scrolling=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;', NULL, CAST(0x0000AEAE0186D920 AS DateTime), CAST(0x0000AEAF0020598F AS DateTime))
GO
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2048, 2017, 1013, N'Demo 1.1', N'/bao-cao-31073107/welcome_20225818714.mp4|/bao-cao-31073107/GalaxyS22UltraOfficialfilm-Theepicstandard-Samsung_20225824099.mp4|&lt;iframe width=&quot;640&quot; height=&quot;360&quot; src=&quot;https://short.ink/ov8kwLNbZ&quot; frameborder=&quot;0&quot; scrolling=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;', NULL, CAST(0x0000AEAF0020FE4F AS DateTime), CAST(0x0000AEAF0020FE4F AS DateTime))
INSERT [dbo].[DB_TAP_PHIM] ([id_tap_phim], [id_phim], [id_user], [ten_tap_phim], [noidung_tap_phim], [status_], [created_at], [updated_at]) VALUES (2049, 2017, 1013, N'Demo 2', N'&lt;iframe width=&quot;640&quot; height=&quot;360&quot; src=&quot;https://short.ink/pmRW_XTQI&quot; frameborder=&quot;0&quot; scrolling=&quot;0&quot; allowfullscreen&gt;&lt;/iframe&gt;|/bao-cao-31073107/vivoY33s-YlaDze-Gia6.990.000d-HotSalegiamngay300.000dong,Tragop0%chitu23-26_12_20220115142.mp4', NULL, CAST(0x0000AEAF00214F0E AS DateTime), CAST(0x0000AEAF00214F0E AS DateTime))
SET IDENTITY_INSERT [dbo].[DB_TAP_PHIM] OFF
SET IDENTITY_INSERT [dbo].[DB_THELOAI] ON 

INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (1, N'Hành động', N'Gây cấn, kịch tính, mãn nhãn', 0, CAST(0x0000AE5600BE1F40 AS DateTime), CAST(0x0000AE5600BE1F40 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (4, N'Hài Hước', N'Nội dung có chứa các tình tiết gây cười.', 1, CAST(0x0000ADD60084AD9E AS DateTime), CAST(0x0000ADD60084AD9E AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (5, N'Phiêu Lưu', N'Hành trình chu du khắp thế giới', 1, CAST(0x0000ADD60084D8A8 AS DateTime), CAST(0x0000ADD60084D8A8 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (6, N'Harem', N'Truyện sẽ tập trung vào nhân vật chính  được bao quanh (theo đuổi) bởi hai hay nhiều nhật vật khác giới hoặc đồng giới.', 1, CAST(0x0000ADD60087C155 AS DateTime), CAST(0x0000ADD60087C155 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (7, N'Đời thường', N'Cuộc sống hàng ngày', 1, CAST(0x0000ADD60087EE7D AS DateTime), CAST(0x0000ADD60087EE7D AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (8, N'Siêu nhiên', N'Hiện tượng kỳ ảo giả tưởng', 1, CAST(0x0000ADD60089680C AS DateTime), CAST(0x0000ADD60089680C AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (9, N'Siêu năng lực', N'Nhân vật có khả năng đặc biệt', 1, CAST(0x0000ADD600899562 AS DateTime), CAST(0x0000ADD600899562 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (10, N'Lịch sử', N'Đề tài có liên quan tới lịch sử', 1, CAST(0x0000ADD60089CBE1 AS DateTime), CAST(0x0000ADD60089CBE1 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (11, N'Mecha', N'Nơi những cổ máy, những con robot sẽ trở thành một phần trong cuộc sống của các nhân vật trong truyện. ', 1, CAST(0x0000ADD60089E16F AS DateTime), CAST(0x0000ADD60089E16F AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (12, N'Trinh thám', N'Nơi mà nhân vật chính sẽ là những người khám phá ra các bí mật được ẩn giấu sau các vụ án hay những bí ẩn được che giấu. Nhân vật chính thường có nghề nghiệp như thám tử, điệp viên , v.v.... ', 1, CAST(0x0000ADD6008A1B6C AS DateTime), CAST(0x0000ADD6008A1B6C AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (13, N'Tình Cảm - Lãng mạn', N'Truyện có các yếu tố đào sâu vào cảm xúc tình cảm của các nhân vật trong tình yêu. ', 1, CAST(0x0000ADD6008AE3F2 AS DateTime), CAST(0x0000ADD6008AE3F2 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (14, N'Âm nhạc', N'Nơi chữa lành tâm hồn bằng những giai điệu.', 1, CAST(0x0000ADD6008B5924 AS DateTime), CAST(0x0000ADD6008B5924 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (16, N'Kinh dị', N'Rùng rợn máu me', 1, CAST(0x0000ADD6008D5DE4 AS DateTime), CAST(0x0000ADD6008D5DE4 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (17, N'Drama', N'Chính kịch. Truyện sẽ mang đến nhiều cung bậc cảm xúc và thường sẽ xoay quanh một vài nhân vật và các mối quan hệ xung quanh của nhân vật đó.', 1, CAST(0x0000ADD6008D9416 AS DateTime), CAST(0x0000ADD6008D9416 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (18, N'Shounen', N'Truyện chủ yếu nói về nhân vật nam ở tuổi vị thành niên. ', 1, CAST(0x0000ADD6008ECB73 AS DateTime), CAST(0x0000ADD6008ECB73 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (19, N'Shoujo', N'Nói về nhân vật nữ chủ yếu ở tuổi vị thành niên', 1, CAST(0x0000ADD6008EF769 AS DateTime), CAST(0x0000ADD6008EF769 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (20, N'Thể thao', N'Chủ đề tập trung nói tới các hoạt động  chơi các môn vận động như đá bóng, bóng rổ, bóng chuyền,.... ', 1, CAST(0x0000ADD6008F67C9 AS DateTime), CAST(0x0000ADD6008F67C9 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (21, N'Khoa học Viễn tưởng', N'Thể loại này sẽ mang đến những góc nhìn về nền khoa học tiên tiến hơn và là sản phẩm của trí tưởng tượng mà tạo thành.', 1, CAST(0x0000ADD600904BC6 AS DateTime), CAST(0x0000ADD600904BC6 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (22, N'Yaoi', N'Tình cảm nam x nam (Đam mĩ)', 1, CAST(0x0000ADD60090B5D5 AS DateTime), CAST(0x0000ADD60090B5D5 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (23, N'Yuri', N'Tình cảm nữ x nữ (bách hợp)', 1, CAST(0x0000ADD60090DA6A AS DateTime), CAST(0x0000ADD60090DA6A AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (24, N'Chuyển sinh', N'Tái sinh ở một thế giới khác', 1, CAST(0x0000ADD6009501E6 AS DateTime), CAST(0x0000ADD6009501E6 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (25, N'Xuyên không', N'Du hành thời gian, không gian.', 1, CAST(0x0000ADD6009511EA AS DateTime), CAST(0x0000ADD6009511EA AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (26, N'Phép thuật', N'Nơi nhân vật có thể sử dụng năng lực ma thuật .', 1, CAST(0x0000ADD600D94139 AS DateTime), CAST(0x0000ADD600D94139 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (27, N'Fantasy', N'Được xây dựng dựa trên trí tưởng tượng và sẽ có những tình tiết không có trong thực tại mà do tác giả tưởng tượng mà viết nên.', 1, CAST(0x0000ADD600D9F624 AS DateTime), CAST(0x0000ADD600D9F624 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (28, N'Demons', N'Truyện sẽ đề cập đến nội dung có nhân vật  chính hoặc phụ là ác quỷ nhiều  hơn.', 1, CAST(0x0000ADD600DA2B7F AS DateTime), CAST(0x0000ADD600DA2B7F AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (29, N'Game', N'Xoay quanh các chủ đề mà nhân vật phải tham gia vào các trò chơi để sinh tồn, giải trí và nhiều thứ khác trong cuộc sống.', 1, CAST(0x0000ADD600DA4430 AS DateTime), CAST(0x0000ADD600DA4430 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (30, N'Space', N'Ngoài không gian vũ trụ', 1, CAST(0x0000ADD600DA6E2B AS DateTime), CAST(0x0000ADD600DA6E2B AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (31, N'Tragedy', N'Kết cục của truyện thường sẽ là kết buồn (sad ending ) và nhân vật chính sẽ có nhiều rủi ro, mất mát lớn.', 1, CAST(0x0000ADD600DAF790 AS DateTime), CAST(0x0000ADD600DAF790 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (32, N'Bí ẩn', N'Những sự việc chưa được lý giải và sẽ dần hiện rõ chi tiết qua từng hồi truyện.', 1, CAST(0x0000ADD600DB6AEF AS DateTime), CAST(0x0000ADD600DB6AEF AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (33, N'Học đường', N'Nói về những hoạt động ở trường học', 1, CAST(0x0000ADD6014E7227 AS DateTime), CAST(0x0000ADD6014E7227 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (34, N'Ecchi', N'Độ tuổi từ 16+ trở lên', 1, CAST(0x0000ADE20161C30D AS DateTime), CAST(0x0000ADE20161C30D AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (35, N'Quân đội', N'Đề tài liên quan đến chiến tranh và xuất hiện các quân đội', 1, CAST(0x0000ADE201629DB8 AS DateTime), CAST(0x0000ADE201629DB8 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (42, N'Khác', N'Ngoài những thể loại đã có.', 0, CAST(0x0000ADF50177A215 AS DateTime), CAST(0x0000ADF50177A215 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (1001, N'Phim điện ảnh', N'Phim lẻ hay phim điện ảnh, là phim nhựa hay thường gọi là phim chiếu rạp trong ngành điện ảnh hay kỹ thuật số được làm để chiếu tại các rạp chiếu phim, nhằm phân biệt với các loại phim khác như video sử dụng băng hay đĩa và phim truyền hình thường có phí tổn thấp và đơn giản hơn.', 0, CAST(0x0000AE9F00D44739 AS DateTime), CAST(0x0000AE9F00D44739 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (1003, N'Phim cổ trang', N'Phim cổ trang là một thể loại phim chi tiết hóa các phục trang, bối cảnh và đạo cụ sao cho đặc trưng nhất để hợp với bầu không khí của giai đoạn trước khi chế độ phong kiến sụp đổ. ', 0, CAST(0x0000AEA301571BA9 AS DateTime), CAST(0x0000AEA301571BA9 AS DateTime))
INSERT [dbo].[DB_THELOAI] ([id_theloai], [ten_theloai], [mota_theloai], [status_], [created_at], [updated_at]) VALUES (1004, N'Phim tội phạm', N'Trải nghiệm nỗi phấn khích trước một vụ trộm liều lĩnh hay âm mưu của giới trí thức cao – mà không phạm luật. Những bộ phim này giúp bạn nhanh chóng bước vào cuộc sống phạm tội.', 0, CAST(0x0000AEA3016C9A23 AS DateTime), CAST(0x0000AEA3016C9A23 AS DateTime))
SET IDENTITY_INSERT [dbo].[DB_THELOAI] OFF
SET IDENTITY_INSERT [dbo].[DB_THONGBAO] ON 

INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (26, 2, N'd353dadada đã thêm phim Mahouka Koukou No Rettousei 2 của bạn vào thư viện', N'/taikhoan/info', N'true      ', 2013, CAST(0x0000AE8E000CA2EF AS DateTime), CAST(0x0000AE8E000CA2EF AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (27, 2, N'd353dadada đã nhắc đến bạn ở tập phim Tập 1 tại phim Mahouka Koukou No Rettousei 2', N'Phim/mahouka-koukou-no-rettousei-2-93129312-6/32?page=0#binhluan', N'true      ', 2013, CAST(0x0000AE8E000CB543 AS DateTime), CAST(0x0000AE8E000CB543 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (28, 2013, N'duy võ đã cập nhật Mahouka Koukou No Rettousei tập phim Tập 21', N'Phim/mahouka-koukou-no-rettousei-71147114-5/47', NULL, 2, CAST(0x0000AE8E0010DC0B AS DateTime), CAST(0x0000AE8E0010DC0B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (29, 2013, N'duy võ đã cập nhật Mahouka Koukou No Rettousei tập phim Tập 21', N'Phim/mahouka-koukou-no-rettousei-71147114-5/47', NULL, 2, CAST(0x0000AE8E0010DC14 AS DateTime), CAST(0x0000AE8E0010DC14 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (30, 2013, N'duy võ đã cập nhật Mahouka Koukou No Rettousei tập phim Tập 22', N'Phim/mahouka-koukou-no-rettousei-71147114-5/48', NULL, 2, CAST(0x0000AE8E00112CDE AS DateTime), CAST(0x0000AE8E00112CDE AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (31, 2013, N'duy võ đã cập nhật Mahouka Koukou No Rettousei tập phim Tập 22', N'Phim/mahouka-koukou-no-rettousei-71147114-5/48', NULL, 2, CAST(0x0000AE8E00112CE2 AS DateTime), CAST(0x0000AE8E00112CE2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (32, 2013, N'duy võ đã cập nhật Mahouka Koukou No Rettousei tập phim Tập 23', N'Phim/mahouka-koukou-no-rettousei-71147114-5/49', NULL, 2, CAST(0x0000AE8E001167B7 AS DateTime), CAST(0x0000AE8E001167B7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (33, 2013, N'duy võ đã cập nhật Mahouka Koukou No Rettousei tập phim Tập 23', N'Phim/mahouka-koukou-no-rettousei-71147114-5/49', NULL, 2, CAST(0x0000AE8E001167BC AS DateTime), CAST(0x0000AE8E001167BC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (34, 2013, N'duy võ đã cập nhật Mahouka Koukou No Rettousei tập phim Tập 24', N'Phim/mahouka-koukou-no-rettousei-71147114-5/50', NULL, 2, CAST(0x0000AE8E0011B310 AS DateTime), CAST(0x0000AE8E0011B310 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (35, 2013, N'duy võ đã cập nhật Mahouka Koukou No Rettousei tập phim Tập 24', N'Phim/mahouka-koukou-no-rettousei-71147114-5/50', NULL, 2, CAST(0x0000AE8E0011B315 AS DateTime), CAST(0x0000AE8E0011B315 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (36, 2013, N'duy võ đã cập nhật Mahouka Koukou No Rettousei tập phim Tập 25', N'Phim/mahouka-koukou-no-rettousei-71147114-5/51', NULL, 2, CAST(0x0000AE8E0012188F AS DateTime), CAST(0x0000AE8E0012188F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (37, 2013, N'duy võ đã cập nhật Mahouka Koukou No Rettousei tập phim Tập 25', N'Phim/mahouka-koukou-no-rettousei-71147114-5/51', NULL, 2, CAST(0x0000AE8E00121898 AS DateTime), CAST(0x0000AE8E00121898 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (38, 2013, N'duy võ đã cập nhật Mahouka Koukou No Rettousei tập phim Tập 26', N'Phim/mahouka-koukou-no-rettousei-71147114-5/53', NULL, 2, CAST(0x0000AE8E0012E7B9 AS DateTime), CAST(0x0000AE8E0012E7B9 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (39, 2013, N'duy võ đã cập nhật Mahouka Koukou No Rettousei tập phim Tập 26', N'Phim/mahouka-koukou-no-rettousei-71147114-5/53', NULL, 2, CAST(0x0000AE8E0012E7B9 AS DateTime), CAST(0x0000AE8E0012E7B9 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (40, 2, N'd353dadada đã thêm phim Date A Live IV của bạn vào thư viện', N'/taikhoan/info', N'true      ', 2013, CAST(0x0000AE8E01289311 AS DateTime), CAST(0x0000AE8E01289311 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (41, 2, N'd353dadada đã thêm phim Date A Live IV của bạn vào thư viện', N'/taikhoan/info', N'true      ', 2013, CAST(0x0000AE8E012A9F37 AS DateTime), CAST(0x0000AE8E012A9F37 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (42, 2, N'Tiêu đề:&nbsp;Lỗi_Spy x Family#1_Tập 1#1&nbsp;&nbsp;Mô tả:&nbsp;<strong>alo tap nay bi loi</strong>', N'/cp-admin/tap-phim/capnhat-1', N'true      ', 2, CAST(0x0000AE920089178C AS DateTime), CAST(0x0000AE920089178C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (43, 1013, N'Tiêu đề:&nbsp;Lỗi_Spy x Family#1_Tập 1#1&nbsp;&nbsp;Mô tả:&nbsp;<strong>alo tap nay bi loi</strong>', N'/cp-admin/tap-phim/capnhat-1', N'true      ', 2, CAST(0x0000AE9200891795 AS DateTime), CAST(0x0000AE9200891795 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (44, 1014, N'Tiêu đề:&nbsp;Lỗi_Spy x Family#1_Tập 1#1&nbsp;&nbsp;Mô tả:&nbsp;<strong>alo tap nay bi loi</strong>', N'/cp-admin/tap-phim/capnhat-1', NULL, 2, CAST(0x0000AE9200891795 AS DateTime), CAST(0x0000AE9200891795 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (45, 2, N'Elite Shion đã thêm phim Kaguya-sama wa Kokurasetai Phần 2 của bạn vào thư viện', N'/taikhoan/info', N'true      ', 1013, CAST(0x0000AE9800FE64FC AS DateTime), CAST(0x0000AE9800FE64FC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (46, 2014, N' Bạn nhận được 99999999 coin từ duy võ', N'taikhoan/info#giaodich', NULL, 2, CAST(0x0000AE9D0035845F AS DateTime), CAST(0x0000AE9D0035845F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (47, 2014, N' Bạn nhận được 99999999 coin từ duy võ', N'taikhoan/info#giaodich', NULL, 2, CAST(0x0000AE9D0035892F AS DateTime), CAST(0x0000AE9D0035892F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (48, 2014, N' Bạn nhận được 99999999 coin từ duy võ', N'taikhoan/info#giaodich', NULL, 2, CAST(0x0000AE9D00358F3F AS DateTime), CAST(0x0000AE9D00358F3F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (49, 2014, N' Bạn nhận được 99999999 coin từ duy võ', N'taikhoan/info#giaodich', NULL, 2, CAST(0x0000AE9D0035953C AS DateTime), CAST(0x0000AE9D0035953C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (50, 2014, N'duy võ Giảm 99999999 coin của bạn', N'taikhoan/info#giaodich', NULL, 2, CAST(0x0000AE9D00359B71 AS DateTime), CAST(0x0000AE9D00359B71 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1002, 1013, N'alo đăng phim nhiều vào bạn ơi', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AE9F00D08C0D AS DateTime), CAST(0x0000AE9F00D08C0D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1003, 1013, N'OVERLORD PHẦN 1 với OVERLORD PHẦN 2 chưa có tập', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AE9F00D0A900 AS DateTime), CAST(0x0000AE9F00D0A900 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1004, 2, N'test nhắn tin ', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AE9F00D0BE50 AS DateTime), CAST(0x0000AE9F00D0BE50 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1005, 1013, N' Bạn nhận được 99999999 coin từ duy võ', N'taikhoan/info#giaodich', N'true      ', 2, CAST(0x0000AE9F01522422 AS DateTime), CAST(0x0000AE9F01522422 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1006, 1013, N'duy võ Giảm 66666 coin của bạn', N'taikhoan/info#giaodich', N'true      ', 2, CAST(0x0000AE9F01522A94 AS DateTime), CAST(0x0000AE9F01522A94 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1007, 2, N'd353dadada đã thêm phim Mahouka Koukou No Rettousei của bạn vào thư viện', N'/taikhoan/info', N'true      ', 2013, CAST(0x0000AE9F0185A877 AS DateTime), CAST(0x0000AE9F0185A877 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1008, 2, N'd353dadada vừa bình luận ở tập phim Tập 1 của truyên Mahouka Koukou No Rettousei', N'Phim/mahouka-koukou-no-rettousei-71147114-5/12?page=0#binhluan_trang', N'true      ', 2013, CAST(0x0000AE9F0185B387 AS DateTime), CAST(0x0000AE9F0185B387 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1009, 2, N'd353dadada vừa bình luận ở tập phim Tập 1 của truyên Mahouka Koukou No Rettousei', N'Phim/mahouka-koukou-no-rettousei-71147114-5/12?page=0#binhluan_trang', N'true      ', 2013, CAST(0x0000AE9F0185C3E0 AS DateTime), CAST(0x0000AE9F0185C3E0 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1010, 2, N'd353dadada vừa bình luận ở tập phim Tập 1 của truyên Mahouka Koukou No Rettousei', N'Phim/mahouka-koukou-no-rettousei-71147114-5/12?page=0#binhluan_trang', N'true      ', 2013, CAST(0x0000AE9F0185D03B AS DateTime), CAST(0x0000AE9F0185D03B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1011, 2, N'd353dadada vừa bình luận ở tập phim Tập 1 của truyên Mahouka Koukou No Rettousei', N'Phim/mahouka-koukou-no-rettousei-71147114-5/12?page=0#binhluan_trang', N'true      ', 2013, CAST(0x0000AE9F01865C6C AS DateTime), CAST(0x0000AE9F01865C6C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1012, 2, N'd353dadada vừa bình luận ở tập phim Tập 1 của truyên Mahouka Koukou No Rettousei', N'Phim/mahouka-koukou-no-rettousei-71147114-5/12?page=0#binhluan_trang', N'true      ', 2013, CAST(0x0000AEA00000ACF3 AS DateTime), CAST(0x0000AEA00000ACF3 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1013, 2, N'd353dadada vừa bình luận ở tập phim Tập 1 của truyên Mahouka Koukou No Rettousei', N'Phim/mahouka-koukou-no-rettousei-71147114-5/12?page=0#binhluan_trang', N'true      ', 2013, CAST(0x0000AEA000069CA6 AS DateTime), CAST(0x0000AEA000069CA7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1014, 2, N'd353dadada vừa bình luận ở tập phim Tập 1 của truyên Mahouka Koukou No Rettousei', N'Phim/mahouka-koukou-no-rettousei-71147114-5/12?page=0#binhluan_trang', N'true      ', 2013, CAST(0x0000AEA000081E2C AS DateTime), CAST(0x0000AEA000081E2D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1015, 2, N'd353dadada vừa bình luận ở tập phim Tập 1 của truyên Mahouka Koukou No Rettousei', N'Phim/mahouka-koukou-no-rettousei-71147114-5/12?page=0#binhluan_trang', N'true      ', 2013, CAST(0x0000AEA0000835EA AS DateTime), CAST(0x0000AEA0000835EA AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1016, 2, N'd353dadada đã thêm phim Nhạc sưu tầm của bạn vào thư viện', N'/taikhoan/info', N'true      ', 2013, CAST(0x0000AEA0001029A8 AS DateTime), CAST(0x0000AEA0001029A8 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1017, 2, N'd353dadada vừa bình luận ở tập phim Ep 2 - MASHUP 9X | Giấc Mơ Tuyết Trắng - Ngôi Nhà Hạnh Phúc - Cô Bé Mùa Đông | Chu Duyên Cover của truyên Nhạc sưu tầm', N'Phim/muon-em-la---keyo-k-ut-nhi-cover-386386-7/60?page=0#binhluan_trang', N'true      ', 2013, CAST(0x0000AEA000104211 AS DateTime), CAST(0x0000AEA000104211 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1018, 2013, N' Bạn nhận được 33333333 coin từ duy võ', N'taikhoan/info#giaodich', NULL, 2, CAST(0x0000AEA0001598B7 AS DateTime), CAST(0x0000AEA0001598B7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1019, 2013, N'duy võ Giảm 33333333 coin của bạn', N'taikhoan/info#giaodich', NULL, 2, CAST(0x0000AEA000159F62 AS DateTime), CAST(0x0000AEA000159F62 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1020, 2013, N' Bạn nhận được 333333 coin từ duy võ', N'taikhoan/info#giaodich', NULL, 2, CAST(0x0000AEA00015B1C8 AS DateTime), CAST(0x0000AEA00015B1C8 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1021, 2, N'd353d đã mua phim Nhím Sonic của bạn với 100000               coin', N'/taikhoan/info', N'true      ', 2013, CAST(0x0000AEA000172A29 AS DateTime), CAST(0x0000AEA000172A29 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1022, 2, N'd353d đã thêm phim Kaguya-sama wa Kokurasetai Phần 2 của bạn vào thư viện', N'/taikhoan/info', N'true      ', 2013, CAST(0x0000AEA0001E9D8C AS DateTime), CAST(0x0000AEA0001E9D8C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1023, 2, N'alo đây là thông báo all hệ thôgs', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA0001F543A AS DateTime), CAST(0x0000AEA0001F543A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1024, 1013, N'alo đây là thông báo all hệ thôgs', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA0001F544B AS DateTime), CAST(0x0000AEA0001F544B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1025, 1014, N'alo đây là thông báo all hệ thôgs', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0001F545D AS DateTime), CAST(0x0000AEA0001F545D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1026, 2013, N'alo đây là thông báo all hệ thôgs', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0001F546C AS DateTime), CAST(0x0000AEA0001F546C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1027, 2014, N'alo đây là thông báo all hệ thôgs', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0001F547A AS DateTime), CAST(0x0000AEA0001F547A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1028, 3013, N'alo đây là thông báo all hệ thôgs', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA0001F5487 AS DateTime), CAST(0x0000AEA0001F5487 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1029, 2, N'', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA0002199BF AS DateTime), CAST(0x0000AEA0002199BF AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1030, 1013, N'', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA0002199CD AS DateTime), CAST(0x0000AEA0002199CD AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1031, 1014, N'', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0002199D2 AS DateTime), CAST(0x0000AEA0002199D2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1032, 2013, N'', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0002199D2 AS DateTime), CAST(0x0000AEA0002199D2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1033, 2014, N'', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0002199D7 AS DateTime), CAST(0x0000AEA0002199D7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1034, 3013, N'', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA0002199D7 AS DateTime), CAST(0x0000AEA0002199D7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1035, 2, N'Yahiro Thomas đã thêm phim Mahouka Koukou No Rettousei của bạn vào thư viện', N'/taikhoan/info', N'true      ', 3014, CAST(0x0000AEA000E8B9EE AS DateTime), CAST(0x0000AEA000E8B9EE AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1036, 2, N'Yahiro Thomas đã thêm phim Kaguya-sama wa Kokurasetai Phần 3 của bạn vào thư viện', N'/taikhoan/info', N'true      ', 3014, CAST(0x0000AEA000E8C97E AS DateTime), CAST(0x0000AEA000E8C97E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1037, 2, N'Yahiro Thomas đã thêm phim Overlord Phần 2 của bạn vào thư viện', N'/taikhoan/info', N'true      ', 3014, CAST(0x0000AEA000E8DE88 AS DateTime), CAST(0x0000AEA000E8DE88 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1038, 2, N'Yahiro Thomas đã thêm phim Date A Live IV của bạn vào thư viện', N'/taikhoan/info', N'true      ', 3014, CAST(0x0000AEA000E8EECF AS DateTime), CAST(0x0000AEA000E8EECF AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1039, 2, N'Yahiro Thomas đã thêm phim NiseKoi Phần 1 của bạn vào thư viện', N'/taikhoan/info', N'true      ', 3014, CAST(0x0000AEA000E8FD09 AS DateTime), CAST(0x0000AEA000E8FD09 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1040, 2, N'Yahiro Thomas đã thêm phim Spy x Family của bạn vào thư viện', N'/taikhoan/info', N'true      ', 3014, CAST(0x0000AEA000E90E03 AS DateTime), CAST(0x0000AEA000E90E03 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1041, 2, N'Yahiro Thomas vừa bình luận ở tập phim Tập 1 của truyên Mahouka Koukou No Rettousei', N'Phim/mahouka-koukou-no-rettousei-71147114-5/12?page=0#binhluan_trang', N'true      ', 3014, CAST(0x0000AEA000E963C2 AS DateTime), CAST(0x0000AEA000E963C2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1042, 3014, N' Bạn nhận được 1000000 coin từ Elite Shion', N'taikhoan/info#giaodich', NULL, 1013, CAST(0x0000AEA000EA8EBC AS DateTime), CAST(0x0000AEA000EA8EBC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1043, 2, N'Test tin nhắn toàn hệ thông', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA000F0D63B AS DateTime), CAST(0x0000AEA000F0D63B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1044, 1013, N'Test tin nhắn toàn hệ thông', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA000F0D660 AS DateTime), CAST(0x0000AEA000F0D660 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1045, 1014, N'Test tin nhắn toàn hệ thông', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA000F0D660 AS DateTime), CAST(0x0000AEA000F0D660 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1046, 2013, N'Test tin nhắn toàn hệ thông', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA000F0D665 AS DateTime), CAST(0x0000AEA000F0D665 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1047, 2014, N'Test tin nhắn toàn hệ thông', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA000F0D665 AS DateTime), CAST(0x0000AEA000F0D665 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1048, 3013, N'Test tin nhắn toàn hệ thông', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA000F0D665 AS DateTime), CAST(0x0000AEA000F0D665 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1049, 3014, N'Test tin nhắn toàn hệ thông', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA000F0D66A AS DateTime), CAST(0x0000AEA000F0D66A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1050, 3014, N'Chào bạn momo mình đã nhận được bạn vui lòng chờ.', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA000F10710 AS DateTime), CAST(0x0000AEA000F10710 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1051, 3014, N' Bạn nhận được 200000 coin từ duy võ', N'taikhoan/info#giaodich', NULL, 2, CAST(0x0000AEA000F130BD AS DateTime), CAST(0x0000AEA000F130BD AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1052, 3014, N'Coin đã được nạp, cảm ơn đẫ ủng hộ.', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA000F1584F AS DateTime), CAST(0x0000AEA000F1584F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1053, 2, N'Yahiro Thomas đã thêm phim Nhạc sưu tầm của bạn vào thư viện', N'/taikhoan/info', N'true      ', 3014, CAST(0x0000AEA00108D613 AS DateTime), CAST(0x0000AEA00108D613 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1054, 2, N'alo alo 1234 alo', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA0010DC644 AS DateTime), CAST(0x0000AEA0010DC644 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1055, 1013, N'alo alo 1234 alo', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA0010DC649 AS DateTime), CAST(0x0000AEA0010DC649 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1056, 1014, N'alo alo 1234 alo', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0010DC649 AS DateTime), CAST(0x0000AEA0010DC649 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1057, 2013, N'alo alo 1234 alo', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0010DC64E AS DateTime), CAST(0x0000AEA0010DC64E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1058, 2014, N'alo alo 1234 alo', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0010DC64E AS DateTime), CAST(0x0000AEA0010DC64E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1059, 3013, N'alo alo 1234 alo', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA0010DC64E AS DateTime), CAST(0x0000AEA0010DC64E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1060, 3014, N'alo alo 1234 alo', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0010DC652 AS DateTime), CAST(0x0000AEA0010DC652 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1061, 2, N'moshimo', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA0010DD2BD AS DateTime), CAST(0x0000AEA0010DD2BD AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1062, 1013, N'moshimo', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA0010DD2C6 AS DateTime), CAST(0x0000AEA0010DD2C6 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1063, 1014, N'moshimo', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0010DD2C6 AS DateTime), CAST(0x0000AEA0010DD2C6 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1064, 2013, N'moshimo', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0010DD2CB AS DateTime), CAST(0x0000AEA0010DD2CB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1065, 2014, N'moshimo', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0010DD2CB AS DateTime), CAST(0x0000AEA0010DD2CB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1066, 3013, N'moshimo', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA0010DD2CB AS DateTime), CAST(0x0000AEA0010DD2CB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1067, 3014, N'moshimo', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0010DD2CF AS DateTime), CAST(0x0000AEA0010DD2CF AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1068, 3014, N'bình luận sàm  nữa là block nhé bạn ơi.', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0010EEC22 AS DateTime), CAST(0x0000AEA0010EEC22 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1069, 3014, N'mình trừ 10 coin nhé.', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA0010EFC97 AS DateTime), CAST(0x0000AEA0010EFC97 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1070, 3014, N'duy võ Giảm 10 coin của bạn', N'taikhoan/info#giaodich', NULL, 2, CAST(0x0000AEA0010F0D1B AS DateTime), CAST(0x0000AEA0010F0D1B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1071, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10004B8C1 AS DateTime), CAST(0x0000AEA10004B8C1 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1072, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10004CA0C AS DateTime), CAST(0x0000AEA10004CA0C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1073, 2, N'Bạn may mắn nhận được 0 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10004F336 AS DateTime), CAST(0x0000AEA10004F336 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1074, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100071B36 AS DateTime), CAST(0x0000AEA100071B36 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1075, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000812CE AS DateTime), CAST(0x0000AEA1000812CE AS DateTime))
GO
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1076, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10008C415 AS DateTime), CAST(0x0000AEA10008C415 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1077, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10008CFC6 AS DateTime), CAST(0x0000AEA10008CFC6 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1078, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10008DB8D AS DateTime), CAST(0x0000AEA10008DB8D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1079, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10008E7F7 AS DateTime), CAST(0x0000AEA10008E7F7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1080, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10008F3AE AS DateTime), CAST(0x0000AEA10008F3AE AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1081, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10008FF74 AS DateTime), CAST(0x0000AEA10008FF74 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1082, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100090BCD AS DateTime), CAST(0x0000AEA100090BCD AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1083, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100091784 AS DateTime), CAST(0x0000AEA100091784 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1084, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100092366 AS DateTime), CAST(0x0000AEA100092366 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1085, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100092EF2 AS DateTime), CAST(0x0000AEA100092EF2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1086, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100093AB0 AS DateTime), CAST(0x0000AEA100093AB0 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1087, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100094661 AS DateTime), CAST(0x0000AEA100094661 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1088, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10009521B AS DateTime), CAST(0x0000AEA10009521B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1089, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10009698C AS DateTime), CAST(0x0000AEA10009698C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1090, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100097544 AS DateTime), CAST(0x0000AEA100097544 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1091, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000980FA AS DateTime), CAST(0x0000AEA1000980FA AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1092, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100098CB1 AS DateTime), CAST(0x0000AEA100098CB1 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1093, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10009986D AS DateTime), CAST(0x0000AEA10009986D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1094, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10009A425 AS DateTime), CAST(0x0000AEA10009A425 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1095, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10009AF2C AS DateTime), CAST(0x0000AEA10009AF2C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1096, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10009C75C AS DateTime), CAST(0x0000AEA10009C75C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1097, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10009D30A AS DateTime), CAST(0x0000AEA10009D30A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1098, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10009E149 AS DateTime), CAST(0x0000AEA10009E149 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1099, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10009F633 AS DateTime), CAST(0x0000AEA10009F633 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1100, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000A01EE AS DateTime), CAST(0x0000AEA1000A01EE AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1101, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000A263D AS DateTime), CAST(0x0000AEA1000A263D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1102, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000A3299 AS DateTime), CAST(0x0000AEA1000A3299 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1103, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000A3DA9 AS DateTime), CAST(0x0000AEA1000A3DA9 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1104, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000A4968 AS DateTime), CAST(0x0000AEA1000A4968 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1105, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000A551C AS DateTime), CAST(0x0000AEA1000A551C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1106, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000A6C90 AS DateTime), CAST(0x0000AEA1000A6C90 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1107, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000A7976 AS DateTime), CAST(0x0000AEA1000A7976 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1108, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000A83FE AS DateTime), CAST(0x0000AEA1000A83FE AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1109, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000A9B71 AS DateTime), CAST(0x0000AEA1000A9B71 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1110, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000AB568 AS DateTime), CAST(0x0000AEA1000AB568 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1111, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000ACCA7 AS DateTime), CAST(0x0000AEA1000ACCA7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1112, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000B2A71 AS DateTime), CAST(0x0000AEA1000B2A71 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1113, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000B34F2 AS DateTime), CAST(0x0000AEA1000B34F2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1114, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000B4FE3 AS DateTime), CAST(0x0000AEA1000B4FE3 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1115, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000B790A AS DateTime), CAST(0x0000AEA1000B790A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1116, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000B849D AS DateTime), CAST(0x0000AEA1000B849D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1117, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000B9083 AS DateTime), CAST(0x0000AEA1000B9083 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1118, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000BA69F AS DateTime), CAST(0x0000AEA1000BA69F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1119, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000BB250 AS DateTime), CAST(0x0000AEA1000BB250 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1120, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000BBE11 AS DateTime), CAST(0x0000AEA1000BBE11 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1121, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000BDDB4 AS DateTime), CAST(0x0000AEA1000BDDB4 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1122, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000BFB02 AS DateTime), CAST(0x0000AEA1000BFB02 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1123, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000C06D2 AS DateTime), CAST(0x0000AEA1000C06D2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1124, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000C1E1F AS DateTime), CAST(0x0000AEA1000C1E1F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1125, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000C29B2 AS DateTime), CAST(0x0000AEA1000C29B2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1126, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F54DA AS DateTime), CAST(0x0000AEA1000F54DA AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1127, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F572C AS DateTime), CAST(0x0000AEA1000F572C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1128, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F5989 AS DateTime), CAST(0x0000AEA1000F5989 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1129, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F5CFB AS DateTime), CAST(0x0000AEA1000F5CFB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1130, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F6466 AS DateTime), CAST(0x0000AEA1000F6466 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1131, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F64E0 AS DateTime), CAST(0x0000AEA1000F64E1 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1132, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F6963 AS DateTime), CAST(0x0000AEA1000F6963 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1133, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F69A0 AS DateTime), CAST(0x0000AEA1000F69A0 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1134, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F6E8E AS DateTime), CAST(0x0000AEA1000F6E8E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1135, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F6EC5 AS DateTime), CAST(0x0000AEA1000F6EC5 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1136, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F6FDB AS DateTime), CAST(0x0000AEA1000F6FDB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1137, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F7212 AS DateTime), CAST(0x0000AEA1000F7212 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1138, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F7476 AS DateTime), CAST(0x0000AEA1000F7476 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1139, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F76C5 AS DateTime), CAST(0x0000AEA1000F76C5 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1140, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F791C AS DateTime), CAST(0x0000AEA1000F791C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1141, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F7B73 AS DateTime), CAST(0x0000AEA1000F7B73 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1142, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F8061 AS DateTime), CAST(0x0000AEA1000F8061 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1143, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F821E AS DateTime), CAST(0x0000AEA1000F821E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1144, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F83B1 AS DateTime), CAST(0x0000AEA1000F83B1 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1145, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F8AF8 AS DateTime), CAST(0x0000AEA1000F8AF8 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1146, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F8D07 AS DateTime), CAST(0x0000AEA1000F8D07 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1147, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F9091 AS DateTime), CAST(0x0000AEA1000F9091 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1148, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F91BF AS DateTime), CAST(0x0000AEA1000F91BF AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1149, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F956F AS DateTime), CAST(0x0000AEA1000F956F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1150, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F98C4 AS DateTime), CAST(0x0000AEA1000F98C4 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1151, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F9B19 AS DateTime), CAST(0x0000AEA1000F9B19 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1152, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000F9D71 AS DateTime), CAST(0x0000AEA1000F9D71 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1153, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FA467 AS DateTime), CAST(0x0000AEA1000FA467 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1154, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FA686 AS DateTime), CAST(0x0000AEA1000FA686 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1155, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FA91B AS DateTime), CAST(0x0000AEA1000FA91B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1156, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FAD90 AS DateTime), CAST(0x0000AEA1000FAD90 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1157, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FAFE6 AS DateTime), CAST(0x0000AEA1000FAFE6 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1158, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FB240 AS DateTime), CAST(0x0000AEA1000FB240 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1159, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FB497 AS DateTime), CAST(0x0000AEA1000FB497 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1160, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FB6EE AS DateTime), CAST(0x0000AEA1000FB6EE AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1161, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FB995 AS DateTime), CAST(0x0000AEA1000FB995 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1162, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FBBEA AS DateTime), CAST(0x0000AEA1000FBBEA AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1163, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FBE40 AS DateTime), CAST(0x0000AEA1000FBE40 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1164, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FC09C AS DateTime), CAST(0x0000AEA1000FC09C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1165, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FC2F4 AS DateTime), CAST(0x0000AEA1000FC2F4 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1166, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FC95A AS DateTime), CAST(0x0000AEA1000FC95A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1167, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FCBB6 AS DateTime), CAST(0x0000AEA1000FCBB6 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1168, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FD067 AS DateTime), CAST(0x0000AEA1000FD067 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1169, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FD2DD AS DateTime), CAST(0x0000AEA1000FD2DD AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1170, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FD935 AS DateTime), CAST(0x0000AEA1000FD935 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1171, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FDB8D AS DateTime), CAST(0x0000AEA1000FDB8D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1172, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FDDE7 AS DateTime), CAST(0x0000AEA1000FDDE7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1173, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1000FE068 AS DateTime), CAST(0x0000AEA1000FE068 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1174, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109A27 AS DateTime), CAST(0x0000AEA100109A27 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1175, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109AA9 AS DateTime), CAST(0x0000AEA100109AA9 AS DateTime))
GO
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1176, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109AED AS DateTime), CAST(0x0000AEA100109AED AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1177, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109B41 AS DateTime), CAST(0x0000AEA100109B41 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1178, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109B86 AS DateTime), CAST(0x0000AEA100109B86 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1179, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109C0D AS DateTime), CAST(0x0000AEA100109C0D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1180, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109C3E AS DateTime), CAST(0x0000AEA100109C3E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1181, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109C79 AS DateTime), CAST(0x0000AEA100109C79 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1182, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109CCE AS DateTime), CAST(0x0000AEA100109CCE AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1183, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109D0C AS DateTime), CAST(0x0000AEA100109D0C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1184, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109DAC AS DateTime), CAST(0x0000AEA100109DAC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1185, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109DFF AS DateTime), CAST(0x0000AEA100109DFF AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1186, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109E36 AS DateTime), CAST(0x0000AEA100109E36 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1187, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109E6F AS DateTime), CAST(0x0000AEA100109E6F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1188, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109EEC AS DateTime), CAST(0x0000AEA100109EEC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1189, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109F6B AS DateTime), CAST(0x0000AEA100109F6B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1190, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109FBB AS DateTime), CAST(0x0000AEA100109FBB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1191, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100109FFD AS DateTime), CAST(0x0000AEA100109FFD AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1192, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10010A0BC AS DateTime), CAST(0x0000AEA10010A0BC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1193, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10010A0F3 AS DateTime), CAST(0x0000AEA10010A0F3 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1194, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10010A13A AS DateTime), CAST(0x0000AEA10010A13A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1195, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10010A17F AS DateTime), CAST(0x0000AEA10010A17F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1196, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10010A1E5 AS DateTime), CAST(0x0000AEA10010A1E5 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1197, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10010A1F2 AS DateTime), CAST(0x0000AEA10010A1F2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1198, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10010A1F2 AS DateTime), CAST(0x0000AEA10010A1F2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1199, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10010ECA0 AS DateTime), CAST(0x0000AEA10010ECA0 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1200, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10010F858 AS DateTime), CAST(0x0000AEA10010F858 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1201, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100110408 AS DateTime), CAST(0x0000AEA100110408 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1202, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100110FBF AS DateTime), CAST(0x0000AEA100110FBF AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1203, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100111B78 AS DateTime), CAST(0x0000AEA100111B78 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1204, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100112746 AS DateTime), CAST(0x0000AEA100112746 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1205, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001132F1 AS DateTime), CAST(0x0000AEA1001132F1 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1206, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100113EA7 AS DateTime), CAST(0x0000AEA100113EA7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1207, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100114949 AS DateTime), CAST(0x0000AEA100114949 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1208, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100119559 AS DateTime), CAST(0x0000AEA100119559 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1209, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100119FE9 AS DateTime), CAST(0x0000AEA100119FE9 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1210, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10011ACF5 AS DateTime), CAST(0x0000AEA10011ACF5 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1211, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10011B882 AS DateTime), CAST(0x0000AEA10011B882 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1212, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10011CEC5 AS DateTime), CAST(0x0000AEA10011CEC5 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1213, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10011DA7D AS DateTime), CAST(0x0000AEA10011DA7D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1214, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10011E767 AS DateTime), CAST(0x0000AEA10011E767 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1215, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10011F51B AS DateTime), CAST(0x0000AEA10011F51B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1216, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10011FDDE AS DateTime), CAST(0x0000AEA10011FDDE AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1217, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10012095F AS DateTime), CAST(0x0000AEA10012095F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1218, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100121515 AS DateTime), CAST(0x0000AEA100121515 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1219, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100122C8A AS DateTime), CAST(0x0000AEA100122C8A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1220, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100124409 AS DateTime), CAST(0x0000AEA100124409 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1221, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001250DE AS DateTime), CAST(0x0000AEA1001250DE AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1222, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100126200 AS DateTime), CAST(0x0000AEA100126200 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1223, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100126E75 AS DateTime), CAST(0x0000AEA100126E75 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1224, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001279DB AS DateTime), CAST(0x0000AEA1001279DB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1225, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100127A6F AS DateTime), CAST(0x0000AEA100127A6F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1226, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100128596 AS DateTime), CAST(0x0000AEA100128596 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1227, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001286BE AS DateTime), CAST(0x0000AEA1001286BE AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1228, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10012F178 AS DateTime), CAST(0x0000AEA10012F178 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1229, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100132174 AS DateTime), CAST(0x0000AEA100132174 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1230, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100135D46 AS DateTime), CAST(0x0000AEA100135D46 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1231, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10013A4E3 AS DateTime), CAST(0x0000AEA10013A4E3 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1232, 2, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10013F6BB AS DateTime), CAST(0x0000AEA10013F6BB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1233, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100140AA6 AS DateTime), CAST(0x0000AEA100140AA6 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1234, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100144399 AS DateTime), CAST(0x0000AEA100144399 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1235, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100146AAF AS DateTime), CAST(0x0000AEA100146AAF AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1236, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100148234 AS DateTime), CAST(0x0000AEA100148234 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1237, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10014A688 AS DateTime), CAST(0x0000AEA10014A688 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1238, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10014D690 AS DateTime), CAST(0x0000AEA10014D690 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1239, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100151130 AS DateTime), CAST(0x0000AEA100151130 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1240, 2, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10015AB25 AS DateTime), CAST(0x0000AEA10015AB25 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1241, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001625B9 AS DateTime), CAST(0x0000AEA1001625B9 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1242, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001ABF5D AS DateTime), CAST(0x0000AEA1001ABF5D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1243, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001BB58A AS DateTime), CAST(0x0000AEA1001BB58A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1244, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001C13D3 AS DateTime), CAST(0x0000AEA1001C13D3 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1245, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001C94BB AS DateTime), CAST(0x0000AEA1001C94BB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1246, 2, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001CBC6C AS DateTime), CAST(0x0000AEA1001CBC6C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1247, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001CD3DC AS DateTime), CAST(0x0000AEA1001CD3DC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1248, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001CFAB4 AS DateTime), CAST(0x0000AEA1001CFAB4 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1249, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001D1AF8 AS DateTime), CAST(0x0000AEA1001D1AF8 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1250, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001D3390 AS DateTime), CAST(0x0000AEA1001D3390 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1251, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001D86C8 AS DateTime), CAST(0x0000AEA1001D86C8 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1252, 2, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001D9E31 AS DateTime), CAST(0x0000AEA1001D9E31 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1253, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001DBB59 AS DateTime), CAST(0x0000AEA1001DBB59 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1254, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001DD2F2 AS DateTime), CAST(0x0000AEA1001DD2F2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1255, 2, N'Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001DE6B9 AS DateTime), CAST(0x0000AEA1001DE6B9 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1256, 2, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001E67C7 AS DateTime), CAST(0x0000AEA1001E67C7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1257, 2, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1001ED40C AS DateTime), CAST(0x0000AEA1001ED40C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1258, 2, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100201FEE AS DateTime), CAST(0x0000AEA100201FEE AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1259, 2, N'Tiêu đề:&nbsp;Lỗi_Mahouka Koukou No Rettousei#5_Tập 1#12&nbsp;&nbsp;Mô tả:&nbsp;<strong>alo lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-12', N'true      ', 0, CAST(0x0000AEA10021ED61 AS DateTime), CAST(0x0000AEA10021ED61 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1260, 1013, N'Tiêu đề:&nbsp;Lỗi_Mahouka Koukou No Rettousei#5_Tập 1#12&nbsp;&nbsp;Mô tả:&nbsp;<strong>alo lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-12', N'true      ', 0, CAST(0x0000AEA10021ED6F AS DateTime), CAST(0x0000AEA10021ED6F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1261, 1014, N'Tiêu đề:&nbsp;Lỗi_Mahouka Koukou No Rettousei#5_Tập 1#12&nbsp;&nbsp;Mô tả:&nbsp;<strong>alo lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-12', N'true      ', 0, CAST(0x0000AEA10021ED7F AS DateTime), CAST(0x0000AEA10021ED7F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1262, 2014, N'Tiêu đề:&nbsp;Lỗi_Mahouka Koukou No Rettousei#5_Tập 1#12&nbsp;&nbsp;Mô tả:&nbsp;<strong>alo lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-12', NULL, 0, CAST(0x0000AEA10021ED8C AS DateTime), CAST(0x0000AEA10021ED8C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1263, 2, N'ạu', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10027D75B AS DateTime), CAST(0x0000AEA10027D75B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1264, 1013, N'ạu', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10027D77A AS DateTime), CAST(0x0000AEA10027D77A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1265, 1014, N'ạu', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA10027D791 AS DateTime), CAST(0x0000AEA10027D791 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1266, 2013, N'ạu', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA10027D7A3 AS DateTime), CAST(0x0000AEA10027D7A3 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1267, 2014, N'ạu', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA10027D7B3 AS DateTime), CAST(0x0000AEA10027D7B3 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1268, 3013, N'ạu', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10027D7C6 AS DateTime), CAST(0x0000AEA10027D7C6 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1269, 3014, N'ạu', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA10027D7D3 AS DateTime), CAST(0x0000AEA10027D7D3 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1270, 2, N'1313', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10027DA58 AS DateTime), CAST(0x0000AEA10027DA58 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1271, 1013, N'1313', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10027DA65 AS DateTime), CAST(0x0000AEA10027DA65 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1272, 1014, N'1313', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA10027DA7C AS DateTime), CAST(0x0000AEA10027DA7C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1273, 2013, N'1313', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA10027DA90 AS DateTime), CAST(0x0000AEA10027DA90 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1274, 2014, N'1313', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA10027DA9E AS DateTime), CAST(0x0000AEA10027DA9E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1275, 3013, N'1313', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10027DAAE AS DateTime), CAST(0x0000AEA10027DAAE AS DateTime))
GO
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1276, 3014, N'1313', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA10027DABC AS DateTime), CAST(0x0000AEA10027DABC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1277, 2, N'test 1', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10028605E AS DateTime), CAST(0x0000AEA10028605E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1278, 1013, N'test 1', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10028606D AS DateTime), CAST(0x0000AEA10028606D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1279, 1014, N'test 1', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA10028607B AS DateTime), CAST(0x0000AEA10028607B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1280, 2013, N'test 1', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100286087 AS DateTime), CAST(0x0000AEA100286087 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1281, 2014, N'test 1', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100286093 AS DateTime), CAST(0x0000AEA100286093 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1282, 3013, N'test 1', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA10028609F AS DateTime), CAST(0x0000AEA10028609F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1283, 3014, N'test 1', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA1002860AE AS DateTime), CAST(0x0000AEA1002860AE AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1284, 2, N'test2', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100286656 AS DateTime), CAST(0x0000AEA100286656 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1285, 1013, N'test2', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100286670 AS DateTime), CAST(0x0000AEA100286670 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1286, 1014, N'test2', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100286680 AS DateTime), CAST(0x0000AEA100286680 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1287, 2013, N'test2', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100286697 AS DateTime), CAST(0x0000AEA100286697 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1288, 2014, N'test2', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA1002866AC AS DateTime), CAST(0x0000AEA1002866AC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1289, 3013, N'test2', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1002866BD AS DateTime), CAST(0x0000AEA1002866BD AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1290, 3014, N'test2', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA1002866CB AS DateTime), CAST(0x0000AEA1002866CB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1291, 2, N'test4', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100286A7A AS DateTime), CAST(0x0000AEA100286A7A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1292, 1013, N'test4', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100286A89 AS DateTime), CAST(0x0000AEA100286A89 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1293, 1014, N'test4', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100286A97 AS DateTime), CAST(0x0000AEA100286A97 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1294, 2013, N'test4', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100286AAB AS DateTime), CAST(0x0000AEA100286AAB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1295, 2014, N'test4', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100286ABA AS DateTime), CAST(0x0000AEA100286ABA AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1296, 3013, N'test4', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100286ACE AS DateTime), CAST(0x0000AEA100286ACE AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1297, 3014, N'test4', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100286ADA AS DateTime), CAST(0x0000AEA100286ADA AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1298, 2, N'4141222 đã thêm phim Kaguya-sama wa Kokurasetai Phần 2 của bạn vào thư viện', N'/taikhoan/info', N'true      ', 3013, CAST(0x0000AEA1002A7E65 AS DateTime), CAST(0x0000AEA1002A7E65 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1299, 3013, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA1002A8AF3 AS DateTime), CAST(0x0000AEA1002A8AF3 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1300, 2, N'4141222 đã thêm phim Nhạc sưu tầm của bạn vào thư viện', N'/taikhoan/info', N'true      ', 3013, CAST(0x0000AEA1002AB26B AS DateTime), CAST(0x0000AEA1002AB26B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1301, 2013, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA1003D2984 AS DateTime), CAST(0x0000AEA1003D2984 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1302, 2013, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA1003DB278 AS DateTime), CAST(0x0000AEA1003DB278 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1303, 1013, N'Bạn nhân được 0 coin khi mua phim Mahouka Koukou No Rettousei', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1009DB50F AS DateTime), CAST(0x0000AEA1009DB50F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1304, 2, N'Elite Shion đã thêm phim Mahouka Koukou No Rettousei của bạn vào thư viện', N'/taikhoan/info', N'true      ', 1013, CAST(0x0000AEA1009DB514 AS DateTime), CAST(0x0000AEA1009DB514 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1305, 1013, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1009DC7F5 AS DateTime), CAST(0x0000AEA1009DC7F5 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1306, 1013, N'Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA1009E4986 AS DateTime), CAST(0x0000AEA1009E4986 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1307, 1013, N'Bạn nhân được 0 coin khi mua phim Date A Live IV', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100A0990B AS DateTime), CAST(0x0000AEA100A0990B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1308, 2, N'Elite Shion đã thêm phim Date A Live IV của bạn vào thư viện', N'/taikhoan/info', N'true      ', 1013, CAST(0x0000AEA100A0990B AS DateTime), CAST(0x0000AEA100A0990B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1309, 1013, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100A0AC53 AS DateTime), CAST(0x0000AEA100A0AC53 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1310, 1013, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100A12D8B AS DateTime), CAST(0x0000AEA100A12D8B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1311, 2, N'Elite Shion vừa bình luận ở tập phim Tập 1 của truyên Date A Live IV', N'Phim/date-a-live-iv-62276227-4/8?page=0#binhluan_trang', N'true      ', 1013, CAST(0x0000AEA100A15F2F AS DateTime), CAST(0x0000AEA100A15F2F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1312, 3014, N'Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100A1AB80 AS DateTime), CAST(0x0000AEA100A1AB80 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1313, 3014, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100A22D99 AS DateTime), CAST(0x0000AEA100A22D99 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1314, 1013, N'Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100A4118C AS DateTime), CAST(0x0000AEA100A4118C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1315, 1013, N'Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100B5DB74 AS DateTime), CAST(0x0000AEA100B5DB74 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1316, 3014, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100B60BE2 AS DateTime), CAST(0x0000AEA100B60BE2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1317, 1013, N'Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100B669B5 AS DateTime), CAST(0x0000AEA100B669B5 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1318, 1013, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100B6FA99 AS DateTime), CAST(0x0000AEA100B6FA99 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1319, 1013, N'Bạn nhân được 7000 coin khi mua phim Nhím Sonic', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100B83C47 AS DateTime), CAST(0x0000AEA100B83C47 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1320, 2, N'Elite Shion đã mua phim Nhím Sonic của bạn với 100000               coin', N'/taikhoan/info', N'true      ', 1013, CAST(0x0000AEA100B83C4C AS DateTime), CAST(0x0000AEA100B83C4C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1321, 1013, N'Bạn nhân được 0 coin khi mua phim Kaguya-sama wa Kokurasetai Phần 3', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100B87542 AS DateTime), CAST(0x0000AEA100B87542 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1322, 2, N'Elite Shion đã thêm phim Kaguya-sama wa Kokurasetai Phần 3 của bạn vào thư viện', N'/taikhoan/info', N'true      ', 1013, CAST(0x0000AEA100B87542 AS DateTime), CAST(0x0000AEA100B87542 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1323, 2, N'SYS: test nhắn tin mới.', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100CC635F AS DateTime), CAST(0x0000AEA100CC635F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1324, 1013, N'SYS: test nhắn tin mới.', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA100CC636E AS DateTime), CAST(0x0000AEA100CC636E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1325, 1014, N'SYS: test nhắn tin mới.', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100CC6377 AS DateTime), CAST(0x0000AEA100CC6377 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1326, 2013, N'SYS: test nhắn tin mới.', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100CC6377 AS DateTime), CAST(0x0000AEA100CC6377 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1327, 2014, N'SYS: test nhắn tin mới.', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100CC6380 AS DateTime), CAST(0x0000AEA100CC6380 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1328, 3013, N'SYS: test nhắn tin mới.', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100CC6398 AS DateTime), CAST(0x0000AEA100CC6398 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1329, 3014, N'SYS: test nhắn tin mới.', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100CC63A6 AS DateTime), CAST(0x0000AEA100CC63A6 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1330, 2, N' Bạn nhận được 100 coin từ duy võ', N'taikhoan/info#giaodich', N'true      ', 2, CAST(0x0000AEA100CC849B AS DateTime), CAST(0x0000AEA100CC849B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1331, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100CFC39E AS DateTime), CAST(0x0000AEA100CFC39E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1332, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100CFC3B1 AS DateTime), CAST(0x0000AEA100CFC3B1 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1333, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100CFC3BC AS DateTime), CAST(0x0000AEA100CFC3BC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1334, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100CFC3C7 AS DateTime), CAST(0x0000AEA100CFC3C7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1335, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100CFCA52 AS DateTime), CAST(0x0000AEA100CFCA52 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1336, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100CFCA5D AS DateTime), CAST(0x0000AEA100CFCA5D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1337, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100CFCA68 AS DateTime), CAST(0x0000AEA100CFCA68 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1338, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100CFCA73 AS DateTime), CAST(0x0000AEA100CFCA73 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1339, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D002FA AS DateTime), CAST(0x0000AEA100D002FA AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1340, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D00328 AS DateTime), CAST(0x0000AEA100D00328 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1341, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D00334 AS DateTime), CAST(0x0000AEA100D00334 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1342, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0033F AS DateTime), CAST(0x0000AEA100D0033F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1343, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D00D54 AS DateTime), CAST(0x0000AEA100D00D54 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1344, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D00D60 AS DateTime), CAST(0x0000AEA100D00D60 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1345, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D00D6D AS DateTime), CAST(0x0000AEA100D00D6D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1346, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D00D79 AS DateTime), CAST(0x0000AEA100D00D79 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1347, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D02A39 AS DateTime), CAST(0x0000AEA100D02A39 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1348, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D02A47 AS DateTime), CAST(0x0000AEA100D02A47 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1349, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D02A55 AS DateTime), CAST(0x0000AEA100D02A55 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1350, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D02A61 AS DateTime), CAST(0x0000AEA100D02A61 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1351, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D02E31 AS DateTime), CAST(0x0000AEA100D02E31 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1352, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D02E3C AS DateTime), CAST(0x0000AEA100D02E3C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1353, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D02E47 AS DateTime), CAST(0x0000AEA100D02E47 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1354, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D02E53 AS DateTime), CAST(0x0000AEA100D02E53 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1355, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D03305 AS DateTime), CAST(0x0000AEA100D03305 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1356, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D03310 AS DateTime), CAST(0x0000AEA100D03310 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1357, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0331C AS DateTime), CAST(0x0000AEA100D0331C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1358, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D03327 AS DateTime), CAST(0x0000AEA100D03327 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1359, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D03663 AS DateTime), CAST(0x0000AEA100D03663 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1360, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D0366E AS DateTime), CAST(0x0000AEA100D0366E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1361, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D03679 AS DateTime), CAST(0x0000AEA100D03679 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1362, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D03685 AS DateTime), CAST(0x0000AEA100D03685 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1363, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D0B405 AS DateTime), CAST(0x0000AEA100D0B405 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1364, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D0B412 AS DateTime), CAST(0x0000AEA100D0B412 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1365, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0B41C AS DateTime), CAST(0x0000AEA100D0B41C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1366, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0B427 AS DateTime), CAST(0x0000AEA100D0B427 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1367, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D0B952 AS DateTime), CAST(0x0000AEA100D0B952 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1368, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D0B95D AS DateTime), CAST(0x0000AEA100D0B95D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1369, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0B968 AS DateTime), CAST(0x0000AEA100D0B968 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1370, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0B972 AS DateTime), CAST(0x0000AEA100D0B972 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1371, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D0BD13 AS DateTime), CAST(0x0000AEA100D0BD13 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1372, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D0BD1F AS DateTime), CAST(0x0000AEA100D0BD1F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1373, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0BD2C AS DateTime), CAST(0x0000AEA100D0BD2C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1374, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong>Có lỗi rồi</strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0BD38 AS DateTime), CAST(0x0000AEA100D0BD38 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1375, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong></strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D0BE08 AS DateTime), CAST(0x0000AEA100D0BE08 AS DateTime))
GO
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1376, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong></strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D0BE15 AS DateTime), CAST(0x0000AEA100D0BE15 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1377, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong></strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0BE21 AS DateTime), CAST(0x0000AEA100D0BE21 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1378, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong></strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0BE2D AS DateTime), CAST(0x0000AEA100D0BE2D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1379, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong></strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D0C177 AS DateTime), CAST(0x0000AEA100D0C177 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1380, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong></strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D0C182 AS DateTime), CAST(0x0000AEA100D0C182 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1381, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong></strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0C18E AS DateTime), CAST(0x0000AEA100D0C18E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1382, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong></strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0C19A AS DateTime), CAST(0x0000AEA100D0C19A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1383, 2, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong></strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D0C3F1 AS DateTime), CAST(0x0000AEA100D0C3F1 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1384, 1013, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong></strong>', N'/cp-admin/tap-phim/capnhat-178', N'true      ', 2, CAST(0x0000AEA100D0C400 AS DateTime), CAST(0x0000AEA100D0C400 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1385, 1014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong></strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0C40E AS DateTime), CAST(0x0000AEA100D0C40E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1386, 2014, N'ERROR: Tiêu đề:&nbsp;Lỗi_test 111#26_ep 1#178&nbsp;&nbsp;Mô tả:&nbsp;<strong></strong>', N'/cp-admin/tap-phim/capnhat-178', NULL, 2, CAST(0x0000AEA100D0C41B AS DateTime), CAST(0x0000AEA100D0C41B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1387, 2, N'Giảng viên đã thêm phim Spy x Family của bạn vào thư viện', N'/taikhoan/info', N'true      ', 2014, CAST(0x0000AEA100E807E3 AS DateTime), CAST(0x0000AEA100E807E3 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1388, 2014, N'Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA100E81493 AS DateTime), CAST(0x0000AEA100E81493 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1389, 2, N'Giảng viên đã thêm phim Nhạc sưu tầm của bạn vào thư viện', N'/taikhoan/info', N'true      ', 2014, CAST(0x0000AEA101233D6F AS DateTime), CAST(0x0000AEA101233D6F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1390, 2014, N'Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA10123C7D3 AS DateTime), CAST(0x0000AEA10123C7D3 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1391, 2, N'Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA2006DCCDB AS DateTime), CAST(0x0000AEA2006DCCDB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1392, 2, N' Bạn nhận được 131313 coin từ duy võ', N'taikhoan/info#giaodich', N'true      ', 2, CAST(0x0000AEA200B2A6BF AS DateTime), CAST(0x0000AEA200B2A6BF AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1393, 2, N'SYS: Bạn may mắn nhận được 2 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA200B2C28A AS DateTime), CAST(0x0000AEA200B2C28A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1394, 2, N'duy võ Giảm 4242 coin của bạn', N'taikhoan/info#giaodich', N'true      ', 2, CAST(0x0000AEA200B2D18D AS DateTime), CAST(0x0000AEA200B2D18D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1395, 2, N'SYS: Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA2010EC42F AS DateTime), CAST(0x0000AEA2010EC42F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1396, 2, N'SYS: Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA3015A39D1 AS DateTime), CAST(0x0000AEA3015A39D1 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1397, 2013, N'duy võ đã cập nhật Date A Live IV tập phim Tập 6', N'Phim/date-a-live-iv-62276227-4/1021', NULL, 2, CAST(0x0000AEA3015D5454 AS DateTime), CAST(0x0000AEA3015D5454 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1398, 2013, N'duy võ đã cập nhật Date A Live IV tập phim Tập 6', N'Phim/date-a-live-iv-62276227-4/1021', NULL, 2, CAST(0x0000AEA3015D5467 AS DateTime), CAST(0x0000AEA3015D5467 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1399, 3014, N'duy võ đã cập nhật Date A Live IV tập phim Tập 6', N'Phim/date-a-live-iv-62276227-4/1021', NULL, 2, CAST(0x0000AEA3015D547F AS DateTime), CAST(0x0000AEA3015D547F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1400, 1013, N'duy võ đã cập nhật Date A Live IV tập phim Tập 6', N'Phim/date-a-live-iv-62276227-4/1021', N'true      ', 2, CAST(0x0000AEA3015D5483 AS DateTime), CAST(0x0000AEA3015D5483 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1401, 2013, N'duy võ đã cập nhật Date A Live IV tập phim Tập 7', N'Phim/date-a-live-iv-62276227-4/1022', NULL, 2, CAST(0x0000AEA3015D9306 AS DateTime), CAST(0x0000AEA3015D9306 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1402, 2013, N'duy võ đã cập nhật Date A Live IV tập phim Tập 7', N'Phim/date-a-live-iv-62276227-4/1022', NULL, 2, CAST(0x0000AEA3015D930B AS DateTime), CAST(0x0000AEA3015D930B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1403, 3014, N'duy võ đã cập nhật Date A Live IV tập phim Tập 7', N'Phim/date-a-live-iv-62276227-4/1022', NULL, 2, CAST(0x0000AEA3015D930B AS DateTime), CAST(0x0000AEA3015D930B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1404, 1013, N'duy võ đã cập nhật Date A Live IV tập phim Tập 7', N'Phim/date-a-live-iv-62276227-4/1022', N'true      ', 2, CAST(0x0000AEA3015D930B AS DateTime), CAST(0x0000AEA3015D930B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1405, 2013, N'duy võ đã cập nhật Date A Live IV tập phim Tập 8', N'Phim/date-a-live-iv-62276227-4/1023', NULL, 2, CAST(0x0000AEA3015E53E9 AS DateTime), CAST(0x0000AEA3015E53E9 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1406, 2013, N'duy võ đã cập nhật Date A Live IV tập phim Tập 8', N'Phim/date-a-live-iv-62276227-4/1023', NULL, 2, CAST(0x0000AEA3015E53FB AS DateTime), CAST(0x0000AEA3015E53FB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1407, 3014, N'duy võ đã cập nhật Date A Live IV tập phim Tập 8', N'Phim/date-a-live-iv-62276227-4/1023', NULL, 2, CAST(0x0000AEA3015E5417 AS DateTime), CAST(0x0000AEA3015E5417 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1408, 1013, N'duy võ đã cập nhật Date A Live IV tập phim Tập 8', N'Phim/date-a-live-iv-62276227-4/1023', N'true      ', 2, CAST(0x0000AEA3015E5421 AS DateTime), CAST(0x0000AEA3015E5421 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1409, 3014, N'duy võ đã cập nhật Kaguya-sama wa Kokurasetai Phần 3 tập phim Tập 8', N'Phim/kaguya-sama-wa-kokurasetai-phan-3-30453045-8/1024', NULL, 2, CAST(0x0000AEA3015EDC9D AS DateTime), CAST(0x0000AEA3015EDC9D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1410, 1013, N'duy võ đã cập nhật Kaguya-sama wa Kokurasetai Phần 3 tập phim Tập 8', N'Phim/kaguya-sama-wa-kokurasetai-phan-3-30453045-8/1024', N'true      ', 2, CAST(0x0000AEA3015EDCAC AS DateTime), CAST(0x0000AEA3015EDCAC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1411, 2, N'SYS: Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA301674CAC AS DateTime), CAST(0x0000AEA301674CAC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1412, 2, N'SYS: Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA30172D5B9 AS DateTime), CAST(0x0000AEA30172D5B9 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1413, 3014, N'duy võ đã cập nhật Spy x Family tập phim Tập 8', N'Phim/spy-x-family-141141-1/1039', NULL, 2, CAST(0x0000AEA5009E5C94 AS DateTime), CAST(0x0000AEA5009E5C94 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (1414, 2014, N'duy võ đã cập nhật Spy x Family tập phim Tập 8', N'Phim/spy-x-family-141141-1/1039', NULL, 2, CAST(0x0000AEA5009E5C9D AS DateTime), CAST(0x0000AEA5009E5C9D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2412, 2, N'SYS: Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA500C76E65 AS DateTime), CAST(0x0000AEA500C76E65 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2413, 2, N'SYS: Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA500C85DB6 AS DateTime), CAST(0x0000AEA500C85DB6 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2414, 2, N'SYS: Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA5010A171D AS DateTime), CAST(0x0000AEA5010A171D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2415, 2, N'SYS: Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA5010A98F9 AS DateTime), CAST(0x0000AEA5010A98F9 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2416, 2, N'SYS: Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA5012BEFC3 AS DateTime), CAST(0x0000AEA5012BEFC3 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2417, 2, N'SYS: Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA601021226 AS DateTime), CAST(0x0000AEA601021226 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2418, 2, N'SYS: Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', N'true      ', 0, CAST(0x0000AEA700C251B9 AS DateTime), CAST(0x0000AEA700C251B9 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2419, 2, N'SYS: Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA700DC1745 AS DateTime), CAST(0x0000AEA700DC1745 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2420, 2, N'SYS: Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA700E12D34 AS DateTime), CAST(0x0000AEA700E12D34 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2421, 2, N'duyvo26 đã thêm phim Tuyết Ưng Lĩnh Chủ - Dongbo Xueying Land (2022) của bạn vào thư viện', N'/taikhoan/info', NULL, 3015, CAST(0x0000AEA700EA181B AS DateTime), CAST(0x0000AEA700EA181B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2422, 3015, N'SYS: Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA700EA2509 AS DateTime), CAST(0x0000AEA700EA2509 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2423, 2, N'duyvo26 vừa bình luận ở tập phim Full của truyên Tuyết Ưng Lĩnh Chủ - Dongbo Xueying Land (2022)', N'Phim/tuyet-ung-linh-chu---dongbo-xueying-land-2022-85238523-2013/2039?page=0#binhluan_trang', NULL, 3015, CAST(0x0000AEA700EA695F AS DateTime), CAST(0x0000AEA700EA695F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2424, 2, N'duyvo26 đã thêm phim Mahouka Koukou No Rettousei 2 của bạn vào thư viện', N'/taikhoan/info', NULL, 3015, CAST(0x0000AEA700EB77D6 AS DateTime), CAST(0x0000AEA700EB77D6 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2425, 3015, N'SYS: Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA700F36603 AS DateTime), CAST(0x0000AEA700F36608 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2426, 3015, N'SYS: Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA700F38443 AS DateTime), CAST(0x0000AEA700F38443 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2427, 3015, N'SYS: Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA700F3979D AS DateTime), CAST(0x0000AEA700F3979D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2428, 3015, N'SYS: Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA700F3C3ED AS DateTime), CAST(0x0000AEA700F3C3ED AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2429, 3015, N'SYS: Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA700F3D6C9 AS DateTime), CAST(0x0000AEA700F3D6C9 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2430, 3015, N'SYS: Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA700F3E749 AS DateTime), CAST(0x0000AEA700F3E749 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2431, 3015, N'SYS: Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA700F3FD8D AS DateTime), CAST(0x0000AEA700F3FD8D AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2432, 3015, N'SYS: Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA700F42308 AS DateTime), CAST(0x0000AEA700F42308 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2433, 3015, N'SYS: Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA700F441F5 AS DateTime), CAST(0x0000AEA700F441F5 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2434, 3015, N'Bạn nhân được 0 coin khi mua phim ẤU TRÙNG TINH NGHỊCH: MẶT DÂY CHUYỀN', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA701453B72 AS DateTime), CAST(0x0000AEA701453B72 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2435, 2, N'duyvo26 đã mua phim ẤU TRÙNG TINH NGHỊCH: MẶT DÂY CHUYỀN của bạn với 10                   coin', N'/taikhoan/info', NULL, 3015, CAST(0x0000AEA701453B77 AS DateTime), CAST(0x0000AEA701453B77 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2436, 2, N'duyvo26 đã mua phim Phu Quân Phản Diện Của Ta Vietsub, Wo De Fan Pai Fu Jun (2022) của bạn với 7                    coin', N'/taikhoan/info', NULL, 3015, CAST(0x0000AEA7017FA00A AS DateTime), CAST(0x0000AEA7017FA00A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2437, 2, N'duyvo26 đã mua phim Cảnh Sát Tập Sự - Midnight Runners của bạn với 3                    coin', N'/taikhoan/info', NULL, 3015, CAST(0x0000AEA7017FB4AD AS DateTime), CAST(0x0000AEA7017FB4AD AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2438, 2, N'duyvo26 đã mua phim ẤU TRÙNG TINH NGHỊCH: MẶT DÂY CHUYỀN của bạn với 10                   coin', N'/taikhoan/info', NULL, 3015, CAST(0x0000AEA800B15FCC AS DateTime), CAST(0x0000AEA800B15FCC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2439, 3015, N'SYS: Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA800B17615 AS DateTime), CAST(0x0000AEA800B17615 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2440, 3015, N'SYS: Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA800B23B03 AS DateTime), CAST(0x0000AEA800B23B03 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2441, 3015, N'SYS: Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA800B3EDA4 AS DateTime), CAST(0x0000AEA800B3EDA4 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2442, 3015, N'SYS: Bạn may mắn nhận được 6 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA800B49664 AS DateTime), CAST(0x0000AEA800B49664 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2443, 2, N'duyvo26 đã mua phim Phu Quân Phản Diện Của Ta Vietsub, Wo De Fan Pai Fu Jun (2022) của bạn với 7                    coin', N'/taikhoan/info', NULL, 3015, CAST(0x0000AEA800B523E7 AS DateTime), CAST(0x0000AEA800B523E7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2444, 2, N'duyvo26 đã mua phim Phu Quân Phản Diện Của Ta Vietsub, Wo De Fan Pai Fu Jun (2022) của bạn với 7                    coin', N'/taikhoan/info', NULL, 3015, CAST(0x0000AEA800B62F34 AS DateTime), CAST(0x0000AEA800B62F34 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2445, 3015, N' Bạn nhận được 100 coin từ duy võ', N'taikhoan/info#giaodich', NULL, 2, CAST(0x0000AEA801560162 AS DateTime), CAST(0x0000AEA801560162 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2446, 3015, N'SYS: Bạn nhân được 0 coin khi mua phim NHỮNG KẺ NGUYỀN RỦA', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA8015625D7 AS DateTime), CAST(0x0000AEA8015625D7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2447, 2, N'duyvo26 đã mua phim NHỮNG KẺ NGUYỀN RỦA của bạn với 6                    coin', N'/taikhoan/info', NULL, 3015, CAST(0x0000AEA8015625FC AS DateTime), CAST(0x0000AEA8015625FC AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2448, 3015, N'SYS: Bạn nhân được 0 coin khi mua phim NHỮNG KẺ NGUYỀN RỦA', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA90094C346 AS DateTime), CAST(0x0000AEA90094C346 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2449, 2, N'duyvo26 đã mua phim NHỮNG KẺ NGUYỀN RỦA của bạn với 6                    coin', N'/taikhoan/info', NULL, 3015, CAST(0x0000AEA90094C34A AS DateTime), CAST(0x0000AEA90094C34A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2450, 3015, N'SYS: Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA90094DCF2 AS DateTime), CAST(0x0000AEA90094DCF2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2451, 3015, N'SYS: Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA900955E33 AS DateTime), CAST(0x0000AEA900955E33 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2452, 2, N'duyvo26 đã thêm phim Spy x Family của bạn vào thư viện', N'/taikhoan/info', NULL, 3015, CAST(0x0000AEA900961E05 AS DateTime), CAST(0x0000AEA900961E05 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2453, 3015, N'SYS: Bạn may mắn nhận được 9 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEA9009B37ED AS DateTime), CAST(0x0000AEA9009B37ED AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2454, 2013, N'duy võ đã cập nhật Date A Live IV tập phim 	Tập 9', N'Phim/date-a-live-iv-62276227-4/2042', NULL, 2, CAST(0x0000AEAA00AD5897 AS DateTime), CAST(0x0000AEAA00AD5897 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2455, 2013, N'duy võ đã cập nhật Date A Live IV tập phim 	Tập 9', N'Phim/date-a-live-iv-62276227-4/2042', NULL, 2, CAST(0x0000AEAA00AD589C AS DateTime), CAST(0x0000AEAA00AD589C AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2456, 3014, N'duy võ đã cập nhật Date A Live IV tập phim 	Tập 9', N'Phim/date-a-live-iv-62276227-4/2042', NULL, 2, CAST(0x0000AEAA00AD58A1 AS DateTime), CAST(0x0000AEAA00AD58A1 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2457, 1013, N'duy võ đã cập nhật Date A Live IV tập phim 	Tập 9', N'Phim/date-a-live-iv-62276227-4/2042', N'true      ', 2, CAST(0x0000AEAA00AD58A1 AS DateTime), CAST(0x0000AEAA00AD58A1 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2458, 2, N'SYS: Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEAA00ADC56E AS DateTime), CAST(0x0000AEAA00ADC56E AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2459, 2, N'SYS: Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEAA01172B96 AS DateTime), CAST(0x0000AEAA01172B96 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2460, 2, N'duyvo26 đã thêm phim Date A Live IV của bạn vào thư viện', N'/taikhoan/info', NULL, 3015, CAST(0x0000AEAB005243A2 AS DateTime), CAST(0x0000AEAB005243A2 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2461, 3015, N'SYS: Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEAB005250F8 AS DateTime), CAST(0x0000AEAB005250F8 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2462, 2, N'SYS: Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEAA0132E622 AS DateTime), CAST(0x0000AEAA0132E622 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2463, 3014, N'duy võ đã cập nhật Kaguya-sama wa Kokurasetai Phần 3 tập phim Tập 9', N'Phim/kaguya-sama-wa-kokurasetai-phan-3-30453045-8/2044', NULL, 2, CAST(0x0000AEAB006B32AF AS DateTime), CAST(0x0000AEAB006B32AF AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2464, 1013, N'duy võ đã cập nhật Kaguya-sama wa Kokurasetai Phần 3 tập phim Tập 9', N'Phim/kaguya-sama-wa-kokurasetai-phan-3-30453045-8/2044', NULL, 2, CAST(0x0000AEAB006B32B4 AS DateTime), CAST(0x0000AEAB006B32B4 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2465, 2, N'SYS: Bạn may mắn nhận được 3 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEAB006B5D9B AS DateTime), CAST(0x0000AEAB006B5D9B AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2466, 3014, N'duy võ đã cập nhật Spy x Family tập phim Tập 9', N'Phim/spy-x-family-141141-1/2045', NULL, 2, CAST(0x0000AEAB01284E9A AS DateTime), CAST(0x0000AEAB01284E9A AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2467, 2014, N'duy võ đã cập nhật Spy x Family tập phim Tập 9', N'Phim/spy-x-family-141141-1/2045', NULL, 2, CAST(0x0000AEAB01284EAD AS DateTime), CAST(0x0000AEAB01284EAD AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2468, 3015, N'duy võ đã cập nhật Spy x Family tập phim Tập 9', N'Phim/spy-x-family-141141-1/2045', NULL, 2, CAST(0x0000AEAB01284EB7 AS DateTime), CAST(0x0000AEAB01284EB7 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2469, 2, N'SYS: Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEAB0128E002 AS DateTime), CAST(0x0000AEAB0128E002 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2470, 2, N'SYS: Bạn may mắn nhận được 1 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEAD013C9AFB AS DateTime), CAST(0x0000AEAD013C9AFB AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2471, 2, N'SYS: Bạn may mắn nhận được 5 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEAD013D1C4F AS DateTime), CAST(0x0000AEAD013D1C4F AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2472, 2, N'SYS: Bạn may mắn nhận được 4 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEAE00AAB305 AS DateTime), CAST(0x0000AEAE00AAB305 AS DateTime))
GO
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2473, 1013, N'SYS: Bạn may mắn nhận được 8 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEAE01870926 AS DateTime), CAST(0x0000AEAE01870926 AS DateTime))
INSERT [dbo].[DB_THONGBAO] ([id], [id_user], [noi_dung], [url], [truy_cap], [id_user_phanhoi], [created_at], [updated_at]) VALUES (2474, 1013, N'SYS: Bạn may mắn nhận được 7 Coin khi xem phim', N'/taikhoan/info', NULL, 0, CAST(0x0000AEAF0020658F AS DateTime), CAST(0x0000AEAF0020658F AS DateTime))
SET IDENTITY_INSERT [dbo].[DB_THONGBAO] OFF
SET IDENTITY_INSERT [dbo].[DB_THUVIEN] ON 

INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (16, 2, 6, 32, CAST(0x0000AE8E0127F505 AS DateTime), CAST(0x0000AEA0010981E4 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (17, 2, 8, 2044, CAST(0x0000AE8E01281B76 AS DateTime), CAST(0x0000AEAB006B5136 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (18, 2, 4, 2042, CAST(0x0000AE8E01283506 AS DateTime), CAST(0x0000AEAA011C90C9 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (19, 2013, 4, 8, CAST(0x0000AE8E01289310 AS DateTime), CAST(0x0000AEA0001ECA33 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (20, 2013, 4, 8, CAST(0x0000AE8E012A9F34 AS DateTime), CAST(0x0000AEA0001ECA33 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (24, 2, 1, 2, CAST(0x0000AE8F011093B2 AS DateTime), CAST(0x0000AEAB016F9DEB AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (26, 2, 5, 47, CAST(0x0000AE8F011E7A20 AS DateTime), CAST(0x0000AEA700C4B317 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (30, 2, 17, 64, CAST(0x0000AE95017CA83A AS DateTime), CAST(0x0000AE96013DA675 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (31, 2, 18, 94, CAST(0x0000AE95017E5E3E AS DateTime), CAST(0x0000AE9700B9BB3D AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (32, 2, 23, 119, CAST(0x0000AE9600B82E35 AS DateTime), CAST(0x0000AE96013ABE35 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (33, 2, 22, 118, CAST(0x0000AE9600B888BE AS DateTime), CAST(0x0000AE9600B888C0 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (34, 1013, 18, 90, CAST(0x0000AE9800FE64F1 AS DateTime), CAST(0x0000AE9800FE6518 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (36, 2, 11, 140, CAST(0x0000AE9D00360836 AS DateTime), CAST(0x0000AE9E014A86C3 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (37, 2, 12, 152, CAST(0x0000AE9D00362632 AS DateTime), CAST(0x0000AE9D00362635 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1002, 2, 7, 52, CAST(0x0000AE9F0009E91F AS DateTime), CAST(0x0000AEAE00AADD1D AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1003, 2, 1004, 1008, CAST(0x0000AE9F00D5F59F AS DateTime), CAST(0x0000AEA0000F8E54 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1004, 2013, 5, 12, CAST(0x0000AE9F0185B8E2 AS DateTime), CAST(0x0000AEA0000A52DF AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1005, 2013, 7, 176, CAST(0x0000AEA000103A2C AS DateTime), CAST(0x0000AEA1003DB885 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1006, 2013, 1004, 1008, CAST(0x0000AEA000173AB1 AS DateTime), CAST(0x0000AEA000173AB1 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1007, 2013, 18, 83, CAST(0x0000AEA0001EAE12 AS DateTime), CAST(0x0000AEA0001EAE12 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1008, 2, 9, 164, CAST(0x0000AEA0001FE2A9 AS DateTime), CAST(0x0000AEA0001FE2A9 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1009, 3014, 5, 12, CAST(0x0000AEA000E8B9ED AS DateTime), CAST(0x0000AEA100B5FBD0 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1010, 3014, 8, 54, CAST(0x0000AEA000E8C97D AS DateTime), CAST(0x0000AEA000E8C97D AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1011, 3014, 25, 0, CAST(0x0000AEA000E8DE87 AS DateTime), CAST(0x0000AEA000E8DE87 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1012, 3014, 4, 8, CAST(0x0000AEA000E8EECB AS DateTime), CAST(0x0000AEA100A19EF2 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1013, 3014, 11, 132, CAST(0x0000AEA000E8FD05 AS DateTime), CAST(0x0000AEA000E8FD05 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1014, 3014, 1, 2, CAST(0x0000AEA000E90E02 AS DateTime), CAST(0x0000AEA0010C0210 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1015, 3014, 7, 176, CAST(0x0000AEA00108D60B AS DateTime), CAST(0x0000AEA001093034 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1016, 3013, 18, 84, CAST(0x0000AEA1002A90DF AS DateTime), CAST(0x0000AEA1002AA684 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1017, 3013, 7, 176, CAST(0x0000AEA1002AC4EE AS DateTime), CAST(0x0000AEA1002AC502 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1018, 1013, 5, 13, CAST(0x0000AEA1009DB508 AS DateTime), CAST(0x0000AEA100B65D8C AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1019, 1013, 4, 8, CAST(0x0000AEA100A09905 AS DateTime), CAST(0x0000AEA100A16135 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1020, 1013, 1004, 1008, CAST(0x0000AEA100B83C43 AS DateTime), CAST(0x0000AEA100B83C43 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1021, 1013, 8, 54, CAST(0x0000AEA100B8753D AS DateTime), CAST(0x0000AEA100B8753D AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1022, 2014, 1, 1, CAST(0x0000AEA100E807D9 AS DateTime), CAST(0x0000AEA100E81C2E AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1023, 2, 1005, 1010, CAST(0x0000AEA101176F14 AS DateTime), CAST(0x0000AEA2010ECECB AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1024, 2014, 7, 60, CAST(0x0000AEA101233D63 AS DateTime), CAST(0x0000AEA101233D7D AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1025, 2, 1009, 1013, CAST(0x0000AEA3015A2D16 AS DateTime), CAST(0x0000AEA3015A2D1E AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1026, 2, 1007, 1012, CAST(0x0000AEA3015EED9F AS DateTime), CAST(0x0000AEA50126D9A0 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1027, 2, 1008, 1025, CAST(0x0000AEA3015F4B45 AS DateTime), CAST(0x0000AEA3015F4B48 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1028, 2, 1011, 1037, CAST(0x0000AEA30172B8D1 AS DateTime), CAST(0x0000AEA5010A06C7 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (1029, 2, 1013, 1038, CAST(0x0000AEA3017718AE AS DateTime), CAST(0x0000AEA3017718B2 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2028, 2, 2011, 2037, CAST(0x0000AEA6000A2399 AS DateTime), CAST(0x0000AEA700C26207 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2029, 2, 2013, 2039, CAST(0x0000AEA700E9B204 AS DateTime), CAST(0x0000AEA700E9B771 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2030, 3015, 2013, 2039, CAST(0x0000AEA700EA1817 AS DateTime), CAST(0x0000AEA701456603 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2031, 3015, 6, 32, CAST(0x0000AEA700EB77D4 AS DateTime), CAST(0x0000AEA700F4671F AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2032, 2, 2012, 2038, CAST(0x0000AEA700F10740 AS DateTime), CAST(0x0000AEA700F10740 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2035, 3015, 2011, 2037, CAST(0x0000AEA7017FB4B0 AS DateTime), CAST(0x0000AEA7017FB4B0 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2038, 3015, 1009, 1013, CAST(0x0000AEA800B65D11 AS DateTime), CAST(0x0000AEA800B6F1C9 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2040, 3015, 1012, 2041, CAST(0x0000AEA90094C33F AS DateTime), CAST(0x0000AEA90095DD42 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2041, 3015, 1, 1, CAST(0x0000AEA900961E04 AS DateTime), CAST(0x0000AEA900961E0C AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2042, 3015, 4, 8, CAST(0x0000AEAA01183531 AS DateTime), CAST(0x0000AEAA01188217 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2043, 2, 2015, 2043, CAST(0x0000AEAA0127E84F AS DateTime), CAST(0x0000AEAA012DD00D AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2044, 2, 2016, 2046, CAST(0x0000AEAD013C83AA AS DateTime), CAST(0x0000AEAE00AAA255 AS DateTime))
INSERT [dbo].[DB_THUVIEN] ([id_thuvien], [id_user], [id_phim], [id_tap_phim], [created_at], [updated_at]) VALUES (2045, 1013, 2017, 2047, CAST(0x0000AEAE00C16467 AS DateTime), CAST(0x0000AEAF00252279 AS DateTime))
SET IDENTITY_INSERT [dbo].[DB_THUVIEN] OFF
SET IDENTITY_INSERT [dbo].[DB_USER] ON 

INSERT [dbo].[DB_USER] ([id_user], [fullname], [ten_dangnhap], [mail], [matkhau_user], [quyen_han], [coin], [ma_khoa], [img_user], [status_], [created_at], [updated_at]) VALUES (2, N'duy võ', N'duyvo', N'duyvo@mail.com', N'7a8fbde2e8c919527d2f8a29e6acd32', N'2', 127257, N'68dbaf636013deb0333d5e6c67add19', N'3485157210846_2970731016506616_5376874345464786497_n.jpg', 1, CAST(0x0000AE5600B96135 AS DateTime), CAST(0x0000AE5600B96135 AS DateTime))
INSERT [dbo].[DB_USER] ([id_user], [fullname], [ten_dangnhap], [mail], [matkhau_user], [quyen_han], [coin], [ma_khoa], [img_user], [status_], [created_at], [updated_at]) VALUES (1013, N'Elite Shion', N'eliteshion', N'EliteShion@mail.com', N'25f9e794323b453885f5181f1b624db', N'2', 15, N'4857ecb2b646599d62add7364c332', N'2064artworks-a1pkRlPYwOO6UEED-wtGF9w-t500x500.jpg', 1, CAST(0x0000AE5F00A3E48E AS DateTime), CAST(0x0000AE5F00A3E48E AS DateTime))
INSERT [dbo].[DB_USER] ([id_user], [fullname], [ten_dangnhap], [mail], [matkhau_user], [quyen_han], [coin], [ma_khoa], [img_user], [status_], [created_at], [updated_at]) VALUES (1014, N'dalca dalca', N'dalca', N'dalca@mail.com', N'8c3084d793e79e206823d4b14aff742c', N'1', 0, N'9cdddd22aa8647bf1747a7c283235e', NULL, 1, CAST(0x0000AE6201120581 AS DateTime), CAST(0x0000AE6201120581 AS DateTime))
INSERT [dbo].[DB_USER] ([id_user], [fullname], [ten_dangnhap], [mail], [matkhau_user], [quyen_han], [coin], [ma_khoa], [img_user], [status_], [created_at], [updated_at]) VALUES (2013, N'd353d', N'd353dadada', N'd353dadada@xn--dd-pia.com', N'ec54dc512d373ea89d4ff9199a66a3ec', N'0', 0, N'b32152f1794eb4322fc1ee9464c77c', NULL, 1, CAST(0x0000AE8E0004F626 AS DateTime), CAST(0x0000AE8E0004F626 AS DateTime))
INSERT [dbo].[DB_USER] ([id_user], [fullname], [ten_dangnhap], [mail], [matkhau_user], [quyen_han], [coin], [ma_khoa], [img_user], [status_], [created_at], [updated_at]) VALUES (2014, N'Giảng viên', N'giangvien', N'giangvien@mail.com', N'2f83951c2e27fcf934a92d091971a2', N'2', 0, N'68a4a8863534ec3063c0323d7db0581a', NULL, 1, CAST(0x0000AE9D0034E427 AS DateTime), CAST(0x0000AE9D0034E427 AS DateTime))
INSERT [dbo].[DB_USER] ([id_user], [fullname], [ten_dangnhap], [mail], [matkhau_user], [quyen_han], [coin], [ma_khoa], [img_user], [status_], [created_at], [updated_at]) VALUES (3013, N'4141222', N'41414141', N'41414141a', N'6682d4f9e33bbd1772725f43692deb8', N'0', 0, N'1811d7615428f062bb647a192806c1e', NULL, 1, CAST(0x0000AEA000174F6C AS DateTime), CAST(0x0000AEA000174F6D AS DateTime))
INSERT [dbo].[DB_USER] ([id_user], [fullname], [ten_dangnhap], [mail], [matkhau_user], [quyen_han], [coin], [ma_khoa], [img_user], [status_], [created_at], [updated_at]) VALUES (3014, N'Yahiro Thomas', N'thomas', N'thomas@mail.com', N'e1adc3949ba59abbe56e057f2f883e', N'0', 0, N'af81725cc339b4113b927472dcafbc68', N'267550911317_f16586fe7248402a99378f0aa28f7ac3.jpg.gif', 1, CAST(0x0000AEA000E7E079 AS DateTime), CAST(0x0000AEA000E7E079 AS DateTime))
INSERT [dbo].[DB_USER] ([id_user], [fullname], [ten_dangnhap], [mail], [matkhau_user], [quyen_han], [coin], [ma_khoa], [img_user], [status_], [created_at], [updated_at]) VALUES (3015, N'duyvo26', N'duyvo26', N'duyvo26@mail.com', N'243f51579da4660be303b8059ee2a4a', N'0', 148, N'fe376012a8d2df4b25618b68179851', N'5753fb.jpg', 1, CAST(0x0000AEA700EA0228 AS DateTime), CAST(0x0000AEA700EA0228 AS DateTime))
INSERT [dbo].[DB_USER] ([id_user], [fullname], [ten_dangnhap], [mail], [matkhau_user], [quyen_han], [coin], [ma_khoa], [img_user], [status_], [created_at], [updated_at]) VALUES (3016, N'tkmod', N'tkmod', N'@mail.com', N'e1adc3949ba59abbe56e057f2f883e', N'1', 0, N'457a4b3887bf5fbcd6d6a25fbaa3', NULL, 1, CAST(0x0000AEA800EC7947 AS DateTime), CAST(0x0000AEA800EC7947 AS DateTime))
SET IDENTITY_INSERT [dbo].[DB_USER] OFF
SET IDENTITY_INSERT [dbo].[DB_VOTE] ON 

INSERT [dbo].[DB_VOTE] ([id_vote], [id_user], [id_phim], [giatri], [created_at], [updated_at]) VALUES (1, 2, 1, 5, CAST(0x0000AE8901712A7E AS DateTime), CAST(0x0000AE8901712A83 AS DateTime))
INSERT [dbo].[DB_VOTE] ([id_vote], [id_user], [id_phim], [giatri], [created_at], [updated_at]) VALUES (2, 2, 6, 5, CAST(0x0000AE8D01844623 AS DateTime), CAST(0x0000AE8D0184462C AS DateTime))
INSERT [dbo].[DB_VOTE] ([id_vote], [id_user], [id_phim], [giatri], [created_at], [updated_at]) VALUES (3, 2, 23, 5, CAST(0x0000AE9600BCFF47 AS DateTime), CAST(0x0000AE9600BCFF47 AS DateTime))
INSERT [dbo].[DB_VOTE] ([id_vote], [id_user], [id_phim], [giatri], [created_at], [updated_at]) VALUES (4, 2, 18, 5, CAST(0x0000AE9600BD0FFF AS DateTime), CAST(0x0000AE9600BD0FFF AS DateTime))
INSERT [dbo].[DB_VOTE] ([id_vote], [id_user], [id_phim], [giatri], [created_at], [updated_at]) VALUES (1003, 2, 1005, 5, CAST(0x0000AEA2006DEDA2 AS DateTime), CAST(0x0000AEA2006DEDA2 AS DateTime))
INSERT [dbo].[DB_VOTE] ([id_vote], [id_user], [id_phim], [giatri], [created_at], [updated_at]) VALUES (1004, 2, 4, 5, CAST(0x0000AEA3015FC891 AS DateTime), CAST(0x0000AEA3015FC891 AS DateTime))
INSERT [dbo].[DB_VOTE] ([id_vote], [id_user], [id_phim], [giatri], [created_at], [updated_at]) VALUES (1005, 2, 1007, 2, CAST(0x0000AEA301792C4B AS DateTime), CAST(0x0000AEA301792C4B AS DateTime))
SET IDENTITY_INSERT [dbo].[DB_VOTE] OFF
ALTER TABLE [dbo].[DB_CAUHINH] ADD  CONSTRAINT [DF__DB_CAUHIN__updat__2D27B809]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[DB_CAUHINH] ADD  CONSTRAINT [DF__DB_CAUHIN__creat__2C3393D0]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DB_COMMENT] ADD  CONSTRAINT [DF__DB_COMMEN__statu__30F848ED]  DEFAULT ((1)) FOR [status_]
GO
ALTER TABLE [dbo].[DB_COMMENT] ADD  CONSTRAINT [DF__DB_COMMEN__creat__31EC6D26]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DB_COMMENT] ADD  CONSTRAINT [DF__DB_COMMEN__updat__32E0915F]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[DB_LOG_COIN] ADD  CONSTRAINT [DF_LogPhim_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DB_LOG_COIN] ADD  CONSTRAINT [DF_LogPhim_updated_at]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[DB_LUOTXEM] ADD  CONSTRAINT [DF_DB_LUOTXEM_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DB_LUOTXEM] ADD  CONSTRAINT [DF_DB_LUOTXEM_updated_at]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[DB_PHIM] ADD  CONSTRAINT [DF__DB_PHIM__statu__38996AB5]  DEFAULT ((1)) FOR [status_]
GO
ALTER TABLE [dbo].[DB_PHIM] ADD  CONSTRAINT [DF__DB_PHIM__coin___398D8EEE]  DEFAULT ((0)) FOR [coin_phim]
GO
ALTER TABLE [dbo].[DB_PHIM] ADD  CONSTRAINT [DF__DB_PHIM__creat__3A81B327]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DB_PHIM] ADD  CONSTRAINT [DF__DB_PHIM__updat__3B75D760]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[DB_PHIM_THELOAI] ADD  CONSTRAINT [DF__DB_PHIM__statu__3C69FB99]  DEFAULT ((1)) FOR [status_]
GO
ALTER TABLE [dbo].[DB_PHIM_THELOAI] ADD  CONSTRAINT [DF__DB_PHIM__creat__3D5E1FD2]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DB_PHIM_THELOAI] ADD  CONSTRAINT [DF__DB_PHIM__updat__3E52440B]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[DB_TAP_PHIM] ADD  CONSTRAINT [DF__DB_TAP_PHIM__statu__2E1BDC42]  DEFAULT ((1)) FOR [status_]
GO
ALTER TABLE [dbo].[DB_TAP_PHIM] ADD  CONSTRAINT [DF__DB_TAP_PHIM__creat__2F10007B]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DB_TAP_PHIM] ADD  CONSTRAINT [DF__DB_TAP_PHIM__updat__300424B4]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[DB_THELOAI] ADD  CONSTRAINT [DF__DB_THELOA__statu__33D4B598]  DEFAULT ((1)) FOR [status_]
GO
ALTER TABLE [dbo].[DB_THELOAI] ADD  CONSTRAINT [DF__DB_THELOA__creat__34C8D9D1]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DB_THELOAI] ADD  CONSTRAINT [DF__DB_THELOA__updat__35BCFE0A]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[DB_THONGBAO] ADD  CONSTRAINT [DF_DB_THONGBAO_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DB_THONGBAO] ADD  CONSTRAINT [DF_DB_THONGBAO_updated_at]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[DB_THUVIEN] ADD  CONSTRAINT [DF__DB_THUVIE__creat__36B12243]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DB_THUVIEN] ADD  CONSTRAINT [DF__DB_THUVIE__updat__37A5467C]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[DB_USER] ADD  CONSTRAINT [DF__DB_USER__quyen_h__3F466844]  DEFAULT ((0)) FOR [quyen_han]
GO
ALTER TABLE [dbo].[DB_USER] ADD  CONSTRAINT [DF__DB_USER__coin__403A8C7D]  DEFAULT ((0)) FOR [coin]
GO
ALTER TABLE [dbo].[DB_USER] ADD  CONSTRAINT [DF__DB_USER__status___412EB0B6]  DEFAULT ((1)) FOR [status_]
GO
ALTER TABLE [dbo].[DB_USER] ADD  CONSTRAINT [DF__DB_USER__created__4222D4EF]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DB_USER] ADD  CONSTRAINT [DF__DB_USER__updated__4316F928]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[DB_VOTE] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DB_VOTE] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[DB_COMMENT]  WITH CHECK ADD  CONSTRAINT [FK_DB_COMMENT_DB_PHIM] FOREIGN KEY([id_phim])
REFERENCES [dbo].[DB_PHIM] ([id_phim])
GO
ALTER TABLE [dbo].[DB_COMMENT] CHECK CONSTRAINT [FK_DB_COMMENT_DB_PHIM]
GO
ALTER TABLE [dbo].[DB_COMMENT]  WITH CHECK ADD  CONSTRAINT [FK_DB_COMMENT_DB_TAP_PHIM] FOREIGN KEY([id_tap_phim])
REFERENCES [dbo].[DB_TAP_PHIM] ([id_tap_phim])
GO
ALTER TABLE [dbo].[DB_COMMENT] CHECK CONSTRAINT [FK_DB_COMMENT_DB_TAP_PHIM]
GO
ALTER TABLE [dbo].[DB_COMMENT]  WITH CHECK ADD  CONSTRAINT [FK_DB_COMMENT_DB_USER] FOREIGN KEY([id_user])
REFERENCES [dbo].[DB_USER] ([id_user])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DB_COMMENT] CHECK CONSTRAINT [FK_DB_COMMENT_DB_USER]
GO
ALTER TABLE [dbo].[DB_LUOTXEM]  WITH CHECK ADD  CONSTRAINT [FK_DB_LUOTXEM_DB_PHIM] FOREIGN KEY([id_phim])
REFERENCES [dbo].[DB_PHIM] ([id_phim])
GO
ALTER TABLE [dbo].[DB_LUOTXEM] CHECK CONSTRAINT [FK_DB_LUOTXEM_DB_PHIM]
GO
ALTER TABLE [dbo].[DB_LUOTXEM]  WITH CHECK ADD  CONSTRAINT [FK_DB_LUOTXEM_DB_TAP_PHIM] FOREIGN KEY([id_tap_phim])
REFERENCES [dbo].[DB_TAP_PHIM] ([id_tap_phim])
GO
ALTER TABLE [dbo].[DB_LUOTXEM] CHECK CONSTRAINT [FK_DB_LUOTXEM_DB_TAP_PHIM]
GO
ALTER TABLE [dbo].[DB_LUOTXEM]  WITH CHECK ADD  CONSTRAINT [FK_DB_LUOTXEM_DB_USER] FOREIGN KEY([id_user])
REFERENCES [dbo].[DB_USER] ([id_user])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DB_LUOTXEM] CHECK CONSTRAINT [FK_DB_LUOTXEM_DB_USER]
GO
ALTER TABLE [dbo].[DB_PHIM]  WITH CHECK ADD  CONSTRAINT [FK_DB_PHIM_DB_USER] FOREIGN KEY([id_user])
REFERENCES [dbo].[DB_USER] ([id_user])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DB_PHIM] CHECK CONSTRAINT [FK_DB_PHIM_DB_USER]
GO
ALTER TABLE [dbo].[DB_PHIM_THELOAI]  WITH CHECK ADD  CONSTRAINT [FK_DB_PHIM_THELOAI_DB_PHIM] FOREIGN KEY([id_phim])
REFERENCES [dbo].[DB_PHIM] ([id_phim])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DB_PHIM_THELOAI] CHECK CONSTRAINT [FK_DB_PHIM_THELOAI_DB_PHIM]
GO
ALTER TABLE [dbo].[DB_PHIM_THELOAI]  WITH CHECK ADD  CONSTRAINT [FK_DB_PHIM_THELOAI_DB_THELOAI] FOREIGN KEY([id_theloai])
REFERENCES [dbo].[DB_THELOAI] ([id_theloai])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DB_PHIM_THELOAI] CHECK CONSTRAINT [FK_DB_PHIM_THELOAI_DB_THELOAI]
GO
ALTER TABLE [dbo].[DB_TAP_PHIM]  WITH CHECK ADD  CONSTRAINT [FK_DB_TAP_PHIM_DB_PHIM1] FOREIGN KEY([id_phim])
REFERENCES [dbo].[DB_PHIM] ([id_phim])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DB_TAP_PHIM] CHECK CONSTRAINT [FK_DB_TAP_PHIM_DB_PHIM1]
GO
ALTER TABLE [dbo].[DB_TAP_PHIM]  WITH CHECK ADD  CONSTRAINT [FK_DB_TAP_PHIM_DB_USER] FOREIGN KEY([id_user])
REFERENCES [dbo].[DB_USER] ([id_user])
GO
ALTER TABLE [dbo].[DB_TAP_PHIM] CHECK CONSTRAINT [FK_DB_TAP_PHIM_DB_USER]
GO
ALTER TABLE [dbo].[DB_THONGBAO]  WITH CHECK ADD  CONSTRAINT [FK_DB_THONGBAO_DB_USER] FOREIGN KEY([id_user])
REFERENCES [dbo].[DB_USER] ([id_user])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DB_THONGBAO] CHECK CONSTRAINT [FK_DB_THONGBAO_DB_USER]
GO
ALTER TABLE [dbo].[DB_THUVIEN]  WITH CHECK ADD  CONSTRAINT [FK_DB_THUVIEN_DB_PHIM] FOREIGN KEY([id_phim])
REFERENCES [dbo].[DB_PHIM] ([id_phim])
GO
ALTER TABLE [dbo].[DB_THUVIEN] CHECK CONSTRAINT [FK_DB_THUVIEN_DB_PHIM]
GO
ALTER TABLE [dbo].[DB_THUVIEN]  WITH CHECK ADD  CONSTRAINT [FK_DB_THUVIEN_DB_USER] FOREIGN KEY([id_user])
REFERENCES [dbo].[DB_USER] ([id_user])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DB_THUVIEN] CHECK CONSTRAINT [FK_DB_THUVIEN_DB_USER]
GO
ALTER TABLE [dbo].[DB_VOTE]  WITH CHECK ADD  CONSTRAINT [FK_DB_VOTE_DB_PHIM] FOREIGN KEY([id_phim])
REFERENCES [dbo].[DB_PHIM] ([id_phim])
GO
ALTER TABLE [dbo].[DB_VOTE] CHECK CONSTRAINT [FK_DB_VOTE_DB_PHIM]
GO
ALTER TABLE [dbo].[DB_VOTE]  WITH CHECK ADD  CONSTRAINT [FK_DB_VOTE_DB_USER] FOREIGN KEY([id_user])
REFERENCES [dbo].[DB_USER] ([id_user])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DB_VOTE] CHECK CONSTRAINT [FK_DB_VOTE_DB_USER]
GO
USE [master]
GO
ALTER DATABASE [WEB_PHIM] SET  READ_WRITE 
GO
