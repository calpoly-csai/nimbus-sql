DROP VIEW IF EXISTS Profs;
CREATE VIEW Profs
AS SELECT DISTINCT a.first_name, a.last_name, a.phone_number, a.email, c.title, c.department, b.office, b.office_hours, b.platform, b.latest_quarter, b.name, a.research_interests
FROM Professors a, OfficeHours b, Sections c
WHERE (substring_index(a.email, "@", 1) = c.alias)
AND (substring_index(b.email, "@", 1) = c.alias);
