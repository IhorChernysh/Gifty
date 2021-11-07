
import UIKit

class GiftTitleTableViewCell: UITableViewCell {

    @IBOutlet private weak var giftCategoryLabel: UILabel!
    @IBOutlet private weak var giftTitleLabel: UILabel!
    @IBOutlet private weak var giftImageView: UIImageView!
    @IBOutlet private weak var giftTimeIcon: UIImageView!
    @IBOutlet private weak var giftCostIcon: UIImageView!
    @IBOutlet private weak var giftTimeLable: UILabel!
    @IBOutlet private weak var giftCostLabel: UILabel!
    @IBOutlet private weak var giftAuthorLabel: UILabel!
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configure(giftCategory: String, giftTitle: String, giftTime: String, giftPrice: String, giftAuthor: String, giftImage: String ) {
        giftCategoryLabel.text = giftCategory
        giftTitleLabel.text = giftTitle
        giftImageView.image = UIImage(named: "\(giftImage)")
        giftTimeLable.text = giftTime
        giftCostLabel.text = giftPrice
        giftAuthorLabel.text = giftAuthor
        
        giftImageView.layer.cornerRadius = 10
    }
}
