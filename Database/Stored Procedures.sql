USE [MURK]
GO
/****** Object:  StoredProcedure [dbo].[ALTA_ARTICULO]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ALTA_ARTICULO]
@NOM VARCHAR(50),
@DES VARCHAR(50),
@CAT INT,
@PC MONEY,
@PR MONEY,
@PROV INT
AS INSERT INTO Articulos
VALUES(@NOM,@DES,@CAT,@PC,@PR,@PROV,'0','1')

GO
/****** Object:  StoredProcedure [dbo].[ALTA_CATEGORIA]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ALTA_CATEGORIA]
@cat varchar(50)
as insert into Categoria
values(@cat,'1')
GO
/****** Object:  StoredProcedure [dbo].[ALTA_COMPAÑIA]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_COMPAÑIA]
@NOM VARCHAR(50),
@DIRECCION VARCHAR(50),@MUN VARCHAR(50),
@EST VARCHAR (50),
@CP VARCHAR(10), 
@PAIS VARCHAR(50),
@RFC VARCHAR(50)
AS INSERT INTO COMPAÑIA
VALUES(@NOM,@DIRECCION,@MUN,@EST,@CP,@PAIS,@RFC,'1')
GO
/****** Object:  StoredProcedure [dbo].[ALTA_GENERO]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_GENERO]
@GEN VARCHAR(50)
AS INSERT INTO Genero
VALUES(@GEN,'1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_LIBRO]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ALTA_LIBRO]
@ISBN VARCHAR(50),
@TIT VARCHAR(50),
@EDIT VARCHAR(50),
@AUTOR VARCHAR(50),
@ID_GEN INT,
@NO_P INT,
@EDICION INT, 
@IDIOMA  VARCHAR(50),
@PRECIO MONEY,
@STOCK INT
AS INSERT INTO Libro
VALUES(@ISBN,@TIT,@EDIT,@AUTOR,@ID_GEN,@NO_P,@EDICION,@IDIOMA,@PRECIO,@STOCK,'1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_PERSONA]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_PERSONA]
@NOM VARCHAR(50),@AP VARCHAR(50),@AM VARCHAR(50),@FN DATE,@DIR VARCHAR(50),@COL VARCHAR(50),
@MUN VARCHAR(50),@EST VARCHAR(50),@EMAIL VARCHAR(50),@TEL BIGINT
AS INSERT INTO Personas VALUES(@NOM,@AP,@AM,@FN,@DIR,@COL,@MUN,@EST,@EMAIL,@TEL,'1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_PROVEEDOR]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_PROVEEDOR]
@NOM VARCHAR(50),@AP VARCHAR(50),@EMAIL VARCHAR(50),@TEL BIGINT,@COMP int
AS INSERT INTO Provedor VALUES(@NOM,@AP,@EMAIL,@TEL,@COMP,'1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_RECARGO]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_RECARGO]
@ID_PRESTAMO INT,
@DIAS INT,
@RECARGO MONEY,
@ESTADO VARCHAR(50)
AS INSERT INTO Recargos
VALUES(@ID_PRESTAMO,@DIAS,@RECARGO,@ESTADO,'1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_RFID_LIBRO]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_RFID_LIBRO]
@RFID  VARCHAR(50),
@ID_LIBRO INT
AS INSERT INTO Libro_rfid 
VALUES(@RFID,@ID_LIBRO,'1','1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_TIPO_USUARIO]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_TIPO_USUARIO]
@TIPO VARCHAR(50)
AS INSERT INTO Tipo_usuario
VALUES (@TIPO,'1')


GO
/****** Object:  StoredProcedure [dbo].[ALTA_USUARIO]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ALTA_USUARIO]
@RFID VARCHAR(50),
@IDP INT,
@IDT INT
AS INSERT INTO Usuarios 
VALUES(@RFID,@IDP,@IDT,'1')


GO
/****** Object:  StoredProcedure [dbo].[BuscarLogin]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarLogin]
@rfid varchar(50)
as
SELECT Usuarios.Id_tipo_usuario, Usuarios.Status, Personas.Nombre FROM Usuarios, Tipo_usuario, Personas WHERE Personas.Id = Usuarios.Id_persona AND Usuarios.Id_tipo_usuario = Tipo_usuario.Id AND Usuarios.Rfid = @rfid

GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR_ARTICULO]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELIMINAR_ARTICULO]
@ID INT
AS UPDATE Articulos
SET Status = 0
WHERE Id = @ID

GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR_PROVEEDOR]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ELIMINAR_PROVEEDOR]
@ID INT
AS UPDATE Provedor
SET Status = 0
WHERE Id=@ID

GO
/****** Object:  StoredProcedure [dbo].[LISTAR_CATEGORIAS]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LISTAR_CATEGORIAS]
AS
SELECT Id, Nombre FROM Categoria
WHERE Status = 1;
GO
/****** Object:  StoredProcedure [dbo].[LISTAR_COMPAÑIAS]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LISTAR_COMPAÑIAS]
AS
SELECT ID, NOMBRE FROM Compañia WHERE Status = 1

GO
/****** Object:  StoredProcedure [dbo].[LISTAR_PROVEEDORES]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LISTAR_PROVEEDORES]
AS
SELECT P.Id, C.Nombre +' - '+ P.Nombre +' '+ P.Apellido as Proveedor 
FROM Provedor as P, Compañia as C
WHERE C.Id = P.Id_compañia
AND C.Status = 1
AND p.Status = 1;
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Login]
@RFID varchar(50)
as
select * from Usuarios where Usuarios.Rfid like @RFID
GO
/****** Object:  StoredProcedure [dbo].[MOD_ARTICULOS]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MOD_ARTICULOS]
@ID INT,
@NOM VARCHAR(50),
@DES VARCHAR(50),
@CAT INT,
@PC MONEY,
@PR MONEY,
@PROV INT
AS UPDATE Articulos
SET NOMBRE=@NOM, Descripcion=@DES ,Id_categoria=@CAT, Precio_compra=@PC, Precio_renta=@PR,Id_provedor=@PROV
WHERE Id = @ID
GO
/****** Object:  StoredProcedure [dbo].[MOD_PROVEEDOR]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MOD_PROVEEDOR]
@ID INT,@NOM VARCHAR(50),@AP VARCHAR(50),@EMAIL VARCHAR(50),@TEL BIGINT,@COMP INT
AS UPDATE Provedor SET Nombre=@NOM,Apellido= @AP,Correo=@EMAIL, Telefono=@TEL, Id_compañia=@COMP
WHERE Id=@ID

GO
/****** Object:  View [dbo].[V_ARTICULOS]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_ARTICULOS]
AS
SELECT        A.Id, A.Nombre, A.Descripcion, dbo.Categoria.Nombre AS Categoria, A.Precio_renta AS [Precio de Renta], A.Stock, P.Nombre AS Proveedor, C.Nombre AS Compañia
FROM            dbo.Articulos AS A INNER JOIN
                         dbo.Provedor AS P ON A.Id_provedor = P.Id INNER JOIN
                         dbo.Compañia AS C ON P.Id_compañia = C.Id INNER JOIN
                         dbo.Categoria ON A.Id_categoria = dbo.Categoria.Id
WHERE        (A.Status = 1)

GO
/****** Object:  View [dbo].[V_INVENTARIO]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_INVENTARIO]
AS
SELECT        AR.Rfid, A.Nombre, A.Descripcion, C.Nombre AS Categoria, AR.Disponible
FROM            dbo.Articulo_rfid AS AR INNER JOIN
                         dbo.Articulos AS A ON AR.Id_articulo = A.Id INNER JOIN
                         dbo.Categoria AS C ON A.Id_categoria = C.Id
WHERE        (AR.Status = 1) AND (A.Status = 1)

GO
/****** Object:  View [dbo].[V_PROVEEDORES]    Script Date: 26/07/2018 07:46:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_PROVEEDORES]
AS
SELECT        P.Id, P.Nombre, P.Apellido, P.Correo, P.Telefono, C.Nombre AS Compañia, C.Direccion, C.Estado, C.Pais
FROM            dbo.Provedor AS P INNER JOIN
                         dbo.Compañia AS C ON P.Id_compañia = C.Id
WHERE        (C.Status = 1) AND (P.Status = 1)

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[41] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Categoria"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ARTICULOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_ARTICULOS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AR"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_INVENTARIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_INVENTARIO'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 13
               Left = 334
               Bottom = 143
               Right = 504
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PROVEEDORES'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_PROVEEDORES'
GO
