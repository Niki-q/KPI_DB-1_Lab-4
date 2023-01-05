DROP TRIGGER IF EXISTS episode_publisher ON Episodes;

CREATE OR REPLACE FUNCTION episode_publisher_func() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
     BEGIN
          UPDATE Episodes 
          SET ep_pub_date = CURRENT_DATE
		  WHERE Episodes.ep_id = NEW.ep_id;
		  RETURN NULL;
     END;
$$;

CREATE TRIGGER episode_publisher
AFTER INSERT ON Episodes
FOR EACH ROW EXECUTE FUNCTION episode_publisher_func();

INSERT INTO  Authors(auth_id, auth_name, auth_country, auth_date_birth)
VALUES('5775758', 'Dan Kendall', 'USA', '05-10-1985');

INSERT INTO  Podcasts(podc_id, auth_id, podc_title, podc_language)
VALUES('1000000002', '5775758', 'Digital Health Today', 'English');

INSERT INTO  Episodes(ep_id, podc_id, ep_title, ep_audio_lenth)
VALUES('4000000000001', '1000000002', 'Hello world', '3776');
 
INSERT INTO  Episodes(ep_id, podc_id, ep_title, ep_audio_lenth)
VALUES('4000000000002', '1000000002', 'It is my 4 laboratory work on SQL', '2507');

-- DELETE FROM Episodes where ep_id = '4000000000001';
-- DELETE FROM Episodes where ep_id = '4000000000002';
-- DELETE FROM Podcasts  where podc_id = '1000000002';
-- DELETE FROM Authors  where auth_id = '5775758';

SELECT * FROM Episodes ORDER BY ep_pub_date DESC