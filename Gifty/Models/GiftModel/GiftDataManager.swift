//
//  GiftDataManager.swift
//  Gifty
//
//  Created by Oleksii Vasyliev on 01.11.2021.
//
//


import Foundation
import UIKit

class GiftDataManager {
    var gifts: [Gift] = []
    
    func populateGiftdata() {
        gifts = [
            Gift(title: "Nike React Vision Shoes",
                 category: .sports,
                 author: "Gifty",
                 time: "<5 mins",
                 price: "CHF 180.-",
                 picture: "nike",
                 shortDescription: "Nike Sport Shoes",
                 longDescription: """
                      You can buy your friend this shoes at:
                      https://www.nike.com/ch/en/t/react-vision-shoes-wt7Jl4/DO6393-001
                      This one's a vision of comfort. Layered textures, unique shapes and vivid colors combine in a design influenced by the exaggerated worlds found in our dreams. React foam and a soft tongue keep it smooth.
"""),
            Gift(title: "Play badminton with your friend",
                 category: .sports,
                 author: "Gifty",
                 time: "1.5 hours",
                 price: "CHF 70.-",
                 picture: "badminton",
                 shortDescription: "Does your friend enjoy playing badminton? Come and play at Yonex Badminton Halle!",
                 longDescription: """
You must reserve a court via telephone @ 044 273 11 22
The location is Geroldstrasse 5, 8005 Zurich
The opening hours are 8:30 – 22:00
Depending on the time, you can rent a court at CHF 30.- to CHF 40.- per 45 minutes.
For more info, visit the official website of Yonnex Badminton Halle:
https://www.badmintonhalle.ch/Platzreservationen.6.0.html
"""),
            Gift(title: "DIY Travel Map",
                 category: .travel,
                 author: "Minh",
                 time: "5 hours",
                 price: "CHF 10.-",
                 picture: "travelMap",
                 shortDescription: "There is nothing as cool as a DIY map!",
                 longDescription: """
Step 1: Burn the Paper's Edges to make it look authentic. Make sure that you do it outside because of the smoke and fire hazard!
Step 2: Color the paper sheet. You can submerge the paper in concentrated coffee/ tea solution, and let it dry. To speed it up, place the paper in front of a fan or a hair dryer. This step can be repeated as many time as you need!
Step 3: DRAW! It is up to your imagination! Voila, you are all done!
"""),
            Gift(title: "Swiss Alps Day Trip from Zurich: Jungfraujoch and Bernese Oberland",
                 category: .travel,
                 author: "Minh",
                 time: "12 hours",
                 price: "CHF 300.-",
                 picture: "swissAlps",
                 shortDescription: "Let’s visit Jungfraujoch and Bernese Oberland!",
                 longDescription: """
Highlights:
• A guided day trip removes the hassle of planning your visit to Jungfraujoch
• Admire stunning views of Alpine landscape throughout your tour
• Entrance to Sphinx Observatory and Ice Palace included as summit activities
• Round-trip transportation from Zurich in coach, gondola ride and cogwheel train included
What to expect?
Meet your guide in central Zurich, and head for the charming ski resort of Grindelwald aboard a comfortable coach. Learn about the Bernese Oberland region as you pass through the Swiss countryside. Stop in Interlaken long enough for a quick photo and a hot drink (own expense). Upon arrival in Grindelwald, first board the gondola Eiger Express of the newly opened V-Cableway, followed by a ride in a classic cogwheel train up the UNESCO-listed Jungfraujoch mountain, aptly nicknamed the “Top of Europe” for its incredible summit at 11,330 feet (3,450 meters). Disembark at the summit for stunning views of the Alpine landscape from the Sphinx Observatory and a guided tour through the frozen tunnels of the Ice Palace. Enjoy free time to dine or explore before re- boarding the train and meeting your coach for the return journey to Zurich.
For more info, visit: https://www.tripadvisor.com/AttractionProductReview-g188113-d11450092- Swiss_Alps_Day_Trip_from_Zurich_Jungfraujoch_and_Bernese_Oberland-Zurich.html
"""),
            Gift(title: "Mixtape",
                 category: .music,
                 author: "Orestis",
                 time: "20 min – 1 hour",
                 price: "3.15 ~ 18.5 CHF",
                 picture: "mixtape",
                 shortDescription: "Create a mixtape of songs and print its digital code in different objects",
                 longDescription: """
1. Form a playlist at Spotify with songs of the receiver’s preference.
2. Open the playlist you created and tap the
3. Save the image of the playlist with the Spotify code like :
4. After that you could print that code on:
i. Photo stickers with your pictures and the playlist code
ii. A mug with a picture where you are together and the playlist code
For the printing of the code and the picture of you click the following url:
https://www.ifolor.ch/en/photo-gifts/photo-mug
"""),
            Gift(title: "Vinyl Membership",
                 category: .music,
                 author: "Orestis",
                 time: "2 min (only order)",
                 price: "137 – 457 CHF",
                 picture: "vinyl",
                 shortDescription: "Gift someone a membership for a monthly delivery of vinyl goodness",
                 longDescription: """
At https://www.vinylmeplease.com/ you can buy a membership for your gift recipient and they are going to send her/ him a package with a vinyl and many extras like liner notes.
Depending on the music taste of gift recipient, you can choose from 4 Tracks:
1. Essentials 2. Classics 3. Hip-Hop 4. Country
Whether they’re new to vinyl or a pro, through that membership they are going to collect and learn something new every month.
Membership can be one of the following:
3 Months 137 CHF 6 Months 256 CHF 12 Months 457 CHF
"""),
            Gift(title: "Poem Creation",
                 category: .culture,
                 author: "Gifty",
                 time: "1min – 5min",
                 price: "0 CHF",
                 picture: "poem",
                 shortDescription: "Create a poem with an online generator",
                 longDescription: """
You can create an entire poem in less than a minute in the following site:
https://www.poem-generator.org.uk/
You can choose from a variety of different types of poems like:
• Free Verse
• Quick Poem
• Haiku
• Didactic Cinquain
• Rhyming Couplets
• Sonnet
• Villanelle
• Limerick
• Acrostic
• Love Poem
• Narrative Poem
• Line by Line
• Concrete
• Tanka
After you choose your preferable category, you follow the steps that generator suggests you in order to create the poem
"""),
            Gift(title: "Museum Rietberg",
                 category: .culture,
                 author: "Gifty",
                 time: "~90 minutes",
                 price: "14-25 CHF",
                 picture: "museumRietberg",
                 shortDescription: "A multicultural tour to Rietber museum",
                 longDescription: """
The Rietberg Museum is one of the largest art museums in Switzerland. It is located in the city of Zurich and focuses on the traditional and contemporary arts and cultures of Asia, Africa, the Americas, and Oceania
The museum has different exhibitions throughout the year and you can be informed about them here:
https://rietberg.ch/en/exhibitions
Except from Monday, you can visit the Rietberg Museum each of all the other week’s days from 10am to 5pm and on Wednesdays till 8pm.
The tickets for special exhibitions are CHF 25 / 20 (reduced) and for the attending the regular collection of museum CHF 14 / 12 (reduced).
Do not forget to visit the original Japanese tearoom that is inside the premises of museum.
"""),
            Gift(title: "Make your own Chocolate Candy",
                 category: .food,
                 author: "Gifty",
                 time: "15 min",
                 price: "10 CHF",
                 picture: "candy",
                 shortDescription: "There is famous quote from Linda Grayson about chocolate: “There is nothing better than a friend, unless it is a friend with chocolate.” So if you want to be that friend with chocolate, this recipe is just for you.",
                 longDescription: """
Ingredients:
200 g chocolate, whole milk or plain 100 g lady fingers or butter biscuits 50 g icing sugar, sifted
50 g butter
1 bottle of butter vanilla flavouring
Crumble the biscuits in a freezer bag using a rolling pin. Melt the butter. Stir the flavouring into the butter immediately so that everything is evenly distributed.
Slowly heat the chocolate in a water bath. When all the chocolate has melted, stir in the crumbled biscuits, icing sugar and butter and place in the fridge to cool for 10 minutes.
Use a spoon to portion out the mixture, squeeze a little and form small balls between the palms of your hands.
Source: https://www.chefkoch.de/rezepte/2058601333018067/Pralinen-selbstgemacht.html https://www.goodreads.com/quotes/tag/chocolate
"""),
            Gift(title: "Live Online Cooking Experience",
                 category: .food,
                 author: "Gifty",
                 time: "1-2 hours",
                 price: "59 CHF",
                 picture: "onlineCooking",
                 shortDescription: "Thanks to this gift, you can spend time together, eat well and learn something.",
                 longDescription: """
Join the LIVE interactive online cooking class where Sherly will walk you through REAL-Time step by step into making delicious dishes in the comfort of your home kitchen. Make it a date night or a fun group activity and cook up a delicious meal from your home.
You can book it here: https://sherlyskitchen.com/online-cooking-class/
source: https://sherlyskitchen.com/online-cooking-class/
"""),
            Gift(title: "Barista Course",
                 category: .drink,
                 author: "Gifty",
                 time: "6 hours",
                 price: "220 CHF",
                 picture: "baristaCourse",
                 shortDescription: "If the recipient of your gift is a coffee lover, this present is the perfect choice.",
                 longDescription: """
Deepen your knowledge about coffee and learn how to brew a great espresso or cappuccino. You can buy a voucher or book the course on this website:
https://don-camillo.coffee/barista-kurse/
source: https://don-camillo.coffee/barista-kurse/
"""),
            Gift(title: "Cocktail evening",
                 category: .drink,
                 author: "Gifty",
                 time: "1 hour",
                 price: "20 CHF",
                 picture: "cocktail",
                 shortDescription: "Impress with your cocktail mixing skills! After watching a short video, you will be able to mix 10 different cocktails.",
                 longDescription: """
You can learn to mix the following cocktails:
Espresso Martini Negroni
Aperol Spritz Brown Derby Bees Knees Margarita Daiquiri Godfather Manhattan Brandy Flip
Here is the link to the video:
https://www.youtube.com/watch?v=IRkM8jsG-hY&ab_channel=StevetheBartender
source: https://www.youtube.com/watch?v=IRkM8jsG-hY&ab_channel=StevetheBartender
""")]
        
    }
}
