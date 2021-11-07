
import UIKit

enum GiftInfoSections: String, CaseIterable {
    case header
    case description
}

class GiftDetailInfoViewController: UIViewController {

    @IBOutlet private weak var giftInfoTableView: UITableView!
    
    // MARK: - Properties
    
    private var cellArray: [GiftInfoSections] = [.header, .description]
    
    var currentGift: Gift?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setNavigationControllerButton()
    }
    
    //MARK: - Handlers
    
    @objc func closePressed() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Methods
    
    private func setupCollectionView() {
        giftInfoTableView.dataSource = self
        giftInfoTableView.delegate = self
        
        giftInfoTableView.register(GiftTitleTableViewCell.nib, forCellReuseIdentifier: GiftTitleTableViewCell.identifier)
        giftInfoTableView.register(GiftDescriptionTableViewCell.nib, forCellReuseIdentifier: GiftDescriptionTableViewCell.identifier)
        
    }
    
    private func setNavigationControllerButton() {
        let closeImage = UIImage(named: "back")
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: closeImage, style: .plain, target: self, action: #selector(closePressed))
    }
}

//MARK: - UICollectionViewDataSource

extension GiftDetailInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentItem = cellArray[indexPath.row]
        switch currentItem {
        case .header:
            let headerCell = giftInfoTableView.dequeueReusableCell(withIdentifier: GiftTitleTableViewCell.identifier, for: indexPath) as! GiftTitleTableViewCell
            if let selectedGift = currentGift {
                headerCell.configure(giftCategory: selectedGift.category.rawValue,
                                     giftTitle: selectedGift.title,
                                     giftTime: selectedGift.time,
                                     giftPrice: selectedGift.price,
                                     giftAuthor: "Author: \(selectedGift.author)",
                                     giftImage: selectedGift.picture)
            }
            headerCell.selectionStyle = .none
            headerCell.separatorInset = .init(top: 0, left: 1000, bottom: 0, right: 0)
            return headerCell
        case .description:
            let infoCell = giftInfoTableView.dequeueReusableCell(withIdentifier: GiftDescriptionTableViewCell.identifier, for: indexPath) as! GiftDescriptionTableViewCell
            if let selectedGift = currentGift {
                infoCell.configure(giftShortDescription: selectedGift.shortDescription,
                                   giftLongDescription: selectedGift.longDescription)
            }
            infoCell.selectionStyle = .none
            infoCell.separatorInset = .init(top: 0, left: 1000, bottom: 0, right: 0)
            return infoCell
        }
    }
}

//MARK: - UICollectionViewDelegate

extension GiftDetailInfoViewController: UITableViewDelegate {
}
