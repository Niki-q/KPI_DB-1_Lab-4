DROP PROCEDURE IF EXISTS del_podcast_by_language(varchar(50));
CREATE OR REPLACE PROCEDURE del_podcast_by_language(lang_name varchar(50))
LANGUAGE 'plpgsql'
AS $$

BEGIN
	DELETE FROM episodes WHERE TRIM(episodes.podc_id) IN (SELECT TRIM(podc_id) FROM podcasts WHERE TRIM(podc_language) = TRIM(lang_name));
	DELETE FROM podcasts WHERE TRIM(podcasts.podc_language) = TRIM(lang_name);
END;
$$;

-- Виклик процедури
CALL del_podcast_by_language('English');
