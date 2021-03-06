CREATE OR REPLACE FUNCTION log_update() 
  RETURNS trigger AS 
$$ 
BEGIN 
INSERT INTO LOG 
 (LID, OLDPRICE, NEWPRICE, LTYPE, LDATE)  
VALUES  
(OLD.BID, OLD.BPRICE, NEW.BPRICE,'ОБНОВЛЕНО',SYSDATE); 
RETURN NEW; 
END; 
$$ 
LANGUAGE 'plpgsql'; 
 
CREATE OR REPLACE TRIGGER log_trig 
  AFTER UPDATE 
  ON BOOK 
  FOR EACH ROW 
  EXECUTE FUNCTION log_update();