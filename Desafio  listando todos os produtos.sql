DECLARE @CODIGO VARCHAR(10);
DECLARE @NOME VARCHAR(50);
DECLARE @NUMERO_PRODUTOS INT;
DECLARE @I INT;

SELECT @NUMERO_PRODUTOS = COUNT(*) FROM [TABELA DE PRODUTOS];
SET @I = 1;
WHILE @I <= @NUMERO_PRODUTOS
BEGIN
   SELECT @CODIGO = X.[CODIGO DO PRODUTO], @NOME = X.[NOME DO PRODUTO]
   FROM ( SELECT Row_Number() Over (Order By [CODIGO DO PRODUTO]) as RowNum, * from [TABELA DE PRODUTOS]) X
   WHERE X.RowNum = @I;
   PRINT 'Vendas para ' + @CODIGO + ' - ' + @NOME ;
   SET @I = @I + 1;
END;