SELECT DISTINCT m.title, 
                m.year 
FROM   movies m, 
       genres g, 
       actors a, 
       mov_act mc 
WHERE  m.movieid = g.movieid 
       AND g.movieid = mc.movieid 
       AND mc.actorid = a.actorid 
       AND genre IN(SELECT DISTINCT genre 
                    FROM   movies m, 
                           genres g, 
                           actors a, 
                           mov_act mc 
                    WHERE  m.movieid = g.movieid 
                           AND g.movieid = mc.movieid 
                           AND mc.actorid = a.actorid 
                           AND ( m.title, m.year ) = (SELECT title, 
                                                             year 
                                                      FROM   movies 
                                                      GROUP  BY title, 
                                                                year 
                                                      HAVING 
                               Levenshtein(title, 'Th Drk Knght') 
                               <= 3 
                                                      ORDER  BY Levenshtein( 
                                                                title, 
                                                                'Th Drk Knght'), title, year 
                                                      LIMIT  1 offset 1)) 
       AND a.name IN(SELECT DISTINCT name 
                     FROM   movies m, 
                            genres g, 
                            actors a, 
                            mov_act mc 
                     WHERE  m.movieid = g.movieid 
                            AND g.movieid = mc.movieid 
                            AND mc.actorid = a.actorid 
                            AND ( m.title, m.movieid ) = 
                                (SELECT title, 
                                        movieid 
                                 FROM   movies 
                                 GROUP  BY title, 
                                           movieid 
                                 HAVING 
                                Levenshtein(title, 'Th Drk Knght') 
                                <= 3 
                                                          ORDER  BY 
                                Levenshtein( 
                                title, 
                                'Th Drk Knght'), title, movieid 
                                                          LIMIT  1 offset 1) 
                     LIMIT  2) 
LIMIT  10; 