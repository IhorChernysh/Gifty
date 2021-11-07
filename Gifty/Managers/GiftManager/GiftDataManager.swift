import Foundation
import UIKit

class GiftDataManager {
    var gifts: [Gift] = []
    
    init() {
        populateGiftdata()
    }
    
    func getGiftsForActivity(activityName: String) -> [Gift] {
        let filteredArray = gifts.filter { $0.category.rawValue == activityName }
        return filteredArray
    }
    
    func addHyperLinksToText(originalText: String, hyperLinks: [String: String]) -> NSMutableAttributedString {
        let style = NSMutableParagraphStyle()
        style.alignment = .left
        let attributedOriginalText = NSMutableAttributedString(string: originalText)
        for (hyperLink, urlString) in hyperLinks {
            let linkRange = attributedOriginalText.mutableString.range(of: hyperLink)
            let fullRange = NSRange(location: 0, length: attributedOriginalText.length)
            attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: urlString, range: linkRange)
            attributedOriginalText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: fullRange)
            attributedOriginalText.addAttribute(NSAttributedString.Key.font, value: Appfont.regular.size(14), range: fullRange)
            attributedOriginalText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: linkRange)
        }
        
        return attributedOriginalText
    }
    
    func populateGiftdata() {
        gifts = [
            Gift(title: "Nike React Vision Shoes",
                 category: .sports,
                 author: "Gifty",
                 time: "<5 mins",
                 price: "CHF 180.-",
                 picture: "nike",
                 shortDescription: "Nike Sport Shoes",
                 longDescription: addHyperLinksToText(originalText: "You can buy your friend this shoes at:\nhttps://www.nike.com/ch/en/t/react-vision-shoes-wt7Jl4/DO6393-001 \n\nThis one's a vision of comfort. Layered textures, unique shapes and vivid colors combine in a design influenced by the exaggerated worlds found in our dreams. React foam and a soft tongue keep it smooth.",
                                                      hyperLinks: ["https://www.nike.com/ch/en/t/react-vision-shoes-wt7Jl4/DO6393-001": "https://www.nike.com/ch/en/t/react-vision-shoes-wt7Jl4/DO6393-001"])),
            Gift(title: "Play badminton with your friend",
                 category: .sports,
                 author: "Gifty",
                 time: "1.5 hours",
                 price: "CHF 70.-",
                 picture: "badminton",
                 shortDescription: "Does your friend enjoy playing badminton? Come and play at Yonex Badminton Halle!",
                 longDescription: addHyperLinksToText(originalText: "You must reserve a court via telephone @ 044 273 11 22 \n\nThe location is Geroldstrasse 5, 8005 Zurich \n\nThe opening hours are 8:30 – 22:00 \n\nDepending on the time, you can rent a court at CHF 30.- to CHF 40.- per 45 minutes. \n\nFor more info, visit the official website of Yonnex Badminton Halle: \nhttps://www.badmintonhalle.ch/Platzreservationen.6.0.html",
                                                      hyperLinks: ["https://www.badmintonhalle.ch/Platzreservationen.6.0.html": "https://www.badmintonhalle.ch/Platzreservationen.6.0.html"])),
            Gift(title: "DIY Travel Map",
                 category: .travel,
                 author: "Minh",
                 time: "5 hours",
                 price: "CHF 10.-",
                 picture: "travelMap",
                 shortDescription: "There is nothing as cool as a DIY map!",
                 longDescription: addHyperLinksToText(originalText: "Step 1: Burn the Paper's Edges to make it look authentic. Make sure that you do it outside because of the smoke and fire hazard! \n\nStep 2: Color the paper sheet. You can submerge the paper in concentrated coffee/ tea solution, and let it dry. To speed it up, place the paper in front of a fan or a hair dryer. This step can be repeated as many time as you need! \n\nStep 3: DRAW! It is up to your imagination! Voila, you are all done!", hyperLinks: [:])),
            Gift(title: "Swiss Alps Day Trip from Zurich: Jungfraujoch and Bernese Oberland",
                 category: .travel,
                 author: "Minh",
                 time: "12 hours",
                 price: "CHF 300.-",
                 picture: "swissAlps",
                 shortDescription: "Let’s visit Jungfraujoch and Bernese Oberland!",
                 longDescription: addHyperLinksToText(originalText: "Highlights: \n• A guided day trip removes the hassle of planning your visit to Jungfraujoch \n• Admire stunning views of Alpine landscape throughout your tour \n• Entrance to Sphinx Observatory and Ice Palace included as summit activities \n• Round-trip transportation from Zurich in coach, gondola ride and cogwheel train included \n\nWhat to expect? \nMeet your guide in central Zurich, and head for the charming ski resort of Grindelwald aboard a comfortable coach. Learn about the Bernese Oberland region as you pass through the Swiss countryside. Stop in Interlaken long enough for a quick photo and a hot drink (own expense). Upon arrival in Grindelwald, first board the gondola Eiger Express of the newly opened V-Cableway, followed by a ride in a classic cogwheel train up the UNESCO-listed Jungfraujoch mountain, aptly nicknamed the “Top of Europe” for its incredible summit at 11,330 feet (3,450 meters). Disembark at the summit for stunning views of the Alpine landscape from the Sphinx Observatory and a guided tour through the frozen tunnels of the Ice Palace. Enjoy free time to dine or explore before re- boarding the train and meeting your coach for the return journey to Zurich. \n\nFor more info, visit: https://www.tripadvisor.com/AttractionProductReview-g188113-d11450092-Swiss_Alps_Day_Trip_from_Zurich_Jungfraujoch_and_Bernese_Oberland-Zurich.html",
                                                      hyperLinks: ["https://www.tripadvisor.com/AttractionProductReview-g188113-d11450092-Swiss_Alps_Day_Trip_from_Zurich_Jungfraujoch_and_Bernese_Oberland-Zurich.html": "https://www.tripadvisor.com/AttractionProductReview-g188113-d11450092-Swiss_Alps_Day_Trip_from_Zurich_Jungfraujoch_and_Bernese_Oberland-Zurich.html"])),
            Gift(title: "Mixtape",
                 category: .music,
                 author: "Orestis",
                 time: "20 min – 1 hour",
                 price: "3.15 ~ 18.5 CHF",
                 picture: "mixtape",
                 shortDescription: "Create a mixtape of songs and print its digital code in different objects",
                 longDescription: addHyperLinksToText(originalText: "1. Form a playlist at Spotify with songs of the receiver’s preference. \n2. Open the playlist you created and tap the three dots \n3. Save the image of the playlist with the Spotify code \n4. After that you could print that code on: \ni. Photo stickers with your pictures and the playlist code \nii. A mug with a picture where you are together and the playlist code \n\nFor the printing of the code and the picture of you click the following url: \nhttps://www.ifolor.ch/en/photo-gifts/photo-mug",
                                                      hyperLinks: ["https://www.ifolor.ch/en/photo-gifts/photo-mug": "https://www.ifolor.ch/en/photo-gifts/photo-mug"])),
            Gift(title: "Vinyl Membership",
                 category: .music,
                 author: "Orestis",
                 time: "2 min (only order)",
                 price: "137 – 457 CHF",
                 picture: "vinyl",
                 shortDescription: "Gift someone a membership for a monthly delivery of vinyl goodness",
                 longDescription: addHyperLinksToText(originalText: "At https://www.vinylmeplease.com/ you can buy a membership for your gift recipient and they are going to send her/ him a package with a vinyl and many extras like liner notes. \n\nDepending on the music taste of gift recipient, you can choose from 4 Tracks: \n1. Essentials \n2. Classics \n3. Hip-Hop \n4. Country \n\nWhether they’re new to vinyl or a pro, through that membership they are going to collect and learn something new every month. \n\nMembership can be one of the following: \n3 Months 137 CHF \n6 Months 256 CHF \n12 Months 457 CHF",
                                                      hyperLinks: ["https://www.vinylmeplease.com/": "https://www.vinylmeplease.com/"])),
            Gift(title: "Poem Creation",
                 category: .culture,
                 author: "Gifty",
                 time: "1min – 5min",
                 price: "0 CHF",
                 picture: "poem",
                 shortDescription: "Create a poem with an online generator",
                 longDescription: addHyperLinksToText(originalText: "You can create an entire poem in less than a minute in the following site: \nhttps://www.poem-generator.org.uk/ \n\nYou can choose from a variety of different types of poems like: \n\n • Free Verse \n • Quick Poem \n • Haiku \n • Didactic Cinquain \n • Rhyming Couplets \n • Sonnet \n • Villanelle \n • Limerick \n • Acrostic \n • Love Poem \n • Narrative Poem \n • Line by Line \n • Concrete \n • Tanka \n\nAfter you choose your preferable category, you follow the steps that generator suggests you in order to create the poem",
                                                      hyperLinks: ["https://www.poem-generator.org.uk/": "https://www.poem-generator.org.uk/"])),
            Gift(title: "Museum Rietberg",
                 category: .culture,
                 author: "Gifty",
                 time: "~90 minutes",
                 price: "14-25 CHF",
                 picture: "museumRietberg",
                 shortDescription: "A multicultural tour to Rietber museum",
                 longDescription: addHyperLinksToText(originalText: "The Rietberg Museum is one of the largest art museums in Switzerland. It is located in the city of Zurich and focuses on the traditional and contemporary arts and cultures of Asia, Africa, the Americas, and Oceania \n\nThe museum has different exhibitions throughout the year and you can be informed about them here: \n\nhttps://rietberg.ch/en/exhibitions \n\nExcept from Monday, you can visit the Rietberg Museum each of all the other week’s days from 10am to 5pm and on Wednesdays till 8pm. \n\nThe tickets for special exhibitions are CHF 25 / 20 (reduced) and for the attending the regular collection of museum CHF 14 / 12 (reduced). \n\nDo not forget to visit the original Japanese tearoom that is inside the premises of museum.",
                                                      hyperLinks: ["https://rietberg.ch/en/exhibitions": "https://rietberg.ch/en/exhibitions"])),
            Gift(title: "Make your own Chocolate Candy",
                 category: .food,
                 author: "Gifty",
                 time: "15 min",
                 price: "10 CHF",
                 picture: "candy",
                 shortDescription: "There is famous quote from Linda Grayson about chocolate: “There is nothing better than a friend, unless it is a friend with chocolate.” So if you want to be that friend with chocolate, this recipe is just for you.",
                 longDescription: addHyperLinksToText(originalText: "Ingredients: \n\n200 g chocolate, whole milk or plain \n100 g lady fingers or butter biscuits \n50 g icing sugar, sifted \n50 g butter \n1 bottle of butter vanilla flavouring \n\nCrumble the biscuits in a freezer bag using a rolling pin. Melt the butter. Stir the flavouring into the butter immediately so that everything is evenly distributed. \n\nSlowly heat the chocolate in a water bath. When all the chocolate has melted, stir in the crumbled biscuits, icing sugar and butter and place in the fridge to cool for 10 minutes. \n\nUse a spoon to portion out the mixture, squeeze a little and form small balls between the palms of your hands. \n\nSource: https://www.chefkoch.de/rezepte/2058601333018067/Pralinen-selbstgemacht.html",
                                                      hyperLinks: ["https://www.chefkoch.de/rezepte/2058601333018067/Pralinen-selbstgemacht.html": "https://www.chefkoch.de/rezepte/2058601333018067/Pralinen-selbstgemacht.html"])),
            Gift(title: "Live Online Cooking Experience",
                 category: .food,
                 author: "Gifty",
                 time: "1-2 hours",
                 price: "59 CHF",
                 picture: "onlineCooking",
                 shortDescription: "Thanks to this gift, you can spend time together, eat well and learn something.",
                 longDescription: addHyperLinksToText(originalText: "Join the LIVE interactive online cooking class where Sherly will walk you through REAL-Time step by step into making delicious dishes in the comfort of your home kitchen. Make it a date night or a fun group activity and cook up a delicious meal from your home. \n\nYou can book it here: https://sherlyskitchen.com/online-cooking-class/ \n\nsource: https://sherlyskitchen.com/",
                                                      hyperLinks: ["https://sherlyskitchen.com/online-cooking-class/": "https://sherlyskitchen.com/online-cooking-class/", "https://sherlyskitchen.com/": "https://sherlyskitchen.com/"])),
            Gift(title: "Barista Course",
                 category: .drink,
                 author: "Gifty",
                 time: "6 hours",
                 price: "220 CHF",
                 picture: "baristaCourse",
                 shortDescription: "If the recipient of your gift is a coffee lover, this present is the perfect choice.",
                 longDescription: addHyperLinksToText(originalText: "Deepen your knowledge about coffee and learn how to brew a great espresso or cappuccino. \n\nYou can buy a voucher or book the course on this website: \nhttps://don-camillo.coffee/barista-kurse/ \nsource: https://don-camillo.coffee",
                                                      hyperLinks: ["https://don-camillo.coffee/barista-kurse/": "https://don-camillo.coffee/barista-kurse/", "https://don-camillo.coffee": "https://don-camillo.coffee"])),
            Gift(title: "Cocktail evening",
                 category: .drink,
                 author: "Gifty",
                 time: "1 hour",
                 price: "20 CHF",
                 picture: "cocktail",
                 shortDescription: "Impress with your cocktail mixing skills! After watching a short video, you will be able to mix 10 different cocktails.",
                 longDescription: addHyperLinksToText(originalText: "You can learn to mix the following cocktails: \nEspresso Martini Negroni \nAperol Spritz Brown Derby Bees Knees Margarita Daiquiri Godfather Manhattan Brandy Flip \n\nHere is the link to the video: \nhttps://www.youtube.com/watch?v=IRkM8jsG-hY&ab_channel=StevetheBartender \nsource: https://www.youtube.com/",
                                                      hyperLinks: ["https://www.youtube.com/watch?v=IRkM8jsG-hY&ab_channel=StevetheBartender": "https://www.youtube.com/watch?v=IRkM8jsG-hY&ab_channel=StevetheBartender", "https://www.youtube.com/": "https://www.youtube.com/"]))
                 ]
        
    }
}
