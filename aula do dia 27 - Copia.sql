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

ALTER TABLE produto
ADD constraint fk_produto_fornecedor
foreign key (idfornecedor)
references fornecedor (idfornecedor);

-- Adicidonado o campo "idcliente" na tabela Venda
ALTER TABLE venda
ADD COLUMN idcliente int not null;

-- Adicionando o relacionamento entre as tabelas venda, cliente e funcionario
ALTER TABLE venda
ADD CONSTRAINT fk_venda_funcionario
foreign key (idfuncionario)
references funcionario (idfuncionario), -- essa virgula significa que vc vai add outro relacionamento na proxima linha entre venda e o cliente
ADD CONSTRAINT fk_venda_cliente -- add relacionamento entre venda e cliente
FOREIGN KEY (idcliente)
REFERENCES cliente (idcliente);

-- SELECIONANDO DADOS EM MULTIPLAS TABELAS
SELECT descricao, preco, categoria, fantasia FROM produto, fornecedor
WHERE produto.idfornecedor = fornecedor.idfornecedor;

-- Tres tabelas
SELECT descricao, preco, categoria, quantidade, fantasia
FROM produto, fornecedor, estoque
where produto.idfornecedor = fornecedor.idfornecedor
and produto.idproduto = estoque.idproduto
order by descricao;

-- Duas tabelas
SELECT idcompra, datacompra, nome FROM compra, funcionario
WHERE compra.idfuncionario = funcionario.idfuncionario;

SELECT idcompra, datacompra, nome FROM compra, funcionario
WHERE compra.idfuncionario = funcionario.idfuncionario
AND YEAR(datacompra) = 2023 -- selecionando as compras do ano de 2023
AND MONTH(datacompra) >= 06 -- selecionando  o mes da compra 
AND MONTH(datacompra) <= 09;

























SELECT * FROM dbturma414.item_da_compra;
