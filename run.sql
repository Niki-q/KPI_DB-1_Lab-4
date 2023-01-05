-- Виклик функції
SELECT * FROM get_episodes_by_prod_id('c2089afc563a41afb00353d2a1359db6');

-- Виклик процедури
CALL del_podcast_by_language('English');

-- Перевірка тригера
INSERT INTO  Authors(auth_id, auth_name, auth_country, auth_date_birth)
VALUES('5775758', 'Dan Kendall', 'USA', '05-10-1985');

INSERT INTO  Podcasts(podc_id, auth_id, podc_title, podc_language)
VALUES('1000000002', '5775758', 'Digital Health Today', 'English');

INSERT INTO  Episodes(ep_id, podc_id, ep_title, ep_audio_lenth)
VALUES('4000000000001', '1000000002', 'Hello world', '3776');
 
INSERT INTO  Episodes(ep_id, podc_id, ep_title, ep_audio_lenth)
VALUES('4000000000002', '1000000002', 'It is my 4 laboratory work on SQL', '2507');

SELECT * FROM Episodes ORDER BY ep_pub_date DESC

