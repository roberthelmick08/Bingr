-- MySQL dump 10.13  Distrib 5.5.54, for Linux (x86_64)
--
-- Host: localhost    Database: bingesync
-- ------------------------------------------------------
-- Server version	5.5.54

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `img_url` varchar(300) DEFAULT NULL,
  `episode_number` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_episodes_seasons1_idx` (`season_id`),
  CONSTRAINT `fk_episodes_seasons1` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,'Ep 1 GOS','Episode 1',NULL,1,3),(2,'Ep 2 GOS','Episode 2',NULL,2,3),(3,'Ep 1 GOS','Episode 1',NULL,1,4),(4,'Ep 2 GOS','Episode 2',NULL,2,4),(5,'Ep 1 ST','Episode 1',NULL,1,1),(6,'Ep 2 ST','Episode 2',NULL,2,1),(7,'Ep 1 ST','Episode 1',NULL,1,2),(8,'Ep 2ST','Episode 2',NULL,2,2),(9,'Winter Is Coming','Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon\'s place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.','',1,5),(10,'The Kingsroad','While Bran recovers from his fall, Ned takes only his daughters to Kings Landing. Jon Snow goes with his uncle Benjen to The Wall. Tyrion joins them.','',2,5),(11,'Lord Snow','Lord Stark and his daughters arrive at King\'s Landing to discover the intrigues of the king\'s realm.','',3,5),(12,'Cripples, Bastards, and Broken Things','Eddard investigates Jon Arryn\'s murder. Jon befriends Samwell Tarly, a coward who has come to join the Night\'s Watch.','',4,5),(13,'The Wolf and the Lion','Catelyn has captured Tyrion and plans to bring him to her sister, Lysa Arryn, at The Vale, to be tried for his, supposed, crimes against Bran. Robert plans to have Daenerys killed, but Eddard refuses to be a part of it and quits.','',5,5),(14,'A Golden Crown','While recovering from his battle with Jamie, Eddard is forced to run the kingdom while Robert goes hunting. Tyrion demands a trial by combat for his freedom. Viserys is losing his patience with Drogo.','',6,5),(15,'You Win or You Die','Robert has been injured while hunting and is dying. Jon and the others finally take their vows to the Night\'s Watch. A man, sent by Robert, is captured for trying to poison Daenerys. Furious, Drogo vows to attack the Seven Kingdoms.','',7,5),(16,'The Pointy End','Eddard and his men are betrayed and captured by the Lannisters. When word reaches Robb, he plans to go to war to rescue them. The White Walkers attack The Wall. Tyrion returns to his father with some new friends.','',8,5),(17,'Baelor','Robb goes to war against the Lannisters. Jon finds himself struggling on deciding if his place is with Robb or the Night\'s Watch. Drogo has fallen ill from a fresh battle wound. Daenerys is desperate to save him.','',9,5),(18,'Fire and Blood','With Ned dead, Robb vows to get revenge on the Lannisters. Jon must officially decide if his place is with Robb or the Night\'s Watch. Daenerys says her final goodbye to Drogo.','',10,5),(19,'The North Remembers','Tyrion arrives at Kings Landing to take his father\'s place as Hand of the King. Stannis Baratheon plans to take the Iron Throne for his own. Robb tries to decide his next move in the war. The Night\'s Watch arrive at the house of Craster.','',1,6),(20,'The Night Lands','Arya makes friends with Gendry. Tyrion tries to take control of the small council. Theon arrives at his home, Pyke, in order to persuade his father into helping Robb with the war. Jon tries to investigate Craster\'s secret.','',2,6),(21,'What Is Dead May Never Die','Tyrion tries to see who he can trust in the small council. Catelyn visits Renly to try and persuade him to join Robb in the war. Theon must decide if his loyalties lie with his own family or with Robb.','',3,6),(22,'Garden of Bones','Lord Baelish arrives at Renly\'s camp just before he faces off against Stannis. Daenerys and her company are welcomed into the city of Qarth. Arya, Gendry, and Hot Pie find themselves imprisoned at Harrenhal.','',4,6),(23,'The Ghost of Harrenhal','Tyrion investigates a secret weapon that King Joffrey plans to use against Stannis. Meanwhile, as a token for saving his life, Jaqen H\'ghar offers to kill three people that Arya chooses.','',5,6),(24,'The Old Gods and the New','Theon seizes control of Winterfell. Jon captures a wildling, named Ygritte. The people of King\'s Landing begin to turn against King Joffrey. Daenerys looks to buy ships to sail for the Seven Kingdoms.','',6,6),(25,'A Man Without Honor','Bran and Rickon have escaped Winterfell. Theon tries to hunt them down. Daenerys\' dragons have been stolen. Jon travels through the wilderness with Ygritte as his prisoner. Sansa has bled and is now ready to have Joffrey\'s children.','',7,6),(26,'The Prince of Winterfell','Stannis is just days from King\'s Landing. Tyrion prepares for his arrival. Jon and Qhorin are taken prisoner by the wildlings. Catelyn is arrested for releasing Jamie. Arya, Gendry, and Hot Pie plan to escape from Harrenhal.','',8,6),(27,'Blackwater','Stannis Baratheon\'s fleet and army arrive at King\'s Landing and the battle for the city begins. Cersei plans for her and her children\'s future.','',9,6),(28,'Valar Morghulis','Joffrey puts Sansa aside for Margaery Tyrell. Robb marries Talisa Maegyr. Jon prepares to meet Mance Rayder. Arya says farewell to Jaqen H\'ghar. Daenerys tries to rescue her dragons.','',10,6),(29,'Valar Dohaeris','Jon is brought before Mance Rayder, the King Beyond the Wall, while the Night\'s Watch survivors retreat south. In King\'s Landing, Tyrion asks for his reward. Littlefinger offers Sansa a way out.','',1,7),(30,'Dark Wings, Dark Words','Bran and company meet Jojen and Meera Reed. Arya, Gendry, and Hot Pie meet the Brotherhood. Jaime travels through the wilderness with Brienne. Sansa confesses her true feelings about Joffery to Margaery.','',2,7),(31,'Walk of Punishment','Robb and Catelyn arrive at Riverrun for Lord Hoster Tully\'s funeral. Tywin names Tyrion the new Master of Coin. Arya says goodbye to Hot Pie. The Night\'s Watch returns to Craster\'s. Brienne and Jamie are taken prisoner.','',3,7),(32,'And Now His Watch Is Ended','Jamie mopes over his lost hand. Cersei is growing uncomfortable with the Tyrells. The Night\'s Watch is growing impatient with Craster. Daenerys buys the Unsullied.','',4,7),(33,'Kissed by Fire','Robb\'s army is falling apart. Jamie reveals a story, to Brienne, that he has never told anyone. Jon breaks his vows. The Hound is granted his freedom. The Lannisters hatch a new plan.','',5,7),(34,'The Climb','Jon and the wildlings scale The Wall. The Brotherhood sells Gendry to Melisandre. Robb does what he can to win back the Freys. Tyrion tells Sansa about their engagement.','',6,7),(35,'The Bear and the Maiden Fair','Jon and the wildlings travel south of The Wall. Talisa tells Robb that she\'s pregnant. Arya runs away from the Brotherhood. Daenerys arrives at Yunkai. Jamie leaves Brienne behind at Harrenhal.','',7,7),(36,'Second Sons','Daenerys tries to persuade the Second Sons to join her against Yunkai. Stannis releases Davos from the dungeons. Sam and Gilly are attacked by a White Walker. Sansa and Tyrion wed.','',8,7),(37,'The Rains of Castamere','Robb and Catelyn arrive at the Twins for the wedding. Jon is put to the test to see where his loyalties truly lie. Bran\'s group decides to split up. Daenerys plans an invasion of Yunkai.','',9,7),(38,'Mhysa','Bran and company travel beyond The Wall. Sam returns to Castle Black. Jon says good bye to Ygritte. Jamie returns to King\'s Landing. The Night\'s Watch asks for help from Stannis.','',10,7),(39,'Two Swords','Tyrion welcomes a guest to King\'s Landing. At Castle Black, Jon stands trial. Daenerys is pointed to Meereen, the mother of all slave cities. Arya runs into an old enemy.','',1,8),(40,'The Lion and the Rose','Joffrey and Margaery\'s wedding has come. Tyrion breaks up with Shae. Ramsay tries to prove his worth to his father. Bran and company find a Weirwood tree.','',2,8),(41,'Breaker of Chains','Tyrion is arrested for the murder of Joffery and awaits trial. Sansa escapes King\'s Landing. Sam sends Gilly to Mole\'s Town as the Night\'s Watch finds itself in a tight spot. Meereen challenges Daenerys.','',3,8),(42,'Oathkeeper','Jaime entrusts a task to Brienne. Daenerys frees Meereen. Jon is given permission to lead a group of Night\'s Watchmen to Craster\'s Keep. Bran and company are taken hostage.','',4,8),(43,'First of His Name','Tommen is crowned King of the Seven Kingdoms. Cersei builds her case against Tyrion. Sansa and Lord Baelish arrive at the Eyrie. The Night\'s Watch attacks Craster\'s Keep.','',5,8),(44,'The Laws of Gods and Men','Tyrion\'s trial has come. Yara and her troops storm the Dreadfort to free Theon. Daenerys meets Hizdar zo Loraq. Stannis makes a deal with the Iron Bank of Braavos.','',6,8),(45,'Mockingbird','Tyrion tries to find a champion. Daenerys sleeps with Daario. The Hound becomes wounded. Jon\'s advice is ignored at Castle Black. Brienne and Podrick receive a tip on Arya\'s whereabouts.','',7,8),(46,'The Mountain and the Viper','Theon helps Ramsay seize Moat Cailin. The wildlings attack Mole\'s Town. Sansa comes up with a story to protect Lord Baelish. Daenerys finds out a secret about Ser Jorah. Oberyn Martell faces Ser Gregor Clegane.','',8,8),(47,'The Watchers on the Wall','The battle between the Night\'s Watch and the Wildlings has come.','',9,8),(48,'The Children','The Night\'s Watch story continues, with surprising developments. Daenerys experiences new consequences. Brienne and Podrick have an unexpected encounter. Bran achieves a goal, while Tyrion makes an important discovery.','',10,8),(49,'The Wars to Come','Cersei and Jaime adjust to a world without Tywin. Tyrion and Varys arrive at Pentos. In Meereen, a new enemy emerges. Jon is caught between two kings.','',1,9),(50,'The House of Black and White','Arya arrives in Braavos. Jamie takes on a secret mission. Ellaria Sand seeks revenge for Oberyn\'s death. Stannis makes Jon a generous offer as the Night\'s Watch elects a new Lord Commander. Daenerys is faced with a difficult decision.','',2,9),(51,'High Sparrow','Tommen and Margaery wed. Arya has trouble adapting to her new life. Littlefinger reveals his plans to Sansa. Jon gives his first orders as Lord Commander. Tyrion and Varys arrive in Volantis.','',3,9),(52,'Sons of the Harpy','Jorah Mormont sets sail alongside his prisoner, Tyrion. Cersei makes a move against the Tyrells. Jaime and Bronn sneak into Dorne. Ellaria and the Sand Snakes make their plans. Melisandre tempts Jon. The Harpies attack.','',4,9),(53,'Kill the Boy','Daenerys arrests the heads of Meereen\'s great families. Jon makes a difficult decision. Theon is forced to face Sansa. Stannis rides south. Tyrion and Jorah enter the ruins of Old Valyria.','',5,9),(54,'Unbowed, Unbent, Unbroken','Arya is put to the test. Tyrion and Jorah are captured by slavers. Loras Tyrell is judged by the Sparrows. Jaime and Bronn face the Sand Snakes. Sansa marries Ramsay Bolton.','',6,9),(55,'The Gift','Jon heads east as trouble begins to stir for Sam and Gilly at Castle Black. Sansa asks Theon for help. Tyrion and Jorah are sold as slaves. Cersei savors her triumph over the Tyrells as new plots are developed in the shadows.','',7,9),(56,'Hardhome','Tyrion advises Daenerys. Sansa forces Theon to tell her a secret. Cersei remains stubborn. Arya meets her first target. Jon and Tormund meet with the Wildling Elders.','',8,9),(57,'The Dance of Dragons','Jon and the Wildlings return to Castle Black. Jaime meets with Doran Martell. Stannis makes a hard choice. Arya runs into Ser Meryn Trant. Daenerys attends the grand reopening of the fighting pits.','',9,9),(58,'Mother\'s Mercy','Stannis arrives at Winterfell. Tyrion runs Meereen as Daario and Jorah go after Daenerys. Jaime and Myrcella leave Dorne. Jon sends Sam and Gilly to Oldtown. Arya challenges the Many-Faced God. Cersei confesses her sins.','',10,9),(59,'The Red Woman','The fate of Jon Snow is revealed. Daenerys is brought before Khal Moro. Tyrion gets used to living in Meereen. Ramsay sends his dogs after Theon and Sansa. Ellaria and the Sand Snakes make their move. Cersei mourns for Myrcella.','',1,10),(60,'Home','Bran trains with the Three-Eyed Raven. Tommen meets with Cersei. Tyrion makes a bold move. Theon leaves while at Pyke new issues arise. Ramsay\'s brother is born. Davos asks Melisandre for a miracle.','',2,10),(61,'Oathbreaker','Daenerys arrives at Vaes Dothrak. Sam and Gilly sail for Horn Hill. Arya trains as No One. Varys finds information on the Sons of the Harpy. Ramsay receives a gift. Tommen meets with the High Sparrow. At Castle Black, a miracle occurs.','',3,10),(62,'Book of the Stranger','Sansa arrives at Castle Black. Tyrion makes a deal with the Slave Masters. Jorah and Daario sneak into Vaes Dothrak. Ramsay sends a letter to Jon. Theon arrives at Pyke. Cersei and Olenna Tyrell plot against the High Sparrow.','',4,10),(63,'The Door','Sansa and Jon make plans. Arya is given another chance to prove herself. Jorah confesses a secret to Daenerys. Tyrion meets with a Red Priestess. Yara finds her rule tested. Bran discovers the origin of the White Walkers.','',5,10),(64,'Blood of My Blood','Bran and Meera find a new ally. Gilly meets Sam\'s family. Arya makes a difficult choice. The Lannisters and Tyrells march against the High Sparrow.','',6,10),(65,'The Broken Man','Jon and Sansa gather troops. Jaime arrives at Riverrun. Olenna Tyrell plans to leave King\'s Landing. Theon and Yara plan a destination. Arya makes plans to leave.','',7,10),(66,'No One','Brienne arrives at Riverrun. Arya seeks shelter. Jaime meets with Edmure Tully. Cersei challenges the Faith. Sandor Clegane hunts for revenge. Tyrion faces the consequences of earlier decisions.','',8,10),(67,'Battle of the Bastards','Jon and Sansa face Ramsay Bolton on the fields of Winterfell. Daenerys strikes back at her enemies. Theon and Yara arrive in Meereen.','',9,10),(68,'The Winds of Winter','Cersei and Loras Tyrell stand trial by the gods. Daenerys prepares to set sail for Westeros. Davos confronts Melisandre. Sam and Gilly arrive in The Citadel. Bran discovers a long kept secret. Lord Frey has an uninvited guest.','',10,10),(69,'Chapter One: The Vanishing of Will Byers','In a small Indiana town, the disappearance of a young boy sparks a police investigation.','',1,11),(70,'Chapter Two: The Weirdo on Maple Street','Mike hides the mysterious girl in his house. Joyce gets a strange phone call.','',2,11),(71,'Chapter Three: Holly, Jolly','An increasingly concerned Nancy looks for Barb and finds out what Jonathan\'s been up to. Joyce is convinced Will is trying to talk to her.','',3,11),(72,'Chapter Four: The Body','Refusing to believe Will is dead, Joyce tries to connect with her son. The boys give Eleven a makeover. Johnathan and Nancy form an unlikely alliance.','',4,11),(73,'Chapter Five: The Flea and the Acrobat','Hopper breaks into the lab to find the truth about Will\'s death. The boys try to locate the \"gate\" that will take them to Will.','',5,11),(74,'Chapter Six: The Monster','Hopper and Joyce find the truth about the lab\'s experiments. After their fight, the boys look for the missing Eleven.','',6,11),(75,'Chapter Seven: The Bathtub','The government comes searching for Eleven. Eleven looks for Will in the Upside Down.','',7,11),(76,'Chapter Eight: The Upside Down','Joyce and Hopper are taken in for questioning. Nancy and Jonathan prepare to fight the monster and save Will.','',8,11),(78,'Pilot','A sociopathic scientist drags his innocent grandson on dangerous inter-dimensional adventures.','',1,12),(79,'Lawnmower Dog','Rick helps Jerry out with the dog, broh. Don\'t even trip about this episode, because they also incept Goldenfold.','',2,12),(80,'Anatomy Park','It\'s Christmas. Rick shrinks Morty, injecting him into a homeless man to save Anatomy Park. Jerry tries to have a Christmas free of electronic devices, but regrets his decision when his parents introduce him to their new friend.','',3,12),(81,'M. Night Shaym-Aliens!','Rick and Morty try to get to the bottom of a mystery in this M. Night Shamyaloin style twistaroony of an episode! (Guest Starring David Cross)','',4,12),(82,'Meeseeks and Destroy','Rick provides the family with a solution to their problems, freeing him up to go on an adventure led by Morty.','',5,12),(83,'Rick Potion #9','Rick provides Morty with a love potion to get Jessica.','',6,12),(84,'Raising Gazorpazorp','Morty becomes a father to an alien baby, while Rick and Summer get trapped in a dangerous dimension.','',7,12),(85,'Rixty Minutes','Rick hooks up the family\'s TV with interdimensional cable, allowing them to watch infinite TV from across the multiverse.','',8,12),(86,'Something Ricked This Way Comes','Summer gets a job at a pawn shop owned by the devil. Jerry helps Morty with his science fair project.','',9,12),(87,'Close Rick-counters of the Rick Kind','Rick has a run in with some old associates, resulting in a fallout with Morty. You got any chips, broh?','',10,12),(88,'Ricksy Business','Beth and Jerry head for an iceberg of a date leaving Rick in charge. Morty doesn\'t get to go on any more adventures if the house isn\'t in the same condition when they get back.','',11,12),(89,'A Rickle in Time','Having restarted time, Rick, Morty and Summer are in a quantum-uncertain state of existence. An argument leads to the creation of two alternate timelines, which need to be stitched back together fast if they are to escape quantum collapse.','',1,13),(90,'Mortynight Run','Rick and Morty try to save a gas life form while Jerry resides in a daycare made for Jerrys.','',2,13),(91,'Auto Erotic Assimilation','Rick gets emotional. Beth and Jerry get into a fight.','',3,13),(92,'Total Rickall','The Smith house is locked down after parasites threaten to take over the world by multiplying through flashbacks.','',4,13),(93,'Get Schwifty','Rick and morty must aid Earth after a giant head disrupts the planet, demanding to see a hit song performed.','',5,13),(94,'The Ricks Must Be Crazy','Rick is having trouble with his car and they have to fix it by traveling to the microverse.','',6,13),(95,'Big Trouble in Little Sanchez','Rick joins in on some hijinks by transferring his consciousness into teenage \"Tiny Rick\". Beth and Jerry sort out their relationship.','',7,13),(96,'Interdimensional Cable 2: Tempting Fate','Jerry is faced with the difficult decision of losing his manhood in order to save an alien leader from imminent death. Meanwhile, Rick, Morty and Summer explore the possibilities of interdimensional television.','',8,13),(97,'Look Who\'s Purging Now','Rick and Morty arrive on an alien planet to fix their ship just as the day of the purge begins there, Jerry and Summer work on their father-daughter relationship, but his lack of employment keeps coming up.','',9,13),(98,'The Wedding Squanchers','The Smith family is invited to the wedding of Rick\'s best friend, Birdperson. Things go south when it\'s discovered that the bride isn\'t who she says she is.','',10,13),(99,'Pilot','In near-future Los Angeles, Will Bowman attempts a daring rescue. His wife Katie tries to help a relative in need. A job opportunity threatens to divide the family.','',1,14),(100,'A Brave New World','Will\'s new mission is to find the guy behind the explosion. Madeline encounters an old friend. Will and Katie help out the family of a mutual friend. Katie\'s actions put Will\'s job at risk.','',2,14),(101,'98 Seconds','Katie\'s first mission leads her to question her commitment to the cause. Will\'s hunt for Geronimo draws him into the Resistance\'s crosshairs. Bram\'s girlfriend needs him to keep a secret.','',3,14),(102,'Blind Spot','Will earns the respect of his new colleagues. A Resistance attack comes to the home front and brings the Bowman family together. Katie gets to know Will\'s team. Maddie finds a new job that makes the most of her talents.','',4,14),(103,'Geronimo','Geronimo\'s identity is revealed. Will begins to question his wife\'s loyalties. Katie struggles with the weight of her choices. Bram finds his way into a secret world. Snyder sees an opporunity to improve his standing in the colony.','',5,14),(104,'Yoknapatawpha','Will and Snyder take shelter in the Yonk after they are ambushed, and Katie struggles with where her loyalties really lie.','',6,14),(105,'Broussard','The series begins less than a year after the beginning of the Occupation. The Bowmans seek their middle child (younger son), Charlie, who was separated from them during the Arrival, while they try to survive with meager resources in a changed world that is constantly dangerous despite its urban veneer of order. Will is forced to work for the Redhats to hunt down the Resistance, or his family will be sent to the Factory. Katie, who is (unbeknownst to Will) a member of the Resistance, now has an inside source in Will.','',7,14),(106,'In From the Cold','A high-ranking member of the Resistance arrives; Katie gets a second chance; Bram proposes a risky journey.','',8,14),(107,'Zero Day','Will wants to remove the family from the occupation; Snyder tries to protect his office.','',9,14),(108,'Gateway','After a high-value hostage is kidnapped by the Resistance, the Los Angeles block is placed on lockdown. Season Finale.','',10,14),(109,'Eleven.Thirteen','Will and Katie try to keep their family together in the changing city while Broussard returns home.','',1,15),(110,'Somewhere Out There','Will puts his trust in an old friend in the Santa Monica bloc; Jennifer visits Katie; Bram meets the camp commandant.','',2,15),(111,'Sublimation','Will, Devon and Charlie journey home; Katie says goodbye to her daughter; Bram makes friends at camp; Maddie finds a new project.','',3,15),(112,'Panopticon','Jennifer keeps an eye on the Bowman house. The family encounters unexpected challenges when Charlie returns home.','',4,15),(113,'Company Man','Will returns to an unfamiliar workplace. At home, Katie tries to stay on her best behavior. Broussard and his cell make a startling discovery about the Wall.','',5,15),(114,'The Original','Bernard alerts Ford of aberrant behavior from recoded hosts; Dolores encounters gunslinger Teddy, but their narrative is upended by a mysterious Man in Black.','',1,16),(115,'Chestnut','William and Logan arrive with different expectations; To avoid recall, Maeve\'s emotions are tweaked; Lee pitches his latest narrative; The Man in Black seeks help from a ruthless bandit, Lawernce.','',2,16),(116,'The Stray','Elsie and Stubbs search for a missing host; Teddy gets a new backstory; Bernard investigates the origins of madness and hallucinations within the hosts.','',3,16),(117,'Dissonance Theory','Dolores joins William and Logan on a bounty hunt; The Man in Black finds a critical clue in his search to unlock the maze; Dr. Ford and Theresa discuss the park\'s future; Maeve is troubled by a recurring vision.','',4,16),(118,'Contrapasso','Dolores, William and Logan reach Pariah, and are recruited for a dangerous mission; The Man in Black meets an unlikely ally in his search to unlock the maze.','',5,16),(119,'The Adversary','Maeve charms Felix; Elsie discovers evidence that could point to sabotage; Teddy and the Man in Black conflict with a garrison.','',6,16),(120,'Trompe L\'Oeil','Dolores and William continue their journey; Maeve presents her demand; Bernard considers his next move; A surprising discovery is made.','',7,16),(121,'Trace Decay','Bernard struggles with a mandate; Teddy is troubled by dark memories; Maeve looks to change her script.','',8,16),(122,'The Well-Tempered Clavier','Dolores and Bernard reconnect with their pasts; Maeve makes a bold proposition to Hector; Teddy finds enlightenment, at a price.','',8,16),(123,'The Bicameral Mind','Ford unveils his bold new narrative; Dolores embraces her identity; Maeve sets her plan in motion.','',10,16),(124,'The Train Job','Mal and his crew pull a train robbery.','',1,17),(125,'Bushwhacked','The Serenity hits a wrecked transport vessel that was transporting settler\'s families and Mal decides to check whether there are survivors or goods. He goes on board with Zoe and they find a survivor completely mad and bring him to the Serenity. They also find some valuable goods and the fate of the crew that was attacked by the Reavers. When they are ready to go, they are intercepted by an Alliance\'s spacecraft and their Commander Harken brings them on board for investigation. Soon Mal realizes that they are in danger and tries to convince Harken to check the ...','',2,17),(126,'Our Mrs. Reynolds','A woman claiming to be Mal\'s wife appears aboard Serenity.','',3,17),(127,'Jaynestown','Mal and the crew of Serenity land to pick up some contraband In Canton, a township on Higgins\' Moon, where labor is provided under servitude run by the local magistrate. Jayne had once robbed the boss with a partner but barely escaped by jettisoning from their getaway vehicle his partner (now waiting for revenge) and the money boxes (who have made him a legendary hero). Jayne is recognized by all and \"welcomed\" accordingly. Sub-plots show Simon and Kaylee face their growing romantic feelings, River first tries to \"fix\" the Bible and is later traumatized by seeing ...','',4,17),(128,'Out of Gas','When Serenity\'s life support system fails, Mal orders the crew off the ship - but he stays behind.','',5,17),(129,'Shindig','After scuffling with one of Inara\'s clients during a royal ball where the Serenity crew is hired by a diplomat to smuggle some unusual cargo, Mal is challenged to a duel of swords by the snobbish and arrogant royal Atherton Wing.','',6,17),(130,'Safe','The Serenity brings the cattle to a plane and, when Mal is negotiating the selling with the traders, there is a shootout and Shepherd Book is hit. Meanwhile Dr. Simon and River are kidnapped by the residents to work in an isolated area. But Mal needs to leave the planet to seek help for Book and the leave the siblings behind. When the locals discover that River can read minds, they believe she is a witch and wants to burn her at stake.','',7,17),(131,'Ariel','Serenity travels to the core world Ariel and Simon comes up with a plan to steal drugs from the hospital.','',8,17),(132,'War Stories','Niska catches up with the Serenity crew.','',9,17),(133,'Objects in Space','River has a daydream and holds one of Jayne\'s weapon believing it was a tree branch; suddenly she awakes and sees Mal and the crew scary. River overhears Mal and the crew discussing about her and she feels rejected. Meanwhile, the ruthless bounty hunter Jubal Early, who has tracked down River, boards the Serenity while everybody is sleeping. He subdues Mal and locks the crew in the cabins; ties Kaylee up in the engine room; hits Shepherd Book on the head; and he finally captures Simon to force him to deliver his sister. However River is missing and out of the blue, ...','',10,17),(134,'Serenity','After scavenging the remains of a cargo spaceship, Captain Malcolm \'Mal\' Reynolds and his crew are found by the Alliance but they escape. They go to Persephone to sell the stolen cargo to the criminal Badger, but he is no longer interested in the wanted goods. Malcom decides to sell the cargo to the outlaw Patience in the planet Whitefall and pick up passenger to raise money. But soon they discover and Alliance\'s mole on board that is chasing one of the passengers. Who is who? When they arrive on Whitefall, Patience betrays Malcolm and the infamous Reavers have ...','',11,17),(135,'Heart of Gold','Inara receives a distress call from her old friend Nandi, who owns a brothel on a moon. Mal and his crew heads to the place and they learn that the leader of the town Rance Burgess has an infertile wife and the prostitute Petaline is pregnant of him. Now he wants the baby to raise with his family. Mal and his crew decide to help Nandi, Petaline and the other girls, defending the brothel from Rance Burgess. Meanwhile Mal an Nandi feel attracted for each other hurting the feelings of Inara.','',12,17),(136,'Trash','Saffron returns to offer the crew a mission but not everyone is willing to trust her again.','',13,17),(137,'The Message','A dying request from an old army buddy turns treacherous for Mal, ZoÃ«, and the rest of the crew.','',14,17);
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES (1,'First Group');
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_tv_show`
--

