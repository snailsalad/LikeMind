# A/B Test 1
Metrics:
Login frequency, retention time, and Click-Through Rate (CTR).
Hypothesis:
A high-contrast color scheme (dark blue and yellow) will improve user retention, engagement, and CTR on matches.
Experiment:
Using Firebase Remote Config, we will show half of users a new logo with a high-contrast color scheme, while the other half continue with the default design. Engagement metrics will be tracked over the test period.

Variations:

Variation 1:
<img width="1024" height="1024" alt="ChatGPT Image Oct 22, 2025, 04_06_28 PM" src="https://github.com/user-attachments/assets/c28d9293-8e5c-49b5-9d33-20ac775a63e5" />

Variation 2:

<img width="512" height="512" alt="unnamed" src="https://github.com/user-attachments/assets/0bd286d5-3bbd-43d9-93e5-a51e24d26929" />

# A/B Test 2
User Story #: 4 \
Metrics: Login frequency, retention time, Click-Through Rate (CTR) \
Hypothesis: Choosing a different, high-contrast color scheme will increase user retention and engagement and increase the click-through rate on matches. \
Experiment: We will change the primary and secondary colors on the app to a high-contrast color scheme using dark blue and yellow and see if users spend more or less time using our app. We will use a remote config parameter in firebase to control the app's color scheme and change the colors that way. We will roll out the high-contrast alternate color scheme to half the user base, while the other half will continue with the original color scheme. \
Variations: Control variable will be the default/neutral color scheme already in place, while the variable will be the high-contrast alternate color scheme.

# A/B Test 3
User Story #: 1 \
Metrics: Login frequency,and the amount of daily active users. 
Hypothesis: Choosing a differrent way of logging in and signing up seperately will cause retention, egagement and daily active users to decrease \
Experiment: We will implement two version of screens, one has both login and signup in one screen, while the other version will have each seperately to make signing up and verification be its own entity\
Variations: The control variable is the default signup and logging screen together as the original layout, while the variable will be the two seperate screens for login and signup. 

# A/B Test 4
User Story #: 4 \
Metrics: Login frequency, retention time, number of matches \
Hypothesis: Users might be more engaged by a swiping system that suggests other users than a search bar. A swiping system would allow users to instantly find other users to connect with after creating an account which may improve retention. \
Experiment: Create 2 different matching screens: A Search bar with filters by major and hobbies and a Swiping system with random user suggestions based on majors and hobbies.
Each screen will be randomly assigned through firebase remote config to half of users each.
Metrics will be tracked by tracking time spent on the matching page and the number of match requests each user makes.
Retention will also be tracked with the 1 and 7 day retention statistics. \
Variations: Page with 1 suggestion of a user profile, can be accepted or rejected or a search bar with filters to find people by major and hobby
