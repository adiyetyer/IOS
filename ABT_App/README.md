Hello Everyone! This is my iOS project for the final. 

I chose forwarding company topic. As a template i chose ABT E-trans Forwarding Company based in Kazakshtan, 
more information about company here:https://abttrans.kz/ 

I designed app only for clients with some functions. 

So 

Main Screens and their Functions:

Navigation Bar as MainTabView in system:
- Includes 3 main navigation buttons(Home, Price calculator, Profile)

  
Home Page:
 - "Send Cargo" button: Initiates the process of calculating the cost and placing an order.
 - Order History: Displays a list of all previous orders with details.
 - Delivery Status: Shows the current status of the active delivery (if any).
Price Calculator(Actually same as send Cargo function, but with price calculator you can see total price
of delivery without taking any order):
 - Input fields for entering data to calculate the delivery cost.
 - "Calculate" button: Displays the total cost.
 - Calculation formula is: Almaty - Astana : up to 25 kg 6000 tenge
   from 25 kg 6000 + (125 * for each kilogram)
   more details in PriceCalculatorView.
Order Placement Steps: After pressing Send cargo you will go to
 - Step1(which is same as price calculator)
 - Step 2: Input additional data about the cargo and sender.
 - Step 3: Input data about the recipient.
 - Cost Confirmation: Displays the total cost and a "Pay" button.
 - Order Confirmation: Displays the order ID, date, and status and COULD save order data to the database
User Profile:
 - Displays the user's personal information.
 - Allows editing of profile information.
