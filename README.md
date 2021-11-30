# SearchEngineAPIDemo
A sample iOS app allows one to search for a query using either Google or Bing, displays results, and open links. 


Basic Usage Flow:
Upon the app launching you will be directed to a 2-tab view that by default is pre-selected on the Google tab. Each screen contains a text search field, a submit button, and a Table View below containing the results of any search done. Typing into the search field and pressing “submit” will retrieve results from either Google or Bing and then display the title of the result and the description. Tapping on any of the results will bring up the Safari web browser and navigate to the search result’s content. 

**3rd Party Libraries Used: **
- PKHUD : Used for showing a clean-looking progress indicator when asynchronous network calls are in progress


**API Endpoints used:**
- Official Bing Web Search API
	I created a free trial account on the Microsoft Azure website and was able to 	obtain an API Key that works for up to 1000 requests per month. 
- Goog.io
	- Goog.io is one of several ‘freemium’ API endpoints that allow robust and customizable google searches. I had to create an account but it has a daily limit of 100 requests per day. 


You can register for free API keys on the Googio and Microsoft Azure websites. Once you have them they can be placed here in the app project.

<img width="682" alt="Screen Shot 2021-11-30 at 1 46 56 PM" src="https://user-images.githubusercontent.com/6954210/144125922-41f0d6ce-008e-4e04-afcf-a8c10158df19.png">



![Simulator Screen Shot - iPod touch (7th generation) - 2021-11-30 at 13 54 52](https://user-images.githubusercontent.com/6954210/144127778-12ab1595-a5c6-4dda-9ed5-340132519e39.png)
![Simulator Screen Shot - iPod touch (7th generation) - 2021-11-30 at 13 56 33](https://user-images.githubusercontent.com/6954210/144127811-c1ea785d-4cf8-42e7-a2be-3f0ae2384c14.png)
![Simulator Screen Shot - iPod touch (7th generation) - 2021-11-30 at 13 56 48](https://user-images.githubusercontent.com/6954210/144127833-f098a385-24c8-4b50-b410-b07ba3![Simulator Screen Shot - iPod touch (7th generation) - 2021-11-30 at 14 01 43](https://user-images.githubusercontent.com/6954210/144127855-e91febdd-b73d-4cb4-9c72-63ae618629da.png)
0a5091.png)
