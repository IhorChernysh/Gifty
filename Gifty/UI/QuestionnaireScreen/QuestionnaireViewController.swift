//
//  QuestionnaireViewController.swift
//  Gifty
//
//  Created by Oleksii Vasyliev on 01.11.2021.
//
//

import UIKit

class QuestionnaireViewController: UIViewController {
    
    @IBOutlet private weak var questionnaireTableView: UITableView!
    
    // MARK: - Properties
    
    private var questionsManager = QuestionsManager.shared
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setNavigationControllerButtons()
    }
    
    // MARK: - Handlers
    
    @objc func closePressed() {
        if questionsManager.getNavigationState() == .firstQuestion {
            navigationController?.popViewController(animated: true)
            return
        }
        
        questionsManager.setPreviousQuestion()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nextPressed() {
        if questionsManager.currentQuestionIsLast() {
            questionsManager.saveUserInfoAndActivity()
            questionsManager.resetQuestionsManager()
            let vc = UIViewController()
            let closeImage = UIImage(named: "closeButton")
            vc.view.backgroundColor = .white
            vc.navigationItem.leftBarButtonItem = UIBarButtonItem(image: closeImage, style: .plain, target: self, action: #selector(goToWelcomeScreen))
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        
        questionsManager.setNextQuestion()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "QuestionnaireViewController") as? QuestionnaireViewController else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func goToWelcomeScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Methods

    private func setupTableView() {
        questionnaireTableView.delegate = self
        questionnaireTableView.dataSource = self
        
        questionnaireTableView.register(UINib.init(nibName: "QuestionnaireViewCell", bundle: nil), forCellReuseIdentifier: "QuestionnaireViewCell")
        questionnaireTableView.register(QuestionsTableHeaderView.nib, forHeaderFooterViewReuseIdentifier: QuestionsTableHeaderView.identifier)
        
        questionnaireTableView.tableFooterView = UIView()
        questionnaireTableView.rowHeight = UITableView.automaticDimension
        questionnaireTableView.separatorColor = UIColor.lightGray
    }
        
    private func setNavigationControllerButtons() {
        navigationController?.isNavigationBarHidden = false
        
        setNavigationWith(navigationState: questionsManager.getNavigationState())
    }
    
    private func setNavigationWith(navigationState: NavigationState) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: navigationState.leftImage, style: .plain, target: self, action: #selector(closePressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: navigationState.title, style: .plain, target: self, action: #selector(nextPressed))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0.0/255.0, green: 181/255.0, blue: 98/255.0, alpha: 1.0)
        
        setNavigationRightButtonEnable(answerIsSelected: false)
    }
    
    private func setNavigationRightButtonEnable(answerIsSelected: Bool) {
        navigationItem.rightBarButtonItem?.isEnabled = answerIsSelected
    }
}

// MARK: - UITableViewDataSource

extension QuestionnaireViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: QuestionsTableHeaderView.identifier ) as! QuestionsTableHeaderView
        if let currentQuestion = questionsManager.getCurrentQuestion() {
            headerView.configure(questionTitle: currentQuestion.question)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionsManager.getCurrentQuestion()?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionnaireViewCell", for: indexPath) as! QuestionnaireViewCell
        if let answerNameToSetup = questionsManager.getCurrentQuestion()?.answers[indexPath.row] {
            let selectedAnswerName = questionsManager.getSelectedAnswerNameBy(indexPath: indexPath)
            cell.configure(answer: answerNameToSetup, isSelected: answerNameToSetup == selectedAnswerName)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension QuestionnaireViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var answerIsSelected = false
        if let selectedAnswerName = questionsManager.getCurrentQuestion()?.answers[indexPath.row] {
            questionsManager.updateSelectedAnswer(selectedAnswerName: selectedAnswerName)
            answerIsSelected = true
        }
        setNavigationRightButtonEnable(answerIsSelected: answerIsSelected)
        
        tableView.reloadData()
    }
}
