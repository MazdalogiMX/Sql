Update RFQD
set RFQD.diasTranscurridos = Isnull([dbo].[DiasLaborablesSelb](isnull(RFQD.RFQCambio,RFQE.FechaSolicitud),fechaTablaComparativa),isnull(RFQD.diasTranscurridos,0)),
RFQD.diasTablaComparativa = isnull([dbo].[DiasLaborablesSelb](RFQD.FechaCotizacion,RFQD.fechaTablaComparativa),isnull(RFQD.diasTablaComparativa,0))

FROM [dbo].[RFQ_Detalle] RFQD With (NoLock)
Inner join [dbo].[RFQ_Encabezado] RFQE With (NoLock) on (RFQD.idRfq = RFQE.IdRFQ)
Where RFQE.Estatus in (10,11)
