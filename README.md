# SearchEngineAPIDemo
A sample iOS app allows one to search for a query using either Google or Bing, displays results, and open links. 


Basic Usage Flow:
Upon the app launching you will be directed to a 2-tab view that by default is pre-selected on the Google tab. Each screen contains a text search field, a submit button, and a Table View below containing the results of any search done. Typing into the search field and pressing “submit” will retrieve results from either Google or Bing and then display the title of the result and the description. Tapping on any of the results will bring up the Safari web browser and navigate to the search result’s content. 

3rd Party Libraries Used: 
- PKHUD : Used for showing a clean-looking progress indicator when asynchronous network calls are in progress


API Endpoints used:
- Official Bing Web Search API
	I created a free trial account on the Microsoft Azure website and was able to 	obtain an API Key that works for up to 1000 requests per month. 
- Goog.io
	- Goog.io is one of several ‘freemium’ API endpoints that allow robust and customizable google searches. I had to create an account but it has a daily limit of 100 requests per day. 
