INSERT INTO `pessoa` (`id`, `endereco`, `nome`, `telefone`) 
VALUES ('3', 'Rua X', 'Alexsandro', '99999');

SELECT id, endereco, nome, telefone 
FROM pessoa;

UPDATE `pessoa` SET `endereco`='Moro Aqui',`nome`='Alexsandro';
WHERE id = '2'

DELETE FROM pessoa WHERE id = 3";


