SELECT * FROM estoque;
SELECT * FROM produto;


SELECT categoria, count(idproduto) as quantidade -- Conte quantos produtos de categoria existe conte o id produto
FROM produto -- Da tabela produto
GROUP BY categoria; -- Agrupando a categoria


-- O setor tal tem tantos itens
SELECT setor, sum(quantidade) as  "quantidade total" -- mando somar a quantidade e chamo ela de quantidade total
FROM estoque -- Da tabela estoque
GROUP BY setor -- Agrupa o setor 
ORDER BY setor; -- coloca em ordem de A - Z a coluna setor

-- Liste a data da compra e o nome do funcionario no lugar do id
SELECT * FROM compra;
SELECT idcompra, datacompra, nome
FROM compra, funcionario
WHERE compra.idfuncionario  = funcionario.idfuncionario;

-- Liste o total de compra
SELECT nome, count(idcompra) as "total de compras"
FROM compra, funcionario
WHERE compra.idfuncionario = funcionario.idfuncionario
group by nome;

-- Uma listagem contendo nome do produto, quantidade em estoque
-- preço e subtotal(preço x quantidade).
SELECT descricao, quantidade, preco, preco*quantidade as subtotal
FROM produto, estoque
WHERE produto.idproduto = estoque.idproduto;

-- Exibir a receita total (soma do subtotal) contida no estoque da empresa
SELECT sum(preco*quantidade) as subtotal
FROM produto, estoque
where produto.idproduto = estoque.idproduto;

-- Uma lista com a relacao de produtos e o total comprado de cada um.
select descricao, sum(quantidade * item_da_compra.preco) as "total comprado"
from produto, item_da_compra as item_da_compra 
where produto.idproduto = item_da_compra.idproduto
group by item_da_compra.idproduto;

select * from item_da_compra;


-- ALGUMAS FUNÇOES DE AGREGAÇÂoffline
-- sum, count, max, min e avg

-- Criar uma listagem de compras agrupada
-- Por funcionario, exibindo o tatal
-- comprado por funcionario

SELECT nome, sum(quantidade * preco) as "total comprado"
FROM funcionario, item_da_compra, compra
WHERE funcionario.idfuncionario = compra.idfuncionario
AND compra.idcompra = item_da_compra.idcompra 
group by nome; 

-- Crie uma listagem de produtos por quantidade comprada
select descricao, sum(quantidade) as "total comprado"
from produto, item_da_compra  
where produto.idproduto = item_da_compra.idproduto
group by descricao;                                                

-- Crie uma listagem de total de compras por fornecedor

select fantasia, sum(quantidade*ic.preco) as "total de compra"
from fornecedor, produto, item_da_compra as ic
where fornecedor.idfornecedor = produto.idfornecedor
and produto.idproduto = ic.idproduto
group by fantasia;

-- Crie uma listagem de total de compras e quantidade de compras por fornecedor

select fantasia, count(quantidade*ic.preco) as "quantidade total", 
count(fantasia) as "quantidade de compras"
from fornecedor, produto, item_da_compra as ic
where fornecedor.idfornecedor = produto.idfornecedor
and produto.idproduto = ic.idproduto
group by fantasia;

select * from venda;

SELECT * FROM item_da_venda;


 select datavenda, funcionario.nome, descricao, quantidade, 
 item_da_venda.preco,  item_da_venda.preco * quantidade as subtotal, -- Adicionando um subtotal ,
 cliente.nome
 from venda, funcionario, produto, item_da_venda, cliente -- De onde vem os dados selecionados acima
 where venda.idfuncionario = funcionario.idfuncionario -- como essas tabelas se relacionam 
 and venda.idcliente = cliente.idcliente
 and venda.idvenda = item_da_venda.idvenda
 and item_da_venda.idproduto = produto.idproduto;
 
 
 /* Criar uma lista de total por produto vendido, exibindo
 o nome do produto, a quantidade total vendida e o valor total vendido (quantidade * preco) */
 select descricao, sum(quantidade) as "qtd total", -- somando a quantidade vendida
 sum(quantidade)*item_da_venda.preco as total -- somando a quantidade vendida vezes o preco
 from produto, item_da_venda -- de onde vem
 where produto.idproduto = item_da_venda.idproduto
 group by descricao;
 
 
/* -- criar uma lista de total vendido por cliente, exibindo
 nome do cliente, quantidade de itens vendidos e o valor total da venda para o cliente */
 select descricao, sum(quantidade) as "qtd total",
 sum
 from cliente, item_da_venda, venda












