SELECT 
    AHO_CODIGO_COO,
    SUM(CASE WHEN aho_tipo_cta = 1 THEN TRA_MTO_DEPOSITO + TRA_MTO_INTERES - TRA_MTO_RETIRO - TRA_MTO_ISR ELSE 0 END) AS SALDO_TIPO,
    SUM(CASE WHEN aho_tipo_cta = 3 THEN TRA_MTO_DEPOSITO + TRA_MTO_INTERES - TRA_MTO_RETIRO - TRA_MTO_ISR ELSE 0 END) AS SALDO_TIPO_3
FROM 
    DBA.AHORROS 
    INNER JOIN DBA.TRANS_AHORRO ON TRA_CODIGO_CTA = AHO_CODIGO_CTA
WHERE 
    tra_fecha_trans BETWEEN '2023-01-01' AND '2024-12-30'
    AND aho_tipo_cta IN (1, 3)
    --AND AHO_CODIGO_COO = 30000007
GROUP BY 
    AHO_CODIGO_COO;