USE [master]
GO
/****** Object:  Database [WEB_PHIM]    Script Date: 03/04/2022 12:23:30 SA ******/
CREATE DATABASE [WEB_PHIM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WEB_PHIM', FILENAME = N'D:\SQL SERVER\phim.duyvo26.xyz\WebPhim.mdf' , SIZE = 122880KB , MAXSIZE = 90971520KB , FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'WEB_PHIM_log', FILENAME = N'D:\SQL SERVER\phim.duyvo26.xyz\WebPhim_log.ldf' , SIZE = 5120KB , MAXSIZE = 904832KB , FILEGROWTH = 10240KB )
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
/****** Object:  User [WebPhims]    Script Date: 03/04/2022 12:23:31 SA ******/
CREATE USER [WebPhims] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [WebPhim]    Script Date: 03/04/2022 12:23:31 SA ******/
CREATE USER [WebPhim] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [WebPhims]
GO
ALTER ROLE [db_owner] ADD MEMBER [WebPhim]
GO
/****** Object:  StoredProcedure [dbo].[CapNhatAllThongBao]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[CapNhatCauHinh]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[CapNhatCoinUser]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Capnhatnguoidung]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[CapNhatPhim]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[CapNhatQuyenHan]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[CapnhatTapPhim]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[CapNhatThuVien]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[CapNhatThuVienDoc]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[DangKyNguoiDung]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[DelUser]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[LayLuotXem]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[LayPhimRand]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[LayPhimTheLoai]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[LayThongTinBinhLuan]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[LayThongTinBinhLuanTapPhim]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[LayThuVienDoc]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[Them_cmt]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[ThemPhim]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[ThemPhimTheLoai]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[ThemTapPhim]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[ThemThuVien]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[TimKiem]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[TimKiemTheoTen]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[TimKiemTheoTheLoai]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[TimKiemTheoTheLoais]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[XoaPhim]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[XoaPhimTL]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[XoaTapPhim]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[XoaTapPhimAdmin]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  StoredProcedure [dbo].[XoaThuVien]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  UserDefinedFunction [dbo].[StringSplit]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  Table [dbo].[DB_CAUHINH]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  Table [dbo].[DB_COMMENT]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  Table [dbo].[DB_LOG_COIN]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  Table [dbo].[DB_LUOTXEM]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  Table [dbo].[DB_PHIM]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  Table [dbo].[DB_PHIM_THELOAI]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  Table [dbo].[DB_TAP_PHIM]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  Table [dbo].[DB_THELOAI]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  Table [dbo].[DB_THONGBAO]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  Table [dbo].[DB_THUVIEN]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  Table [dbo].[DB_USER]    Script Date: 03/04/2022 12:23:31 SA ******/
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
/****** Object:  Table [dbo].[DB_VOTE]    Script Date: 03/04/2022 12:23:31 SA ******/
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
