USE [Compras]
GO
/****** Object:  StoredProcedure [dbo].[RfqListadoSelg]    Script Date: 29/09/2022 11:35:09 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[RfqListadoSelg]
@Fecha Datetime,
@Autorizador int
as
Begin

SELECT RFQE.IdRFQ,
	   RFQE.Descripcion,
	   CU.nombreUsuario Solicitante,
	   CE.NomEstatus as Estatus,
	   Ca.NomArea Area
FROM [dbo].[RFQ_Encabezado] RFQE With (NoLock) 
Inner Join [dbo].[RelUsuarioArea] RUA With (NoLock)  on (RFQE.IdUsuario = RUA.Idusuario)
Inner Join [dbo].[CatAreas] CA With (NoLock)  on (RUA.ClaArea = CA.ClaArea)
Inner Join [dbo].[CatUsuarios] CU With (NoLock)  on (RFQE.IdUsuario = CU.Idusuario)
Inner join [dbo].[CatEstatus] CE With (NoLock) on (RFQE.Estatus = CE.idEstatus)
Where
Format(RFQE.FechaSolicitud,'MMyyyy')  = format(@fecha,'MMyyyy')  
and 
(RUA.ClaManager = @Autorizador or RUA.ClaGManager=@Autorizador)
and RFQE.Estatus=12

end 



