//
//  ProfileViewController.swift
//  Gifty
//
//  Created by Oleksii Vasyliev on 01.11.2021.
//
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var welcomeScreenLabel: UILabel!
    @IBOutlet private weak var createReceiverButton: UIButton!
    @IBOutlet private weak var listOfReceiversTableView: UITableView!
    
    private lazy var fetchedResultsController: NSFetchedResultsController<UserCD> = {
        let fetchRequest: NSFetchRequest<UserCD> = UserCD.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.shared.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        
        return fetchedResultsController
    }()
    
    // MARK: - Lifecycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        createReceiverButton.titleLabel?.font = Appfont.regular.size(16.0)
        createReceiverButton.backgroundColor = .white
        createReceiverButton.layer.cornerRadius = 24
        listOfReceiversTableView.layer.cornerRadius = 24
        listOfReceiversTableView.delegate = self
        listOfReceiversTableView.dataSource = self
        listOfReceiversTableView.tableFooterView = UIView()
        navigationController?.isNavigationBarHidden = true
        
        do {
            try self.fetchedResultsController.performFetch()
        } catch {
            let fetchError = error as NSError
            print("Unable to Perform Fetch Request")
            print("\(fetchError), \(fetchError.localizedDescription)")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
        if fetchedResultsController.fetchedObjects?.first == nil {
            listOfReceiversTableView.isHidden = true
        } else {
            listOfReceiversTableView.isHidden = false
        }
        
        QuestionsManager.shared.resetQuestionsManager()
    }
    
    // MARK: - Actions
    
    @IBAction func createReceiverPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ReceiverInfoViewController") as? ReceiverInfoViewController else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ListOfGiftsViewController") as? ListOfGiftsViewController else { return }
        if let selectedUserCD = fetchedResultsController.fetchedObjects?[indexPath.row] {
            viewController.gifts = GiftDataManager().getGiftsForActivity(activityName: selectedUserCD.preferActivity ?? "")
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath)
        let user = fetchedResultsController.fetchedObjects?[indexPath.row]
        cell.textLabel?.text = user?.name
        cell.textLabel?.font = Appfont.regular.size(16.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let object = fetchedResultsController.fetchedObjects?[indexPath.row] {
                CoreDataService.shared.remove(object: object)
            }
        }
    }
}

// MARK: - NSFetchedResultsControllerDelegate

extension ProfileViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller:
                                     NSFetchedResultsController<NSFetchRequestResult>) {
        listOfReceiversTableView.beginUpdates()
    }
    
    func controller(_ controller:
                    NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            listOfReceiversTableView.insertRows(at: [newIndexPath!], with: .left)
        case .delete:
            listOfReceiversTableView.deleteRows(at: [indexPath!], with: .right)
        case .update:
            break
        case .move:
            break
        @unknown default:
            print("Unexpected NSFetchedResultsChangeType")
        }
    }
    
    func controllerDidChangeContent(_ controller:
                                    NSFetchedResultsController<NSFetchRequestResult>) {
        listOfReceiversTableView.endUpdates()
    }
}