DROP TABLE IF EXISTS `party_tv_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party_tv_show` (
  `party_id` int(11) NOT NULL,
  `tv_show_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_party_has_tv_show_tv_show1_idx` (`tv_show_id`),
  KEY `fk_party_has_tv_show_party1_idx` (`party_id`),
  CONSTRAINT `fk_party_has_tv_show_party1` FOREIGN KEY (`party_id`) REFERENCES `party` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_party_has_tv_show_tv_show1` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_show` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_tv_show`
--

LOCK TABLES `party_tv_show` WRITE;
/*!40000 ALTER TABLE `party_tv_show` DISABLE KEYS */;
INSERT INTO `party_tv_show` VALUES (1,1,1),(1,2,2);
/*!40000 ALTER TABLE `party_tv_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `party_user`
--

DROP TABLE IF EXISTS `party_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party_user` (
  `party_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_party_has_user_user1_idx` (`user_id`),
  KEY `fk_party_has_user_party1_idx` (`party_id`),
  CONSTRAINT `fk_party_has_user_party1` FOREIGN KEY (`party_id`) REFERENCES `party` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_party_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party_user`
--

LOCK TABLES `party_user` WRITE;
/*!40000 ALTER TABLE `party_user` DISABLE KEYS */;
INSERT INTO `party_user` VALUES (1,1,1),(1,2,2);
/*!40000 ALTER TABLE `party_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(1000) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `img_url` varchar(300) DEFAULT NULL,
  `season_number` int(11) DEFAULT NULL,
  `tv_show_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`tv_show_id`),
  KEY `fk_seasons_show1_idx` (`tv_show_id`),
  CONSTRAINT `fk_seasons_show1` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_show` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,'Season 1 of Stranger Thrones','Season 1',NULL,1,2),(2,'Season 2 of Stranger Thrones','Season 2',NULL,2,2),(3,'Season 1 of Game of Swords','Season 1',NULL,1,1),(4,'Season 2 of Game of Swords','Season2',NULL,2,1),(5,'Season 1','Season 1','',1,4),(6,'Season 2','Season 2','',2,4),(7,'Season 3','Season 3','',3,4),(8,'Season 4','Season 4','',4,4),(9,'Season 5','Season 5','',5,4),(10,'Season 6','Season 6','',6,4),(11,'Season 1','Season 1','https://images-na.ssl-images-amazon.com/images/M/MV5BMjEzMDAxOTUyMV5BMl5BanBnXkFtZTgwNzAxMzYzOTE@._V1_UX182_CR0,0,182,268_AL_.jpg',1,5),(12,'Season 1','Season 1','',1,6),(13,'Season 2','Season 2','',2,6),(14,'Season 1','Season 1','',1,7),(15,'Season 2','Season 2','',2,7),(16,'Season 1','Season 1','',1,8),(17,'Five hundred years in the future, a renegade crew aboard a small spacecraft tries to survive as they travel the unknown parts of the galaxy and evade warring factions as well as authority agents out to get them.','Season 1','',1,9);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv_show`
--

DROP TABLE IF EXISTS `tv_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tv_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `img_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv_show`
--

LOCK TABLES `tv_show` WRITE;
/*!40000 ALTER TABLE `tv_show` DISABLE KEYS */;
INSERT INTO `tv_show` VALUES (1,'Game of Swords','People killing eachother',NULL),(2,'Stranger Thrones','Throne Improvement Show',NULL),(4,'Game of Thrones','Nine noble families fight for control over the mythical lands of Westeros. Meanwhile, a forgotten race hell-bent on destruction returns after being dormant for thousands of years.','https://upload.wikimedia.org/wikipedia/en/d/d1/Game_of_Thrones_Season_6.jpeg'),(5,'Stranger Things','When a young boy disappears, his mother, a police chief, and his friends must confront terrifying forces in order to get him back.','https://images-na.ssl-images-amazon.com/images/M/MV5BMjEzMDAxOTUyMV5BMl5BanBnXkFtZTgwNzAxMzYzOTE@._V1_UX182_CR0,0,182,268_AL_.jpg'),(6,'Rick and Morty','An animated series that follows the exploits of a super scientist and his not so bright grandson.','https://images-na.ssl-images-amazon.com/images/M/MV5BMTQxNDEwNTE0Nl5BMl5BanBnXkFtZTgwMzQ1MTg3MDE@._V1_UY268_CR2,0,182,268_AL_.jpg'),(7,'Colony','In the wake of a mysterious alien invasion, a family fights to stay together in a new world order.','https://images-na.ssl-images-amazon.com/images/M/MV5BMjE3NDQzMDE2N15BMl5BanBnXkFtZTgwMjQwMDU0NzE@._V1_UX182_CR0,0,182,268_AL_.jpg'),(8,'West World','A Western-themed futuristic theme park, populated with artificial intelligence, allows high-paying guests to live out their fantasies with no consequences or retaliation from the android hosts, until now.','https://images-na.ssl-images-amazon.com/images/M/MV5BMTEyODk5NTc2MjNeQTJeQWpwZ15BbWU4MDQ5NTgwOTkx._V1_UX182_CR0,0,182,268_AL_.jpg'),(9,'Firefly','Five hundred years in the future, a renegade crew aboard a small spacecraft tries to survive as they travel the unknown parts of the galaxy and evade warring factions as well as authority agents out to get them.','https://images-na.ssl-images-amazon.com/images/M/MV5BNGEzYjIzZGUtNWI5YS00Y2IzLWIzMTQtMGJhNDljZDkzYzM0XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_UY268_CR0,0,182,268_AL_.jpg');
/*!40000 ALTER TABLE `tv_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(45) NOT NULL,
  `img_url` varchar(90) NOT NULL DEFAULT 'img/default.jpg',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Chaz','chaz',1,'Chaaaz','img/default.jpg'),('Nik','nik',2,'Nikolaus','img/default.jpg'),('Robert','robert',3,'Rupert','img/default.jpg'),('JoshZ','joshz',4,'JayDizzle','img/default.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_episode`
--

DROP TABLE IF EXISTS `user_episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_episode` (
  `watched` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `episode_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_user_episode_user1_idx` (`user_id`),
  KEY `fk_user_episode_episode1_idx` (`episode_id`),
  CONSTRAINT `fk_user_episode_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_episode_episode1` FOREIGN KEY (`episode_id`) REFERENCES `episode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_episode`
--

LOCK TABLES `user_episode` WRITE;
/*!40000 ALTER TABLE `user_episode` DISABLE KEYS */;
INSERT INTO `user_episode` VALUES (1,1,1,1),(1,1,3,2),(1,2,3,3),(0,2,1,4),(1,2,2,5),(1,1,2,6),(0,1,2,7);
/*!40000 ALTER TABLE `user_episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tv_show`
--

DROP TABLE IF EXISTS `user_tv_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tv_show` (
  `user_id` int(11) NOT NULL,
  `tv_show_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_user_has_Show_Show1_idx` (`tv_show_id`),
  KEY `fk_user_has_Show_user_idx` (`user_id`),
  CONSTRAINT `fk_user_has_Show_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_Show_Show1` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_show` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tv_show`
--

LOCK TABLES `user_tv_show` WRITE;
/*!40000 ALTER TABLE `user_tv_show` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tv_show` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-16 20:33:48
