select nome, sum(quantidade) as "total de itens",
sum(quantidade * preco) as "valor total"
from cliente, item_da_venda, venda
where cliente.idcliente = venda.idcliente
and item_da_venda.idvenda = venda.idvenda
group by nome;

select * from item_da_venda;
select * from venda;

-- Criar uma lista que apresente o total vendido por funcionário.alter
select nome, sum(preco * quantidade) as "total vendido"
from funcionario, item_da_venda, venda -- vem de 
where funcionario.idfuncionario = item_da_venda.idvenda
and venda.idfuncionario = item_da_venda.idvenda
group by nome;

-- criar uma lista que apresenta a quantidade total de produto por fornecedor.

select fantasia as fornecedor,sum(quantidade) as "total de produto"
from fornecedor, produto, estoque
where fornecedor.idfornecedor = produto.idfornecedor
and produto.idproduto = estoque.idproduto
group by fantasia;

-- Criar uma lista de produtos vendidos por funcionario,contendo o nome
-- do funcionario, nome do produto, data da venda, quantidade vendida e subtotal.

select nome, descricao, datavenda, quantidade, quantidade * item_da_venda.preco as subtotal
from funcionario, produto, venda, item_da_venda
where funcionario.idfuncionario = venda.idfuncionario
and item_da_venda.idproduto = produto.idproduto;


