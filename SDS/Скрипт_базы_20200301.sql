USE [master]
GO
/****** Object:  Database [SDS]    Script Date: 03/01/2020 22:34:47 ******/
CREATE DATABASE [SDS] ON  PRIMARY 
( NAME = N'Vuz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLROMA8\MSSQL\DATA\SDS.mdf' , SIZE = 3776KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Vuz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLROMA8\MSSQL\DATA\SDS_log.ldf' , SIZE = 6272KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SDS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SDS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SDS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SDS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SDS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SDS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SDS] SET ARITHABORT OFF
GO
ALTER DATABASE [SDS] SET AUTO_CLOSE ON
GO
ALTER DATABASE [SDS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SDS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SDS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SDS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SDS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SDS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SDS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SDS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SDS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SDS] SET  DISABLE_BROKER
GO
ALTER DATABASE [SDS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SDS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SDS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SDS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SDS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SDS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SDS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SDS] SET  READ_WRITE
GO
ALTER DATABASE [SDS] SET RECOVERY SIMPLE
GO
ALTER DATABASE [SDS] SET  MULTI_USER
GO
ALTER DATABASE [SDS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SDS] SET DB_CHAINING OFF
GO
USE [SDS]
GO
/****** Object:  UserDefinedFunction [dbo].[s_split]    Script Date: 03/01/2020 22:34:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[s_split]
(    
@str_in varchar(8000)
,@dlm varchar(254)
)
RETURNS @str_parts TABLE 
    (
      nnn        int IDENTITY(1,1) PRIMARY KEY,
      str_part    varchar(8000)
    )
AS
begin
declare @cur_pos    int
        ,@find_pos    int
        ,@cur_part    varchar(8000)
    if CHARINDEX(  @dlm, @str_in) = 0
        return 
    while CHARINDEX(  @dlm, @str_in, 0) <> 0
    begin
        set @find_pos = CHARINDEX(  @dlm, @str_in, 0)
        set @cur_part = substring(@str_in, 0, @find_pos )
        set @str_in = substring(@str_in, @find_pos + 1, 8000 )
        
        insert into @str_parts(str_part)
        select @cur_part
    end
    insert into @str_parts(str_part)
    select @str_in
RETURN 
end
GO
/****** Object:  Table [dbo].[DIRECTION_SAVE]    Script Date: 03/01/2020 22:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIRECTION_SAVE](
	[direction_id] [int] IDENTITY(1,1) NOT NULL,
	[direction_name] [varchar](512) NULL,
	[direction_list_id] [int] NULL,
	[faculties_id] [int] NULL,
	[count_budget_places] [int] NULL,
	[active] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[direction_list]    Script Date: 03/01/2020 22:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[direction_list](
	[direction_list_id] [int] IDENTITY(1,1) NOT NULL,
	[direction_name] [varchar](512) NULL,
 CONSTRAINT [PK_direction_list] PRIMARY KEY CLUSTERED 
(
	[direction_list_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vuz]    Script Date: 03/01/2020 22:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vuz](
	[vuz_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](512) NULL,
	[short_name] [varchar](50) NULL,
	[golden_medal] [int] NULL,
	[GTO] [int] NULL,
	[voluntering] [int] NULL,
	[final_essay] [int] NULL,
	[vuz_top] [int] NULL,
	[hostel] [bit] NULL,
 CONSTRAINT [PK_vuz] PRIMARY KEY CLUSTERED 
(
	[vuz_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 03/01/2020 22:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[user0_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NULL,
	[user_surname] [varchar](50) NULL,
	[user_patronymic] [varchar](50) NULL,
	[user_login] [varchar](50) NULL,
	[user_pasword] [varchar](50) NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](50) NULL,
	[user_role] [varchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user0_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 03/01/2020 22:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subjects](
	[subject_id] [int] IDENTITY(1,1) NOT NULL,
	[subject_name] [varchar](255) NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[_test]    Script Date: 03/01/2020 22:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[_test](
	[direction_id] [int] IDENTITY(1,1) NOT NULL,
	[direction_name] [varchar](512) NULL,
	[faculties_id] [int] NULL,
	[number_of_budget_places] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[vuz_comlite]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[vuz_comlite]
AS
BEGIN
	declare @num_vuz int
	set @num_vuz = 1

	select 0 as vuz_id, 0 as golden_medal, 0 as GTO, 0 as voluntering, 0 as final_essay
	into #ppp
	
	truncate table #ppp
	
	while @num_vuz <= (select COUNT(vuz_id) from dbo.vuz)
	begin
			insert into #ppp(vuz_id, golden_medal, GTO, voluntering, final_essay)
			select @num_vuz,
				   floor(RAND()*(3+1-0)+0),
				   floor(RAND()*(2+1-0)+0),
				   floor(RAND()*(2+1-0)+0),
				   floor(RAND()*(3+1-0)+0)
			
			set @num_vuz = @num_vuz + 1
	end
	
	update vuz
	set vuz.golden_medal = P.golden_medal
	from dbo.vuz V
	left join #ppp P on V.vuz_id = P.vuz_id
	
	update vuz
	set vuz.GTO = P.GTO
	from dbo.vuz V
	left join #ppp P on V.vuz_id = P.vuz_id
	
	update vuz
	set vuz.voluntering = P.voluntering
	from dbo.vuz V
	left join #ppp P on V.vuz_id = P.vuz_id
	
	update vuz
	set vuz.final_essay = P.final_essay
	from dbo.vuz V
	left join #ppp P on V.vuz_id = P.vuz_id
END
GO
/****** Object:  Table [dbo].[student]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[student_id] [int] IDENTITY(1,1) NOT NULL,
	[student_name] [varchar](512) NULL,
	[golden_medal] [bit] NULL,
	[GTO] [bit] NULL,
	[voluntering] [bit] NULL,
	[final_essay] [bit] NULL,
	[user0_id] [int] NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[faculties]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[faculties](
	[faculties_id] [int] IDENTITY(1,1) NOT NULL,
	[name_faculties] [varchar](512) NULL,
	[vuz_id] [int] NULL,
 CONSTRAINT [PK_faculties] PRIMARY KEY CLUSTERED 
(
	[faculties_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[direction]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[direction](
	[direction_id] [int] IDENTITY(1,1) NOT NULL,
	[direction_name] [varchar](512) NULL,
	[direction_list_id] [int] NULL,
	[faculties_id] [int] NULL,
	[count_budget_places] [int] NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_direction] PRIMARY KEY CLUSTERED 
(
	[direction_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student_subject]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_subject](
	[student_subject_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[subject_id] [int] NULL,
	[count_of_points] [int] NULL,
 CONSTRAINT [PK_student_subject] PRIMARY KEY CLUSTERED 
(
	[student_subject_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[__generate_main]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[__generate_main]
	@vuz_count int
	,@min_faculties_count int
	,@max_faculties_count int
	,@min_direction_count int
	,@max_direction_count int

AS
BEGIN
	declare @num_vuz int,
			@num_facul int,
			@num_dir int,
			@faculties int,
			@faculties_count int,
			@direction int,
			@direction_count int
	set @num_vuz = 1
	set @num_facul = 1
	set @num_dir = 1
	set @faculties_count = 0
	set @faculties = 0
	set @direction = 0
	set @direction_count = 0
	
	-- Чистим таблицу
	truncate table dbo.vuz
	truncate table dbo.faculties
	truncate table dbo.direction

	while @num_vuz<=@vuz_count
	begin
		
		set @faculties = floor(RAND()*(@max_faculties_count+1-@min_faculties_count)+@min_faculties_count)
		
		insert into dbo.vuz(
			full_name
			, short_name
			, faculties_count
			)
		select
			'vuz_'+RIGHT(  ltrim(str(10000+@num_vuz)), 4)	
			,null
			,@faculties
				
		set @faculties_count = @faculties_count + @faculties
		
		while @num_facul<=@faculties_count
		begin
			
			set @direction = floor(RAND()*(@max_direction_count+1-@min_direction_count)+@min_direction_count)
		
			insert into dbo.faculties( 
									  name_faculties, 
									  vuz_id, 
									  direction_count
									  )
			select
				'faculty_'+RIGHT(  ltrim(str(1000+@num_facul)), 3)
				,@num_vuz
				,@direction
			
			set @direction_count = @direction_count + @direction
				
			while @num_dir<=@direction_count
			begin
				insert into dbo.direction(
										  direction_name, 
										  faculties_id, 
										  number_of_points, 
										  number_of_budget_places, 
										  golden_medal, 
										  trp_icon, 
										  volunteering, 
										  final_essay, 
										  olympiad
										  )
				select
					'derection_'+RIGHT(  ltrim(str(10000+@num_dir)), 4)
					,@num_facul
					,floor(RAND()*(250+1-130)+130)
					,floor(RAND()*(300+1-20)+20)
					,floor(RAND()*(1+1-0)+0)
					,floor(RAND()*(1+1-0)+0)
					,floor(RAND()*(1+1-0)+0)
					,floor(RAND()*(1+1-0)+0)
					,null
				
				set @num_dir = @num_dir + 1
			end
			
			set @num_facul = @num_facul + 1	
				
		end
		
		set @num_vuz = @num_vuz + 1
	end
  
END
GO
/****** Object:  Table [dbo].[student_wish]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_wish](
	[stud_wish_id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[direction_id] [int] NULL,
	[number_of_wish] [int] NULL,
 CONSTRAINT [PK_student_wish_1] PRIMARY KEY CLUSTERED 
(
	[stud_wish_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[direct_subject]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direct_subject](
	[direct_subject_id] [int] IDENTITY(1,1) NOT NULL,
	[direction_id] [int] NULL,
	[subject_id] [int] NULL,
 CONSTRAINT [PK_direct_subject] PRIMARY KEY CLUSTERED 
(
	[direct_subject_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[main_result]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[main_result](
	[main_result_id] [int] IDENTITY(1,1) NOT NULL,
	[direction_id] [int] NULL,
	[student_id] [int] NULL,
	[number_of_wish] [int] NULL,
	[count_of_points] [int] NULL,
	[count_add_points] [int] NULL,
	[count_all_points] [int] NULL,
	[serial_number] [int] NULL,
	[count_budget_places] [int] NULL,
	[status_id] [int] NULL,
 CONSTRAINT [PK_direction_student] PRIMARY KEY CLUSTERED 
(
	[main_result_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[generate_student_only_information]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[generate_student_only_information]
	@student_count int,
	@min_num_of_points int,
	@max_num_of_points int,
	@wish_count int
AS
BEGIN
	declare @num_student int,
			@num_wish int,
			@rand_num int
	set @num_student = 1
	set @num_wish = 1
	set @rand_num = 0
	
	-- Чистим таблицу
	truncate table dbo.student

	while @num_student<=@student_count
	begin
		insert into dbo.student(
								student_name,  
								golden_medal, 
								GTO, 
								voluntering, 
								final_essay

								)
		select
			'student_'+RIGHT(  ltrim(str(100000+@num_student)), 5)	
			,round(RAND(),0)
			,round(RAND(),0)
			,round(RAND(),0)
			,round(RAND(),0)
			
			
		set @num_student = @num_student + 1	
	end
	
	truncate table dbo.student_wish
	
	select direction_id, ROW_NUMBER() over(order by direction_id) as NNN, 0 as flag
	into #dir_time
	from dbo.direction
	--left join dbo.direct_subject DS on D.direction_id = DS.direction_id
	--where direction_name like 'информатик%'
	where active = 1
	
	set @num_student = 1
	
	while @num_student <= @student_count
	begin
			while @num_wish <= @wish_count
			begin
					select direction_id, ROW_NUMBER() over(order by direction_id) as NNN
					into #nnn_time
					from #dir_time
					where flag = 0
					
					set @rand_num = floor(RAND()*(select count(NNN) from #nnn_time)+1) -- +1
					
					insert into dbo.student_wish(student_id, direction_id, number_of_wish)
					select @num_student,
						   (select direction_id from #nnn_time where NNN = @rand_num),
						   @num_wish
					set @num_wish = @num_wish + 1
					
					update #dir_time
					set flag = 1
					where direction_id = (select direction_id from #nnn_time where NNN = @rand_num)

					
					drop table #nnn_time
					
					
			end
			
			set @num_student = @num_student + 1
			set @num_wish = 1
			
			update #dir_time
			set flag = 0
			
	end
	
	set @num_student = 1
	
	truncate table dbo.student_subject 
	
	while @num_student <= @student_count
	begin
			
			insert into dbo.student_subject(student_id, subject_id, count_of_points)
			select @num_student,
				   4,
				   floor(RAND()*(@max_num_of_points+1-@min_num_of_points)+@min_num_of_points)
		    insert into dbo.student_subject(student_id, subject_id, count_of_points)
			select @num_student,
				   5,
				   floor(RAND()*(@max_num_of_points+1-@min_num_of_points)+@min_num_of_points)
			insert into dbo.student_subject(student_id, subject_id, count_of_points)
			select @num_student,
				   6,
				   floor(RAND()*(@max_num_of_points+1-@min_num_of_points)+@min_num_of_points)
				   insert into dbo.student_subject(student_id, subject_id, count_of_points)
			select @num_student,
				   11,
				   floor(RAND()*(@max_num_of_points+1-@min_num_of_points)+@min_num_of_points)
			
		    
		    set @num_student = @num_student + 1
	end
	
	
	
	--------------------------------------
	-- Добавляем 2 направления: 2001, 2002
	--------------------------------------
		
	
	------------------------------
	-- Добавляем студентов вручную
	------------------------------
		SET IDENTITY_INSERT dbo.student ON;  
		insert into dbo.student(
								student_id,
								student_name,  
								golden_medal, 
								GTO, 
								voluntering, 
								final_essay
								)
		select
			300201, 'student_201', 1, 0, 0, 0	
		union all
		select
			300202, 'student_202', 1, 0, 0, 0
		union all
		select
			300203, 'student_203', 0, 1, 0, 0
		union all
		select
			300204, 'student_204', 0, 1, 0, 0
		union all
		select
			300205, 'student_205', 0, 0, 1, 0
		union all
		select
			300206, 'student_206', 0, 0, 0, 1
			
		SET IDENTITY_INSERT dbo.student OFF;  
			
		
		insert into dbo.student_wish(student_id, direction_id, number_of_wish)
		select 300201, 1809, 1
	    union all
		select 300202, 1809, 1
	    union all
	    select 300203, 1809, 1
	    union all
	    select 300204, 1809, 2
	    union all
	    select 300205, 1809, 2
	    union all
	    select 300206, 1809, 2
	    union all 
	    	 
	    select 300201, 1810, 2
	    union all
		select 300202, 1810, 2
	    union all
	    select 300203, 1810, 2
	    union all
	    select 300204, 1810, 1
	    union all
	    select 300205, 1810, 1
	    union all
	    select 300206, 1810, 1
	    	      
		
		insert into dbo.student_subject(student_id, subject_id, count_of_points)
		select 300201, 4, 50
		union all
		select 300201, 5, 50
		union all
		select 300201, 6, 51
		union all
		select 300201, 11, 51
		
		union all
		select 300202, 4, 40
		union all
		select 300202, 5, 60
		union all
		select 300202, 6, 50
		union all
		select 300202, 11, 50
		
		union all
		select 300203, 4, 35
		union all
		select 300203, 5, 65
		union all
		select 300203, 6, 40
		union all
		select 300203, 11, 63
		
		union all
		select 300204, 4, 50
		union all
		select 300204, 5, 50
		union all
		select 300204, 6, 60
		union all
		select 300204, 11, 45
		
		union all
		select 300205, 4, 50
		union all
		select 300205, 5, 50
		union all
		select 300205, 6, 45
		union all
		select 300205, 11, 55
		
		union all
		select 300206, 4, 50
		union all
		select 300206, 5, 50
		union all
		select 300206, 6, 50
		union all
		select 300206, 11, 49
		
			
  
END
GO
/****** Object:  StoredProcedure [dbo].[generate_student]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[generate_student]
	@student_count int,
	@min_num_of_points int,
	@max_num_of_points int,
	@wish_count int
AS
BEGIN
	declare @num_student int,
			@num_wish int,
			@rand_num int
	set @num_student = 1
	set @num_wish = 1
	set @rand_num = 0
	
	-- Чистим таблицу
	truncate table dbo.student

	while @num_student<=@student_count
	begin
		insert into dbo.student(
								student_name,  
								golden_medal, 
								GTO, 
								voluntering, 
								final_essay

								)
		select
			'student_'+RIGHT(  ltrim(str(100000+@num_student)), 5)	
			,round(RAND(),0)
			,round(RAND(),0)
			,round(RAND(),0)
			,round(RAND(),0)
			
			
		set @num_student = @num_student + 1	
	end
	
	truncate table dbo.student_wish
	
	select direction_id, ROW_NUMBER() over(order by direction_id) as NNN, 0 as flag
	into #dir_time
	from dbo.direction
	where direction_id <= 5 --проверка
	
	set @num_student = 1
	
	while @num_student <= @student_count
	begin
			while @num_wish <= @wish_count
			begin
					select direction_id, ROW_NUMBER() over(order by direction_id) as NNN
					into #nnn_time
					from #dir_time
					where flag = 0
					
					set @rand_num = floor(RAND()*(select count(NNN) from #nnn_time)+1) -- +1
					
					insert into dbo.student_wish(student_id, direction_id, number_of_wish)
					select @num_student,
						   (select direction_id from #nnn_time where NNN = @rand_num),
						   @num_wish
					set @num_wish = @num_wish + 1
					
					update #dir_time
					set flag = 1
					where direction_id = (select direction_id from #nnn_time where NNN = @rand_num)

					
					drop table #nnn_time
					
					
			end
			
			set @num_student = @num_student + 1
			set @num_wish = 1
			
			update #dir_time
			set flag = 0
			
	end
	
	set @num_student = 1
	
	truncate table dbo.student_subject 
	
	select *, ROW_NUMBER() over(order by subject_name) as nnn
	into #ppp
	from Subjects
	where subject_id <> 4 and subject_id <> 5
	
	while @num_student <= @student_count
	begin
			
			insert into dbo.student_subject(student_id, subject_id, count_of_points)
			select @num_student,
				   4,
				   floor(RAND()*(@max_num_of_points+1-@min_num_of_points)+@min_num_of_points)
		    insert into dbo.student_subject(student_id, subject_id, count_of_points)
			select @num_student,
				   5,
				   floor(RAND()*(@max_num_of_points+1-@min_num_of_points)+@min_num_of_points)
			
			set @rand_num = (select subject_id from #ppp where nnn = FLOOR(RAND()*(9+1-1)+1))
			insert into dbo.student_subject(student_id, subject_id, count_of_points)
			select @num_student,
				   @rand_num,
				   floor(RAND()*(@max_num_of_points+1-@min_num_of_points)+@min_num_of_points)
			
			select *, ROW_NUMBER() over(order by subject_name) as nnn
			into #ppp2
			from Subjects
			where subject_id <> 4 and subject_id <> 5 and subject_id <> @rand_num
			
			insert into dbo.student_subject(student_id, subject_id, count_of_points)
			select @num_student,
				   (select subject_id from #ppp2 where nnn = FLOOR(RAND()*(8+1-1)+1)),
				   floor(RAND()*(@max_num_of_points+1-@min_num_of_points)+@min_num_of_points)
			
		    
		    set @num_student = @num_student + 1
		    drop table #ppp2
	end
						    
  
END
GO
/****** Object:  StoredProcedure [dbo].[find_pair_copy3_18_02_20]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[find_pair_copy3_18_02_20] 

-- всего мест = 90
-- студентов под границей = 221
-- студентов всего = 311
-- направления: 92,1062,1384,1434,1522 
-- после удаления лишних под границей всего = 250

AS
BEGIN
	--------------------------------------------------------
	-- Копируем main_result в новую таблицу для возможности
	-- сравнить эти таблицы в конце процедуры
	--------------------------------------------------------
	select *
	into #main_result_2
	from main_result
	
	declare @a int
	set @a = 0
	
	while 1=1
	begin
		set @a = @a + 1
		select @a
		
		--------------------------------------------------------
		-- Удаляем под границей позиции с желанием
		-- хуже чем есть у тех же студентов в части над границей
		-- так как при обмене мы хотим улучшить позиции
		--------------------------------------------------------
		delete #main_result_2
		from #main_result_2 TDown
		left join (select * from dbo.main_result where serial_number <= count_budget_places) Tup 
		on TDown.student_id = Tup.student_id
		where TDown.serial_number > TDown.count_budget_places and TDown.number_of_wish > Tup.number_of_wish
		
		--------------------------------------------------
		-- Отбираем верхнюю часть таблицы (над границей)
		-- не берем позиции с желанием 1, так как им нечего 
		-- улучшать
		--------------------------------------------------
		select *
		into #Up
		from #main_result_2
		where serial_number <= count_budget_places and number_of_wish <> 1	
		
		---------------------------------------------------------------------------------------
		-- формируем новые номера для всей таблицы(так как удаляли позиции в начале процедуры)
		-- иначе мы не могли бы сравнить номер с count_budget_places
		---------------------------------------------------------------------------------------
		update 
			#main_result_2
		set 
			serial_number = T.NNN
		from 
			#main_result_2 MR
			inner join (
					select *,ROW_NUMBER() over(partition by direction_id order by count_all_points DESC, student_id) as NNN
					from #main_result_2
					) T on MR.direction_id = T.direction_id and MR.student_id = T.student_id
		
		----------------------------------------------------------------------------------------
		-- Записываем в новую таблицу первые позиции под границей 
		-- т.е. T.NNN = T.count_budget_places + 1
		-- и оставляем только тех абитуриентов, которые присутствуют в верхнем списке
		----------------------------------------------------------------------------------------
		select T.main_result_id, T.student_id, T.direction_id as direction_id_want, T.number_of_wish as number_of_wish_want,
			   #Up.direction_id as direction_id_now, #Up.number_of_wish as number_of_wish_now, 
			   T.direction_id as dir_change,cast(STR(T.student_id + 1000000) as varchar(4000) ) as chain
		into #Down
		from #main_result_2 T
		inner join #Up on #Up.student_id = T.student_id
		where T.serial_number = T.count_budget_places + 1
		
		---------------------------------------------------------------------------
		-- В полученной таблице #Down содержаться первые под границей позиции
		-- абитуриентов. Создаем цикл, в котором простраиваем цепочки для каждого
		-- абитуриента, меняем позиции абитуриентов, удовлетворяющих условию 
		-- (цепочка должна начинаться и заканчиваться одним и тем же абитуриентом),
		-- заменяем получившуюся цепочку на Null, удаляем все цепочки равные Null.
		-- Если в таблице #Down больше не осталось строк, заканчиваем цикл.
		---------------------------------------------------------------------------
		while 1=1
		begin
		
			---------------------------------------------------------------------------
			-- К таблице #Down присоединяем эту же таблицу(dir_change - изменяющийся 
			-- столбец желаемого направления, по которому присоединяется таблица) и 
			-- обновляем ее данные. Меняем цепочку(прибавляем к имеющемуся значению 
			-- id студента из новой таблицы)  
			---------------------------------------------------------------------------
			update #Down
			set chain = ltrim(D1.chain) + '=' + ltrim(STR(D2.student_id+1000000)),
				dir_change = D2.direction_id_want
			from #Down D1
			left join (select * from #Down) D2 on D1.dir_change = D2.direction_id_now
			
			select 0 as before_detete, *
			from #Down
			
			----------------------------
			--  Выводим удаляющиеся пары
			----------------------------
			select 'pair' as pair,*
			from #main_result_2 MR
			left join
			(select *
			from #Down D
			left join
			(SELECT distinct L.str_part - 1000000 as part
			FROM #Down D
			CROSS APPLY
			(SELECT * FROM dbo.S_split(D.chain,'=')) L
			where SUBSTRING(D.chain, 1, 7) = SUBSTRING(D.chain, len(D.chain) - 6, 7)) R on D.student_id = R.part
			where R.part is not NULL) R2 on MR.student_id = R2.student_id and 
			MR.direction_id = R2.direction_id_now and MR.number_of_wish = R2.number_of_wish_now
			where R2.main_result_id is not NULL
			----------------------------
			
			--------------------------------------------------------------------------------
			-- Меняем абитуриентов местами, то есть удаляем их позиции над границей. Для 
			-- этого формируем таблицу неповторяющийся id студентов, составляющих 
			-- законченную цеппочку (where SUBSTRING(D.chain, 1, 7) = 
			-- SUBSTRING(D.chain, len(D.chain) - 6, 7)), с помощью функции S_split(), 
			-- получающая на вход строку и символ, по которому будет разделяться эта строка.
			-- Присоединяем эту таблицу к таблице, содержащей позиции абитуриентов сразу под
			-- границей. Полученныые данные присоединяем к #main_result_2 для удаления.
			--------------------------------------------------------------------------------
			delete #main_result_2
			from #main_result_2 MR
			left join
			(select *
			from #Down D
			left join
			(SELECT distinct L.str_part - 1000000 as part
			FROM #Down D
			CROSS APPLY
			(SELECT * FROM dbo.S_split(D.chain,'=')) L
			where SUBSTRING(D.chain, 1, 7) = SUBSTRING(D.chain, len(D.chain) - 6, 7)) R on D.student_id = R.part
			where R.part is not NULL) R2 on MR.student_id = R2.student_id and 
			MR.direction_id = R2.direction_id_now and MR.number_of_wish = R2.number_of_wish_now
			where R2.main_result_id is not NULL
			
			--------------------------------------------------------------
			-- Обновляем данные таблицы. Меняем строку chain на Null, если
			-- первые 7 символов равны последним 7-ми, то есть id студента
			-- в начале таблицы равен id студента в конце таблицы. 
			--------------------------------------------------------------
			update #Down
			set chain = Null
			where SUBSTRING(chain, 1, 7) = SUBSTRING(chain, len(chain) - 6, 7)
			
			----------------------------------------------------------------
			-- Удаляем закончившиеся цепочки
			----------------------------------------------------------------
			delete
			from #Down
			where chain is Null
			
			select 0 as after_detete, chain
			from #Down
			
			if not exists(select * from #down) break
		
		end
		
		------------------------------------------
		-- формируем новые номера для всей таблицы
		------------------------------------------
		update 
			#main_result_2
		set 
			serial_number = T.NNN
		from 
			#main_result_2 MR
			inner join (
					select *,ROW_NUMBER() over(partition by direction_id order by count_all_points DESC, student_id) as NNN
					from #main_result_2
					) T on MR.direction_id = T.direction_id and MR.student_id = T.student_id
		
		drop table #Down
		drop table #Up
		
		if @a = 3 break		
	end
END
GO
/****** Object:  StoredProcedure [dbo].[find_pair_copy2_18_02_20]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[find_pair_copy2_18_02_20] 

-- всего мест = 90
-- студентов под границей = 221
-- студентов всего = 311
-- направления: 92,1062,1384,1434,1522 
-- после удаления лишних под границей всего = 250

AS
BEGIN
	--------------------------------------------------------
	-- Копируем main_result в новую таблицу для возможности
	-- сравнить эти таблицы в конце процедуры
	--------------------------------------------------------
	select *
	into #main_result_2
	from main_result
	
	
	
	
		--------------------------------------------------------
		-- Удаляем под границей позиции с желанием
		-- хуже чем есть у тех же студентов в части над границей
		-- так как при обмене мы хотим улучшить позиции
		--------------------------------------------------------
		delete dbo.main_result
		from #main_result_2 TDown
		left join (select * from dbo.main_result where serial_number <= count_budget_places) Tup 
		on TDown.student_id = Tup.student_id
		where TDown.serial_number > TDown.count_budget_places and TDown.number_of_wish > Tup.number_of_wish
		
		--------------------------------------------------
		-- Отбираем верхнюю часть таблицы (над границей)
		-- не берем позиции с желанием 1, так как им нечего 
		-- улучшать
		--------------------------------------------------
		select *
		into #Up
		from #main_result_2
		where serial_number <= count_budget_places and number_of_wish <> 1	
		
		---------------------------------------------------------------------------------------
		-- формируем новые номера для всей таблицы(так как удаляли позиции в начале процедуры)
		-- иначе мы не могли бы сравнить номер с count_budget_places
		---------------------------------------------------------------------------------------
		update 
			#main_result_2
		set 
			serial_number = T.NNN
		from 
			#main_result_2 MR
			inner join (
					select *,ROW_NUMBER() over(partition by direction_id order by count_all_points DESC, student_id) as NNN
					from #main_result_2
					) T on MR.direction_id = T.direction_id and MR.student_id = T.student_id
		
		----------------------------------------------------------------------------------------
		-- Записываем в новую таблицу первые позиции под границей 
		-- т.е. T.NNN = T.count_budget_places + 1
		-- и оставляем только тех абитуриентов, которые присутствуют в верхнем списке
		----------------------------------------------------------------------------------------
		select T.main_result_id, T.student_id, T.direction_id as direction_id_want, T.number_of_wish as number_of_wish_want,
			   #Up.direction_id as direction_id_now, #Up.number_of_wish as number_of_wish_now, 
			   T.direction_id as dir_change,cast(STR(T.student_id + 1000000) as varchar(4000) ) as chain
		into #Down
		from #main_result_2 T
		inner join #Up on #Up.student_id = T.student_id
		where T.serial_number = T.count_budget_places + 1
		
		---------------------------------------------------------------------------
		-- В полученной таблице #Down содержаться первые под границей позиции
		-- абитуриентов. Создаем цикл, в котором простраиваем цепочки для каждого
		-- абитуриента, меняем позиции абитуриентов, удовлетворяющих условию 
		-- (цепочка должна начинаться и заканчиваться одним и тем же абитуриентом),
		-- заменяем получившуюся цепочку на Null, удаляем все цепочки равные Null.
		-- Если в таблице #Down больше не осталось строк, заканчиваем цикл.
		---------------------------------------------------------------------------
		while 1=1
		begin
		
			---------------------------------------------------------------------------
			-- К таблице #Down присоединяем эту же таблицу(dir_change - изменяющийся 
			-- столбец желаемого направления, по которому присоединяется таблица) и 
			-- обновляем ее данные. Меняем цепочку(прибавляем к имеющемуся значению 
			-- id студента из новой таблицы)  
			---------------------------------------------------------------------------
			update #Down
			set chain = ltrim(D1.chain) + '=' + ltrim(STR(D2.student_id+1000000)),
				dir_change = D2.direction_id_want
			from #Down D1
			left join (select * from #Down) D2 on D1.dir_change = D2.direction_id_now
			
			select 0 as before_detete, *
			from #Down
			
			--------------------------------------------------------------------------------
			-- Меняем абитуриентов местами, то есть удаляем их позиции над границей. Для 
			-- этого формируем таблицу неповторяющийся id студентов, составляющих 
			-- законченную цеппочку (where SUBSTRING(D.chain, 1, 7) = 
			-- SUBSTRING(D.chain, len(D.chain) - 6, 7)), с помощью функции S_split(), 
			-- получающая на вход строку и символ, по которому будет разделяться эта строка.
			-- Присоединяем эту таблицу к таблице, содержащей позиции абитуриентов сразу под
			-- границей. Полученныые данные присоединяем к #main_result_2 для удаления.
			--------------------------------------------------------------------------------
			delete #main_result_2
			from #main_result_2 MR
			left join
			(select *
			from #Down D
			left join
			(SELECT distinct L.str_part - 1000000 as part
			FROM #Down D
			CROSS APPLY
			(SELECT * FROM dbo.S_split(D.chain,'=')) L
			where SUBSTRING(D.chain, 1, 7) = SUBSTRING(D.chain, len(D.chain) - 6, 7)) R on D.student_id = R.part
			where R.part is not NULL) R2 on MR.student_id = R2.student_id and 
			MR.direction_id = R2.direction_id_now and MR.number_of_wish = R2.number_of_wish_now
			where R2.main_result_id is not NULL
			
			--------------------------------------------------------------
			-- Обновляем данные таблицы. Меняем строку chain на Null, если
			-- первые 7 символов равны последним 7-ми, то есть id студента
			-- в начале таблицы равен id студента в конце таблицы. 
			--------------------------------------------------------------
			update #Down
			set chain = Null
			where SUBSTRING(chain, 1, 7) = SUBSTRING(chain, len(chain) - 6, 7)
			
			----------------------------------------------------------------
			-- Удаляем закончившиеся цепочки
			----------------------------------------------------------------
			delete
			from #Down
			where chain is Null
			
			select 0 as after_detete, chain
			from #Down
			
			if not exists(select * from #down) break
		
		end
		
		------------------------------------------
		-- формируем новые номера для всей таблицы
		------------------------------------------
		update 
			#main_result_2
		set 
			serial_number = T.NNN
		from 
			#main_result_2 MR
			inner join (
					select *,ROW_NUMBER() over(partition by direction_id order by count_all_points DESC, student_id) as NNN
					from #main_result_2
					) T on MR.direction_id = T.direction_id and MR.student_id = T.student_id
				
	
END
GO
/****** Object:  StoredProcedure [dbo].[find_pair_copy2_16_02_20]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[find_pair_copy2_16_02_20] 

-- всего мест = 90
-- студентов под границей = 221
-- студентов всего = 311
-- направления: 92,1062,1384,1434,1522 
-- после удаления лишних под границей всего = 250

AS
BEGIN
	--select TDown.*, Tup.*
	--from dbo.main_result TDown
	--left join (select * from dbo.main_result where serial_number <= count_budget_places) Tup 
	--on TDown.student_id = Tup.student_id
	--where TDown.serial_number > TDown.count_budget_places and TDown.number_of_wish > Tup.number_of_wish
	--order by TDown.student_id, TDown.direction_id, TDown.serial_number
	
	--------------------------------------------------------
	-- Удаляем под границей позиции с желанием
	-- хуже чем есть у тех же студентов в части над границей
	-- так как при обмене мы хотим улучшить позиции
	--------------------------------------------------------
	delete dbo.main_result
	from dbo.main_result TDown
	left join (select * from dbo.main_result where serial_number <= count_budget_places) Tup 
	on TDown.student_id = Tup.student_id
	where TDown.serial_number > TDown.count_budget_places and TDown.number_of_wish > Tup.number_of_wish
	
	--------------------------------------------------
	-- Отбираем верхнюю часть таблицы (над границей)
	-- не берем позиции с желанием 1, так как им нечего 
	-- улучшать
	--------------------------------------------------
	select *
	into #Up
	from main_result
	where serial_number <= count_budget_places and number_of_wish <> 1	
	
	--select *
	--from #Up
	--where student_id = 17 or student_id = 18
	
	---------------------------------------------------------------------------------------
	-- формируем новые номера для всей таблицы(так как удаляли позиции в начале процедуры)
	-- иначе мы не могли бы сравнить номер с count_budget_places
	-- Записываем в новую таблицу первые позиции под границей 
	-- т.е. T.NNN = T.count_budget_places + 1
	-- и оставляем только тех абитуриентов, которые присутствуют в верхнем списке
	----------------------------------------------------------------------------------------
	select T.main_result_id, T.student_id, T.direction_id as direction_id_want, T.number_of_wish as number_of_wish_want,
		   #Up.direction_id as direction_id_now, #Up.number_of_wish as number_of_wish_now, 
		   T.direction_id as dir_change,cast(STR(T.student_id + 1000000) as varchar(4000) ) as chain,
		   0 as pr
		   --,T.serial_number, T.NNN, T.count_budget_places
	into #Down
	from (select *, ROW_NUMBER() over(partition by direction_id order by count_all_points DESC, student_id) as NNN
		  from main_result) T
    inner join #Up on #Up.student_id = T.student_id
	where T.NNN = T.count_budget_places + 1
	
	
	--select D1.student_id, 
	--	   D1.direction_id_now as dir_now, D1.number_of_wish_now as wish_now,
	--	   D1.direction_id_want as dir_want, D1.number_of_wish_want as wish_want,
	--	   D1.dir_change, D1.chain,
	--	   '   ' as '0',
	--	   D2.student_id, 
	--	   D2.direction_id_now as dir_now, D2.number_of_wish_now as wish_now,
	--	   D2.direction_id_want as dir_want, D2.number_of_wish_want as wish_want
	--from #Down D1
	--left join #Down D2 on D1.dir_change = D2.direction_id_now
	
	declare @k int
	set @k = 0
	
	while 1=1
	begin
	
	update #Down
	set chain = ltrim(D1.chain) + '=' + ltrim(STR(D2.student_id+1000000)),
	    dir_change = D2.direction_id_want
	from #Down D1
	left join (select * from #Down) D2 on D1.dir_change = D2.direction_id_now
	
	--update #Down
	--set pr = 1
	--where SUBSTRING(chain, 1, 7) = SUBSTRING(chain, len(chain) - 6, 7)
	
	select *
	from #Down
	
	update #Down
	set chain = Null
	where SUBSTRING(chain, 1, 7) = SUBSTRING(chain, len(chain) - 6, 7)
	
	delete
	from #Down
	where chain is Null
	
	if not exists(select * from #down) break
	
	end
END
GO
/****** Object:  StoredProcedure [dbo].[find_pair_copy_18_02_20]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[find_pair_copy_18_02_20] 

-- всего мест = 90
-- студентов под границей = 221
-- студентов всего = 311
-- направления: 92,1062,1384,1434,1522 
-- после удаления лишних под границей всего = 250

AS
BEGIN
	--------------------------------------------------------
	-- Копируем main_result в новую таблицу для возможности
	-- сравнить эти таблицы в конце процедуры
	--------------------------------------------------------
	select *
	into #main_result_2
	from main_result
	
	--------------------------------------------------------
	-- Удаляем под границей позиции с желанием
	-- хуже чем есть у тех же студентов в части над границей
	-- так как при обмене мы хотим улучшить позиции
	--------------------------------------------------------
	delete dbo.main_result
	from dbo.main_result TDown
	left join (select * from dbo.main_result where serial_number <= count_budget_places) Tup 
	on TDown.student_id = Tup.student_id
	where TDown.serial_number > TDown.count_budget_places and TDown.number_of_wish > Tup.number_of_wish
	
	--------------------------------------------------
	-- Отбираем верхнюю часть таблицы (над границей)
	-- не берем позиции с желанием 1, так как им нечего 
	-- улучшать
	--------------------------------------------------
	select *
	into #Up
	from main_result
	where serial_number <= count_budget_places and number_of_wish <> 1	
	
	---------------------------------------------------------------------------------------
	-- формируем новые номера для всей таблицы(так как удаляли позиции в начале процедуры)
	-- иначе мы не могли бы сравнить номер с count_budget_places
	-- Записываем в новую таблицу первые позиции под границей 
	-- т.е. T.NNN = T.count_budget_places + 1
	-- и оставляем только тех абитуриентов, которые присутствуют в верхнем списке
	----------------------------------------------------------------------------------------
	select T.main_result_id, T.student_id, T.direction_id as direction_id_want, T.number_of_wish as number_of_wish_want,
		   #Up.direction_id as direction_id_now, #Up.number_of_wish as number_of_wish_now, 
		   T.direction_id as dir_change,cast(STR(T.student_id + 1000000) as varchar(4000) ) as chain
	into #Down
	from (select *, ROW_NUMBER() over(partition by direction_id order by count_all_points DESC, student_id) as NNN
		  from main_result) T
    inner join #Up on #Up.student_id = T.student_id
	where T.NNN = T.count_budget_places + 1
	
	---------------------------------------------------------------------------
	-- В полученной таблице #Down содержаться первые под границей позиции
	-- абитуриентов. Создаем цикл, в котором простраиваем цепочки для каждого
	-- абитуриента, меняем позиции абитуриентов, удовлетворяющих условию 
	-- (цепочка должна начинаться и заканчиваться одним и тем же абитуриентом),
	-- заменяем получившуюся цепочку на Null, удаляем все цепочки равные Null.
	-- Если в таблице #Down больше не осталось строк, заканчиваем цикл.
	---------------------------------------------------------------------------
	while 1=1
	begin
	
		---------------------------------------------------------------------------
		-- К таблице #Down присоединяем эту же таблицу(dir_change - изменяющийся 
		-- столбец желаемого направления, по которому присоединяется таблица) и 
		-- обновляем ее данные. Меняем цепочку(прибавляем к имеющемуся значению 
		-- id студента из новой таблицы)  
		---------------------------------------------------------------------------
		update #Down
		set chain = ltrim(D1.chain) + '=' + ltrim(STR(D2.student_id+1000000)),
			dir_change = D2.direction_id_want
		from #Down D1
		left join (select * from #Down) D2 on D1.dir_change = D2.direction_id_now
		
		select *
		from #main_result_2 MR
		left join
		(select *
		from #Down D
		left join
		(SELECT distinct L.str_part - 1000000 as part
		FROM #Down D
		CROSS APPLY
		(SELECT * FROM dbo.S_split(D.chain,'=')) L) R on D.student_id = R.part
		where R.part is not NULL) R2 on MR.student_id = R2.student_id and 
		MR.direction_id = R2.direction_id_want and MR.number_of_wish = R2.number_of_wish_want
		where R2.main_result_id is not NULL
		
		--------------------------------------------------------------
		-- Обновляем данные таблицы. Меняем строку chain на Null, если
		-- первые 7 символов равны последним 7-ми, то есть id студента
		-- в начале таблицы равен id студента в конце таблицы. 
		--------------------------------------------------------------
		update #Down
		set chain = Null
		where SUBSTRING(chain, 1, 7) = SUBSTRING(chain, len(chain) - 6, 7)
		
		----------------------------------------------------------------
		-- Удаляем незамкнувшиеся цепочки
		----------------------------------------------------------------
		delete
		from #Down
		where chain is Null
		
		select 0 as after_detete, chain
		from #Down
		
		if not exists(select * from #down) break
	
	end
END
GO
/****** Object:  StoredProcedure [dbo].[find_pair_copy_16_02_20]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[find_pair_copy_16_02_20] 

-- всего мест = 90
-- студентов под границей = 221
-- студентов всего = 311
-- направления: 92,1062,1384,1434,1522 
-- после удаления лишних под границей всего = 250

AS
BEGIN
	--select TDown.*, Tup.*
	--from dbo.main_result TDown
	--left join (select * from dbo.main_result where serial_number <= count_budget_places) Tup 
	--on TDown.student_id = Tup.student_id
	--where TDown.serial_number > TDown.count_budget_places and TDown.number_of_wish > Tup.number_of_wish
	--order by TDown.student_id, TDown.direction_id, TDown.serial_number
	
	--------------------------------------------------------
	-- Удаляем под границей позиции с желанием
	-- хуже чем есть у тех же студентов в части над границей
	-- так как при обмене мы хотим улучшить позиции
	--------------------------------------------------------
	delete dbo.main_result
	from dbo.main_result TDown
	left join (select * from dbo.main_result where serial_number <= count_budget_places) Tup 
	on TDown.student_id = Tup.student_id
	where TDown.serial_number > TDown.count_budget_places and TDown.number_of_wish > Tup.number_of_wish
	
	--------------------------------------------------
	-- Отбираем верхнюю часть таблицы (над границей)
	-- не берем позиции с желанием 1, так как им нечего 
	-- улучшать
	--------------------------------------------------
	select *
	into #Up
	from main_result
	where serial_number <= count_budget_places and number_of_wish <> 1	
	
	--select *
	--from #Up
	--where student_id = 17 or student_id = 18
	
	---------------------------------------------------------------------------------------
	-- формируем новые номера для всей таблицы(так как удаляли позиции в начале процедуры)
	-- иначе мы не могли бы сравнить номер с count_budget_places
	-- Записываем в новую таблицу первые позиции под границей 
	-- т.е. T.NNN = T.count_budget_places + 1
	-- и оставляем только тех абитуриентов, которые присутствуют в верхнем списке
	----------------------------------------------------------------------------------------
	select T.main_result_id, T.student_id, T.direction_id as direction_id_want, T.number_of_wish as number_of_wish_want,
		   #Up.direction_id as direction_id_now, #Up.number_of_wish as number_of_wish_now
		   --,T.serial_number, T.NNN, T.count_budget_places
	into #Down
	from (select *, ROW_NUMBER() over(partition by direction_id order by count_all_points DESC, student_id) as NNN
		  from main_result) T
    inner join #Up on #Up.student_id = T.student_id
	where T.NNN = T.count_budget_places + 1
	
	
	select D1.main_result_id, D1.student_id, D1.direction_id_want, D1.number_of_wish_want
	from #Down D1
	inner join (select * from #Down) D2 on D1.direction_id_now = D2.direction_id_want
	where D2.direction_id_now = D1.direction_id_want
	--group by D1.student_id	
	
	--------------------------
	-- Удалить зеркальные пары
	--------------------------
	--update 
	--	main_result
	--set 
	--	direction_id = P.direction_id_want,
	--	number_of_wish = P.number_of_wish_want
	--from 
	--	main_result MR
	--	inner join(
		
	--	select D1.main_result_id, D1.student_id, D1.direction_id_want, D1.number_of_wish_want
	--	from #Down D1
	--	inner join (select * from #Down) D2 on D1.direction_id_now = D2.direction_id_want
	--	where D2.direction_id_now = D1.direction_id_want
				   
	--			   ) P on MR.student_id = P.student_id
	
END
GO
/****** Object:  StoredProcedure [dbo].[find_pair_copy_10_02_20]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[find_pair_copy_10_02_20] 

-- всего мест = 90
-- студентов под границей = 221
-- студентов всего = 311
-- направления: 92,1062,1384,1434,1522 
-- после удаления лишних под границей всего = 250

AS
BEGIN
	--select TDown.*, Tup.*
	--from dbo.main_result TDown
	--left join (select * from dbo.main_result where serial_number <= count_budget_places) Tup 
	--on TDown.student_id = Tup.student_id
	--where TDown.serial_number > TDown.count_budget_places and TDown.number_of_wish > Tup.number_of_wish
	--order by TDown.student_id, TDown.direction_id, TDown.serial_number
	
	--------------------------------------------------------
	-- Удаляем под границей позиции с желанием
	-- хуже чем есть у тех же студентов в части над границей
	-- так как при обмене мы хотим улучшить позиции
	--------------------------------------------------------
	delete dbo.main_result
	from dbo.main_result TDown
	left join (select * from dbo.main_result where serial_number <= count_budget_places) Tup 
	on TDown.student_id = Tup.student_id
	where TDown.serial_number > TDown.count_budget_places and TDown.number_of_wish > Tup.number_of_wish
	
	--------------------------------------------------
	-- Отбираем верхнюю часть таблицы (над границей)
	-- не берем позиции с желанием 1, так как им нечего 
	-- улучшать
	--------------------------------------------------
	select *
	into #Up
	from main_result
	where serial_number <= count_budget_places and number_of_wish <> 1	
	
	--select *
	--from #Up
	--where student_id = 17 or student_id = 18
	
	---------------------------------------------------------------------------------------
	-- формируем новые номера для всей таблицы(так как удаляли позиции в начале процедуры)
	-- иначе мы не могли бы сравнить номер с count_budget_places
	-- Записываем в новую таблицу первые позиции под границей 
	-- т.е. T.NNN = T.count_budget_places + 1
	-- и оставляем только тех абитуриентов, которые присутствуют в верхнем списке
	----------------------------------------------------------------------------------------
	select T.main_result_id, T.student_id, T.direction_id as direction_id_want, T.number_of_wish as number_of_wish_want,
		   #Up.direction_id as direction_id_now, #Up.number_of_wish as number_of_wish_now
		   --,T.serial_number, T.NNN, T.count_budget_places
	into #Down
	from (select *, ROW_NUMBER() over(partition by direction_id order by count_all_points DESC, student_id) as NNN
		  from main_result) T
    inner join #Up on #Up.student_id = T.student_id
	where T.NNN = T.count_budget_places + 1
	
	
	select *
	from #Down D1
	inner join (select * from #Down) D2 on D1.direction_id_now = D2.direction_id_want
	where D2.direction_id_now = D1.direction_id_want and D1.direction_id_now > D1.direction_id_want
	
	--------------------------
	-- Удалить зеркальные пары
	--------------------------
	
END
GO
/****** Object:  StoredProcedure [dbo].[find_pair]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[find_pair] 

-- всего мест = 90
-- студентов под границей = 221
-- студентов всего = 311
-- направления: 92,1062,1384,1434,1522 
-- после удаления лишних под границей всего = 250

AS
BEGIN
	--------------------------------------------------------
	-- Копируем main_result в новую таблицу для возможности
	-- сравнить эти таблицы в конце процедуры
	--------------------------------------------------------
	select *
	into #main_result_2
	from main_result
	
	declare @a int,
			@flag int
	set @a = 0
	set @flag = 0
	
	while 1=1
	begin
		set @a = @a + 1
		select @a
		
		--------------------------------------------------------
		-- Удаляем под границей позиции с желанием
		-- хуже чем есть у тех же студентов в части над границей
		-- так как при обмене мы хотим улучшить позиции
		--------------------------------------------------------
		delete #main_result_2
		from #main_result_2 TDown
		left join (select * from dbo.main_result where serial_number <= count_budget_places) Tup 
		on TDown.student_id = Tup.student_id
		where TDown.serial_number > TDown.count_budget_places and TDown.number_of_wish > Tup.number_of_wish
		
		--------------------------------------------------
		-- Отбираем верхнюю часть таблицы (над границей)
		-- не берем позиции с желанием 1, так как им нечего 
		-- улучшать
		--------------------------------------------------
		select *
		into #Up
		from #main_result_2
		where serial_number <= count_budget_places and number_of_wish <> 1	
		
		---------------------------------------------------------------------------------------
		-- формируем новые номера для всей таблицы(так как удаляли позиции в начале процедуры)
		-- иначе мы не могли бы сравнить номер с count_budget_places
		---------------------------------------------------------------------------------------
		update 
			#main_result_2
		set 
			serial_number = T.NNN
		from 
			#main_result_2 MR
			inner join (
					select *,ROW_NUMBER() over(partition by direction_id order by count_all_points DESC, student_id) as NNN
					from #main_result_2
					) T on MR.direction_id = T.direction_id and MR.student_id = T.student_id
		
		----------------------------------------------------------------------------------------
		-- Записываем в новую таблицу первые позиции под границей 
		-- т.е. T.NNN = T.count_budget_places + 1
		-- и оставляем только тех абитуриентов, которые присутствуют в верхнем списке
		----------------------------------------------------------------------------------------
		select T.main_result_id, T.student_id, T.direction_id as direction_id_want, T.number_of_wish as number_of_wish_want,
			   #Up.direction_id as direction_id_now, #Up.number_of_wish as number_of_wish_now, 
			   T.direction_id as dir_change,cast(STR(T.student_id + 1000000) as varchar(4000) ) as chain
		into #Down
		from #main_result_2 T
		inner join #Up on #Up.student_id = T.student_id
		where T.serial_number = T.count_budget_places + 1
		
		set @flag = 0
		
		---------------------------------------------------------------------------
		-- В полученной таблице #Down содержаться первые под границей позиции
		-- абитуриентов. Создаем цикл, в котором простраиваем цепочки для каждого
		-- абитуриента, меняем позиции абитуриентов, удовлетворяющих условию 
		-- (цепочка должна начинаться и заканчиваться одним и тем же абитуриентом),
		-- заменяем получившуюся цепочку на Null, удаляем все цепочки равные Null.
		-- Если в таблице #Down больше не осталось строк, заканчиваем цикл.
		---------------------------------------------------------------------------
		while 1=1
		begin
		
			---------------------------------------------------------------------------
			-- К таблице #Down присоединяем эту же таблицу(dir_change - изменяющийся 
			-- столбец желаемого направления, по которому присоединяется таблица) и 
			-- обновляем ее данные. Меняем цепочку(прибавляем к имеющемуся значению 
			-- id студента из новой таблицы)  
			---------------------------------------------------------------------------
			update #Down
			set chain = ltrim(D1.chain) + '=' + ltrim(STR(D2.student_id+1000000)),
				dir_change = D2.direction_id_want
			from #Down D1
			left join (select * from #Down) D2 on D1.dir_change = D2.direction_id_now
			
			--select 0 as before_detete, *
			--from #Down
			
			----------------------------
			--  Выводим удаляющиеся пары
			----------------------------
			select 'pair' as pair,*
			from #main_result_2 MR
			left join
			(select *
			from #Down D
			left join
			(SELECT distinct L.str_part - 1000000 as part
			FROM #Down D
			CROSS APPLY
			(SELECT * FROM dbo.S_split(D.chain,'=')) L
			where SUBSTRING(D.chain, 1, 7) = SUBSTRING(D.chain, len(D.chain) - 6, 7)) R on D.student_id = R.part
			where R.part is not NULL) R2 on MR.student_id = R2.student_id and 
			MR.direction_id = R2.direction_id_now and MR.number_of_wish = R2.number_of_wish_now
			where R2.main_result_id is not NULL
			----------------------------
			
			---------------------------------------------------------
			-- Если законченные цепочки нашлись, то @flag = @flag + 1
			---------------------------------------------------------
			if exists(
			select 'pair' as pair,*
			from #main_result_2 MR
			left join
			(select *
			from #Down D
			left join
			(SELECT distinct L.str_part - 1000000 as part
			FROM #Down D
			CROSS APPLY
			(SELECT * FROM dbo.S_split(D.chain,'=')) L
			where SUBSTRING(D.chain, 1, 7) = SUBSTRING(D.chain, len(D.chain) - 6, 7)) R on D.student_id = R.part
			where R.part is not NULL) R2 on MR.student_id = R2.student_id and 
			MR.direction_id = R2.direction_id_now and MR.number_of_wish = R2.number_of_wish_now
			where R2.main_result_id is not NULL
			) set @flag = @flag + 1
			
			
			--------------------------------------------------------------------------------
			-- Меняем абитуриентов местами, то есть удаляем их позиции над границей. Для 
			-- этого формируем таблицу неповторяющийся id студентов, составляющих 
			-- законченную цеппочку (where SUBSTRING(D.chain, 1, 7) = 
			-- SUBSTRING(D.chain, len(D.chain) - 6, 7)), с помощью функции S_split(), 
			-- получающая на вход строку и символ, по которому будет разделяться эта строка.
			-- Присоединяем эту таблицу к таблице, содержащей позиции абитуриентов сразу под
			-- границей. Полученныые данные присоединяем к #main_result_2 для удаления.
			--------------------------------------------------------------------------------
			delete #main_result_2
			from #main_result_2 MR
			left join
			(select *
			from #Down D
			left join
			(SELECT distinct L.str_part - 1000000 as part
			FROM #Down D
			CROSS APPLY
			(SELECT * FROM dbo.S_split(D.chain,'=')) L
			where SUBSTRING(D.chain, 1, 7) = SUBSTRING(D.chain, len(D.chain) - 6, 7)) R on D.student_id = R.part
			where R.part is not NULL) R2 on MR.student_id = R2.student_id and 
			MR.direction_id = R2.direction_id_now and MR.number_of_wish = R2.number_of_wish_now
			where R2.main_result_id is not NULL
			
			--------------------------------------------------------------
			-- Обновляем данные таблицы. Меняем строку chain на Null, если
			-- первые 7 символов равны последним 7-ми, то есть id студента
			-- в начале таблицы равен id студента в конце таблицы. 
			--------------------------------------------------------------
			update #Down
			set chain = Null
			where SUBSTRING(chain, 1, 7) = SUBSTRING(chain, len(chain) - 6, 7)
			
			----------------------------------------------------------------
			-- Удаляем закончившиеся цепочки
			----------------------------------------------------------------
			delete
			from #Down
			where chain is Null
			
			--select 0 as after_detete, chain
			--from #Down
			
			----------------------------------------
			-- Если законченных цепочек больше нет,
			-- тогда заканчиваем цикл
			----------------------------------------
			if not exists(select * from #down) break
		
		end
		
		------------------------------------------
		-- формируем новые номера для всей таблицы
		------------------------------------------
		update 
			#main_result_2
		set 
			serial_number = T.NNN
		from 
			#main_result_2 MR
			inner join (
					select *,ROW_NUMBER() over(partition by direction_id order by count_all_points DESC, student_id) as NNN
					from #main_result_2
					) T on MR.direction_id = T.direction_id and MR.student_id = T.student_id
		
		drop table #Down
		drop table #Up
		
		select @flag as flag
		if @flag = 0 break		
	end
	
	select *
	from #main_result_2
	order by student_id
END
GO
/****** Object:  StoredProcedure [dbo].[calc_double_save]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[calc_double_save] 
AS
BEGIN
	truncate table main_result
	
	-- Формируем таблицу результата с сразу пишем 
	-- количесвто баллов за предметы
	---------------------------------------------
	insert into main_result(
		direction_id
		,student_id
		, number_of_wish
		, count_of_points
		, count_add_points
		
		, count_all_points
		, serial_number
		, count_budget_places
		, status_id
		)
	select 
		SW.direction_id
		,SW.student_id
		,SW.number_of_wish
		,SUM(count_of_points) 
		,NULL
		
		,null
		,null
		,null
		,null
	from 
		dbo.student_wish SW
		inner join dbo.direct_subject DS on DS.direction_id = SW.direction_id
		left join dbo.student_subject SS on SS.student_id = SW.student_id
			and SS.subject_id = DS.subject_id
	group by 
		SW.student_id, SW.direction_id, SW.number_of_wish
	order by 
		SW.student_id, SW.number_of_wish

	-- Прописываем доп баллы
	------------------------
	update main_result
	set count_add_points = T.count_add_points
		,count_budget_places = T.count_budget_places 
		,count_all_points = T.count_add_points + count_of_points
	from main_result MR
	inner join 
		(
		select 
			SW.student_id, SW.direction_id as direction_id,
			V.golden_medal * ST.golden_medal
			+ V.GTO * ST.GTO
			+ V.voluntering * ST.voluntering
			+ V.final_essay * ST.final_essay as count_add_points
			,D.count_budget_places 
		from dbo.student_wish SW
			left join student ST on SW.student_id = ST.student_id
			left join direction D on SW.direction_id = D.direction_id
			left join faculties F on D.faculties_id = F.faculties_id
			left join vuz V on F.vuz_id = V.vuz_id		
		) T	on T.student_id = MR.student_id and T.direction_id = MR.direction_id
		
	
	while 1=1
	begin
		----------------------------------------------------
		--перенумерация позиций студентов внутри направления
		----------------------------------------------------
		update 
			main_result
		set 
			serial_number = T.NNN
		from 
			main_result MR
			inner join (
					select *,ROW_NUMBER() over(partition by direction_id order by count_all_points DESC) as NNN
					from main_result
					) T on MR.direction_id = T.direction_id and MR.student_id = T.student_id 
		
		select student_id, MIN(number_of_wish) as min_wish, count(student_id) as cnt
		into #TTT
		from main_result
		where serial_number <= count_budget_places
		group by student_id
		
		select *
		from #TTT
		--where student_id = 20
		
		if not exists(select * from #TTT where cnt > 1)
			break
		
		delete main_result
		from main_result MR
		left join #TTT T on MR.student_id = T.student_id and MR.number_of_wish = T.min_wish
		where MR.serial_number <= MR.count_budget_places and T.student_id is NULL
		
		select 11111111111, student_id, number_of_wish, serial_number, count_budget_places
		from main_result
		--where student_id = 20
		
		drop table #TTT
		
	end  -- while 1=1
select 'finish'
END
GO
/****** Object:  StoredProcedure [dbo].[calc_double]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[calc_double] 
/*
Другой способ:
1.Формируем единый неповторяющийся список абитуров который над границей (Distinct)
2.Для каждого абитура оставляем его лучшую позицию в списке над границей
С желанием = 1 переносим в отдельный список
3.Удаляем позиции кроме лучших (дубли)
4.На освободившиеся места подтягиваем из списка ниже границы
5 Идем на пункт 1.
И так до тех пор пока не перестанут освобождаться места и соответственно  - подтягиваться 
*/
AS
BEGIN
	truncate table main_result
	
	-- Формируем таблицу результата и сразу пишем 
	-- количесвто баллов за предметы
	-- !!! Не должно быть несостыковок между 
	-- абитуриентами и направлениями(соответствие
	-- предметов, выполнение различных условий)
	---------------------------------------------
	insert into main_result(
		direction_id
		,student_id
		, number_of_wish
		, count_of_points
		, count_add_points
		
		, count_all_points
		, serial_number
		, count_budget_places
		, status_id
		)
	select 
		SW.direction_id
		,SW.student_id
		,SW.number_of_wish
		,SUM(count_of_points) 
		,NULL
		
		,null
		,null
		,null
		,null
	from 
		dbo.student_wish SW
		inner join dbo.direct_subject DS on DS.direction_id = SW.direction_id
		left join dbo.student_subject SS on SS.student_id = SW.student_id
			and SS.subject_id = DS.subject_id
	group by 
		SW.student_id, SW.direction_id, SW.number_of_wish
	order by 
		SW.student_id, SW.number_of_wish

	-- Прописываем доп баллы
	------------------------
	update main_result
	set count_add_points = T.count_add_points
		,count_budget_places = T.count_budget_places 
		,count_all_points = T.count_add_points + count_of_points
	from main_result MR
	inner join 
		(
		select 
			SW.student_id, SW.direction_id as direction_id,
			V.golden_medal * ST.golden_medal
			+ V.GTO * ST.GTO
			+ V.voluntering * ST.voluntering
			+ V.final_essay * ST.final_essay as count_add_points
			,D.count_budget_places 
		from dbo.student_wish SW
			left join student ST on SW.student_id = ST.student_id
			left join direction D on SW.direction_id = D.direction_id
			left join faculties F on D.faculties_id = F.faculties_id
			left join vuz V on F.vuz_id = V.vuz_id		
		) T	on T.student_id = MR.student_id and T.direction_id = MR.direction_id
		

	
	while 1=1
	begin
		----------------------------------------------------
		-- Перенумерация позиций студентов внутри направления
		-- по убыванию кол-ва баллов
		----------------------------------------------------
		update 
			main_result
		set 
			serial_number = T.NNN
		from 
			main_result MR
			inner join (
					select *,ROW_NUMBER() over(partition by direction_id order by count_all_points DESC, student_id) as NNN
					from main_result
					) T on MR.direction_id = T.direction_id and MR.student_id = T.student_id 
	
	
		
	--select distinct student_id
	--from main_result
	--where serial_number <= count_budget_places
	
		------------------------------------------------------
		-- Ищем для каждого студента лучшую позицию (min wish)
		-- Поиск происходит над границей
		-- cnt показывает сколько раз студент встречается над 
		-- границей
		------------------------------------------------------
		select student_id, MIN(number_of_wish) as min_wish, count(student_id) as cnt
		into #TTT
		from main_result
		where serial_number <= count_budget_places
		group by student_id
		
		--select *
		--from #TTT

		-- если дублей больше нет над границей,
		-- заканчиваем процедуру
		---------------------------------------
		if not exists(select * from #TTT where cnt > 1)
			break
		
		--------------------------------------------
		-- Удаляем все позиции, которые нелучшие и
		-- которые находятся над границей
		--------------------------------------------
		delete main_result
		from main_result MR
		left join #TTT T on MR.student_id = T.student_id and MR.number_of_wish = T.min_wish
		where MR.serial_number <= MR.count_budget_places and T.student_id is NULL
		
		--select 11111111111, student_id, number_of_wish, serial_number, count_budget_places
		--from main_result
		
		drop table #TTT
		
	end  -- while 1=1
select 'finish'
END

--------------------------------------------------------------------
-- Итог: после выполнения процедуры имеется таблица, которая
-- над границей заполнена неповторяющимися позициями абитуриентов,
-- а под границей могут содержаться дубли как с большим приоритетом,
-- так и с меньшим. Абитуриенты имеют неповторяющийся номер внутри
-- направления, все абитуриенты остортированы по этому номеру без
-- пробелов
--------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[basic_algorithm]    Script Date: 03/01/2020 22:34:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[basic_algorithm] 
AS
BEGIN
----------------------------------------------------------------------
--Создаём таблицу, в которой к direction присоединяем student_wish,
--где id направления равен желанию студента(любому желанию).
----------------------------------------------------------------------
--В данном случае мы рассматривааем студентов, которые хотят поступить 
--на информационные направления, поэтому убираем лишние строки с 
--неинформационнами направлениями.
----------------------------------------------------------------------
--сортируем таблицу по id направления
----------------------------------------------------------------------
	select D.direction_id, student_id, number_of_wish
	into #part_1
	from dbo.direction D
	left join dbo.student_wish SW on D.direction_id = SW.direction_id
	where student_id is not NULL
	order by direction_id
	
select 101,* from #part_1


-----------------------------------------------------------------------
--Создаём таблицу, в которой к student_subject присоединяем первую
--таблицу(#part_1), где они равны по id студента
-----------------------------------------------------------------------
	select P1.*, SS.subject_id, SS.count_of_points
	into #part_2
	from student_subject SS
	right join #part_1 P1 on SS.student_id = P1.student_id 
	
	
select 101,* from #part_1
-------------------------------------------------------------------------
----Создаём таблицу, в которой к таблице #part_2 присоединяем таблицу
----direct_subject, где равны id направлений и предметы(предметы, которые
----нужны напрвлениям, и предметы, которые сдавали студенты)
-------------------------------------------------------------------------
	select P2.direction_id, P2.student_id, P2.number_of_wish, P2.count_of_points
	into #part_3
	from #part_2 P2
	left join dbo.direct_subject DS on P2.direction_id = DS.direction_id and P2.subject_id = DS.subject_id
	where DS.direction_id is not NULL
select 103,* from #part_3
-------------------------------------------------------------------------
----Чистим таблицу 
-------------------------------------------------------------------------
	truncate table direction_student
	
-------------------------------------------------------------------------
----Создаем таблицу direction_student, в которой упрощаем прошлую таблицу
----т.е. группируем направления и выводим сумму баллов студента,
----которая учитывает предметы, которые сдал студент, и предметы, которые
----требует направление
-------------------------------------------------------------------------
	insert into dbo.direction_student 
		(direction_id, student_id, number_of_wish, count_of_points, NNN)
	select 
		direction_id, student_id, number_of_wish, SUM(count_of_points) as count_of_points, null
	from #part_3
	group by direction_id, student_id, number_of_wish
	
	select *
	from direction_student

-------------------------------------------------------------------------
----Обновляем таблицу, а именно прибавляем к уже имеющемуся кол-ву
----баллов доп. баллы(умножаем достижения студента на доп. баллы за эти 
----достижения, которые дает ВУЗ)
-------------------------------------------------------------------------
	update direction_student
	set count_of_points = count_of_points 
		+ V.golden_medal * ST.golden_medal
		+ V.GTO * ST.GTO
		+ V.voluntering * ST.voluntering
		+ V.final_essay * ST.final_essay
	from direction_student DS
	left join direction D on DS.direction_id = D.direction_id
	left join faculties F on D.faculties_id = F.faculties_id
	left join vuz V on F.vuz_id = V.vuz_id
	left join student ST on DS.student_id = ST.student_id

---------------------------------------------------------------------------
------Удаляемм все временные таблицы
---------------------------------------------------------------------------	
	drop table #part_1
	drop table #part_2
	drop table #part_3

----------------------------------------------------------------------------
------Создаём таблицу, в которой данные из direction_student группируем по
------direction_id 	и сортируем по кол-ву баллов(по убыванию), которые
------получил студент и нумеруем их в каждой группе
----------------------------------------------------------------------------
------На данном этапе мы уже подготовили таблицу #begin_part к работе с ней
------в основном алгоритме
----------------------------------------------------------------------------
	select 
		direction_id, student_id, number_of_wish, count_of_points
		, ROW_NUMBER() over(partition by direction_id order by count_of_points DESC) as NNN
	into #begin_part
	from dbo.direction_student

--------------------------------------------------------------------------
----Алгоритм
--------------------------------------------------------------------------
----Этап первый
--------------------------------------------------------------------------
	declare @number_of_wish int,	@cnt int
	set @number_of_wish = 1
	
	truncate table direction_student
	
	set @cnt= (select COUNT(number_of_wish) from student_wish where student_id = 1)
	while @number_of_wish <= @cnt
	begin
	select 555
			IF (select count(#begin_part.direction_id)
			from #begin_part
			left join dbo.direction on #begin_part.direction_id = direction.direction_id
			where #begin_part.NNN <= direction.count_budget_places 
			and #begin_part.number_of_wish = @number_of_wish) < 1
			begin
					set @number_of_wish = @number_of_wish + 1
			end
			ELSE
			begin
					insert into direction_student
					select #begin_part.*
					from #begin_part
					left join dbo.direction on #begin_part.direction_id = direction.direction_id
					where #begin_part.NNN <= direction.count_budget_places 
					and #begin_part.number_of_wish = @number_of_wish
					set @number_of_wish = 9
			end

	end  -- while @number_of_wish <= @cnt
END
GO
/****** Object:  ForeignKey [FK_student_users]    Script Date: 03/01/2020 22:34:50 ******/
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_users] FOREIGN KEY([user0_id])
REFERENCES [dbo].[users] ([user0_id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_users]
GO
/****** Object:  ForeignKey [FK_faculties_vuz]    Script Date: 03/01/2020 22:34:50 ******/
ALTER TABLE [dbo].[faculties]  WITH CHECK ADD  CONSTRAINT [FK_faculties_vuz] FOREIGN KEY([vuz_id])
REFERENCES [dbo].[vuz] ([vuz_id])
GO
ALTER TABLE [dbo].[faculties] CHECK CONSTRAINT [FK_faculties_vuz]
GO
/****** Object:  ForeignKey [FK_direction_direction_list]    Script Date: 03/01/2020 22:34:50 ******/
ALTER TABLE [dbo].[direction]  WITH CHECK ADD  CONSTRAINT [FK_direction_direction_list] FOREIGN KEY([direction_list_id])
REFERENCES [dbo].[direction_list] ([direction_list_id])
GO
ALTER TABLE [dbo].[direction] CHECK CONSTRAINT [FK_direction_direction_list]
GO
/****** Object:  ForeignKey [FK_direction_faculties]    Script Date: 03/01/2020 22:34:50 ******/
ALTER TABLE [dbo].[direction]  WITH CHECK ADD  CONSTRAINT [FK_direction_faculties] FOREIGN KEY([faculties_id])
REFERENCES [dbo].[faculties] ([faculties_id])
GO
ALTER TABLE [dbo].[direction] CHECK CONSTRAINT [FK_direction_faculties]
GO
/****** Object:  ForeignKey [FK_student_subject_student]    Script Date: 03/01/2020 22:34:50 ******/
ALTER TABLE [dbo].[student_subject]  WITH CHECK ADD  CONSTRAINT [FK_student_subject_student] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([student_id])
GO
ALTER TABLE [dbo].[student_subject] CHECK CONSTRAINT [FK_student_subject_student]
GO
/****** Object:  ForeignKey [FK_student_subject_Subjects]    Script Date: 03/01/2020 22:34:50 ******/
ALTER TABLE [dbo].[student_subject]  WITH CHECK ADD  CONSTRAINT [FK_student_subject_Subjects] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([subject_id])
GO
ALTER TABLE [dbo].[student_subject] CHECK CONSTRAINT [FK_student_subject_Subjects]
GO
/****** Object:  ForeignKey [FK_student_wish_direction]    Script Date: 03/01/2020 22:34:50 ******/
ALTER TABLE [dbo].[student_wish]  WITH CHECK ADD  CONSTRAINT [FK_student_wish_direction] FOREIGN KEY([direction_id])
REFERENCES [dbo].[direction] ([direction_id])
GO
ALTER TABLE [dbo].[student_wish] CHECK CONSTRAINT [FK_student_wish_direction]
GO
/****** Object:  ForeignKey [FK_student_wish_student]    Script Date: 03/01/2020 22:34:50 ******/
ALTER TABLE [dbo].[student_wish]  WITH CHECK ADD  CONSTRAINT [FK_student_wish_student] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([student_id])
GO
ALTER TABLE [dbo].[student_wish] CHECK CONSTRAINT [FK_student_wish_student]
GO
/****** Object:  ForeignKey [FK_direct_subject_direction]    Script Date: 03/01/2020 22:34:50 ******/
ALTER TABLE [dbo].[direct_subject]  WITH CHECK ADD  CONSTRAINT [FK_direct_subject_direction] FOREIGN KEY([direction_id])
REFERENCES [dbo].[direction] ([direction_id])
GO
ALTER TABLE [dbo].[direct_subject] CHECK CONSTRAINT [FK_direct_subject_direction]
GO
/****** Object:  ForeignKey [FK_direct_subject_Subjects]    Script Date: 03/01/2020 22:34:50 ******/
ALTER TABLE [dbo].[direct_subject]  WITH CHECK ADD  CONSTRAINT [FK_direct_subject_Subjects] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([subject_id])
GO
ALTER TABLE [dbo].[direct_subject] CHECK CONSTRAINT [FK_direct_subject_Subjects]
GO
/****** Object:  ForeignKey [FK_main_result_direction]    Script Date: 03/01/2020 22:34:50 ******/
ALTER TABLE [dbo].[main_result]  WITH CHECK ADD  CONSTRAINT [FK_main_result_direction] FOREIGN KEY([direction_id])
REFERENCES [dbo].[direction] ([direction_id])
GO
ALTER TABLE [dbo].[main_result] CHECK CONSTRAINT [FK_main_result_direction]
GO
/****** Object:  ForeignKey [FK_main_result_student]    Script Date: 03/01/2020 22:34:50 ******/
ALTER TABLE [dbo].[main_result]  WITH CHECK ADD  CONSTRAINT [FK_main_result_student] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([student_id])
GO
ALTER TABLE [dbo].[main_result] CHECK CONSTRAINT [FK_main_result_student]
GO
