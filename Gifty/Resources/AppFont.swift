import Foundation
import UIKit

private let familyName = "Montserrat"

enum Appfont: String {
    case regular = "Regular"
    case bold = "Bold"
    
    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: fullFontName, size: size + 1.0){
            return font
        }
        fatalError("Font \(fullFontName) does not exist.")
    }
    fileprivate var fullFontName: String {
        return rawValue.isEmpty ? familyName : familyName + "-" + rawValue
    }
}
