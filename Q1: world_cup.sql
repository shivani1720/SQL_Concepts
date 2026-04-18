CREATE TABLE icc_world_cup (
  Team_1 VARCHAR(20),
  Team_2 VARCHAR(20),
  Winner VARCHAR(20)
  );

INSERT INTO icc_world_cup values('India', 'SL', 'India');
INSERT INTO icc_world_cup values('West Indies', 'SA', 'SA');
INSERT INTO icc_world_cup values('Pakistan', 'India', 'India');
INSERT INTO icc_world_cup values('Australia', 'India', 'Australia');


QUESTION: I want the output as Team_Name, No of matches_played, No_of_wins, No_of_losses

SELECT team_name, count(1) as no_of_matches_played, SUM(win_flag) as no_of_matches_won, 
count(1) - SUM(win_flag) as no_of_losses
FROM
(  
SELECT Team_1 as team_name, 
  CASE 
    WHEN Team_1 = Winner then 1 
    ELSE 0 
  END AS win_flag
FROM icc_world_cup
UNION ALL
SELECT Team_2 as team_name,
  CASE
    WHEN Team_2 = Winner then 1
    ELSE 0
END AS win_flag
FROM icc_world_cup ) A
GROUP BY team_name
ORDER BY no_of_matches_won DESC
