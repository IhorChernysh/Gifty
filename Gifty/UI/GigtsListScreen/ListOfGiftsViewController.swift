import UIKit

class ListOfGiftsViewController: UIViewController {
    
    @IBOutlet private weak var giftsListCollectionView: UICollectionView!
    
    //MARK: - Properties
    
    private var questionsManager = QuestionsManager.shared
    private let giftsManager = GiftDataManager()
    var gifts = [Gift]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        questionsManager.resetQuestionsManager()
    }
    
    @objc func goToWelcomeScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: - Methods
    
    private func setupCollectionView() {
        giftsListCollectionView.delegate = self
        giftsListCollectionView.dataSource = self
        
        giftsListCollectionView.register(GiftsCollectionViewCell.nib, forCellWithReuseIdentifier: GiftsCollectionViewCell.identifier)
    }
    
    private func setupNavigation() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        
        let closeImage = UIImage(named: "closeButton")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: closeImage, style: .plain, target: self, action: #selector(goToWelcomeScreen))
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension ListOfGiftsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        return CGSize(width: screenWidth * 0.9, height: 145)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
}

//MARK: - UICollectionViewDataSource

extension ListOfGiftsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GiftsCollectionViewCell.identifier, for: indexPath) as! GiftsCollectionViewCell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = CGColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0)
        cell.layer.cornerRadius = 10
        let gift = gifts[indexPath.row]
        cell.configure(giftsCategory: gift.category.rawValue,
                       giftsTitle: gift.title,
                       giftsTime: gift.time,
                       giftsPrice: gift.price,
                       giftsAuthor: "Author: \(gift.author)")
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension ListOfGiftsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "GiftDetailInfoViewController") as? GiftDetailInfoViewController else { return }
        let selectedGift = gifts[indexPath.row]
        viewController.currentGift = selectedGift
        navigationController?.pushViewController(viewController, animated: true)
    }
}
