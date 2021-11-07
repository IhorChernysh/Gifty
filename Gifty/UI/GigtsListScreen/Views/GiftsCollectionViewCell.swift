import UIKit

class GiftsCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var timeImage: UIImageView!
    @IBOutlet private weak var priceImage: UIImageView!
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configure(giftsCategory: String, giftsTitle: String, giftsTime: String, giftsPrice: String, giftsAuthor: String) {
        categoryLabel.text = giftsCategory
        titleLabel.text = giftsTitle
        timeLabel.text = giftsTime
        priceLabel.text = giftsPrice
        authorLabel.text = giftsAuthor
    }
}
