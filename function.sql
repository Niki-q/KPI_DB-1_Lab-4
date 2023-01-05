DROP FUNCTION IF EXISTS get_episodes_by_prod_id(varchar(40));
CREATE OR REPLACE FUNCTION get_episodes_by_prod_id(product_id varchar(40))
RETURNS TABLE (id_code char, title char, audio_length_in_seconds int, publication_date date)
LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
		SELECT ep_id AS id_code, ep_title AS title, ep_audio_lenth AS audio_length_in_seconds , ep_pub_date AS publication_date 
		FROM Episodes WHERE TRIM(product_id) = TRIM(podc_id) 
		ORDER BY publication_date;
END;
$$;

SELECT * FROM get_episodes_by_prod_id('c2089afc563a41afb00353d2a1359db6');