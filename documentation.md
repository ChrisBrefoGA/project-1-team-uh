Documentation
=============

Account Display
---------------

The user's account information was displayed on the AccountDisplayPage using the AccountDisplayController. The controller takes the current session of the user, and uses the retrieved string to query for the contactID of the user using a SOQL query. Then the associated accountID is queried from contact using the user's contactID field. Finally, the necessary fields are queried from Accounts using the contact's Account ID.

Current Case Display
--------------------

The user's current case is displayed on the CurrentCaseDisplay page by using the CurrentCaseController. The controller takes the current session of the user, and uses the retrieved string to query the user from the User object. Then, relevant fields for the open case is queried from the Case object using the CreatedById field of the Case object and the userID queried earlier.

Past Case Display
-----------------

The user's past cases are displayed on the PastCaseDisplay page by using the PastCaseController. The controller takes in the current session of the user and retrieves the userID. Next, a query is made to get the ID from the User object of the related userID. Finally, a query is made to the case object with the relevant information with the condition being the CreatedById field and the userID queried earlier.

Web To Case Display
-------------------

A web to case form is displayed on the WebToCaseDisplay page by using the WebToCaseController. The controller takes the current session of the user to retrieve a sessionID string to query for the user in the User object. Relevant fields are then queried from the contact object by using the userId. Next the case is assigned to the queue and a new case is created. The display page uses apex:form to create the form structure of the page, and takes in relevant input to successfully create a case.

PayPalController
----------------

The PayPalController is an apex controller that works with the aura lightning component to retrieve the REST API for PayPal. The security token is stored as a string, and after a new Http method is called, a new httprequest method is called to set the endpoint with the api url. The Http method is set to GET and the headers are set to application/json for both accept and content-type, and the authorization is set to the security token. The HttpResponse is then sent and a debug message is created to fire when the status code is equal to Success.


apitest.cmp
-----------

apitest.cmp is the component of the lightning aura component that was implemented in this project. It uses the PayPalController apex class to retrieve the REST API call, and it uses aura elements to integrate functionality and interactivity to the community. The component consists of 15 different input values, each corresponding to an appropriate field that will be used for the PayPal API. The input is takin in through lightning:input, and there are two buttons at the end of the component that handles how the user interacts with the form. The JS controller associated with the component handles the events, specifically what occurs when the buttons are clicked. WHen the submit button is clicked, the handleClick function is called, where it gets the input values that the user submits and creates an action with the paramaters as the values. This is used for the PayPal API.