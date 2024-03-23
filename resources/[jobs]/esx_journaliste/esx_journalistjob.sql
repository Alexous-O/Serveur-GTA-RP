INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_Weazel_News', 'Journaliste', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_Weazel_News', 'Journaliste', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('Journalist', 'Journaliste')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('Journalist',0,'recrue','Recrue',12,'{}','{}'),
	('Journalist',1,'novice','Novice',24,'{}','{}'),
	('Journalist',2,'experimente','Experimente',36,'{}','{}'),
	('Journalist',3,'chief',"Chef d\'équipe",48,'{}','{}'),
	('Journalist',4,'boss','Patron',0,'{}','{}')
;