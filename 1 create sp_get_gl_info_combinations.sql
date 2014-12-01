CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_gl_info_combinations`(IN business_info_id int, IN gl_sub_account_info_id int )
BEGIN

select * FROM (gl_info_combinations gic)
LEFT JOIN gl_category_info gc ON gic.gl_category_info_id = gc.gl_category_info_id
LEFT JOIN gl_sub_category_info gsc ON gic.gl_sub_category_info_id = gsc.gl_sub_category_info_id
LEFT JOIN gl_account_info ga ON gic.gl_account_info_id = ga.gl_account_info_id
LEFT JOIN gl_sub_account_info gs ON gic.gl_sub_account_info_id = gs.gl_sub_account_info_id
WHERE gic.business_info_id = business_info_id
AND gic.gl_sub_account_info_id = gl_sub_account_info_id
ORDER BY gic.gl_category_info_id, gic.gl_sub_category_info_id, gic.gl_account_info_id ASC;

END
