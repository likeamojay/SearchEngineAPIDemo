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


![Simulator Screen Shot - iPod touch (7th generation) - 2021-11-30 at 13 54 52](https://user-images.githubusercontent.com/6954210/144128025-9a4756fe-52ba-45f9-a2fe-4a1f32aac88e.png)

![Simulator Screen Shot - iPod touch (7th generation) - 2021-11-30 at 13 56 33](https://user-images.githubusercontent.com/6954210/144128046-2d774191-3c34-4f51-b227-39018165748f.png)

![Simulator Screen Shot - iPod touch (7th generation) - 2021-11-30 at 13 56 48](https://user-images.githubusercontent.com/6954210/144128059-99a59cd5-75db-4300-876c-6410e4e090da.png)

![Simulator Screen Shot - iPod touch (7th generation) - 2021-11-30 at 14 01 43](https://user-images.githubusercontent.com/6954210/144128076-ea843ffd-4bc5-425b-ad74-bb08b169b39d.png)

