DROP VIEW IF EXISTS Professor_Teaches_Section;
CREATE VIEW Professor_Teaches_Section AS SELECT * FROM (
SELECT first_name, last_name, phone_number, research_interests, email, prof_alias_id, prof_email_alias, id_sections, section_name, instructor, alias, title, phone, office, `type`, days, `start`, `end`, location, department 
FROM (
	SELECT * FROM Professors 
	JOIN (SELECT id AS prof_alias_id, substring_index(email, "@", 1) AS prof_email_alias FROM Professors) AS ProfAlias
	ON Professors.id = ProfAlias.prof_alias_id
) AS ProfWithAlias
JOIN Sections
ON Sections.alias = ProfWithAlias.prof_email_alias
) AS Professor_Teaches_Section
