CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `new_store`.`all_in_one` AS
    SELECT 
        CONCAT(`c`.`first_name`, ' ', `c`.`last_name`) AS `full_name`,
        `c`.`id_client` AS `id_client`,
        `c`.`state` AS `state`,
        `t`.`id_transaction` AS `id_transaction`,
        `p`.`unit_price` AS `unit_price`,
        `t`.`quantity` AS `quantity`,
        (`p`.`unit_price` * `t`.`quantity`) AS `order_value`,
        `p`.`name` AS `name`
    FROM
        ((`new_store`.`customers` `c`
        JOIN `new_store`.`transactions` `t` ON ((`c`.`id_client` = `t`.`id_client`)))
        JOIN `new_store`.`products` `p` ON ((`t`.`id_product` = `p`.`id_product`)))