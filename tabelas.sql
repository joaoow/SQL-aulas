USE dbturma414;

SELECT * FROM cliente;

-- Criando relacionamento entre as tabelas compra e funcionario
ALTER TABLE compra  -- Alter altera as estrutura fisica (altere a tabela compra)
ADD CONSTRAINT fk_compra_funcionario -- Chave estrangeira entre compra e funcionario
FOREIGN KEY (idfuncionario) -- Quem é a chave estrangeira na tabela compra
REFERENCES funcionario (idfuncionario); -- A chave estrangeira está relacionado a tabela funcionario

-- Alterando a tabela estoque
ALTER TABLE estoque -- Altere a tabela estoque
ADD CONSTRAINT fk_estoque_produto 
FOREIGN KEY (idproduto) 
REFERENCES produto (idproduto);

-- Alterando a tabela compra
ALTER TABLE item_da_compra
ADD CONSTRAINT fk_item_da_compra_compra
FOREIGN KEY (idcompra) 
REFERENCES compra (idcompra),
ADD CONSTRAINT fk_item_da_compra_produto
FOREIGN KEY (idproduto)
REFERENCES produto (idproduto);

-- Alterando a tabela item da venda
ALTER TABLE item_da_venda
ADD CONSTRAINT fk_item_da_venda_venda
FOREIGN KEY (idvenda) 
REFERENCES venda (idvenda),
ADD CONSTRAINT fk_item_da_venda_produto
FOREIGN KEY (idproduto)
REFERENCES produto (idproduto);










