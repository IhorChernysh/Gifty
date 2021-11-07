
import UIKit

class GiftDescriptionTableViewCell: UITableViewCell {

    @IBOutlet private weak var giftShortDescriptionLabel: UILabel!
    @IBOutlet private weak var giftLongDescriptionTextView: UITextView!
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configure(giftShortDescription: String, giftLongDescription: NSMutableAttributedString) {
        giftLongDescriptionTextView.delegate = self
        
        giftShortDescriptionLabel.text = giftShortDescription
        giftLongDescriptionTextView.text = ""
        giftLongDescriptionTextView.attributedText = giftLongDescription
        
        giftLongDescriptionTextView.isScrollEnabled = false
        giftLongDescriptionTextView.sizeToFit()
        giftLongDescriptionTextView.textContainer.lineFragmentPadding = 0
        giftLongDescriptionTextView.isEditable = false
    }
}

extension GiftDescriptionTableViewCell: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL, options: [:], completionHandler: nil)
        return false
    }
}
