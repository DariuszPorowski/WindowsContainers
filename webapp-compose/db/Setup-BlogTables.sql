USE blogengine_db
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[be_BlogRollItems](
	[BlogRollRowId] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [uniqueidentifier] NOT NULL,
	[BlogRollId] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[BlogUrl] [varchar](255) NOT NULL,
	[FeedUrl] [varchar](255) NULL,
	[Xfn] [varchar](255) NULL,
	[SortIndex] [int] NOT NULL,
 CONSTRAINT [PK_be_BlogRollItems] PRIMARY KEY CLUSTERED 
(
	[BlogRollRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET ANSI_PADDING OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_Blogs](
	[BlogRowId] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [uniqueidentifier] NOT NULL,
	[BlogName] [nvarchar](255) NOT NULL,
	[Hostname] [nvarchar](255) NOT NULL,
	[IsAnyTextBeforeHostnameAccepted] [bit] NOT NULL,
	[StorageContainerName] [nvarchar](255) NOT NULL,
	[VirtualPath] [nvarchar](255) NOT NULL,
	[IsPrimary] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsSiteAggregation] [bit] NOT NULL,
 CONSTRAINT [PK_be_Blogs] PRIMARY KEY CLUSTERED 
(
	[BlogRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_Categories](
	[CategoryRowID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[CategoryID] [uniqueidentifier] DEFAULT newid()  NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[ParentID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_be_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryRowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_DataStoreSettings](
	[DataStoreSettingRowId] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [uniqueidentifier] NOT NULL,
	[ExtensionType] [nvarchar](50) NOT NULL,
	[ExtensionId] [nvarchar](100) NOT NULL,
	[Settings] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_be_DataStoreSettings] PRIMARY KEY CLUSTERED 
(
	[DataStoreSettingRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[be_FileStoreDirectory](
	[Id] [uniqueidentifier] NOT NULL,
	[ParentID] [uniqueidentifier] NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[FullPath] [varchar](1000) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastAccess] [datetime] NOT NULL,
	[LastModify] [datetime] NOT NULL,
 CONSTRAINT [PK_be_FileStoreDirectory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET ANSI_PADDING OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[be_FileStoreFiles](
	[FileID] [uniqueidentifier] NOT NULL,
	[ParentDirectoryID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[FullPath] [varchar](255) NOT NULL,
	[Contents] [varbinary](max) NOT NULL,
	[Size] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastAccess] [datetime] NOT NULL,
	[LastModify] [datetime] NOT NULL,
 CONSTRAINT [PK_be_FileStoreFiles] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET ANSI_PADDING OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[be_FileStoreFileThumbs](
	[thumbnailId] [uniqueidentifier] NOT NULL,
	[FileId] [uniqueidentifier] NOT NULL,
	[size] [int] NOT NULL,
	[contents] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_be_FileStoreFileThumbs] PRIMARY KEY CLUSTERED 
(
	[thumbnailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET ANSI_PADDING OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_PackageFiles](
	[PackageId] [nvarchar](128) NOT NULL,
	[FileOrder] [int] NOT NULL,
	[FilePath] [nvarchar](255) NOT NULL,
	[IsDirectory] [bit] NOT NULL,
 CONSTRAINT [PK_be_PackageFiles] PRIMARY KEY CLUSTERED 
(
	[PackageId] ASC,
	[FilePath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_Packages](
	[PackageId] [nvarchar](128) NOT NULL,
	[Version] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_be_Packages] PRIMARY KEY CLUSTERED 
(
	[PackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 
GO

CREATE TABLE [dbo].[be_CustomFields](
	[CustomType] [nvarchar](25) NOT NULL,
	[ObjectId] [nvarchar](100) NOT NULL,
	[BlogId] [uniqueidentifier] NOT NULL,
	[Key] [nvarchar](150) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Attribute] [nvarchar](250) NULL
)
GO

CREATE CLUSTERED INDEX [idx_be_CustomType_ObjectId_BlogId_Key] ON [dbo].[be_CustomFields] 
(
	[CustomType] ASC,
	[ObjectId] ASC,
	[BlogId] ASC,
	[Key] ASC
)
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_Pages](
	[PageRowID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[PageID] [uniqueidentifier] DEFAULT newid()  NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[PageContent] [nvarchar](max) NULL,
	[Keywords] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[IsPublished] [bit] NULL,
	[IsFrontPage] [bit] NULL,
	[Parent] [uniqueidentifier] NULL,
	[ShowInList] [bit] NULL,
	[Slug] [nvarchar](255) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_be_Pages] PRIMARY KEY CLUSTERED 
(
	[PageRowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_PingService](
	[PingServiceID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[Link] [nvarchar](255) NULL,
 CONSTRAINT [PK_be_PingService_1] PRIMARY KEY CLUSTERED 
(
	[PingServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_PostCategory](
	[PostCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[PostID] [uniqueidentifier] NOT NULL,
	[CategoryID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_be_PostCategory_1] PRIMARY KEY CLUSTERED 
(
	[PostCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_PostComment](
	[PostCommentRowID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[PostCommentID] [uniqueidentifier] DEFAULT newid()  NOT NULL,
	[PostID] [uniqueidentifier] NOT NULL,
	[ParentCommentID] [uniqueidentifier] NOT NULL,
	[CommentDate] [datetime] NOT NULL,
	[Author] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Website] [nvarchar](255) NULL,
	[Comment] [nvarchar](max) NULL,
	[Country] [nvarchar](255) NULL,
	[Ip] [nvarchar](50) NULL,
	[IsApproved] [bit] NULL,
	[ModeratedBy] [nvarchar](100) NULL,
	[Avatar] [nvarchar](255) NULL,
	[IsSpam] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_be_PostComment] PRIMARY KEY CLUSTERED 
(
	[PostCommentRowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_PostNotify](
	[PostNotifyID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[PostID] [uniqueidentifier] NOT NULL,
	[NotifyAddress] [nvarchar](255) NULL,
 CONSTRAINT [idx_be_PostCategory_BlogId_PostId] PRIMARY KEY CLUSTERED 
(
	[PostNotifyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_Posts](
	[PostRowID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[PostID] [uniqueidentifier] DEFAULT newid()  NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[PostContent] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[Author] [nvarchar](50) NULL,
	[IsPublished] [bit] NULL,
	[IsCommentEnabled] [bit] NULL,
	[Raters] [int] NULL,
	[Rating] [real] NULL,
	[Slug] [nvarchar](255) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_be_Posts] PRIMARY KEY CLUSTERED 
(
	[PostRowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_PostTag](
	[PostTagID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[PostID] [uniqueidentifier] NOT NULL,
	[Tag] [nvarchar](50) NULL,
 CONSTRAINT [PK_be_PostTag] PRIMARY KEY CLUSTERED 
(
	[PostTagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_Profiles](
	[ProfileID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[SettingName] [nvarchar](200) NULL,
	[SettingValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_be_Profiles] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_QuickNotes](
	[QuickNoteID] [int] IDENTITY(1,1) NOT NULL,
	[NoteID] [uniqueidentifier] NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_be_QuickNotes] PRIMARY KEY CLUSTERED 
(
	[QuickNoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_QuickSettings](
	[QuickSettingID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[SettingName] [nvarchar](255) NOT NULL,
	[SettingValue] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_be_QuickSettings] PRIMARY KEY CLUSTERED 
(
	[QuickSettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[be_Referrers](
	[ReferrerRowId] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [uniqueidentifier] NOT NULL,
	[ReferrerId] [uniqueidentifier] NOT NULL,
	[ReferralDay] [datetime] NOT NULL,
	[ReferrerUrl] [varchar](255) NOT NULL,
	[ReferralCount] [int] NOT NULL,
	[Url] [varchar](255) NULL,
	[IsSpam] [bit] NULL,
 CONSTRAINT [PK_be_Referrers] PRIMARY KEY CLUSTERED 
(
	[ReferrerRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET ANSI_PADDING OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_RightRoles](
	[RightRoleRowId] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [uniqueidentifier] NOT NULL,
	[RightName] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_be_RightRoles] PRIMARY KEY CLUSTERED 
(
	[RightRoleRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_Rights](
	[RightRowId] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [uniqueidentifier] NOT NULL,
	[RightName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_be_Rights] PRIMARY KEY CLUSTERED 
(
	[RightRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

ALTER TABLE dbo.be_Rights
ADD CONSTRAINT AK_RightName UNIQUE (BlogId, RightName)

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[Role] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_be_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_Settings](
	[SettingRowId] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [uniqueidentifier] NOT NULL,
	[SettingName] [nvarchar](50) NOT NULL,
	[SettingValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_be_Settings] PRIMARY KEY CLUSTERED 
(
	[SettingRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

ALTER TABLE dbo.be_Settings
ADD CONSTRAINT AK_SettingName UNIQUE (BlogId, SettingName)

 
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_StopWords](
	[StopWordRowId] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [uniqueidentifier] NOT NULL,
	[StopWord] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_be_StopWords] PRIMARY KEY CLUSTERED 
(
	[StopWordRowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_UserRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_be_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[be_Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[LastLoginTime] [datetime] NULL,
	[EmailAddress] [nvarchar](100) NULL,
 CONSTRAINT [PK_be_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
) 

GO
SET IDENTITY_INSERT [dbo].[be_BlogRollItems] ON 

GO
INSERT [dbo].[be_BlogRollItems] ([BlogRollRowId], [BlogId], [BlogRollId], [Title], [Description], [BlogUrl], [FeedUrl], [Xfn], [SortIndex]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'890f00e5-3a86-4cba-b85b-104063964a87', N'Ben Amada', N'adventures in application development', N'http://allben.net/', N'http://feeds.feedburner.com/allben', N'contact', 5)
GO
INSERT [dbo].[be_BlogRollItems] ([BlogRollRowId], [BlogId], [BlogRollId], [Title], [Description], [BlogUrl], [FeedUrl], [Xfn], [SortIndex]) VALUES (2, N'27604f05-86ad-47ef-9e05-950bb762570c', N'7f906880-4316-47f1-a934-1a912fc02f8b', N'Russell van der Walt', N'an adventure in web technologies', N'http://blog.ruski.co.za/', N'http://feeds.feedburner.com/rusvdw', N'contact', 4)
GO
INSERT [dbo].[be_BlogRollItems] ([BlogRollRowId], [BlogId], [BlogRollId], [Title], [Description], [BlogUrl], [FeedUrl], [Xfn], [SortIndex]) VALUES (3, N'27604f05-86ad-47ef-9e05-950bb762570c', N'dcdaa78b-0b77-4691-99f0-1bb6418945a1', N'Ruslan Tur', N'.NET and Open Source: better together', N'http://rtur.net/blog/', N'http://feeds.feedburner.com/rtur', N'contact', 2)
GO
INSERT [dbo].[be_BlogRollItems] ([BlogRollRowId], [BlogId], [BlogRollId], [Title], [Description], [BlogUrl], [FeedUrl], [Xfn], [SortIndex]) VALUES (4, N'27604f05-86ad-47ef-9e05-950bb762570c', N'8a846489-b69e-4fde-b2b2-53bc6104a6fa', N'John Dyer', N'Technology and web development in ASP.NET, Flash, and JavaScript', N'http://johndyer.name/', N'http://johndyer.name/syndication.axd', N'contact', 3)
GO
INSERT [dbo].[be_BlogRollItems] ([BlogRollRowId], [BlogId], [BlogRollId], [Title], [Description], [BlogUrl], [FeedUrl], [Xfn], [SortIndex]) VALUES (5, N'27604f05-86ad-47ef-9e05-950bb762570c', N'25e4d8da-3278-4e58-b0bf-932496dabc96', N'Mads Kristensen', N'Full featured simplicity in ASP.NET and C#', N'http://madskristensen.net', N'http://feeds.feedburner.com/netslave', N'contact', 0)
GO
INSERT [dbo].[be_BlogRollItems] ([BlogRollRowId], [BlogId], [BlogRollId], [Title], [Description], [BlogUrl], [FeedUrl], [Xfn], [SortIndex]) VALUES (6, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ccc817ef-e760-482b-b82f-a6854663110f', N'Al Nyveldt', N'Adventures in Code and Other Stories', N'http://www.nyveldt.com/blog/', N'http://feeds.feedburner.com/razorant', N'contact', 1)
GO
SET IDENTITY_INSERT [dbo].[be_BlogRollItems] OFF
GO
SET IDENTITY_INSERT [dbo].[be_Blogs] ON 

GO
INSERT [dbo].[be_Blogs] ([BlogRowId], [BlogId], [BlogName], [Hostname], [IsAnyTextBeforeHostnameAccepted], [StorageContainerName], [VirtualPath], [IsPrimary], [IsActive], [IsSiteAggregation]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'Primary', N'', 0, N'', N'~/', 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[be_Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[be_Categories] ON 

GO
INSERT [dbo].[be_Categories] ([CategoryRowID], [BlogID], [CategoryID], [CategoryName], [Description], [ParentID]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'f5962d4c-6c54-4a99-860c-f7e8c1f255d9', N'General', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[be_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[be_DataStoreSettings] ON 

GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'1', N'be_WIDGET_ZONE', N'<?xml version="1.0" encoding="utf-16"?>
<WidgetData xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Settings>&lt;widgets&gt;&lt;widget id="d9ada63d-3462-4c72-908e-9d35f0acce40" title="TextBox" showTitle="True"&gt;TextBox&lt;/widget&gt;&lt;widget id="19baa5f6-49d4-4828-8f7f-018535c35f94" title="Administration" showTitle="True"&gt;Administration&lt;/widget&gt;&lt;widget id="d81c5ae3-e57e-4374-a539-5cdee45e639f" title="Search" showTitle="True"&gt;Search&lt;/widget&gt;&lt;widget id="77142800-6dff-4016-99ca-69b5c5ebac93" title="Tag Cloud" showTitle="True"&gt;TagCloud&lt;/widget&gt;&lt;widget id="4ce68ae7-c0c8-4bf8-b50f-a67b582b0d2e" title="Post List" showTitle="True"&gt;PostList&lt;/widget&gt;&lt;/widgets&gt;</Settings>
</WidgetData>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (113, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'MetaExtension', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="MetaExtension">
  <AdminPage />
  <Author>BlogEngine.net</Author>
  <Description>Meta extension</Description>
  <Enabled>true</Enabled>
  <Priority>0</Priority>
  <Settings>
    <Delimiter>44</Delimiter>
    <Help />
    <Hidden>false</Hidden>
    <Index>0</Index>
    <IsScalar>false</IsScalar>
    <KeyField>ID</KeyField>
    <Name>BeCommentFilters</Name>
    <Parameters>
      <KeyField>true</KeyField>
      <Label>ID</Label>
      <MaxLength>20</MaxLength>
      <Name>ID</Name>
      <ParamType>Integer</ParamType>
      <Required>true</Required>
      <SelectedValue />
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Action</Label>
      <MaxLength>100</MaxLength>
      <Name>Action</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Subject</Label>
      <MaxLength>100</MaxLength>
      <Name>Subject</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Operator</Label>
      <MaxLength>100</MaxLength>
      <Name>Operator</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Filter</Label>
      <MaxLength>100</MaxLength>
      <Name>Filter</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
    </Parameters>
    <ShowAdd>true</ShowAdd>
    <ShowDelete>true</ShowDelete>
    <ShowEdit>true</ShowEdit>
  </Settings>
  <Settings>
    <Delimiter>44</Delimiter>
    <Help />
    <Hidden>false</Hidden>
    <Index>1</Index>
    <IsScalar>false</IsScalar>
    <KeyField>FullName</KeyField>
    <Name>BeCustomFilters</Name>
    <Parameters>
      <KeyField>true</KeyField>
      <Label>Name</Label>
      <MaxLength>100</MaxLength>
      <Name>FullName</Name>
      <ParamType>String</ParamType>
      <Required>true</Required>
      <SelectedValue />
      <Values>App_Code.Extensions.TypePadFilter</Values>
      <Values>App_Code.Extensions.StopForumSpam</Values>
      <Values>App_Code.Extensions.AkismetFilter</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Name</Label>
      <MaxLength>100</MaxLength>
      <Name>Name</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>TypePadFilter</Values>
      <Values>StopForumSpam</Values>
      <Values>AkismetFilter</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Checked</Label>
      <MaxLength>100</MaxLength>
      <Name>Checked</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>0</Values>
      <Values>0</Values>
      <Values>0</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Cought</Label>
      <MaxLength>100</MaxLength>
      <Name>Cought</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>0</Values>
      <Values>0</Values>
      <Values>0</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Reported</Label>
      <MaxLength>100</MaxLength>
      <Name>Reported</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>0</Values>
      <Values>0</Values>
      <Values>0</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Priority</Label>
      <MaxLength>100</MaxLength>
      <Name>Priority</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>0</Values>
      <Values>0</Values>
      <Values>0</Values>
    </Parameters>
    <ShowAdd>true</ShowAdd>
    <ShowDelete>true</ShowDelete>
    <ShowEdit>true</ShowEdit>
  </Settings>
  <ShowSettings>true</ShowSettings>
  <Version>1.0</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (114, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'SyntaxHighlighter', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="SyntaxHighlighter">
  <AdminPage />
  <Author>&lt;a target="_blank" href="http://dotnetblogengine.net/"&gt;BlogEngine.NET&lt;/a&gt;</Author>
  <Description>Adds &lt;a target="_blank" href="http://alexgorbatchev.com/wiki/SyntaxHighlighter"&gt;Alex Gorbatchev''s&lt;/a&gt; source code formatter</Description>
  <Enabled>true</Enabled>
  <Priority>0</Priority>
  <Settings>
    <Delimiter>44</Delimiter>
    <Help>&lt;p&gt;This extension implements excellent Alex Gorbatchev''s syntax highlighter JS library for source code formatting. Please refer to &lt;a target="_blank" href="http://alexgorbatchev.com/wiki/SyntaxHighlighter:Usage"&gt;this site&lt;/a&gt; for usage.&lt;/p&gt;
&lt;p&gt;&lt;b&gt;auto-links&lt;/b&gt;: Allows you to turn detection of links in the highlighted element on and off. If the option is turned off, URLs won''t be clickable.&lt;/p&gt;
&lt;p&gt;&lt;b&gt;collapse&lt;/b&gt;: Allows you to force highlighted elements on the page to be collapsed by default.&lt;/p&gt;
&lt;p&gt;&lt;b&gt;gutter&lt;/b&gt;:	Allows you to turn gutter with line numbers on and off.&lt;/p&gt;
&lt;p&gt;&lt;b&gt;light&lt;/b&gt;: Allows you to disable toolbar and gutter with a single property.&lt;/p&gt;
&lt;p&gt;&lt;b&gt;smart-tabs&lt;/b&gt;:	Allows you to turn smart tabs feature on and off.&lt;/p&gt;
&lt;p&gt;&lt;b&gt;tab-size&lt;/b&gt;: Allows you to adjust tab size.&lt;/p&gt;
&lt;p&gt;&lt;b&gt;toolbar&lt;/b&gt;: Toggles toolbar on/off.&lt;/p&gt;
&lt;p&gt;&lt;b&gt;wrap-lines&lt;/b&gt;: Allows you to turn line wrapping feature on and off.&lt;/p&gt;
&lt;p&gt;&lt;a target="_blank" href="http://alexgorbatchev.com/wiki/SyntaxHighlighter:Configuration"&gt;more...&lt;/a&gt;&lt;/p&gt;
</Help>
    <Hidden>false</Hidden>
    <Index>0</Index>
    <IsScalar>true</IsScalar>
    <KeyField>gutter</KeyField>
    <Name>Options</Name>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Gutter</Label>
      <MaxLength>100</MaxLength>
      <Name>gutter</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>True</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Smart tabs</Label>
      <MaxLength>100</MaxLength>
      <Name>smart-tabs</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>True</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Auto links</Label>
      <MaxLength>100</MaxLength>
      <Name>auto-links</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>True</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Collapse</Label>
      <MaxLength>100</MaxLength>
      <Name>collapse</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Light</Label>
      <MaxLength>100</MaxLength>
      <Name>light</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Tab size</Label>
      <MaxLength>100</MaxLength>
      <Name>tab-size</Name>
      <ParamType>Integer</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>4</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Toolbar</Label>
      <MaxLength>100</MaxLength>
      <Name>toolbar</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>True</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Wrap lines</Label>
      <MaxLength>100</MaxLength>
      <Name>wrap-lines</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>True</Values>
    </Parameters>
    <ShowAdd>true</ShowAdd>
    <ShowDelete>true</ShowDelete>
    <ShowEdit>true</ShowEdit>
  </Settings>
  <Settings>
    <Delimiter>44</Delimiter>
    <Help />
    <Hidden>false</Hidden>
    <Index>1</Index>
    <IsScalar>true</IsScalar>
    <KeyField>shBrushBash</KeyField>
    <Name>Brushes</Name>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Bash (bash, shell)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushBash</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>C++ (cpp, c)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushCpp</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>C# (c-sharp, csharp)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushCSharp</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>True</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Css (css)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushCss</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>True</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Delphi (delphi, pas, pascal)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushDelphi</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Diff (diff, patch)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushDiff</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Groovy (groovy)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushGroovy</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Java (java)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushJava</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>JScript (js, jscript, javascript)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushJScript</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>True</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>PHP (php)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushPhp</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Plain (plain, text)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushPlain</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>True</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Python (py, python)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushPython</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Ruby (rails, ror, ruby)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushRuby</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Scala (scala)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushScala</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>SQL (sql)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushSql</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>True</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>VB (vb, vbnet)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushVb</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>True</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>XML (xml, xhtml, xslt, html, xhtml)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushXml</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>True</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Cold Fusion (cf, coldfusion)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushColdFusion</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Erlang (erlang, erl)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushErlang</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>JavaFX (jfx, javafx)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushJavaFX</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Perl (perl, pl)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushPerl</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>PowerSell (ps, powershell)</Label>
      <MaxLength>100</MaxLength>
      <Name>shBrushPowerShell</Name>
      <ParamType>Boolean</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <ShowAdd>true</ShowAdd>
    <ShowDelete>true</ShowDelete>
    <ShowEdit>true</ShowEdit>
  </Settings>
  <Settings>
    <Delimiter>44</Delimiter>
    <Help />
    <Hidden>false</Hidden>
    <Index>2</Index>
    <IsScalar>true</IsScalar>
    <KeyField>SelectedTheme</KeyField>
    <Name>Themes</Name>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Themes</Label>
      <MaxLength>20</MaxLength>
      <Name>SelectedTheme</Name>
      <ParamType>ListBox</ParamType>
      <Required>false</Required>
      <SelectedValue>Default</SelectedValue>
      <Values>Default</Values>
      <Values>Django</Values>
      <Values>Eclipse</Values>
      <Values>Emacs</Values>
      <Values>FadeToGrey</Values>
      <Values>MDUltra</Values>
      <Values>Midnight</Values>
      <Values>Dark</Values>
    </Parameters>
    <ShowAdd>true</ShowAdd>
    <ShowDelete>true</ShowDelete>
    <ShowEdit>true</ShowEdit>
  </Settings>
  <ShowSettings>true</ShowSettings>
  <Version>2.5</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (115, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'BBCode', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="BBCode">
  <AdminPage />
  <Author>&lt;a href="http://dotnetblogengine.net"&gt;BlogEngine.NET&lt;/a&gt;</Author>
  <Description>Converts BBCode to XHTML in the comments</Description>
  <Enabled>true</Enabled>
  <Priority>0</Priority>
  <ShowSettings>true</ShowSettings>
  <Version>1.0</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (116, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'Logger', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="Logger">
  <AdminPage />
  <Author>BlogEngine.NET</Author>
  <Description>Subscribes to Log events and records the events in a file.</Description>
  <Enabled>true</Enabled>
  <Priority>0</Priority>
  <ShowSettings>true</ShowSettings>
  <Version>1.0</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (117, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'TypePadFilter', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="TypePadFilter">
  <AdminPage />
  <Author>&lt;a href="http://lucsiferre.net"&gt;By Chris Nicola&lt;/a&gt;</Author>
  <Description>TypePad anti-spam comment filter (based on AkismetFilter)</Description>
  <Enabled>false</Enabled>
  <Priority>0</Priority>
  <Settings>
    <Delimiter>44</Delimiter>
    <Help />
    <Hidden>false</Hidden>
    <Index>0</Index>
    <IsScalar>true</IsScalar>
    <KeyField>SiteURL</KeyField>
    <Name>TypePadFilter</Name>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Site URL</Label>
      <MaxLength>100</MaxLength>
      <Name>SiteURL</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>http://example.com/blog</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>API Key</Label>
      <MaxLength>100</MaxLength>
      <Name>ApiKey</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>123456789</Values>
    </Parameters>
    <ShowAdd>true</ShowAdd>
    <ShowDelete>true</ShowDelete>
    <ShowEdit>true</ShowEdit>
  </Settings>
  <ShowSettings>true</ShowSettings>
  <Version>1.0</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (118, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'MediaElementPlayer', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="MediaElementPlayer">
  <AdminPage />
  <Author>&lt;a href="http://johndyer.me/"&gt;John Dyer&lt;/a&gt;</Author>
  <Description>HTML5 Video/Audio Player</Description>
  <Enabled>true</Enabled>
  <Priority>0</Priority>
  <Settings>
    <Delimiter>44</Delimiter>
    <Help>
&lt;p&gt;Build on &lt;a href="http://mediaelement.js.com/"&gt;MediaElement.js&lt;/a&gt;, the HTML5 video/audio player.&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Upload media files to your /media/ folder&lt;/li&gt;
	&lt;li&gt;Add short code to your media: [video src="myfile.mp4"] for video and [audio src="myfile.mp3"] for audio&lt;/li&gt;
	&lt;li&gt;Customize with the following parameters:
		&lt;ul&gt;
			&lt;li&gt;&lt;b&gt;width&lt;/b&gt;: The exact width of the video&lt;/li&gt;
			&lt;li&gt;&lt;b&gt;height&lt;/b&gt;: The exact height of the video&lt;/li&gt;
			&lt;li&gt;&lt;b&gt;autoplay&lt;/b&gt;: Plays the video as soon as the webpage loads&lt;/li&gt;
		&lt;/ul&gt;
	&lt;/li&gt;
	&lt;li&gt;You can also specify multiple file formats and codecs 
		&lt;ul&gt;
			&lt;li&gt;&lt;b&gt;mp4&lt;/b&gt;: H.264 encoded MP4 file&lt;/li&gt;
			&lt;li&gt;&lt;b&gt;webm&lt;/b&gt;: VP8/WebM encoded file&lt;/li&gt;
			&lt;li&gt;&lt;b&gt;ogg&lt;/b&gt;: Theora/Vorbis encoded file&lt;/li&gt;
		&lt;/ul&gt;
	&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;A complete example:&lt;br /&gt;
[code mp4="myfile.mp4" webm="myfile.webm" ogg="myfile.ogg" width="480" height="360"]
&lt;/p&gt;

&lt;p&gt;Supported formats&lt;/p&gt;
&lt;ul&gt;
	&lt;li&gt;&lt;b&gt;MP4/MP3&lt;/b&gt;: Native HTML5 for IE9, Safari, Chrome; Flash in IE8, Firefox, Opera&lt;/li&gt;
	&lt;li&gt;&lt;b&gt;WebM&lt;/b&gt;: HTML5 for IE9, Chrome, Firefox, Opera; Flash in IE8 (coming in Flash 11)&lt;/li&gt;
	&lt;li&gt;&lt;b&gt;FLV&lt;/b&gt;: Flash fallback&lt;/li&gt;
	&lt;li&gt;&lt;b&gt;WMV/WMA&lt;/b&gt;: Silverlight fallback&lt;/li&gt;
&lt;/ul&gt;
</Help>
    <Hidden>false</Hidden>
    <Index>0</Index>
    <IsScalar>true</IsScalar>
    <KeyField>width</KeyField>
    <Name>MediaElementPlayer</Name>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Default Width</Label>
      <MaxLength>100</MaxLength>
      <Name>width</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>480</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Default Height</Label>
      <MaxLength>100</MaxLength>
      <Name>height</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>360</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Folder for Media (MP4, MP3, WMV, Ogg, WebM, etc.)</Label>
      <MaxLength>100</MaxLength>
      <Name>folder</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>media</Values>
    </Parameters>
    <ShowAdd>true</ShowAdd>
    <ShowDelete>true</ShowDelete>
    <ShowEdit>true</ShowEdit>
  </Settings>
  <ShowSettings>true</ShowSettings>
  <Version>1.5</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (119, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'ResolveLinks', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="ResolveLinks">
  <AdminPage />
  <Author>BlogEngine.NET</Author>
  <Description>Auto resolves URLs in the comments and turn them into valid hyperlinks.</Description>
  <Enabled>true</Enabled>
  <Priority>0</Priority>
  <ShowSettings>true</ShowSettings>
  <Version>1.5</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (120, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'SendPings', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="SendPings">
  <AdminPage />
  <Author>BlogEngine.NET</Author>
  <Description>Pings all the ping services specified on the PingServices admin page and send track- and pingbacks</Description>
  <Enabled>true</Enabled>
  <Priority>0</Priority>
  <ShowSettings>true</ShowSettings>
  <Version>1.3</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (121, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'BreakPost', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="BreakPost">
  <AdminPage />
  <Author>BlogEngine.NET</Author>
  <Description>Breaks a post where [more] is found in the body and adds a link to full post</Description>
  <Enabled>true</Enabled>
  <Priority>0</Priority>
  <ShowSettings>true</ShowSettings>
  <Version>1.4</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (122, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'AkismetFilter', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="AkismetFilter">
  <AdminPage />
  <Author>&lt;a href="http://dotnetblogengine.net"&gt;BlogEngine.NET&lt;/a&gt;</Author>
  <Description>Akismet anti-spam comment filter</Description>
  <Enabled>false</Enabled>
  <Priority>0</Priority>
  <Settings>
    <Delimiter>44</Delimiter>
    <Help />
    <Hidden>false</Hidden>
    <Index>0</Index>
    <IsScalar>true</IsScalar>
    <KeyField>SiteURL</KeyField>
    <Name>AkismetFilter</Name>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Site URL</Label>
      <MaxLength>100</MaxLength>
      <Name>SiteURL</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>http://example.com/blog</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>API Key</Label>
      <MaxLength>100</MaxLength>
      <Name>ApiKey</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
      <Values>123456789</Values>
    </Parameters>
    <ShowAdd>true</ShowAdd>
    <ShowDelete>true</ShowDelete>
    <ShowEdit>true</ShowEdit>
  </Settings>
  <ShowSettings>true</ShowSettings>
  <Version>1.0</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (123, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'SendCommentMail', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="SendCommentMail">
  <AdminPage />
  <Author>BlogEngine.NET</Author>
  <Description>Sends an e-mail to the blog owner whenever a comment is added</Description>
  <Enabled>true</Enabled>
  <Priority>0</Priority>
  <ShowSettings>true</ShowSettings>
  <Version>1.3</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (124, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'Smilies', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="Smilies">
  <AdminPage />
  <Author>BlogEngine.NET</Author>
  <Description>Converts ASCII smilies into real smilies in the comments</Description>
  <Enabled>true</Enabled>
  <Priority>0</Priority>
  <ShowSettings>true</ShowSettings>
  <Version>1.3</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (125, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'CodeFormatterExtension', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="CodeFormatterExtension">
  <AdminPage />
  <Author>www.manoli.net</Author>
  <Description>Converts text to formatted syntax highlighted code (beta).</Description>
  <Enabled>true</Enabled>
  <Priority>0</Priority>
  <ShowSettings>true</ShowSettings>
  <Version>0.1</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (126, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'SimpleCaptcha', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="SimpleCaptcha">
  <AdminPage />
  <Author>&lt;a href="http://www.aaronstannard.com"&gt;Aaron Stannard&lt;/a&gt;</Author>
  <Description>Settings for the SimpleCaptcha control</Description>
  <Enabled>false</Enabled>
  <Priority>0</Priority>
  <Settings>
    <Delimiter>44</Delimiter>
    <Help>To get started with SimpleCaptcha, just provide some captcha instructions for your users in the &lt;b&gt;CaptchaLabel&lt;/b&gt;
                                field and the value you require from your users in order to post a comment in the &lt;b&gt;CaptchaAnswer&lt;/b&gt; field.</Help>
    <Hidden>false</Hidden>
    <Index>0</Index>
    <IsScalar>true</IsScalar>
    <KeyField>CaptchaLabel</KeyField>
    <Name>SimpleCaptcha</Name>
    <Parameters>
      <KeyField>true</KeyField>
      <Label>Your captcha''s label</Label>
      <MaxLength>30</MaxLength>
      <Name>CaptchaLabel</Name>
      <ParamType>String</ParamType>
      <Required>true</Required>
      <SelectedValue />
      <Values>5+5 = </Values>
    </Parameters>
    <Parameters>
      <KeyField>true</KeyField>
      <Label>Your captcha''s expected value</Label>
      <MaxLength>30</MaxLength>
      <Name>CaptchaAnswer</Name>
      <ParamType>String</ParamType>
      <Required>true</Required>
      <SelectedValue />
      <Values>10</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Show Captcha For Authenticated Users</Label>
      <MaxLength>1</MaxLength>
      <Name>ShowForAuthenticatedUsers</Name>
      <ParamType>Boolean</ParamType>
      <Required>true</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <ShowAdd>true</ShowAdd>
    <ShowDelete>true</ShowDelete>
    <ShowEdit>true</ShowEdit>
  </Settings>
  <ShowSettings>true</ShowSettings>
  <Version>1.0</Version>
</ManagedExtension>')
GO
INSERT [dbo].[be_DataStoreSettings] ([DataStoreSettingRowId], [BlogId], [ExtensionType], [ExtensionId], [Settings]) VALUES (127, N'27604f05-86ad-47ef-9e05-950bb762570c', N'0', N'Recaptcha', N'<?xml version="1.0" encoding="utf-16"?>
<ManagedExtension xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Name="Recaptcha">
  <AdminPage />
  <Author>&lt;a href="http://www.bloodforge.com"&gt;Bloodforge.com&lt;/a&gt;</Author>
  <Description>Settings for the Recaptcha control</Description>
  <Enabled>false</Enabled>
  <Priority>0</Priority>
  <Settings>
    <Delimiter>44</Delimiter>
    <Help>
&lt;script type=''text/javascript''&gt;
function showRecaptchaLog() {
        window.scrollTo(0, 0);
        var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
        var height = document.documentElement.clientHeight + document.documentElement.scrollTop;

        var layer = document.createElement(''div'');
        layer.style.zIndex = 1002;
        layer.id = ''RecaptchaLogLayer'';
        layer.style.position = ''absolute'';
        layer.style.top = ''0px'';
        layer.style.left = ''0px'';
        layer.style.height = document.documentElement.scrollHeight + ''px'';
        layer.style.width = width + ''px'';
        layer.style.backgroundColor = ''black'';
        layer.style.opacity = ''.6'';
        layer.style.filter += (''progid:DXImageTransform.Microsoft.Alpha(opacity=60)'');
        document.body.style.position = ''static'';
        document.body.appendChild(layer);

        var size = { ''height'': 500, ''width'': 750 };
        var iframe = document.createElement(''iframe'');
        iframe.name = ''Recaptcha Log Viewer'';
        iframe.id = ''RecaptchaLogDetails'';
        iframe.src = ''../Pages/RecaptchaLogViewer.aspx'';
        iframe.style.height = size.height + ''px'';
        iframe.style.width = size.width + ''px'';
        iframe.style.position = ''fixed'';
        iframe.style.zIndex = 1003;
        iframe.style.backgroundColor = ''white'';
        iframe.style.border = ''4px solid silver'';
        iframe.frameborder = ''0'';

        iframe.style.top = ((height + document.documentElement.scrollTop) / 2) - (size.height / 2) + ''px'';
        iframe.style.left = (width / 2) - (size.width / 2) + ''px'';

        document.body.appendChild(iframe);
        return false;
    }
&lt;/script&gt;
You can create your own public key at &lt;a href=''http://www.Recaptcha.net''&gt;http://www.Recaptcha.net&lt;/a&gt;. This is used for communication between your website and the recapcha server.&lt;br /&gt;&lt;br /&gt;Please rememeber you need to &lt;span style="color:red"&gt;enable extension&lt;/span&gt; for reCaptcha to show up on the comments form.&lt;br /&gt;&lt;br /&gt;You can see some statistics on Captcha solving by storing successful attempts. If you''re getting spam, this should also confirm that the spammers are at least solving the captcha.&lt;br /&gt;&lt;br /&gt;&lt;a href=''../Pages/RecaptchaLogViewer.aspx'' target=''_blank'' onclick=''return showRecaptchaLog()''&gt;Click here to view the log&lt;/a&gt;</Help>
    <Hidden>false</Hidden>
    <Index>0</Index>
    <IsScalar>true</IsScalar>
    <KeyField>PublicKey</KeyField>
    <Name>Recaptcha</Name>
    <Parameters>
      <KeyField>true</KeyField>
      <Label>Public Key</Label>
      <MaxLength>50</MaxLength>
      <Name>PublicKey</Name>
      <ParamType>String</ParamType>
      <Required>true</Required>
      <SelectedValue />
      <Values>YOURPUBLICKEY</Values>
    </Parameters>
    <Parameters>
      <KeyField>true</KeyField>
      <Label>Private Key</Label>
      <MaxLength>50</MaxLength>
      <Name>PrivateKey</Name>
      <ParamType>String</ParamType>
      <Required>true</Required>
      <SelectedValue />
      <Values>YOURPRIVATEKEY</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Show Captcha For Authenticated Users</Label>
      <MaxLength>1</MaxLength>
      <Name>ShowForAuthenticatedUsers</Name>
      <ParamType>Boolean</ParamType>
      <Required>true</Required>
      <SelectedValue />
      <Values>False</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Logging: Maximum successful recaptcha attempts to store (set to 0 to disable logging)</Label>
      <MaxLength>4</MaxLength>
      <Name>MaxLogEntries</Name>
      <ParamType>Integer</ParamType>
      <Required>true</Required>
      <SelectedValue />
      <Values>50</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Theme</Label>
      <MaxLength>20</MaxLength>
      <Name>Theme</Name>
      <ParamType>DropDown</ParamType>
      <Required>true</Required>
      <SelectedValue>white</SelectedValue>
      <Values>red</Values>
      <Values>white</Values>
      <Values>blackglass</Values>
      <Values>clean</Values>
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Language</Label>
      <MaxLength>5</MaxLength>
      <Name>Language</Name>
      <ParamType>DropDown</ParamType>
      <Required>true</Required>
      <SelectedValue>en</SelectedValue>
      <Values>en|English</Values>
      <Values>nl|Dutch</Values>
      <Values>fr|French</Values>
      <Values>de|German</Values>
      <Values>pt|Portuguese</Values>
      <Values>ru|Russian</Values>
      <Values>es|Spanish</Values>
      <Values>tr|Turkish</Values>
    </Parameters>
    <ShowAdd>true</ShowAdd>
    <ShowDelete>true</ShowDelete>
    <ShowEdit>true</ShowEdit>
  </Settings>
  <Settings>
    <Delimiter>44</Delimiter>
    <Help />
    <Hidden>true</Hidden>
    <Index>1</Index>
    <IsScalar>false</IsScalar>
    <KeyField>Response</KeyField>
    <Name>RecaptchaLog</Name>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Response</Label>
      <MaxLength>100</MaxLength>
      <Name>Response</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Challenge</Label>
      <MaxLength>100</MaxLength>
      <Name>Challenge</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>CommentID</Label>
      <MaxLength>100</MaxLength>
      <Name>CommentID</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>TimeToComment</Label>
      <MaxLength>100</MaxLength>
      <Name>TimeToComment</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>TimeToSolveCapcha</Label>
      <MaxLength>100</MaxLength>
      <Name>TimeToSolveCapcha</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>NumberOfAttempts</Label>
      <MaxLength>100</MaxLength>
      <Name>NumberOfAttempts</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Enabled</Label>
      <MaxLength>100</MaxLength>
      <Name>Enabled</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
    </Parameters>
    <Parameters>
      <KeyField>false</KeyField>
      <Label>Necessary</Label>
      <MaxLength>100</MaxLength>
      <Name>Necessary</Name>
      <ParamType>String</ParamType>
      <Required>false</Required>
      <SelectedValue />
    </Parameters>
    <ShowAdd>true</ShowAdd>
    <ShowDelete>true</ShowDelete>
    <ShowEdit>true</ShowEdit>
  </Settings>
  <ShowSettings>true</ShowSettings>
  <Version>1.1</Version>
</ManagedExtension>')
GO
SET IDENTITY_INSERT [dbo].[be_DataStoreSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[be_PingService] ON 
GO
INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://rpc.technorati.com/rpc/ping')
GO
INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (2, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://rpc.pingomatic.com/rpc2')
GO
INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (3, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://ping.feedburner.com')
GO
INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (4, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://www.bloglines.com/ping')
GO
INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (5, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://services.newsgator.com/ngws/xmlrpcping.aspx')
GO
INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (6, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://api.my.yahoo.com/rpc2 ')
GO
INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (7, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://blogsearch.google.com/ping/RPC2')
GO
INSERT [dbo].[be_PingService] ([PingServiceID], [BlogID], [Link]) VALUES (8, N'27604f05-86ad-47ef-9e05-950bb762570c', N'http://rpc.pingthesemanticweb.com/')
GO
SET IDENTITY_INSERT [dbo].[be_PingService] OFF
GO
SET IDENTITY_INSERT [dbo].[be_PostCategory] ON 

GO
INSERT [dbo].[be_PostCategory] ([PostCategoryID], [BlogID], [PostID], [CategoryID]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'f50d9b47-ed25-4925-a03a-3dab5fd45b28', N'f5962d4c-6c54-4a99-860c-f7e8c1f255d9')
GO
SET IDENTITY_INSERT [dbo].[be_PostCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[be_Posts] ON 

GO
INSERT [dbo].[be_Posts] ([PostRowID], [BlogID], [PostID], [Title], [Description], [PostContent], [DateCreated], [DateModified], [Author], [IsPublished], [IsCommentEnabled], [Raters], [Rating], [Slug], [IsDeleted]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'f50d9b47-ed25-4925-a03a-3dab5fd45b28', N'Welcome to BlogEngine.NET using Microsoft SQL Server', N'The description is used as the meta description as well as shown in the related posts. It is recommended that you write a description, but not mandatory', 
N'<p>If you see this post it means that BlogEngine.NET is running and the hard part of creating your own blog is done. There is only a few things left to do.</p>
<h2>Write Permissions</h2>
<p>To be able to log in, write posts and customize blog, you need to enable write permissions on the App_Data and Custom folders. If your blog is hosted at a hosting provider, you can either log into your account’s admin page or call the support.<br></p>
<p>If you wish to use a database to store your blog data, we still encourage you to enable this write access for an images you may wish to store for your blog posts.&nbsp; If you are interested in using Microsoft SQL Server, MySQL, SQL CE, or other databases, please see the <a href="http://dnbe.net/docs">BlogEngine docs</a> to get started.</p>
<h2>Security</h2>
<p>When you`ve got write permissions set, you need to change the username and password. Find the sign-in link located either at the bottom or top of the page depending on your current theme and click it. Now enter "admin" in both the username and password fields and click the button. You will now see an admin menu appear. It has a link to the "Users" admin page. From there you can change password, create new users and set roles and permissions. Passwords are hashed by default so you better configure email in settings for password recovery to work or <a target="_blank" href="http://dnbe.net/docs/post/frequently-asked-questions#HowdoIresetlostadminpassword">learn how to do it manually</a>.<br></p>
<h2>Configuration and Profile</h2>
<p>Now that you have your blog secured, take a look through the settings and give your new blog a title.&nbsp; BlogEngine.NET is set up to take full advantage of many semantic formats and technologies such as FOAF, SIOC and APML. It means that the content stored in your BlogEngine.NET installation will be fully portable and auto-discoverable.&nbsp; Be sure to fill in your author profile to take better advantage of this.</p>
<h2>Themes, Widgets &amp; Extensions</h2>
<p>One last thing to consider is customizing the look and behavior of your blog. We have themes, widgets and extensions available right out of the box. You can install more right from admin panel under Custom/Gallery.</p>
<h2>On the web</h2>
<p>You can find news about BlogEngine.NET on the <a href="http://www.dotnetblogengine.net">official website</a>. For tutorials, documentation, tips and tricks visit our <a target="_blank" href="http://dnbe.net/docs">docs site</a>. The ongoing development of BlogEngine.NET can be followed at <a href="http://blogengine.codeplex.com/">CodePlex</a> where the daily builds will be published for anyone to download.<br></p>
<p>Good luck and happy writing.</p>
<p>The BlogEngine.NET team</p>', GETDATE(), NULL, N'admin', 1, NULL, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[be_Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[be_PostTag] ON 

GO
INSERT [dbo].[be_PostTag] ([PostTagID], [BlogID], [PostID], [Tag]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'f50d9b47-ed25-4925-a03a-3dab5fd45b28', N'blog')
GO
INSERT [dbo].[be_PostTag] ([PostTagID], [BlogID], [PostID], [Tag]) VALUES (2, N'27604f05-86ad-47ef-9e05-950bb762570c', N'f50d9b47-ed25-4925-a03a-3dab5fd45b28', N'welcome')
GO
SET IDENTITY_INSERT [dbo].[be_PostTag] OFF
GO
SET IDENTITY_INSERT [dbo].[be_RightRoles] ON 

GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26066, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewDetailedErrorMessages', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26067, N'27604f05-86ad-47ef-9e05-950bb762570c', N'AccessAdminPages', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26068, N'27604f05-86ad-47ef-9e05-950bb762570c', N'AccessAdminPages', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26069, N'27604f05-86ad-47ef-9e05-950bb762570c', N'AccessAdminSettingsPages', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26070, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ManageWidgets', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26071, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewPublicComments', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26072, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewPublicComments', N'Anonymous')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26073, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewPublicComments', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26074, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewUnmoderatedComments', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26075, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewUnmoderatedComments', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26076, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateComments', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26077, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateComments', N'Anonymous')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26078, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateComments', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26079, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ModerateComments', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26080, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ModerateComments', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26081, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewPublicPosts', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26082, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewPublicPosts', N'Anonymous')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26083, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewPublicPosts', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26084, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewUnpublishedPosts', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26085, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewUnpublishedPosts', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26086, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateNewPosts', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26087, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateNewPosts', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26088, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOwnPosts', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26089, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOwnPosts', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26090, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOtherUsersPosts', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26091, N'27604f05-86ad-47ef-9e05-950bb762570c', N'DeleteOwnPosts', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26092, N'27604f05-86ad-47ef-9e05-950bb762570c', N'DeleteOwnPosts', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26093, N'27604f05-86ad-47ef-9e05-950bb762570c', N'DeleteOtherUsersPosts', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26094, N'27604f05-86ad-47ef-9e05-950bb762570c', N'PublishOwnPosts', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26095, N'27604f05-86ad-47ef-9e05-950bb762570c', N'PublishOwnPosts', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26096, N'27604f05-86ad-47ef-9e05-950bb762570c', N'PublishOtherUsersPosts', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26097, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewPublicPages', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26098, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewPublicPages', N'Anonymous')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26099, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewPublicPages', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26100, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewUnpublishedPages', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26101, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewUnpublishedPages', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26102, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateNewPages', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26103, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateNewPages', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26104, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOwnPages', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26105, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOwnPages', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26113, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewRatingsOnPosts', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26114, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewRatingsOnPosts', N'Anonymous')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26115, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewRatingsOnPosts', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26116, N'27604f05-86ad-47ef-9e05-950bb762570c', N'SubmitRatingsOnPosts', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26117, N'27604f05-86ad-47ef-9e05-950bb762570c', N'SubmitRatingsOnPosts', N'Anonymous')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26118, N'27604f05-86ad-47ef-9e05-950bb762570c', N'SubmitRatingsOnPosts', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26119, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewRoles', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26120, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateNewRoles', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26121, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditRoles', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26122, N'27604f05-86ad-47ef-9e05-950bb762570c', N'DeleteRoles', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26123, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOwnRoles', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26124, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOtherUsersRoles', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26125, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateNewUsers', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26126, N'27604f05-86ad-47ef-9e05-950bb762570c', N'DeleteUserSelf', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26127, N'27604f05-86ad-47ef-9e05-950bb762570c', N'DeleteUsersOtherThanSelf', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26128, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOwnUser', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26129, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOwnUser', N'Editors')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26130, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOtherUsers', N'Administrators')
GO
SET IDENTITY_INSERT [dbo].[be_RightRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[be_Rights] ON 

GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16041, N'27604f05-86ad-47ef-9e05-950bb762570c', N'None')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16042, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewDetailedErrorMessages')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16043, N'27604f05-86ad-47ef-9e05-950bb762570c', N'AccessAdminPages')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16044, N'27604f05-86ad-47ef-9e05-950bb762570c', N'AccessAdminSettingsPages')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16045, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ManageWidgets')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16046, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewPublicComments')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16047, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewUnmoderatedComments')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16048, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateComments')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16049, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ModerateComments')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16050, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewPublicPosts')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16051, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewUnpublishedPosts')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16052, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateNewPosts')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16053, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOwnPosts')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16054, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOtherUsersPosts')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16055, N'27604f05-86ad-47ef-9e05-950bb762570c', N'DeleteOwnPosts')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16056, N'27604f05-86ad-47ef-9e05-950bb762570c', N'DeleteOtherUsersPosts')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16057, N'27604f05-86ad-47ef-9e05-950bb762570c', N'PublishOwnPosts')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16058, N'27604f05-86ad-47ef-9e05-950bb762570c', N'PublishOtherUsersPosts')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16059, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewPublicPages')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16060, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewUnpublishedPages')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16061, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateNewPages')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16062, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOwnPages')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16068, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewRatingsOnPosts')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16069, N'27604f05-86ad-47ef-9e05-950bb762570c', N'SubmitRatingsOnPosts')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16070, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewRoles')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16071, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateNewRoles')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16072, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditRoles')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16073, N'27604f05-86ad-47ef-9e05-950bb762570c', N'DeleteRoles')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16074, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOwnRoles')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16075, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOtherUsersRoles')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16076, N'27604f05-86ad-47ef-9e05-950bb762570c', N'CreateNewUsers')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16077, N'27604f05-86ad-47ef-9e05-950bb762570c', N'DeleteUserSelf')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16078, N'27604f05-86ad-47ef-9e05-950bb762570c', N'DeleteUsersOtherThanSelf')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16079, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOwnUser')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16080, N'27604f05-86ad-47ef-9e05-950bb762570c', N'EditOtherUsers')
GO
SET IDENTITY_INSERT [dbo].[be_Rights] OFF
GO
SET IDENTITY_INSERT [dbo].[be_Roles] ON 

GO
INSERT [dbo].[be_Roles] ([RoleID], [BlogID], [Role]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'Administrators')
GO
INSERT [dbo].[be_Roles] ([RoleID], [BlogID], [Role]) VALUES (6, N'27604f05-86ad-47ef-9e05-950bb762570c', N'Anonymous')
GO
INSERT [dbo].[be_Roles] ([RoleID], [BlogID], [Role]) VALUES (2, N'27604f05-86ad-47ef-9e05-950bb762570c', N'Editors')
GO
SET IDENTITY_INSERT [dbo].[be_Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[be_Settings] ON 

GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'administratorrole', N'Administrators')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (2, N'27604f05-86ad-47ef-9e05-950bb762570c', N'alternatefeedurl', N'')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (3, N'27604f05-86ad-47ef-9e05-950bb762570c', N'authorname', N'My name')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (4, N'27604f05-86ad-47ef-9e05-950bb762570c', N'avatar', N'combine')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (5, N'27604f05-86ad-47ef-9e05-950bb762570c', N'blogrollmaxlength', N'23')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (6, N'27604f05-86ad-47ef-9e05-950bb762570c', N'blogrollupdateminutes', N'60')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (7, N'27604f05-86ad-47ef-9e05-950bb762570c', N'blogrollvisibleposts', N'3')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (8, N'27604f05-86ad-47ef-9e05-950bb762570c', N'contactformmessage', N'<p>I will answer the mail as soon as I can.</p>')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (9, N'27604f05-86ad-47ef-9e05-950bb762570c', N'contactthankmessage', N'<h1>Thank you</h1><p>The message was sent.</p>')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (10, N'27604f05-86ad-47ef-9e05-950bb762570c', N'culture', N'Auto')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (11, N'27604f05-86ad-47ef-9e05-950bb762570c', N'dayscommentsareenabled', N'0')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (12, N'27604f05-86ad-47ef-9e05-950bb762570c', N'description', N'Short description of the blog')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (13, N'27604f05-86ad-47ef-9e05-950bb762570c', N'displaycommentsonrecentposts', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (14, N'27604f05-86ad-47ef-9e05-950bb762570c', N'displayratingsonrecentposts', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (15, N'27604f05-86ad-47ef-9e05-950bb762570c', N'email', N'user@example.com')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (16, N'27604f05-86ad-47ef-9e05-950bb762570c', N'emailsubjectprefix', N'Weblog')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (17, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablecommentsearch', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (18, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablecommentsmoderation', N'False')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (19, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablecontactattachments', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (20, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablecountryincomments', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (21, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablehttpcompression', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (22, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enableopensearch', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (23, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablepingbackreceive', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (24, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablepingbacksend', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (25, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablerating', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (26, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablereferrertracking', N'False')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (27, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablerelatedposts', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (28, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablessl', N'False')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (29, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enabletrackbackreceive', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (30, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enabletrackbacksend', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (31, N'27604f05-86ad-47ef-9e05-950bb762570c', N'endorsement', N'http://www.dotnetblogengine.net/syndication.axd')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (32, N'27604f05-86ad-47ef-9e05-950bb762570c', N'fileextension', N'.aspx')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (33, N'27604f05-86ad-47ef-9e05-950bb762570c', N'geocodinglatitude', N'0')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (34, N'27604f05-86ad-47ef-9e05-950bb762570c', N'geocodinglongitude', N'0')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (35, N'27604f05-86ad-47ef-9e05-950bb762570c', N'handlewwwsubdomain', N'')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (36, N'27604f05-86ad-47ef-9e05-950bb762570c', N'iscocommentenabled', N'False')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (37, N'27604f05-86ad-47ef-9e05-950bb762570c', N'iscommentsenabled', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (38, N'27604f05-86ad-47ef-9e05-950bb762570c', N'language', N'en-GB')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (39, N'27604f05-86ad-47ef-9e05-950bb762570c', N'mobiletheme', N'Standard')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (40, N'27604f05-86ad-47ef-9e05-950bb762570c', N'name', N'Name of the blog')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (41, N'27604f05-86ad-47ef-9e05-950bb762570c', N'numberofrecentcomments', N'10')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (42, N'27604f05-86ad-47ef-9e05-950bb762570c', N'numberofrecentposts', N'10')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (43, N'27604f05-86ad-47ef-9e05-950bb762570c', N'postsperfeed', N'10')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (44, N'27604f05-86ad-47ef-9e05-950bb762570c', N'postsperpage', N'10')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (45, N'27604f05-86ad-47ef-9e05-950bb762570c', N'removewhitespaceinstylesheets', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (46, N'27604f05-86ad-47ef-9e05-950bb762570c', N'searchbuttontext', N'Search')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (47, N'27604f05-86ad-47ef-9e05-950bb762570c', N'searchcommentlabeltext', N'Include comments in search')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (48, N'27604f05-86ad-47ef-9e05-950bb762570c', N'searchdefaulttext', N'Enter search term')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (49, N'27604f05-86ad-47ef-9e05-950bb762570c', N'sendmailoncomment', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (50, N'27604f05-86ad-47ef-9e05-950bb762570c', N'showdescriptioninpostlist', N'False')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (51, N'27604f05-86ad-47ef-9e05-950bb762570c', N'showlivepreview', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (52, N'27604f05-86ad-47ef-9e05-950bb762570c', N'showpostnavigation', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (53, N'27604f05-86ad-47ef-9e05-950bb762570c', N'smtppassword', N'password')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (54, N'27604f05-86ad-47ef-9e05-950bb762570c', N'smtpserver', N'mail.example.dk')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (55, N'27604f05-86ad-47ef-9e05-950bb762570c', N'smtpserverport', N'25')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (56, N'27604f05-86ad-47ef-9e05-950bb762570c', N'smtpusername', N'user@example.com')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (57, N'27604f05-86ad-47ef-9e05-950bb762570c', N'storagelocation', N'~/App_Data/')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (58, N'27604f05-86ad-47ef-9e05-950bb762570c', N'syndicationformat', N'Rss')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (59, N'27604f05-86ad-47ef-9e05-950bb762570c', N'theme', N'Standard')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (60, N'27604f05-86ad-47ef-9e05-950bb762570c', N'timestamppostlinks', N'True')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (61, N'27604f05-86ad-47ef-9e05-950bb762570c', N'timezone', N'0')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (62, N'27604f05-86ad-47ef-9e05-950bb762570c', N'trackingscript', N'')
GO
INSERT [dbo].[be_Settings] ([SettingRowId], [BlogId], [SettingName], [SettingValue]) VALUES (63, N'27604f05-86ad-47ef-9e05-950bb762570c', N'enablequicknotes', N'True')
GO
SET IDENTITY_INSERT [dbo].[be_Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[be_StopWords] ON 

GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'a')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (2, N'27604f05-86ad-47ef-9e05-950bb762570c', N'about')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (3, N'27604f05-86ad-47ef-9e05-950bb762570c', N'actually')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (4, N'27604f05-86ad-47ef-9e05-950bb762570c', N'add')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (5, N'27604f05-86ad-47ef-9e05-950bb762570c', N'after')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (6, N'27604f05-86ad-47ef-9e05-950bb762570c', N'all')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (7, N'27604f05-86ad-47ef-9e05-950bb762570c', N'almost')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (8, N'27604f05-86ad-47ef-9e05-950bb762570c', N'along')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (9, N'27604f05-86ad-47ef-9e05-950bb762570c', N'also')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (10, N'27604f05-86ad-47ef-9e05-950bb762570c', N'an')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (11, N'27604f05-86ad-47ef-9e05-950bb762570c', N'and')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (12, N'27604f05-86ad-47ef-9e05-950bb762570c', N'any')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (13, N'27604f05-86ad-47ef-9e05-950bb762570c', N'are')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (14, N'27604f05-86ad-47ef-9e05-950bb762570c', N'as')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (15, N'27604f05-86ad-47ef-9e05-950bb762570c', N'at')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (16, N'27604f05-86ad-47ef-9e05-950bb762570c', N'be')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (17, N'27604f05-86ad-47ef-9e05-950bb762570c', N'both')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (18, N'27604f05-86ad-47ef-9e05-950bb762570c', N'but')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (19, N'27604f05-86ad-47ef-9e05-950bb762570c', N'by')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (20, N'27604f05-86ad-47ef-9e05-950bb762570c', N'can')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (21, N'27604f05-86ad-47ef-9e05-950bb762570c', N'cannot')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (22, N'27604f05-86ad-47ef-9e05-950bb762570c', N'com')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (23, N'27604f05-86ad-47ef-9e05-950bb762570c', N'could')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (24, N'27604f05-86ad-47ef-9e05-950bb762570c', N'de')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (25, N'27604f05-86ad-47ef-9e05-950bb762570c', N'do')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (26, N'27604f05-86ad-47ef-9e05-950bb762570c', N'down')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (27, N'27604f05-86ad-47ef-9e05-950bb762570c', N'each')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (28, N'27604f05-86ad-47ef-9e05-950bb762570c', N'either')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (29, N'27604f05-86ad-47ef-9e05-950bb762570c', N'en')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (30, N'27604f05-86ad-47ef-9e05-950bb762570c', N'for')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (31, N'27604f05-86ad-47ef-9e05-950bb762570c', N'from')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (32, N'27604f05-86ad-47ef-9e05-950bb762570c', N'good')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (33, N'27604f05-86ad-47ef-9e05-950bb762570c', N'has')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (34, N'27604f05-86ad-47ef-9e05-950bb762570c', N'have')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (35, N'27604f05-86ad-47ef-9e05-950bb762570c', N'he')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (36, N'27604f05-86ad-47ef-9e05-950bb762570c', N'her')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (37, N'27604f05-86ad-47ef-9e05-950bb762570c', N'here')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (38, N'27604f05-86ad-47ef-9e05-950bb762570c', N'hers')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (39, N'27604f05-86ad-47ef-9e05-950bb762570c', N'his')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (40, N'27604f05-86ad-47ef-9e05-950bb762570c', N'how')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (41, N'27604f05-86ad-47ef-9e05-950bb762570c', N'i')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (42, N'27604f05-86ad-47ef-9e05-950bb762570c', N'if')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (43, N'27604f05-86ad-47ef-9e05-950bb762570c', N'in')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (44, N'27604f05-86ad-47ef-9e05-950bb762570c', N'into')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (45, N'27604f05-86ad-47ef-9e05-950bb762570c', N'is')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (46, N'27604f05-86ad-47ef-9e05-950bb762570c', N'it')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (47, N'27604f05-86ad-47ef-9e05-950bb762570c', N'its')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (48, N'27604f05-86ad-47ef-9e05-950bb762570c', N'just')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (49, N'27604f05-86ad-47ef-9e05-950bb762570c', N'la')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (50, N'27604f05-86ad-47ef-9e05-950bb762570c', N'like')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (51, N'27604f05-86ad-47ef-9e05-950bb762570c', N'long')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (52, N'27604f05-86ad-47ef-9e05-950bb762570c', N'make')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (53, N'27604f05-86ad-47ef-9e05-950bb762570c', N'me')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (54, N'27604f05-86ad-47ef-9e05-950bb762570c', N'more')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (55, N'27604f05-86ad-47ef-9e05-950bb762570c', N'much')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (56, N'27604f05-86ad-47ef-9e05-950bb762570c', N'my')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (57, N'27604f05-86ad-47ef-9e05-950bb762570c', N'need')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (58, N'27604f05-86ad-47ef-9e05-950bb762570c', N'new')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (59, N'27604f05-86ad-47ef-9e05-950bb762570c', N'now')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (60, N'27604f05-86ad-47ef-9e05-950bb762570c', N'of')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (61, N'27604f05-86ad-47ef-9e05-950bb762570c', N'off')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (62, N'27604f05-86ad-47ef-9e05-950bb762570c', N'on')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (63, N'27604f05-86ad-47ef-9e05-950bb762570c', N'once')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (64, N'27604f05-86ad-47ef-9e05-950bb762570c', N'one')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (65, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ones')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (66, N'27604f05-86ad-47ef-9e05-950bb762570c', N'only')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (67, N'27604f05-86ad-47ef-9e05-950bb762570c', N'or')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (68, N'27604f05-86ad-47ef-9e05-950bb762570c', N'our')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (69, N'27604f05-86ad-47ef-9e05-950bb762570c', N'out')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (70, N'27604f05-86ad-47ef-9e05-950bb762570c', N'over')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (71, N'27604f05-86ad-47ef-9e05-950bb762570c', N'own')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (72, N'27604f05-86ad-47ef-9e05-950bb762570c', N'really')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (73, N'27604f05-86ad-47ef-9e05-950bb762570c', N'right')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (74, N'27604f05-86ad-47ef-9e05-950bb762570c', N'same')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (75, N'27604f05-86ad-47ef-9e05-950bb762570c', N'see')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (76, N'27604f05-86ad-47ef-9e05-950bb762570c', N'she')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (77, N'27604f05-86ad-47ef-9e05-950bb762570c', N'so')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (78, N'27604f05-86ad-47ef-9e05-950bb762570c', N'some')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (79, N'27604f05-86ad-47ef-9e05-950bb762570c', N'such')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (80, N'27604f05-86ad-47ef-9e05-950bb762570c', N'take')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (81, N'27604f05-86ad-47ef-9e05-950bb762570c', N'takes')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (82, N'27604f05-86ad-47ef-9e05-950bb762570c', N'that')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (83, N'27604f05-86ad-47ef-9e05-950bb762570c', N'the')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (84, N'27604f05-86ad-47ef-9e05-950bb762570c', N'their')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (85, N'27604f05-86ad-47ef-9e05-950bb762570c', N'these')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (86, N'27604f05-86ad-47ef-9e05-950bb762570c', N'thing')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (87, N'27604f05-86ad-47ef-9e05-950bb762570c', N'this')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (88, N'27604f05-86ad-47ef-9e05-950bb762570c', N'to')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (89, N'27604f05-86ad-47ef-9e05-950bb762570c', N'too')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (90, N'27604f05-86ad-47ef-9e05-950bb762570c', N'took')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (91, N'27604f05-86ad-47ef-9e05-950bb762570c', N'und')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (92, N'27604f05-86ad-47ef-9e05-950bb762570c', N'up')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (93, N'27604f05-86ad-47ef-9e05-950bb762570c', N'use')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (94, N'27604f05-86ad-47ef-9e05-950bb762570c', N'used')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (95, N'27604f05-86ad-47ef-9e05-950bb762570c', N'using')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (96, N'27604f05-86ad-47ef-9e05-950bb762570c', N'very')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (97, N'27604f05-86ad-47ef-9e05-950bb762570c', N'was')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (98, N'27604f05-86ad-47ef-9e05-950bb762570c', N'we')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (99, N'27604f05-86ad-47ef-9e05-950bb762570c', N'well')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (100, N'27604f05-86ad-47ef-9e05-950bb762570c', N'what')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (101, N'27604f05-86ad-47ef-9e05-950bb762570c', N'when')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (102, N'27604f05-86ad-47ef-9e05-950bb762570c', N'where')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (103, N'27604f05-86ad-47ef-9e05-950bb762570c', N'who')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (104, N'27604f05-86ad-47ef-9e05-950bb762570c', N'will')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (105, N'27604f05-86ad-47ef-9e05-950bb762570c', N'with')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (106, N'27604f05-86ad-47ef-9e05-950bb762570c', N'www')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (107, N'27604f05-86ad-47ef-9e05-950bb762570c', N'you')
GO
INSERT [dbo].[be_StopWords] ([StopWordRowId], [BlogId], [StopWord]) VALUES (108, N'27604f05-86ad-47ef-9e05-950bb762570c', N'your')
GO
SET IDENTITY_INSERT [dbo].[be_StopWords] OFF
GO
SET IDENTITY_INSERT [dbo].[be_UserRoles] ON 

GO
INSERT [dbo].[be_UserRoles] ([UserRoleID], [BlogID], [UserName], [Role]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'Admin', N'Administrators')
GO
SET IDENTITY_INSERT [dbo].[be_UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[be_Users] ON 

GO
INSERT [dbo].[be_Users] ([UserID], [BlogID], [UserName], [Password], [LastLoginTime], [EmailAddress]) VALUES (1, N'27604f05-86ad-47ef-9e05-950bb762570c', N'Admin', N'', GETDATE(), N'email@example.com')
GO
SET IDENTITY_INSERT [dbo].[be_Users] OFF
GO
CREATE NONCLUSTERED INDEX [idx_be_BlogRollItems_BlogId] ON [dbo].[be_BlogRollItems]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_be_Categories_BlogID_CategoryID] ON [dbo].[be_Categories]
(
	[BlogID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [idx_be_DataStoreSettings_BlogId_ExtensionType_TypeID] ON [dbo].[be_DataStoreSettings]
(
	[BlogId] ASC,
	[ExtensionType] ASC,
	[ExtensionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE NONCLUSTERED INDEX [idx_Pages_BlogId_PageId] ON [dbo].[be_Pages]
(
	[BlogID] ASC,
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE NONCLUSTERED INDEX [idx_be_PingService_BlogId] ON [dbo].[be_PingService]
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE NONCLUSTERED INDEX [idx_be_PostCategory_BlogId_CategoryId] ON [dbo].[be_PostCategory]
(
	[BlogID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE NONCLUSTERED INDEX [idx_be_PostCategory_BlogId_PostId] ON [dbo].[be_PostCategory]
(
	[BlogID] ASC,
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE NONCLUSTERED INDEX [idx_be_PostComment_BlogId_PostId] ON [dbo].[be_PostComment]
(
	[BlogID] ASC,
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE NONCLUSTERED INDEX [FK_PostID] ON [dbo].[be_PostNotify]
(
	[BlogID] ASC,
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE UNIQUE NONCLUSTERED INDEX [be_Posts_BlogID_PostID] ON [dbo].[be_Posts]
(
	[BlogID] ASC,
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE NONCLUSTERED INDEX [idx_be_PostTag_BlogId_PostId] ON [dbo].[be_PostTag]
(
	[BlogID] ASC,
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [idx_be_Profiles_BlogId_UserName] ON [dbo].[be_Profiles]
(
	[BlogID] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [idx_be_NoteId_BlogId_UserName] ON [dbo].[be_QuickNotes]
(
	[NoteID] ASC,
	[BlogID] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE NONCLUSTERED INDEX [idx_be_Referrers_BlogId] ON [dbo].[be_Referrers]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE NONCLUSTERED INDEX [idx_be_RightRoles_BlogId] ON [dbo].[be_RightRoles]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE NONCLUSTERED INDEX [idx_be_Rights_BlogId] ON [dbo].[be_Rights]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
SET ANSI_PADDING ON

GO
CREATE UNIQUE NONCLUSTERED INDEX [idx_be_Roles_BlogID_Role] ON [dbo].[be_Roles]
(
	[BlogID] ASC,
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE NONCLUSTERED INDEX [idx_be_Settings_BlogId] ON [dbo].[be_Settings]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE NONCLUSTERED INDEX [idx_be_StopWords_BlogId] ON [dbo].[be_StopWords]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
CREATE NONCLUSTERED INDEX [idx_be_UserRoles_BlogId] ON [dbo].[be_UserRoles]
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
SET ANSI_PADDING ON

GO
CREATE NONCLUSTERED INDEX [idx_be_Users_BlogId_UserName] ON [dbo].[be_Users]
(
	[BlogID] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO
ALTER TABLE [dbo].[be_Blogs] ADD  CONSTRAINT [DF_be_Blogs_IsSiteAggregation]  DEFAULT ((0)) FOR [IsSiteAggregation]
GO
ALTER TABLE [dbo].[be_Pages] ADD  CONSTRAINT [DF__be_Pages__IsDele__0425A276]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[be_PostComment] ADD  CONSTRAINT [DF__be_PostCo__Paren__173876EA]  DEFAULT ('00000000-0000-0000-0000-000000000000') FOR [ParentCommentID]
GO
ALTER TABLE [dbo].[be_PostComment] ADD  CONSTRAINT [DF__be_PostCo__IsSpa__182C9B23]  DEFAULT ((0)) FOR [IsSpam]
GO
ALTER TABLE [dbo].[be_PostComment] ADD  CONSTRAINT [DF__be_PostCo__IsDel__1920BF5C]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[be_Posts] ADD  CONSTRAINT [DF__be_Posts__IsDele__09DE7BCC]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[be_Referrers] ADD  CONSTRAINT [DF_be_Referrers_Day]  DEFAULT (getdate()) FOR [ReferralDay]
GO
ALTER TABLE [dbo].[be_FileStoreFiles]  WITH CHECK ADD  CONSTRAINT [FK_be_FileStoreFiles_be_FileStoreDirectory] FOREIGN KEY([ParentDirectoryID])
REFERENCES [dbo].[be_FileStoreDirectory] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[be_FileStoreFiles] CHECK CONSTRAINT [FK_be_FileStoreFiles_be_FileStoreDirectory]
GO
ALTER TABLE [dbo].[be_FileStoreFileThumbs]  WITH CHECK ADD  CONSTRAINT [FK_be_FileStoreFileThumbs_be_FileStoreFiles] FOREIGN KEY([FileId])
REFERENCES [dbo].[be_FileStoreFiles] ([FileID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[be_FileStoreFileThumbs] CHECK CONSTRAINT [FK_be_FileStoreFileThumbs_be_FileStoreFiles]
GO
ALTER TABLE [dbo].[be_PostCategory]  WITH CHECK ADD  CONSTRAINT [FK_be_PostCategory_be_Categories] FOREIGN KEY([BlogID], [CategoryID])
REFERENCES [dbo].[be_Categories] ([BlogID], [CategoryID])
GO
ALTER TABLE [dbo].[be_PostCategory] CHECK CONSTRAINT [FK_be_PostCategory_be_Categories]
GO
ALTER TABLE [dbo].[be_PostCategory]  WITH CHECK ADD  CONSTRAINT [FK_be_PostCategory_be_Posts] FOREIGN KEY([BlogID], [PostID])
REFERENCES [dbo].[be_Posts] ([BlogID], [PostID])
GO
ALTER TABLE [dbo].[be_PostCategory] CHECK CONSTRAINT [FK_be_PostCategory_be_Posts]
GO
ALTER TABLE [dbo].[be_PostComment]  WITH CHECK ADD  CONSTRAINT [FK_be_PostComment_be_Posts] FOREIGN KEY([BlogID], [PostID])
REFERENCES [dbo].[be_Posts] ([BlogID], [PostID])
GO
ALTER TABLE [dbo].[be_PostComment] CHECK CONSTRAINT [FK_be_PostComment_be_Posts]
GO
ALTER TABLE [dbo].[be_PostNotify]  WITH CHECK ADD  CONSTRAINT [FK_be_PostNotify_be_Posts] FOREIGN KEY([BlogID], [PostID])
REFERENCES [dbo].[be_Posts] ([BlogID], [PostID])
GO
ALTER TABLE [dbo].[be_PostNotify] CHECK CONSTRAINT [FK_be_PostNotify_be_Posts]
GO
ALTER TABLE [dbo].[be_PostTag]  WITH CHECK ADD  CONSTRAINT [FK_be_PostTag_be_Posts] FOREIGN KEY([BlogID], [PostID])
REFERENCES [dbo].[be_Posts] ([BlogID], [PostID])
GO
ALTER TABLE [dbo].[be_PostTag] CHECK CONSTRAINT [FK_be_PostTag_be_Posts]
GO

--
-- be_Pages SortOrder
--
ALTER TABLE dbo.be_Pages ADD
	SortOrder int NOT NULL CONSTRAINT DF_be_Pages_SortOrder DEFAULT 0
GO
CREATE NONCLUSTERED INDEX IX_be_Pages ON dbo.be_Pages
	(
	SortOrder
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
--
-- add new rights to administrators
--
SET IDENTITY_INSERT [dbo].[be_RightRoles] ON 
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26131, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewDashboard', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26132, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ManageExtensions', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26133, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ManageThemes', N'Administrators')
GO
INSERT [dbo].[be_RightRoles] ([RightRoleRowId], [BlogId], [RightName], [Role]) VALUES (26134, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ManagePackages', N'Administrators')
GO
SET IDENTITY_INSERT [dbo].[be_RightRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[be_Rights] ON 
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16081, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ViewDashboard')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16082, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ManageExtensions')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16083, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ManageThemes')
GO
INSERT [dbo].[be_Rights] ([RightRowId], [BlogId], [RightName]) VALUES (16084, N'27604f05-86ad-47ef-9e05-950bb762570c', N'ManagePackages')
GO
SET IDENTITY_INSERT [dbo].[be_Rights] OFF
GO