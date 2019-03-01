export DVK_PWD="/home/dna/domains/starter.wordpress.davask.com/public_html";
 rm $DVK_PWD/backups/localhost.starter-fr.sql;
 mysqldump -u dna -p starter-fr > $DVK_PWD/backups/localhost.starter-fr.sql;
 sed -e s/starter\.wordpress\.davask\.com/demo.wordpress.davask.com/g $DVK_PWD/backups/localhost.starter-fr.sql > $DVK_PWD/backups/localhost.demo.sql;
 rm $DVK_PWD/dvk.backups/s.localhost.starter-fr.*;
 split -C 50m --numeric-suffixes $DVK_PWD/backups/localhost.starter-fr.sql $DVK_PWD/dvk.backups/s.localhost.starter-fr.;
 rm $DVK_PWD/dvk.backups/s.localhost.demo.*;
 split -C 50m --numeric-suffixes $DVK_PWD/backups/localhost.demo.sql $DVK_PWD/dvk.backups/s.localhost.demo.;
 cp $DVK_PWD/wp-config.php $DVK_PWD/dvk.backups/wp-config.starter.php;
 cp $DVK_PWD/robots.txt $DVK_PWD/dvk.backups/robots.starter.txt;
 sed -e s/starter\.wordpress\.davask\.com/demo.wordpress.davask.com/g $DVK_PWD/dvk.backups/robots.starter-fr.txt > $DVK_PWD/dvk.backups/robots.demo.txt;
 git add --all && git commit -am "backup latest version starter" && git push origin starter;
