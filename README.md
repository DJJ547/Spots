# Spots Web App

# Contributors: Edward Gerald Tomista, Yashna Peerthum, Jiajun Dai

# Hardware and Software used:
	Apache Tomcat 10.0, 
	Eclipse IDE, 
	MySQL workbench, 
	Windows 10 OS, 

# RDBMS:
	MySQL Community Server 8.0.26, 

# Application Language:
	Java, JSP Servlet, SQL, HTML, CSS, JavaScript, 
  
Here is the link to download our newest sample database in order to run the application: https://drive.google.com/file/d/1nMZFviPsFJPpkW5eRSRQSmXQwa8FvgNG/view?usp=sharing

This project is a web application on creating, searching and rating on hangout spots. The spots will be classified according to spot host's classification and spotter's classification. 
The project has four different types of users: guests, individual users with accounts whom we will call spotters, spot hosts and admins. 
- The spot hosts will be able to create their spot pages, view their spots’ ratings and comments that spotters leave, and update their information such as name, address, images, and operating hours. 
- The spotters will be able to easily search the spots they like and leave ratings, classification, and comments on the spot page which they have visited as well as favorite the spots they like best. 
- Guest users will be able to view and search for spots but will not be able to take any other actions without signing up to become a spotter. 
- Admins will be responsible for managing and moderating the pages, and baning users with inappropriate activities.

# Our ERD diagram:
![ERD](https://user-images.githubusercontent.com/21046341/152704522-9027ed42-f8b9-422a-af96-446fdfd361e6.png)

# Our ERD Entities:
- Spots(spot_id, name, address, city, zipcode, group_size, category, noise level, creation_date)
- Admin(admin_id, first_name, last_name)
- SpotHost(host_email, first_name, last_name)
- Spotter(spotter_email, first_name, last_name)
- Comments(comment_id, comment_text, time_stamp)
Relationships:
- Favorite(spot_id, spotter_email)
- Manage(admin_id, spot_id, time_stamp)
- Create(host_email, spot_id, time_stamp)
- Rate(spotter_email, spot_id, rating, time_stamp)
- Ban(admin_id, spotter_email, time_stamp)
- Leaves(spotter_email, comment_id, time_stamp)
- Deleted(admin_id, comment_id, time_stamp)
- Classify(spot_id, spotter_email, user_group_size, user_category, user_noise_level)
- Has(comment_id, spot_id)
