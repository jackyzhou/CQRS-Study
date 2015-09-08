USE [master]
GO
/****** Object:  Database [Conference]    Script Date: 09/08/2015 10:54:10 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Conference')
BEGIN
CREATE DATABASE [Conference] ON  PRIMARY 
( NAME = N'Conference', FILENAME = N'E:\DB\Conference.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Conference_log', FILENAME = N'E:\DB\Conference_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [Conference] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Conference].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Conference] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Conference] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Conference] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Conference] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Conference] SET ARITHABORT OFF
GO
ALTER DATABASE [Conference] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Conference] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Conference] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Conference] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Conference] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Conference] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Conference] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Conference] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Conference] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Conference] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Conference] SET  DISABLE_BROKER
GO
ALTER DATABASE [Conference] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Conference] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Conference] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Conference] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Conference] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Conference] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Conference] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Conference] SET  READ_WRITE
GO
ALTER DATABASE [Conference] SET RECOVERY FULL
GO
ALTER DATABASE [Conference] SET  MULTI_USER
GO
ALTER DATABASE [Conference] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Conference] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Conference', N'ON'
GO
USE [Conference]
GO
/****** Object:  ForeignKey [DraftOrder_Lines]    Script Date: 09/08/2015 10:54:13 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[DraftOrder_Lines]') AND parent_object_id = OBJECT_ID(N'[ConferenceRegistration].[OrderItemsViewV3]'))
ALTER TABLE [ConferenceRegistration].[OrderItemsViewV3] DROP CONSTRAINT [DraftOrder_Lines]
GO
/****** Object:  ForeignKey [ThirdPartyProcessorPayment_Items]    Script Date: 09/08/2015 10:54:14 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferencePayments].[ThirdPartyProcessorPayment_Items]') AND parent_object_id = OBJECT_ID(N'[ConferencePayments].[ThidPartyProcessorPaymentItems]'))
ALTER TABLE [ConferencePayments].[ThidPartyProcessorPaymentItems] DROP CONSTRAINT [ThirdPartyProcessorPayment_Items]
GO
/****** Object:  ForeignKey [FK_ConferenceManagement.SeatTypes_ConferenceManagement.Conferences_ConferenceInfo_Id]    Script Date: 09/08/2015 10:54:15 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[FK_ConferenceManagement.SeatTypes_ConferenceManagement.Conferences_ConferenceInfo_Id]') AND parent_object_id = OBJECT_ID(N'[ConferenceManagement].[SeatTypes]'))
ALTER TABLE [ConferenceManagement].[SeatTypes] DROP CONSTRAINT [FK_ConferenceManagement.SeatTypes_ConferenceManagement.Conferences_ConferenceInfo_Id]
GO
/****** Object:  ForeignKey [PricedOrder_Lines]    Script Date: 09/08/2015 10:54:15 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrder_Lines]') AND parent_object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrderLinesV3]'))
ALTER TABLE [ConferenceRegistration].[PricedOrderLinesV3] DROP CONSTRAINT [PricedOrder_Lines]
GO
/****** Object:  ForeignKey [FK_ConferenceManagement.OrderSeats_ConferenceManagement.Orders_OrderId]    Script Date: 09/08/2015 10:54:15 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[FK_ConferenceManagement.OrderSeats_ConferenceManagement.Orders_OrderId]') AND parent_object_id = OBJECT_ID(N'[ConferenceManagement].[OrderSeats]'))
ALTER TABLE [ConferenceManagement].[OrderSeats] DROP CONSTRAINT [FK_ConferenceManagement.OrderSeats_ConferenceManagement.Orders_OrderId]
GO
/****** Object:  ForeignKey [FK_ConferenceManagement.OrderSeats_ConferenceManagement.SeatTypes_SeatInfoId]    Script Date: 09/08/2015 10:54:15 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[FK_ConferenceManagement.OrderSeats_ConferenceManagement.SeatTypes_SeatInfoId]') AND parent_object_id = OBJECT_ID(N'[ConferenceManagement].[OrderSeats]'))
ALTER TABLE [ConferenceManagement].[OrderSeats] DROP CONSTRAINT [FK_ConferenceManagement.OrderSeats_ConferenceManagement.SeatTypes_SeatInfoId]
GO
/****** Object:  Table [ConferenceManagement].[OrderSeats]    Script Date: 09/08/2015 10:54:15 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[FK_ConferenceManagement.OrderSeats_ConferenceManagement.Orders_OrderId]') AND parent_object_id = OBJECT_ID(N'[ConferenceManagement].[OrderSeats]'))
ALTER TABLE [ConferenceManagement].[OrderSeats] DROP CONSTRAINT [FK_ConferenceManagement.OrderSeats_ConferenceManagement.Orders_OrderId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[FK_ConferenceManagement.OrderSeats_ConferenceManagement.SeatTypes_SeatInfoId]') AND parent_object_id = OBJECT_ID(N'[ConferenceManagement].[OrderSeats]'))
ALTER TABLE [ConferenceManagement].[OrderSeats] DROP CONSTRAINT [FK_ConferenceManagement.OrderSeats_ConferenceManagement.SeatTypes_SeatInfoId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[OrderSeats]') AND type in (N'U'))
DROP TABLE [ConferenceManagement].[OrderSeats]
GO
/****** Object:  Table [ConferenceRegistration].[PricedOrderLinesV3]    Script Date: 09/08/2015 10:54:15 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrder_Lines]') AND parent_object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrderLinesV3]'))
ALTER TABLE [ConferenceRegistration].[PricedOrderLinesV3] DROP CONSTRAINT [PricedOrder_Lines]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrderLinesV3]') AND type in (N'U'))
DROP TABLE [ConferenceRegistration].[PricedOrderLinesV3]
GO
/****** Object:  Table [ConferenceManagement].[SeatTypes]    Script Date: 09/08/2015 10:54:15 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[FK_ConferenceManagement.SeatTypes_ConferenceManagement.Conferences_ConferenceInfo_Id]') AND parent_object_id = OBJECT_ID(N'[ConferenceManagement].[SeatTypes]'))
ALTER TABLE [ConferenceManagement].[SeatTypes] DROP CONSTRAINT [FK_ConferenceManagement.SeatTypes_ConferenceManagement.Conferences_ConferenceInfo_Id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[SeatTypes]') AND type in (N'U'))
DROP TABLE [ConferenceManagement].[SeatTypes]
GO
/****** Object:  Table [ConferencePayments].[ThidPartyProcessorPaymentItems]    Script Date: 09/08/2015 10:54:14 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferencePayments].[ThirdPartyProcessorPayment_Items]') AND parent_object_id = OBJECT_ID(N'[ConferencePayments].[ThidPartyProcessorPaymentItems]'))
ALTER TABLE [ConferencePayments].[ThidPartyProcessorPaymentItems] DROP CONSTRAINT [ThirdPartyProcessorPayment_Items]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferencePayments].[ThidPartyProcessorPaymentItems]') AND type in (N'U'))
DROP TABLE [ConferencePayments].[ThidPartyProcessorPaymentItems]
GO
/****** Object:  View [ConferencePayments].[ThirdPartyProcessorPaymentDetailsView]    Script Date: 09/08/2015 10:54:14 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ConferencePayments].[ThirdPartyProcessorPaymentDetailsView]'))
DROP VIEW [ConferencePayments].[ThirdPartyProcessorPaymentDetailsView]
GO
/****** Object:  Table [ConferenceRegistration].[OrderItemsViewV3]    Script Date: 09/08/2015 10:54:13 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[DraftOrder_Lines]') AND parent_object_id = OBJECT_ID(N'[ConferenceRegistration].[OrderItemsViewV3]'))
ALTER TABLE [ConferenceRegistration].[OrderItemsViewV3] DROP CONSTRAINT [DraftOrder_Lines]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[OrderItemsViewV3]') AND type in (N'U'))
DROP TABLE [ConferenceRegistration].[OrderItemsViewV3]
GO
/****** Object:  Table [ConferenceManagement].[Orders]    Script Date: 09/08/2015 10:54:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[Orders]') AND type in (N'U'))
DROP TABLE [ConferenceManagement].[Orders]
GO
/****** Object:  Table [ConferencePayments].[ThirdPartyProcessorPayments]    Script Date: 09/08/2015 10:54:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferencePayments].[ThirdPartyProcessorPayments]') AND type in (N'U'))
DROP TABLE [ConferencePayments].[ThirdPartyProcessorPayments]
GO
/****** Object:  Table [ConferenceRegistrationProcesses].[UndispatchedMessages]    Script Date: 09/08/2015 10:54:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistrationProcesses].[UndispatchedMessages]') AND type in (N'U'))
DROP TABLE [ConferenceRegistrationProcesses].[UndispatchedMessages]
GO
/****** Object:  Table [ConferenceRegistration].[PricedOrdersV3]    Script Date: 09/08/2015 10:54:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrdersV3]') AND type in (N'U'))
DROP TABLE [ConferenceRegistration].[PricedOrdersV3]
GO
/****** Object:  Table [ConferenceRegistrationProcesses].[RegistrationProcess]    Script Date: 09/08/2015 10:54:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistrationProcesses].[RegistrationProcess]') AND type in (N'U'))
DROP TABLE [ConferenceRegistrationProcesses].[RegistrationProcess]
GO
/****** Object:  Table [ConferenceRegistration].[OrdersViewV3]    Script Date: 09/08/2015 10:54:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[OrdersViewV3]') AND type in (N'U'))
DROP TABLE [ConferenceRegistration].[OrdersViewV3]
GO
/****** Object:  Table [ConferenceRegistration].[PricedOrderLineSeatTypeDescriptionsV3]    Script Date: 09/08/2015 10:54:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrderLineSeatTypeDescriptionsV3]') AND type in (N'U'))
DROP TABLE [ConferenceRegistration].[PricedOrderLineSeatTypeDescriptionsV3]
GO
/****** Object:  Table [BlobStorage].[Blobs]    Script Date: 09/08/2015 10:54:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[BlobStorage].[Blobs]') AND type in (N'U'))
DROP TABLE [BlobStorage].[Blobs]
GO
/****** Object:  Table [SqlBus].[Commands]    Script Date: 09/08/2015 10:54:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SqlBus].[Commands]') AND type in (N'U'))
DROP TABLE [SqlBus].[Commands]
GO
/****** Object:  Table [ConferenceManagement].[Conferences]    Script Date: 09/08/2015 10:54:13 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[Conferences]') AND type in (N'U'))
DROP TABLE [ConferenceManagement].[Conferences]
GO
/****** Object:  Table [ConferenceRegistration].[ConferenceSeatTypesView]    Script Date: 09/08/2015 10:54:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[ConferenceSeatTypesView]') AND type in (N'U'))
DROP TABLE [ConferenceRegistration].[ConferenceSeatTypesView]
GO
/****** Object:  Table [ConferenceRegistration].[ConferencesView]    Script Date: 09/08/2015 10:54:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[ConferencesView]') AND type in (N'U'))
DROP TABLE [ConferenceRegistration].[ConferencesView]
GO
/****** Object:  Table [Events].[Events]    Script Date: 09/08/2015 10:54:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Events].[Events]') AND type in (N'U'))
DROP TABLE [Events].[Events]
GO
/****** Object:  Table [SqlBus].[Events]    Script Date: 09/08/2015 10:54:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SqlBus].[Events]') AND type in (N'U'))
DROP TABLE [SqlBus].[Events]
GO
/****** Object:  Table [MessageLog].[Messages]    Script Date: 09/08/2015 10:54:12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[MessageLog].[Messages]') AND type in (N'U'))
DROP TABLE [MessageLog].[Messages]
GO
/****** Object:  Schema [BlobStorage]    Script Date: 09/08/2015 10:54:10 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'BlobStorage')
DROP SCHEMA [BlobStorage]
GO
/****** Object:  Schema [ConferenceManagement]    Script Date: 09/08/2015 10:54:10 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'ConferenceManagement')
DROP SCHEMA [ConferenceManagement]
GO
/****** Object:  Schema [ConferencePayments]    Script Date: 09/08/2015 10:54:10 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'ConferencePayments')
DROP SCHEMA [ConferencePayments]
GO
/****** Object:  Schema [ConferenceRegistration]    Script Date: 09/08/2015 10:54:10 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'ConferenceRegistration')
DROP SCHEMA [ConferenceRegistration]
GO
/****** Object:  Schema [ConferenceRegistrationProcesses]    Script Date: 09/08/2015 10:54:10 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'ConferenceRegistrationProcesses')
DROP SCHEMA [ConferenceRegistrationProcesses]
GO
/****** Object:  Schema [Events]    Script Date: 09/08/2015 10:54:10 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'Events')
DROP SCHEMA [Events]
GO
/****** Object:  Schema [MessageLog]    Script Date: 09/08/2015 10:54:10 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'MessageLog')
DROP SCHEMA [MessageLog]
GO
/****** Object:  Schema [SqlBus]    Script Date: 09/08/2015 10:54:10 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'SqlBus')
DROP SCHEMA [SqlBus]
GO
/****** Object:  Schema [SqlBus]    Script Date: 09/08/2015 10:54:10 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'SqlBus')
EXEC sys.sp_executesql N'CREATE SCHEMA [SqlBus] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [MessageLog]    Script Date: 09/08/2015 10:54:10 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'MessageLog')
EXEC sys.sp_executesql N'CREATE SCHEMA [MessageLog] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [Events]    Script Date: 09/08/2015 10:54:10 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'Events')
EXEC sys.sp_executesql N'CREATE SCHEMA [Events] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [ConferenceRegistrationProcesses]    Script Date: 09/08/2015 10:54:10 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'ConferenceRegistrationProcesses')
EXEC sys.sp_executesql N'CREATE SCHEMA [ConferenceRegistrationProcesses] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [ConferenceRegistration]    Script Date: 09/08/2015 10:54:10 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'ConferenceRegistration')
EXEC sys.sp_executesql N'CREATE SCHEMA [ConferenceRegistration] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [ConferencePayments]    Script Date: 09/08/2015 10:54:10 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'ConferencePayments')
EXEC sys.sp_executesql N'CREATE SCHEMA [ConferencePayments] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [ConferenceManagement]    Script Date: 09/08/2015 10:54:10 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'ConferenceManagement')
EXEC sys.sp_executesql N'CREATE SCHEMA [ConferenceManagement] AUTHORIZATION [dbo]'
GO
/****** Object:  Schema [BlobStorage]    Script Date: 09/08/2015 10:54:10 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'BlobStorage')
EXEC sys.sp_executesql N'CREATE SCHEMA [BlobStorage] AUTHORIZATION [dbo]'
GO
/****** Object:  Table [MessageLog].[Messages]    Script Date: 09/08/2015 10:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[MessageLog].[Messages]') AND type in (N'U'))
BEGIN
CREATE TABLE [MessageLog].[Messages](
	[Id] [uniqueidentifier] NOT NULL,
	[Kind] [nvarchar](max) NULL,
	[SourceId] [nvarchar](max) NULL,
	[AssemblyName] [nvarchar](max) NULL,
	[Namespace] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[TypeName] [nvarchar](max) NULL,
	[SourceType] [nvarchar](max) NULL,
	[CreationDate] [nvarchar](max) NULL,
	[Payload] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'dadf662b-9915-4841-bd8d-0ecbb88c5596', N'Event', N'98441f3a-3c8d-4bf6-921e-014fac9572d8', N'Registration.Contracts', N'Registration.Events', N'Registration.Events.SeatAssigned', N'SeatAssigned', NULL, N'2015-09-08T02:52:28.2315160Z', N'{
  "$type": "Registration.Events.SeatAssigned, Registration.Contracts",
  "Position": 0,
  "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
  "Attendee": {
    "$type": "Registration.PersonalInfo, Registration.Contracts",
    "FirstName": "aa",
    "LastName": "bb",
    "Email": "a@b.com"
  },
  "SourceId": "98441f3a-3c8d-4bf6-921e-014fac9572d8",
  "Version": 1
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'30de6abe-215f-42cd-bbf1-0f12cd695afd', N'Event', N'77afb7a1-11b7-413c-8d56-014fac9420fd', N'Conference.Contracts', N'Conference', N'Conference.SeatCreated', N'SeatCreated', NULL, N'2015-09-08T02:50:39.5584293Z', N'{
  "$type": "Conference.SeatCreated, Conference.Contracts",
  "ConferenceId": "34a94f58-2f2f-428b-8153-014fac93ce7b",
  "SourceId": "77afb7a1-11b7-413c-8d56-014fac9420fd",
  "Name": "Red",
  "Description": "Red",
  "Price": 100.00,
  "Quantity": 100
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'9d47ca93-bac1-4503-a11f-12ccf735e69d', N'Event', N'80289725-96a4-4264-9328-014fac94fd2a', N'Registration.Contracts', N'Registration.Events', N'Registration.Events.OrderReservationCompleted', N'OrderReservationCompleted', NULL, N'2015-09-08T02:51:37.9125160Z', N'{
  "$type": "Registration.Events.OrderReservationCompleted, Registration.Contracts",
  "ReservationExpiration": "2015-09-08T03:06:34.38",
  "Seats": {
    "$type": "Registration.SeatQuantity[], Registration.Contracts",
    "$values": [
      {
        "$type": "Registration.SeatQuantity, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "Quantity": 2
      }
    ]
  },
  "SourceId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Version": 2
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'2641302e-6b9a-471a-ac88-2255999faa07', N'Event', N'98441f3a-3c8d-4bf6-921e-014fac9572d8', N'Registration.Contracts', N'Registration.Events', N'Registration.Events.SeatAssigned', N'SeatAssigned', NULL, N'2015-09-08T02:52:28.3985160Z', N'{
  "$type": "Registration.Events.SeatAssigned, Registration.Contracts",
  "Position": 1,
  "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
  "Attendee": {
    "$type": "Registration.PersonalInfo, Registration.Contracts",
    "FirstName": "cc",
    "LastName": "dd",
    "Email": "c@b.com"
  },
  "SourceId": "98441f3a-3c8d-4bf6-921e-014fac9572d8",
  "Version": 2
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'70f7a16e-6803-4d5b-88a7-2b326e7af189', N'Command', N'257e3294-2bfc-47f3-b243-66cc75a967f6', N'Registration', N'Registration.Commands', N'Registration.Commands.RegisterToConference', N'RegisterToConference', NULL, N'2015-09-08T02:51:34.4695160Z', N'{
  "$type": "Registration.Commands.RegisterToConference, Registration",
  "Id": "257e3294-2bfc-47f3-b243-66cc75a967f6",
  "OrderId": "80289725-96a4-4264-9328-014fac94fd2a",
  "ConferenceId": "34a94f58-2f2f-428b-8153-014fac93ce7b",
  "Seats": {
    "$type": "System.Collections.ObjectModel.Collection`1[[Registration.SeatQuantity, Registration.Contracts]], mscorlib",
    "$values": [
      {
        "$type": "Registration.SeatQuantity, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "Quantity": 2
      }
    ]
  }
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'820b47e2-2ad0-4204-a534-2fc3af2b18a3', N'Command', N'0134ef6d-599f-4731-86db-1e2f0f51d78d', N'Payments.Contracts', N'Payments.Contracts.Commands', N'Payments.Contracts.Commands.InitiateThirdPartyProcessorPayment', N'InitiateThirdPartyProcessorPayment', NULL, N'2015-09-08T02:51:52.0475160Z', N'{
  "$type": "Payments.Contracts.Commands.InitiateThirdPartyProcessorPayment, Payments.Contracts",
  "Id": "0134ef6d-599f-4731-86db-1e2f0f51d78d",
  "PaymentId": "02f0de10-906b-493d-97fa-014fac955496",
  "PaymentSourceId": "80289725-96a4-4264-9328-014fac94fd2a",
  "ConferenceId": "34a94f58-2f2f-428b-8153-014fac93ce7b",
  "Description": "Registration for My Conference Test",
  "TotalAmount": 200.00,
  "Items": {
    "$type": "System.Collections.Generic.List`1[[Payments.Contracts.Commands.InitiateThirdPartyProcessorPayment+PaymentItem, Payments.Contracts]], mscorlib",
    "$values": []
  }
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'8d2cdcaa-d56e-4ddf-9243-35baa7e25445', N'Event', N'80289725-96a4-4264-9328-014fac94fd2a', N'Registration.Contracts', N'Registration.Events', N'Registration.Events.OrderPlaced', N'OrderPlaced', NULL, N'2015-09-08T02:51:36.9335160Z', N'{
  "$type": "Registration.Events.OrderPlaced, Registration.Contracts",
  "ConferenceId": "34a94f58-2f2f-428b-8153-014fac93ce7b",
  "Seats": {
    "$type": "System.Collections.Generic.List`1[[Registration.SeatQuantity, Registration.Contracts]], mscorlib",
    "$values": [
      {
        "$type": "Registration.SeatQuantity, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "Quantity": 2
      }
    ]
  },
  "ReservationAutoExpiration": "2015-09-08T03:06:34.378516Z",
  "AccessCode": "G19H56",
  "SourceId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Version": 0
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'd726ec7b-58a2-4f51-9971-3bc9ce5e177e', N'Event', N'80289725-96a4-4264-9328-014fac94fd2a', N'Registration.Contracts', N'Registration.Events', N'Registration.Events.OrderConfirmed', N'OrderConfirmed', NULL, N'2015-09-08T02:51:59.6855160Z', N'{
  "$type": "Registration.Events.OrderConfirmed, Registration.Contracts",
  "SourceId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Version": 4
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'c2bb4801-1f9e-455f-8d3b-3e9d13756acc', N'Command', N'fc2cdf0f-7ffc-4c92-be97-e59f36c954c6', N'Registration', N'Registration.Commands', N'Registration.Commands.AddSeats', N'AddSeats', NULL, N'2015-09-08T02:50:41.6706405Z', N'{
  "$type": "Registration.Commands.AddSeats, Registration",
  "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
  "Quantity": 100,
  "Id": "fc2cdf0f-7ffc-4c92-be97-e59f36c954c6",
  "ConferenceId": "34a94f58-2f2f-428b-8153-014fac93ce7b"
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'9fea113c-d984-484e-a8bd-423c3664ae8b', N'Command', N'bf01da8e-7b69-4b71-a91e-00d975848cfb', N'Registration', N'Registration.Commands', N'Registration.Commands.MakeSeatReservation', N'MakeSeatReservation', NULL, N'2015-09-08T02:51:34.9675160Z', N'{
  "$type": "Registration.Commands.MakeSeatReservation, Registration",
  "ReservationId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Seats": {
    "$type": "System.Collections.Generic.List`1[[Registration.SeatQuantity, Registration.Contracts]], mscorlib",
    "$values": [
      {
        "$type": "Registration.SeatQuantity, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "Quantity": 2
      }
    ]
  },
  "Id": "bf01da8e-7b69-4b71-a91e-00d975848cfb",
  "ConferenceId": "34a94f58-2f2f-428b-8153-014fac93ce7b"
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'70cabccc-5657-4dba-b4d4-5bebc75b59e3', N'Event', N'34a94f58-2f2f-428b-8153-014fac93ce7b', N'Registration', N'Registration.Events', N'Registration.Events.SeatsReservationCommitted', N'SeatsReservationCommitted', NULL, N'2015-09-08T02:51:59.7405160Z', N'{
  "$type": "Registration.Events.SeatsReservationCommitted, Registration",
  "ReservationId": "80289725-96a4-4264-9328-014fac94fd2a",
  "SourceId": "34a94f58-2f2f-428b-8153-014fac93ce7b",
  "Version": 2
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'b1ca3823-f438-497e-b4f5-60ea282bcef3', N'Command', N'edc240cc-906c-4a19-9360-41fd3c9b12cb', N'Registration', N'Registration.Commands', N'Registration.Commands.CommitSeatReservation', N'CommitSeatReservation', NULL, N'2015-09-08T02:51:59.4455160Z', N'{
  "$type": "Registration.Commands.CommitSeatReservation, Registration",
  "ReservationId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Id": "edc240cc-906c-4a19-9360-41fd3c9b12cb",
  "ConferenceId": "34a94f58-2f2f-428b-8153-014fac93ce7b"
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'e36a998b-a9b2-414c-9c72-6264f6fa24df', N'Command', N'aa0edb87-fda2-400c-94ec-d9161a43bacf', N'Registration', N'Registration.Commands', N'Registration.Commands.AssignRegistrantDetails', N'AssignRegistrantDetails', NULL, N'2015-09-08T02:51:51.1885160Z', N'{
  "$type": "Registration.Commands.AssignRegistrantDetails, Registration",
  "Id": "aa0edb87-fda2-400c-94ec-d9161a43bacf",
  "OrderId": "80289725-96a4-4264-9328-014fac94fd2a",
  "FirstName": "jacky",
  "LastName": "zhou",
  "Email": "a@b.com"
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'10a68810-c1ea-405b-98d2-6f35142c78ce', N'Event', N'02f0de10-906b-493d-97fa-014fac955496', N'Payments.Contracts', N'Payments.Contracts.Events', N'Payments.Contracts.Events.PaymentInitiated', N'PaymentInitiated', NULL, N'2015-09-08T02:51:52.1005160Z', N'{
  "$type": "Payments.Contracts.Events.PaymentInitiated, Payments.Contracts",
  "SourceId": "02f0de10-906b-493d-97fa-014fac955496",
  "PaymentSourceId": "80289725-96a4-4264-9328-014fac94fd2a"
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'4d191143-7431-4bbc-81fe-72e1d77fc45a', N'Command', N'49df5082-416f-41d0-b7b3-5312a2182379', N'Registration', N'Registration.Commands', N'Registration.Commands.AssignSeat', N'AssignSeat', NULL, N'2015-09-08T02:52:27.9075160Z', N'{
  "$type": "Registration.Commands.AssignSeat, Registration",
  "Id": "49df5082-416f-41d0-b7b3-5312a2182379",
  "SeatAssignmentsId": "98441f3a-3c8d-4bf6-921e-014fac9572d8",
  "Position": 0,
  "Attendee": {
    "$type": "Registration.PersonalInfo, Registration.Contracts",
    "FirstName": "aa",
    "LastName": "bb",
    "Email": "a@b.com"
  }
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'88afb127-b92e-4b11-8018-80a44da9fcc1', N'Event', N'80289725-96a4-4264-9328-014fac94fd2a', N'Registration.Contracts', N'Registration.Events', N'Registration.Events.OrderTotalsCalculated', N'OrderTotalsCalculated', NULL, N'2015-09-08T02:51:37.3275160Z', N'{
  "$type": "Registration.Events.OrderTotalsCalculated, Registration.Contracts",
  "Total": 200.00,
  "Lines": {
    "$type": "Registration.OrderLine[], Registration.Contracts",
    "$values": [
      {
        "$type": "Registration.SeatOrderLine, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "UnitPrice": 100.00,
        "Quantity": 2,
        "LineTotal": 200.00
      }
    ]
  },
  "IsFreeOfCharge": false,
  "SourceId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Version": 1
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'ff5fa32d-b082-4f6b-9d5c-85115fef0562', N'Event', N'98441f3a-3c8d-4bf6-921e-014fac9572d8', N'Registration.Contracts', N'Registration.Events', N'Registration.Events.SeatAssignmentsCreated', N'SeatAssignmentsCreated', NULL, N'2015-09-08T02:52:00.0545160Z', N'{
  "$type": "Registration.Events.SeatAssignmentsCreated, Registration.Contracts",
  "OrderId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Seats": {
    "$type": "System.Collections.Generic.List`1[[Registration.Events.SeatAssignmentsCreated+SeatAssignmentInfo, Registration.Contracts]], mscorlib",
    "$values": [
      {
        "$type": "Registration.Events.SeatAssignmentsCreated+SeatAssignmentInfo, Registration.Contracts",
        "Position": 0,
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd"
      },
      {
        "$type": "Registration.Events.SeatAssignmentsCreated+SeatAssignmentInfo, Registration.Contracts",
        "Position": 1,
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd"
      }
    ]
  },
  "SourceId": "98441f3a-3c8d-4bf6-921e-014fac9572d8",
  "Version": 0
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'71d28f35-68f8-4e2c-89f1-90ac21867966', N'Event', N'34a94f58-2f2f-428b-8153-014fac93ce7b', N'Registration', N'Registration.Events', N'Registration.Events.SeatsReserved', N'SeatsReserved', NULL, N'2015-09-08T02:51:37.6195160Z', N'{
  "$type": "Registration.Events.SeatsReserved, Registration",
  "ReservationId": "80289725-96a4-4264-9328-014fac94fd2a",
  "ReservationDetails": {
    "$type": "System.Collections.Generic.List`1[[Registration.SeatQuantity, Registration.Contracts]], mscorlib",
    "$values": [
      {
        "$type": "Registration.SeatQuantity, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "Quantity": 2
      }
    ]
  },
  "AvailableSeatsChanged": {
    "$type": "System.Collections.Generic.List`1[[Registration.SeatQuantity, Registration.Contracts]], mscorlib",
    "$values": [
      {
        "$type": "Registration.SeatQuantity, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "Quantity": -2
      }
    ]
  },
  "SourceId": "34a94f58-2f2f-428b-8153-014fac93ce7b",
  "Version": 1
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'a24def38-c288-4352-9a90-90e9e46c96eb', N'Event', N'34a94f58-2f2f-428b-8153-014fac93ce7b', N'Conference.Contracts', N'Conference', N'Conference.ConferencePublished', N'ConferencePublished', NULL, N'2015-09-08T02:50:39.6874422Z', N'{
  "$type": "Conference.ConferencePublished, Conference.Contracts",
  "SourceId": "34a94f58-2f2f-428b-8153-014fac93ce7b"
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'd6a8fcab-7488-44f8-9f0f-95625058f9a1', N'Event', N'02f0de10-906b-493d-97fa-014fac955496', N'Payments.Contracts', N'Payments.Contracts.Events', N'Payments.Contracts.Events.PaymentCompleted', N'PaymentCompleted', NULL, N'2015-09-08T02:51:59.0225160Z', N'{
  "$type": "Payments.Contracts.Events.PaymentCompleted, Payments.Contracts",
  "SourceId": "02f0de10-906b-493d-97fa-014fac955496",
  "PaymentSourceId": "80289725-96a4-4264-9328-014fac94fd2a"
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'd0d9bb35-679a-4629-b760-9ef436484e5b', N'Event', N'34a94f58-2f2f-428b-8153-014fac93ce7b', N'Registration', N'Registration.Events', N'Registration.Events.AvailableSeatsChanged', N'AvailableSeatsChanged', NULL, N'2015-09-08T02:50:41.8066541Z', N'{
  "$type": "Registration.Events.AvailableSeatsChanged, Registration",
  "Seats": {
    "$type": "Registration.SeatQuantity[], Registration.Contracts",
    "$values": [
      {
        "$type": "Registration.SeatQuantity, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "Quantity": 100
      }
    ]
  },
  "SourceId": "34a94f58-2f2f-428b-8153-014fac93ce7b",
  "Version": 0
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'1ce71345-eed1-4de9-9574-aff4ea1b58f0', N'Command', N'd37f1ae1-1067-4f6f-b8c5-85ebdb3c5021', N'Payments.Contracts', N'Payments.Contracts.Commands', N'Payments.Contracts.Commands.CompleteThirdPartyProcessorPayment', N'CompleteThirdPartyProcessorPayment', NULL, N'2015-09-08T02:51:58.7675160Z', N'{
  "$type": "Payments.Contracts.Commands.CompleteThirdPartyProcessorPayment, Payments.Contracts",
  "Id": "d37f1ae1-1067-4f6f-b8c5-85ebdb3c5021",
  "PaymentId": "02f0de10-906b-493d-97fa-014fac955496"
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'e55a9f1f-c63a-4b02-836f-bd2d58a336fc', N'Command', N'e12c6e16-2e21-488f-aa73-07e279f56c58', N'Registration', N'Registration.Commands', N'Registration.Commands.ConfirmOrder', N'ConfirmOrder', NULL, N'2015-09-08T02:51:59.1415160Z', N'{
  "$type": "Registration.Commands.ConfirmOrder, Registration",
  "Id": "e12c6e16-2e21-488f-aa73-07e279f56c58",
  "OrderId": "80289725-96a4-4264-9328-014fac94fd2a"
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'ca16c312-6188-4d68-b14a-d12ad7c5c8a4', N'Event', N'80289725-96a4-4264-9328-014fac94fd2a', N'Registration.Contracts', N'Registration.Events', N'Registration.Events.OrderRegistrantAssigned', N'OrderRegistrantAssigned', NULL, N'2015-09-08T02:51:51.3655160Z', N'{
  "$type": "Registration.Events.OrderRegistrantAssigned, Registration.Contracts",
  "FirstName": "jacky",
  "LastName": "zhou",
  "Email": "a@b.com",
  "SourceId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Version": 3
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'6523dc52-9253-4335-8266-e57e41ef5dba', N'Event', N'34a94f58-2f2f-428b-8153-014fac93ce7b', N'Conference.Contracts', N'Conference', N'Conference.ConferenceCreated', N'ConferenceCreated', NULL, N'2015-09-08T02:50:15.8950632Z', N'{
  "$type": "Conference.ConferenceCreated, Conference.Contracts",
  "SourceId": "34a94f58-2f2f-428b-8153-014fac93ce7b",
  "Name": "My Conference Test",
  "Description": "AAAAAAAAA",
  "Location": "Location XYZ",
  "Slug": "SN001",
  "Tagline": "AA",
  "TwitterSearch": "Twitter Search Key",
  "StartDate": "2015-09-08T00:00:00",
  "EndDate": "2015-10-31T00:00:00",
  "Owner": {
    "$type": "Conference.Owner, Conference.Contracts",
    "Name": "jacky",
    "Email": "jacky@ctrip.com"
  }
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'9218c05c-9f19-4c6a-a163-f003b55d5a37', N'Command', N'5ca21467-2517-4e09-977c-32f6a3745dc6', N'Registration', N'Registration.Commands', N'Registration.Commands.MarkSeatsAsReserved', N'MarkSeatsAsReserved', NULL, N'2015-09-08T02:51:37.7265160Z', N'{
  "$type": "Registration.Commands.MarkSeatsAsReserved, Registration",
  "Id": "5ca21467-2517-4e09-977c-32f6a3745dc6",
  "OrderId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Seats": {
    "$type": "System.Collections.Generic.List`1[[Registration.SeatQuantity, Registration.Contracts]], mscorlib",
    "$values": [
      {
        "$type": "Registration.SeatQuantity, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "Quantity": 2
      }
    ]
  },
  "Expiration": "2015-09-08T03:06:34.38"
}')
INSERT [MessageLog].[Messages] ([Id], [Kind], [SourceId], [AssemblyName], [Namespace], [FullName], [TypeName], [SourceType], [CreationDate], [Payload]) VALUES (N'42c8a63d-f44d-4747-9fc3-f6b1fc99f846', N'Command', N'e6dae91b-df3c-4984-9aa5-6d889cb703a8', N'Registration', N'Registration.Commands', N'Registration.Commands.AssignSeat', N'AssignSeat', NULL, N'2015-09-08T02:52:28.0665160Z', N'{
  "$type": "Registration.Commands.AssignSeat, Registration",
  "Id": "e6dae91b-df3c-4984-9aa5-6d889cb703a8",
  "SeatAssignmentsId": "98441f3a-3c8d-4bf6-921e-014fac9572d8",
  "Position": 1,
  "Attendee": {
    "$type": "Registration.PersonalInfo, Registration.Contracts",
    "FirstName": "cc",
    "LastName": "dd",
    "Email": "c@b.com"
  }
}')
/****** Object:  Table [SqlBus].[Events]    Script Date: 09/08/2015 10:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SqlBus].[Events]') AND type in (N'U'))
BEGIN
CREATE TABLE [SqlBus].[Events](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[CorrelationId] [nvarchar](max) NULL,
 CONSTRAINT [PK_SqlBus.Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Events].[Events]    Script Date: 09/08/2015 10:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Events].[Events]') AND type in (N'U'))
BEGIN
CREATE TABLE [Events].[Events](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AggregateId] [uniqueidentifier] NOT NULL,
	[AggregateType] [nvarchar](128) NOT NULL,
	[Version] [int] NOT NULL,
	[Payload] [nvarchar](max) NULL,
	[CorrelationId] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [Events].[Events] ON
INSERT [Events].[Events] ([Id], [AggregateId], [AggregateType], [Version], [Payload], [CorrelationId]) VALUES (1, N'34a94f58-2f2f-428b-8153-014fac93ce7b', N'SeatsAvailability', 0, N'{
  "$type": "Registration.Events.AvailableSeatsChanged, Registration",
  "Seats": {
    "$type": "Registration.SeatQuantity[], Registration.Contracts",
    "$values": [
      {
        "$type": "Registration.SeatQuantity, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "Quantity": 100
      }
    ]
  },
  "SourceId": "34a94f58-2f2f-428b-8153-014fac93ce7b",
  "Version": 0
}', N'fc2cdf0f-7ffc-4c92-be97-e59f36c954c6')
INSERT [Events].[Events] ([Id], [AggregateId], [AggregateType], [Version], [Payload], [CorrelationId]) VALUES (2, N'80289725-96a4-4264-9328-014fac94fd2a', N'Order', 0, N'{
  "$type": "Registration.Events.OrderPlaced, Registration.Contracts",
  "ConferenceId": "34a94f58-2f2f-428b-8153-014fac93ce7b",
  "Seats": {
    "$type": "System.Collections.Generic.List`1[[Registration.SeatQuantity, Registration.Contracts]], mscorlib",
    "$values": [
      {
        "$type": "Registration.SeatQuantity, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "Quantity": 2
      }
    ]
  },
  "ReservationAutoExpiration": "2015-09-08T03:06:34.378516Z",
  "AccessCode": "G19H56",
  "SourceId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Version": 0
}', N'257e3294-2bfc-47f3-b243-66cc75a967f6')
INSERT [Events].[Events] ([Id], [AggregateId], [AggregateType], [Version], [Payload], [CorrelationId]) VALUES (3, N'80289725-96a4-4264-9328-014fac94fd2a', N'Order', 1, N'{
  "$type": "Registration.Events.OrderTotalsCalculated, Registration.Contracts",
  "Total": 200.00,
  "Lines": {
    "$type": "Registration.OrderLine[], Registration.Contracts",
    "$values": [
      {
        "$type": "Registration.SeatOrderLine, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "UnitPrice": 100.00,
        "Quantity": 2,
        "LineTotal": 200.00
      }
    ]
  },
  "IsFreeOfCharge": false,
  "SourceId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Version": 1
}', N'257e3294-2bfc-47f3-b243-66cc75a967f6')
INSERT [Events].[Events] ([Id], [AggregateId], [AggregateType], [Version], [Payload], [CorrelationId]) VALUES (4, N'34a94f58-2f2f-428b-8153-014fac93ce7b', N'SeatsAvailability', 1, N'{
  "$type": "Registration.Events.SeatsReserved, Registration",
  "ReservationId": "80289725-96a4-4264-9328-014fac94fd2a",
  "ReservationDetails": {
    "$type": "System.Collections.Generic.List`1[[Registration.SeatQuantity, Registration.Contracts]], mscorlib",
    "$values": [
      {
        "$type": "Registration.SeatQuantity, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "Quantity": 2
      }
    ]
  },
  "AvailableSeatsChanged": {
    "$type": "System.Collections.Generic.List`1[[Registration.SeatQuantity, Registration.Contracts]], mscorlib",
    "$values": [
      {
        "$type": "Registration.SeatQuantity, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "Quantity": -2
      }
    ]
  },
  "SourceId": "34a94f58-2f2f-428b-8153-014fac93ce7b",
  "Version": 1
}', N'bf01da8e-7b69-4b71-a91e-00d975848cfb')
INSERT [Events].[Events] ([Id], [AggregateId], [AggregateType], [Version], [Payload], [CorrelationId]) VALUES (5, N'80289725-96a4-4264-9328-014fac94fd2a', N'Order', 2, N'{
  "$type": "Registration.Events.OrderReservationCompleted, Registration.Contracts",
  "ReservationExpiration": "2015-09-08T03:06:34.38",
  "Seats": {
    "$type": "Registration.SeatQuantity[], Registration.Contracts",
    "$values": [
      {
        "$type": "Registration.SeatQuantity, Registration.Contracts",
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
        "Quantity": 2
      }
    ]
  },
  "SourceId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Version": 2
}', N'5ca21467-2517-4e09-977c-32f6a3745dc6')
INSERT [Events].[Events] ([Id], [AggregateId], [AggregateType], [Version], [Payload], [CorrelationId]) VALUES (6, N'80289725-96a4-4264-9328-014fac94fd2a', N'Order', 3, N'{
  "$type": "Registration.Events.OrderRegistrantAssigned, Registration.Contracts",
  "FirstName": "jacky",
  "LastName": "zhou",
  "Email": "a@b.com",
  "SourceId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Version": 3
}', N'aa0edb87-fda2-400c-94ec-d9161a43bacf')
INSERT [Events].[Events] ([Id], [AggregateId], [AggregateType], [Version], [Payload], [CorrelationId]) VALUES (7, N'80289725-96a4-4264-9328-014fac94fd2a', N'Order', 4, N'{
  "$type": "Registration.Events.OrderConfirmed, Registration.Contracts",
  "SourceId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Version": 4
}', N'e12c6e16-2e21-488f-aa73-07e279f56c58')
INSERT [Events].[Events] ([Id], [AggregateId], [AggregateType], [Version], [Payload], [CorrelationId]) VALUES (8, N'34a94f58-2f2f-428b-8153-014fac93ce7b', N'SeatsAvailability', 2, N'{
  "$type": "Registration.Events.SeatsReservationCommitted, Registration",
  "ReservationId": "80289725-96a4-4264-9328-014fac94fd2a",
  "SourceId": "34a94f58-2f2f-428b-8153-014fac93ce7b",
  "Version": 2
}', N'edc240cc-906c-4a19-9360-41fd3c9b12cb')
INSERT [Events].[Events] ([Id], [AggregateId], [AggregateType], [Version], [Payload], [CorrelationId]) VALUES (9, N'98441f3a-3c8d-4bf6-921e-014fac9572d8', N'SeatAssignments', 0, N'{
  "$type": "Registration.Events.SeatAssignmentsCreated, Registration.Contracts",
  "OrderId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Seats": {
    "$type": "System.Collections.Generic.List`1[[Registration.Events.SeatAssignmentsCreated+SeatAssignmentInfo, Registration.Contracts]], mscorlib",
    "$values": [
      {
        "$type": "Registration.Events.SeatAssignmentsCreated+SeatAssignmentInfo, Registration.Contracts",
        "Position": 0,
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd"
      },
      {
        "$type": "Registration.Events.SeatAssignmentsCreated+SeatAssignmentInfo, Registration.Contracts",
        "Position": 1,
        "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd"
      }
    ]
  },
  "SourceId": "98441f3a-3c8d-4bf6-921e-014fac9572d8",
  "Version": 0
}', NULL)
INSERT [Events].[Events] ([Id], [AggregateId], [AggregateType], [Version], [Payload], [CorrelationId]) VALUES (10, N'98441f3a-3c8d-4bf6-921e-014fac9572d8', N'SeatAssignments', 1, N'{
  "$type": "Registration.Events.SeatAssigned, Registration.Contracts",
  "Position": 0,
  "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
  "Attendee": {
    "$type": "Registration.PersonalInfo, Registration.Contracts",
    "FirstName": "aa",
    "LastName": "bb",
    "Email": "a@b.com"
  },
  "SourceId": "98441f3a-3c8d-4bf6-921e-014fac9572d8",
  "Version": 1
}', N'49df5082-416f-41d0-b7b3-5312a2182379')
INSERT [Events].[Events] ([Id], [AggregateId], [AggregateType], [Version], [Payload], [CorrelationId]) VALUES (11, N'98441f3a-3c8d-4bf6-921e-014fac9572d8', N'SeatAssignments', 2, N'{
  "$type": "Registration.Events.SeatAssigned, Registration.Contracts",
  "Position": 1,
  "SeatType": "77afb7a1-11b7-413c-8d56-014fac9420fd",
  "Attendee": {
    "$type": "Registration.PersonalInfo, Registration.Contracts",
    "FirstName": "cc",
    "LastName": "dd",
    "Email": "c@b.com"
  },
  "SourceId": "98441f3a-3c8d-4bf6-921e-014fac9572d8",
  "Version": 2
}', N'e6dae91b-df3c-4984-9aa5-6d889cb703a8')
SET IDENTITY_INSERT [Events].[Events] OFF
/****** Object:  Table [ConferenceRegistration].[ConferencesView]    Script Date: 09/08/2015 10:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[ConferencesView]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferenceRegistration].[ConferencesView](
	[Id] [uniqueidentifier] NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NULL,
	[Tagline] [nvarchar](max) NULL,
	[TwitterSearch] [nvarchar](max) NULL,
	[StartDate] [datetimeoffset](7) NOT NULL,
	[IsPublished] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [ConferenceRegistration].[ConferencesView] ([Id], [Code], [Name], [Description], [Location], [Tagline], [TwitterSearch], [StartDate], [IsPublished]) VALUES (N'34a94f58-2f2f-428b-8153-014fac93ce7b', N'SN001', N'My Conference Test', N'AAAAAAAAA', N'Location XYZ', N'AA', N'Twitter Search Key', CAST(0x070080461C86673A0BE001 AS DateTimeOffset), 1)
/****** Object:  Table [ConferenceRegistration].[ConferenceSeatTypesView]    Script Date: 09/08/2015 10:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[ConferenceSeatTypesView]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferenceRegistration].[ConferenceSeatTypesView](
	[Id] [uniqueidentifier] NOT NULL,
	[ConferenceId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[AvailableQuantity] [int] NOT NULL,
	[SeatsAvailabilityVersion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[ConferenceSeatTypesView]') AND name = N'IX_SeatTypesView_ConferenceId')
CREATE NONCLUSTERED INDEX [IX_SeatTypesView_ConferenceId] ON [ConferenceRegistration].[ConferenceSeatTypesView] 
(
	[ConferenceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [ConferenceRegistration].[ConferenceSeatTypesView] ([Id], [ConferenceId], [Name], [Description], [Price], [Quantity], [AvailableQuantity], [SeatsAvailabilityVersion]) VALUES (N'77afb7a1-11b7-413c-8d56-014fac9420fd', N'34a94f58-2f2f-428b-8153-014fac93ce7b', N'Red', N'Red', CAST(100.00 AS Decimal(18, 2)), 100, 98, 1)
/****** Object:  Table [ConferenceManagement].[Conferences]    Script Date: 09/08/2015 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[Conferences]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferenceManagement].[Conferences](
	[Id] [uniqueidentifier] NOT NULL,
	[AccessCode] [nvarchar](6) NULL,
	[OwnerName] [nvarchar](max) NOT NULL,
	[OwnerEmail] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[WasEverPublished] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[Tagline] [nvarchar](max) NULL,
	[TwitterSearch] [nvarchar](max) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsPublished] [bit] NOT NULL,
 CONSTRAINT [PK_ConferenceManagement.Conferences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [ConferenceManagement].[Conferences] ([Id], [AccessCode], [OwnerName], [OwnerEmail], [Slug], [WasEverPublished], [Name], [Description], [Location], [Tagline], [TwitterSearch], [StartDate], [EndDate], [IsPublished]) VALUES (N'34a94f58-2f2f-428b-8153-014fac93ce7b', N'UGYHMC', N'jacky', N'jacky@ctrip.com', N'SN001', 1, N'My Conference Test', N'AAAAAAAAA', N'Location XYZ', N'AA', N'Twitter Search Key', CAST(0x0000A50D00000000 AS DateTime), CAST(0x0000A54200000000 AS DateTime), 1)
/****** Object:  Table [SqlBus].[Commands]    Script Date: 09/08/2015 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[SqlBus].[Commands]') AND type in (N'U'))
BEGIN
CREATE TABLE [SqlBus].[Commands](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[CorrelationId] [nvarchar](max) NULL,
 CONSTRAINT [PK_SqlBus.Commands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [SqlBus].[Commands] ON
INSERT [SqlBus].[Commands] ([Id], [Body], [DeliveryDate], [CorrelationId]) VALUES (4, N'{
  "$type": "Registration.Commands.ExpireRegistrationProcess, Registration",
  "Id": "2de3cbda-45dd-474a-bdb9-2b3da6b01549",
  "ProcessId": "e680bdb4-0566-457d-9fbc-014fac95118d"
}', CAST(0x0000A50D003716EA AS DateTime), NULL)
SET IDENTITY_INSERT [SqlBus].[Commands] OFF
/****** Object:  Table [BlobStorage].[Blobs]    Script Date: 09/08/2015 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[BlobStorage].[Blobs]') AND type in (N'U'))
BEGIN
CREATE TABLE [BlobStorage].[Blobs](
	[Id] [nvarchar](128) NOT NULL,
	[ContentType] [nvarchar](max) NULL,
	[Blob] [varbinary](max) NULL,
	[BlobString] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [BlobStorage].[Blobs] ([Id], [ContentType], [Blob], [BlobString]) VALUES (N'SeatAssignments-98441f3a-3c8d-4bf6-921e-014fac9572d8', N'text/plain', 0x7B0D0A2020222474797065223A2022526567697374726174696F6E2E526561644D6F64656C2E4F7264657253656174732C20526567697374726174696F6E222C0D0A20202241737369676E6D656E74734964223A202239383434316633612D336338642D346266362D393231652D303134666163393537326438222C0D0A2020224F726465724964223A202238303238393732352D393661342D343236342D393332382D303134666163393466643261222C0D0A2020225365617473223A207B0D0A20202020222474797065223A202253797374656D2E436F6C6C656374696F6E732E47656E657269632E4C69737460315B5B526567697374726174696F6E2E526561644D6F64656C2E4F72646572536561742C20526567697374726174696F6E5D5D2C206D73636F726C6962222C0D0A20202020222476616C756573223A205B0D0A2020202020207B0D0A2020202020202020222474797065223A2022526567697374726174696F6E2E526561644D6F64656C2E4F72646572536561742C20526567697374726174696F6E222C0D0A202020202020202022506F736974696F6E223A20302C0D0A202020202020202022536561744E616D65223A2022526564222C0D0A202020202020202022417474656E646565223A207B0D0A20202020202020202020222474797065223A2022526567697374726174696F6E2E506572736F6E616C496E666F2C20526567697374726174696F6E2E436F6E747261637473222C0D0A202020202020202020202246697273744E616D65223A20226161222C0D0A20202020202020202020224C6173744E616D65223A20226262222C0D0A2020202020202020202022456D61696C223A20226140622E636F6D220D0A20202020202020207D0D0A2020202020207D2C0D0A2020202020207B0D0A2020202020202020222474797065223A2022526567697374726174696F6E2E526561644D6F64656C2E4F72646572536561742C20526567697374726174696F6E222C0D0A202020202020202022506F736974696F6E223A20312C0D0A202020202020202022536561744E616D65223A2022526564222C0D0A202020202020202022417474656E646565223A207B0D0A20202020202020202020222474797065223A2022526567697374726174696F6E2E506572736F6E616C496E666F2C20526567697374726174696F6E2E436F6E747261637473222C0D0A202020202020202020202246697273744E616D65223A20226363222C0D0A20202020202020202020224C6173744E616D65223A20226464222C0D0A2020202020202020202022456D61696C223A20226340622E636F6D220D0A20202020202020207D0D0A2020202020207D0D0A202020205D0D0A20207D0D0A7D, N'{
  "$type": "Registration.ReadModel.OrderSeats, Registration",
  "AssignmentsId": "98441f3a-3c8d-4bf6-921e-014fac9572d8",
  "OrderId": "80289725-96a4-4264-9328-014fac94fd2a",
  "Seats": {
    "$type": "System.Collections.Generic.List`1[[Registration.ReadModel.OrderSeat, Registration]], mscorlib",
    "$values": [
      {
        "$type": "Registration.ReadModel.OrderSeat, Registration",
        "Position": 0,
        "SeatName": "Red",
        "Attendee": {
          "$type": "Registration.PersonalInfo, Registration.Contracts",
          "FirstName": "aa",
          "LastName": "bb",
          "Email": "a@b.com"
        }
      },
      {
        "$type": "Registration.ReadModel.OrderSeat, Registration",
        "Position": 1,
        "SeatName": "Red",
        "Attendee": {
          "$type": "Registration.PersonalInfo, Registration.Contracts",
          "FirstName": "cc",
          "LastName": "dd",
          "Email": "c@b.com"
        }
      }
    ]
  }
}')
/****** Object:  Table [ConferenceRegistration].[PricedOrderLineSeatTypeDescriptionsV3]    Script Date: 09/08/2015 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrderLineSeatTypeDescriptionsV3]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferenceRegistration].[PricedOrderLineSeatTypeDescriptionsV3](
	[SeatTypeId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[SeatTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [ConferenceRegistration].[PricedOrderLineSeatTypeDescriptionsV3] ([SeatTypeId], [Name]) VALUES (N'77afb7a1-11b7-413c-8d56-014fac9420fd', N'Red')
/****** Object:  Table [ConferenceRegistration].[OrdersViewV3]    Script Date: 09/08/2015 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[OrdersViewV3]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferenceRegistration].[OrdersViewV3](
	[OrderId] [uniqueidentifier] NOT NULL,
	[ConferenceId] [uniqueidentifier] NOT NULL,
	[ReservationExpirationDate] [datetime] NULL,
	[StateValue] [int] NOT NULL,
	[OrderVersion] [int] NOT NULL,
	[RegistrantEmail] [nvarchar](max) NULL,
	[AccessCode] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [ConferenceRegistration].[OrdersViewV3] ([OrderId], [ConferenceId], [ReservationExpirationDate], [StateValue], [OrderVersion], [RegistrantEmail], [AccessCode]) VALUES (N'80289725-96a4-4264-9328-014fac94fd2a', N'34a94f58-2f2f-428b-8153-014fac93ce7b', CAST(0x0000A50D00333E6A AS DateTime), 4, 4, N'a@b.com', N'G19H56')
/****** Object:  Table [ConferenceRegistrationProcesses].[RegistrationProcess]    Script Date: 09/08/2015 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistrationProcesses].[RegistrationProcess]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferenceRegistrationProcesses].[RegistrationProcess](
	[Id] [uniqueidentifier] NOT NULL,
	[Completed] [bit] NOT NULL,
	[ConferenceId] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[ReservationId] [uniqueidentifier] NOT NULL,
	[SeatReservationCommandId] [uniqueidentifier] NOT NULL,
	[ReservationAutoExpiration] [datetime] NULL,
	[ExpirationCommandId] [uniqueidentifier] NOT NULL,
	[StateValue] [int] NOT NULL,
	[TimeStamp] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ConferenceRegistrationProcesses].[RegistrationProcess]') AND name = N'IX_RegistrationProcessManager_Completed')
CREATE NONCLUSTERED INDEX [IX_RegistrationProcessManager_Completed] ON [ConferenceRegistrationProcesses].[RegistrationProcess] 
(
	[Completed] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ConferenceRegistrationProcesses].[RegistrationProcess]') AND name = N'IX_RegistrationProcessManager_OrderId')
CREATE NONCLUSTERED INDEX [IX_RegistrationProcessManager_OrderId] ON [ConferenceRegistrationProcesses].[RegistrationProcess] 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [ConferenceRegistrationProcesses].[RegistrationProcess] ([Id], [Completed], [ConferenceId], [OrderId], [ReservationId], [SeatReservationCommandId], [ReservationAutoExpiration], [ExpirationCommandId], [StateValue]) VALUES (N'e680bdb4-0566-457d-9fbc-014fac95118d', 1, N'34a94f58-2f2f-428b-8153-014fac93ce7b', N'80289725-96a4-4264-9328-014fac94fd2a', N'80289725-96a4-4264-9328-014fac94fd2a', N'bf01da8e-7b69-4b71-a91e-00d975848cfb', CAST(0x0000A50D00333E6A AS DateTime), N'00000000-0000-0000-0000-000000000000', 3)
/****** Object:  Table [ConferenceRegistration].[PricedOrdersV3]    Script Date: 09/08/2015 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrdersV3]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferenceRegistration].[PricedOrdersV3](
	[OrderId] [uniqueidentifier] NOT NULL,
	[AssignmentsId] [uniqueidentifier] NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[OrderVersion] [int] NOT NULL,
	[IsFreeOfCharge] [bit] NOT NULL,
	[ReservationExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [ConferenceRegistration].[PricedOrdersV3] ([OrderId], [AssignmentsId], [Total], [OrderVersion], [IsFreeOfCharge], [ReservationExpirationDate]) VALUES (N'80289725-96a4-4264-9328-014fac94fd2a', N'98441f3a-3c8d-4bf6-921e-014fac9572d8', CAST(200.00 AS Decimal(18, 2)), 4, 0, NULL)
/****** Object:  Table [ConferenceRegistrationProcesses].[UndispatchedMessages]    Script Date: 09/08/2015 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistrationProcesses].[UndispatchedMessages]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferenceRegistrationProcesses].[UndispatchedMessages](
	[Id] [uniqueidentifier] NOT NULL,
	[Commands] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [ConferencePayments].[ThirdPartyProcessorPayments]    Script Date: 09/08/2015 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferencePayments].[ThirdPartyProcessorPayments]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferencePayments].[ThirdPartyProcessorPayments](
	[Id] [uniqueidentifier] NOT NULL,
	[StateValue] [int] NOT NULL,
	[PaymentSourceId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [ConferencePayments].[ThirdPartyProcessorPayments] ([Id], [StateValue], [PaymentSourceId], [Description], [TotalAmount]) VALUES (N'02f0de10-906b-493d-97fa-014fac955496', 2, N'80289725-96a4-4264-9328-014fac94fd2a', N'Registration for My Conference Test', CAST(200.00 AS Decimal(18, 2)))
/****** Object:  Table [ConferenceManagement].[Orders]    Script Date: 09/08/2015 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[Orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferenceManagement].[Orders](
	[Id] [uniqueidentifier] NOT NULL,
	[ConferenceId] [uniqueidentifier] NOT NULL,
	[AssignmentsId] [uniqueidentifier] NULL,
	[AccessCode] [nvarchar](max) NULL,
	[RegistrantName] [nvarchar](max) NULL,
	[RegistrantEmail] [nvarchar](max) NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[StatusValue] [int] NOT NULL,
 CONSTRAINT [PK_ConferenceManagement.Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [ConferenceManagement].[Orders] ([Id], [ConferenceId], [AssignmentsId], [AccessCode], [RegistrantName], [RegistrantEmail], [TotalAmount], [StatusValue]) VALUES (N'80289725-96a4-4264-9328-014fac94fd2a', N'34a94f58-2f2f-428b-8153-014fac93ce7b', N'98441f3a-3c8d-4bf6-921e-014fac9572d8', N'G19H56', N'zhou, jacky', N'a@b.com', CAST(200.00 AS Decimal(18, 2)), 1)
/****** Object:  Table [ConferenceRegistration].[OrderItemsViewV3]    Script Date: 09/08/2015 10:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[OrderItemsViewV3]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferenceRegistration].[OrderItemsViewV3](
	[OrderId] [uniqueidentifier] NOT NULL,
	[SeatType] [uniqueidentifier] NOT NULL,
	[RequestedSeats] [int] NOT NULL,
	[ReservedSeats] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[SeatType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [ConferenceRegistration].[OrderItemsViewV3] ([OrderId], [SeatType], [RequestedSeats], [ReservedSeats]) VALUES (N'80289725-96a4-4264-9328-014fac94fd2a', N'77afb7a1-11b7-413c-8d56-014fac9420fd', 2, 2)
/****** Object:  View [ConferencePayments].[ThirdPartyProcessorPaymentDetailsView]    Script Date: 09/08/2015 10:54:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[ConferencePayments].[ThirdPartyProcessorPaymentDetailsView]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [ConferencePayments].[ThirdPartyProcessorPaymentDetailsView]
AS
SELECT     
    Id AS Id, 
    StateValue as StateValue,
    PaymentSourceId as PaymentSourceId,
    Description as Description,
    TotalAmount as TotalAmount
FROM ConferencePayments.ThirdPartyProcessorPayments
'
GO
/****** Object:  Table [ConferencePayments].[ThidPartyProcessorPaymentItems]    Script Date: 09/08/2015 10:54:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferencePayments].[ThidPartyProcessorPaymentItems]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferencePayments].[ThidPartyProcessorPaymentItems](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[ThirdPartyProcessorPayment_Id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [ConferenceManagement].[SeatTypes]    Script Date: 09/08/2015 10:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[SeatTypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferenceManagement].[SeatTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ConferenceInfo_Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ConferenceManagement.SeatTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[SeatTypes]') AND name = N'IX_ConferenceInfo_Id')
CREATE NONCLUSTERED INDEX [IX_ConferenceInfo_Id] ON [ConferenceManagement].[SeatTypes] 
(
	[ConferenceInfo_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [ConferenceManagement].[SeatTypes] ([Id], [Name], [Description], [Quantity], [Price], [ConferenceInfo_Id]) VALUES (N'77afb7a1-11b7-413c-8d56-014fac9420fd', N'Red', N'Red', 100, CAST(100.00 AS Decimal(18, 2)), N'34a94f58-2f2f-428b-8153-014fac93ce7b')
/****** Object:  Table [ConferenceRegistration].[PricedOrderLinesV3]    Script Date: 09/08/2015 10:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrderLinesV3]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferenceRegistration].[PricedOrderLinesV3](
	[OrderId] [uniqueidentifier] NOT NULL,
	[Position] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[LineTotal] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[Position] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [ConferenceRegistration].[PricedOrderLinesV3] ([OrderId], [Position], [Description], [UnitPrice], [Quantity], [LineTotal]) VALUES (N'80289725-96a4-4264-9328-014fac94fd2a', 0, N'Red', CAST(100.00 AS Decimal(18, 2)), 2, CAST(200.00 AS Decimal(18, 2)))
/****** Object:  Table [ConferenceManagement].[OrderSeats]    Script Date: 09/08/2015 10:54:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[OrderSeats]') AND type in (N'U'))
BEGIN
CREATE TABLE [ConferenceManagement].[OrderSeats](
	[OrderId] [uniqueidentifier] NOT NULL,
	[Position] [int] NOT NULL,
	[Attendee_FirstName] [nvarchar](max) NULL,
	[Attendee_LastName] [nvarchar](max) NULL,
	[Attendee_Email] [nvarchar](max) NULL,
	[SeatInfoId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ConferenceManagement.OrderSeats] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[Position] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[OrderSeats]') AND name = N'IX_OrderId')
CREATE NONCLUSTERED INDEX [IX_OrderId] ON [ConferenceManagement].[OrderSeats] 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[OrderSeats]') AND name = N'IX_SeatInfoId')
CREATE NONCLUSTERED INDEX [IX_SeatInfoId] ON [ConferenceManagement].[OrderSeats] 
(
	[SeatInfoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [ConferenceManagement].[OrderSeats] ([OrderId], [Position], [Attendee_FirstName], [Attendee_LastName], [Attendee_Email], [SeatInfoId]) VALUES (N'80289725-96a4-4264-9328-014fac94fd2a', 0, N'aa', N'bb', N'a@b.com', N'77afb7a1-11b7-413c-8d56-014fac9420fd')
INSERT [ConferenceManagement].[OrderSeats] ([OrderId], [Position], [Attendee_FirstName], [Attendee_LastName], [Attendee_Email], [SeatInfoId]) VALUES (N'80289725-96a4-4264-9328-014fac94fd2a', 1, N'cc', N'dd', N'c@b.com', N'77afb7a1-11b7-413c-8d56-014fac9420fd')
/****** Object:  ForeignKey [DraftOrder_Lines]    Script Date: 09/08/2015 10:54:13 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[DraftOrder_Lines]') AND parent_object_id = OBJECT_ID(N'[ConferenceRegistration].[OrderItemsViewV3]'))
ALTER TABLE [ConferenceRegistration].[OrderItemsViewV3]  WITH CHECK ADD  CONSTRAINT [DraftOrder_Lines] FOREIGN KEY([OrderId])
REFERENCES [ConferenceRegistration].[OrdersViewV3] ([OrderId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[DraftOrder_Lines]') AND parent_object_id = OBJECT_ID(N'[ConferenceRegistration].[OrderItemsViewV3]'))
ALTER TABLE [ConferenceRegistration].[OrderItemsViewV3] CHECK CONSTRAINT [DraftOrder_Lines]
GO
/****** Object:  ForeignKey [ThirdPartyProcessorPayment_Items]    Script Date: 09/08/2015 10:54:14 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferencePayments].[ThirdPartyProcessorPayment_Items]') AND parent_object_id = OBJECT_ID(N'[ConferencePayments].[ThidPartyProcessorPaymentItems]'))
ALTER TABLE [ConferencePayments].[ThidPartyProcessorPaymentItems]  WITH CHECK ADD  CONSTRAINT [ThirdPartyProcessorPayment_Items] FOREIGN KEY([ThirdPartyProcessorPayment_Id])
REFERENCES [ConferencePayments].[ThirdPartyProcessorPayments] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferencePayments].[ThirdPartyProcessorPayment_Items]') AND parent_object_id = OBJECT_ID(N'[ConferencePayments].[ThidPartyProcessorPaymentItems]'))
ALTER TABLE [ConferencePayments].[ThidPartyProcessorPaymentItems] CHECK CONSTRAINT [ThirdPartyProcessorPayment_Items]
GO
/****** Object:  ForeignKey [FK_ConferenceManagement.SeatTypes_ConferenceManagement.Conferences_ConferenceInfo_Id]    Script Date: 09/08/2015 10:54:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[FK_ConferenceManagement.SeatTypes_ConferenceManagement.Conferences_ConferenceInfo_Id]') AND parent_object_id = OBJECT_ID(N'[ConferenceManagement].[SeatTypes]'))
ALTER TABLE [ConferenceManagement].[SeatTypes]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceManagement.SeatTypes_ConferenceManagement.Conferences_ConferenceInfo_Id] FOREIGN KEY([ConferenceInfo_Id])
REFERENCES [ConferenceManagement].[Conferences] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[FK_ConferenceManagement.SeatTypes_ConferenceManagement.Conferences_ConferenceInfo_Id]') AND parent_object_id = OBJECT_ID(N'[ConferenceManagement].[SeatTypes]'))
ALTER TABLE [ConferenceManagement].[SeatTypes] CHECK CONSTRAINT [FK_ConferenceManagement.SeatTypes_ConferenceManagement.Conferences_ConferenceInfo_Id]
GO
/****** Object:  ForeignKey [PricedOrder_Lines]    Script Date: 09/08/2015 10:54:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrder_Lines]') AND parent_object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrderLinesV3]'))
ALTER TABLE [ConferenceRegistration].[PricedOrderLinesV3]  WITH CHECK ADD  CONSTRAINT [PricedOrder_Lines] FOREIGN KEY([OrderId])
REFERENCES [ConferenceRegistration].[PricedOrdersV3] ([OrderId])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrder_Lines]') AND parent_object_id = OBJECT_ID(N'[ConferenceRegistration].[PricedOrderLinesV3]'))
ALTER TABLE [ConferenceRegistration].[PricedOrderLinesV3] CHECK CONSTRAINT [PricedOrder_Lines]
GO
/****** Object:  ForeignKey [FK_ConferenceManagement.OrderSeats_ConferenceManagement.Orders_OrderId]    Script Date: 09/08/2015 10:54:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[FK_ConferenceManagement.OrderSeats_ConferenceManagement.Orders_OrderId]') AND parent_object_id = OBJECT_ID(N'[ConferenceManagement].[OrderSeats]'))
ALTER TABLE [ConferenceManagement].[OrderSeats]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceManagement.OrderSeats_ConferenceManagement.Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [ConferenceManagement].[Orders] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[FK_ConferenceManagement.OrderSeats_ConferenceManagement.Orders_OrderId]') AND parent_object_id = OBJECT_ID(N'[ConferenceManagement].[OrderSeats]'))
ALTER TABLE [ConferenceManagement].[OrderSeats] CHECK CONSTRAINT [FK_ConferenceManagement.OrderSeats_ConferenceManagement.Orders_OrderId]
GO
/****** Object:  ForeignKey [FK_ConferenceManagement.OrderSeats_ConferenceManagement.SeatTypes_SeatInfoId]    Script Date: 09/08/2015 10:54:15 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[FK_ConferenceManagement.OrderSeats_ConferenceManagement.SeatTypes_SeatInfoId]') AND parent_object_id = OBJECT_ID(N'[ConferenceManagement].[OrderSeats]'))
ALTER TABLE [ConferenceManagement].[OrderSeats]  WITH CHECK ADD  CONSTRAINT [FK_ConferenceManagement.OrderSeats_ConferenceManagement.SeatTypes_SeatInfoId] FOREIGN KEY([SeatInfoId])
REFERENCES [ConferenceManagement].[SeatTypes] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[ConferenceManagement].[FK_ConferenceManagement.OrderSeats_ConferenceManagement.SeatTypes_SeatInfoId]') AND parent_object_id = OBJECT_ID(N'[ConferenceManagement].[OrderSeats]'))
ALTER TABLE [ConferenceManagement].[OrderSeats] CHECK CONSTRAINT [FK_ConferenceManagement.OrderSeats_ConferenceManagement.SeatTypes_SeatInfoId]
GO
