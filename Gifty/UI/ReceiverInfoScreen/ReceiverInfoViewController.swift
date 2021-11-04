//
//  ReceiverInfoViewController.swift
//  Gifty
//
//  Created by Oleksii Vasyliev on 01.11.2021.
//
//

import UIKit

class ReceiverInfoViewController: UIViewController {
    
    // MARK: - OUtlets
    
    @IBOutlet private weak var receiverHeaderLabel: UILabel!
    @IBOutlet private weak var receiverNameTextField: UITextField!
    @IBOutlet private weak var receiverAgeTextField: UITextField!
    @IBOutlet private weak var receiverGenderTextField: UITextField!
    @IBOutlet private weak var startQuestionnaireButton: UIButton!
    
    // MARK: - Properties
    
    private let genders = ["Male", "Female"]
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startQuestionnaireButton.titleLabel?.font = Appfont.regular.size(16.0)
        startQuestionnaireButton.layer.cornerRadius = 24
        setTextFields()
        pickerSetup()
        dismissKeyboard()
        changeStateOfButton()
        setNavigationControllerButton()
    }
    
    //MARK: - Handlers
    
    @objc func closePressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nameChanged(_ sender: UITextField) {
        changeStateOfButton()
    }
    
    //MARK: - Actions
    
    @IBAction func startQuestionnairePressed(_ sender: UIButton) {
        
        guard let name = receiverNameTextField.text,
              let age = Int(receiverAgeTextField.text ?? "0"),
              let gender = receiverGenderTextField.text else { return }
        
        QuestionsManager.shared.setupUserInfo(name: name, age: age, gender: gender)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "QuestionnaireViewController") as? QuestionnaireViewController else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Methods
    
    private func pickerSetup() {
        let thePicker = UIPickerView()
        receiverGenderTextField.inputView = thePicker
        thePicker.delegate = self
    }
    
    private func setTextFields() {
        receiverNameTextField.delegate = self
        receiverAgeTextField.delegate = self
        receiverGenderTextField.delegate = self
        
        receiverNameTextField.addTarget(self, action: #selector(nameChanged(_:)), for: .editingChanged)
        receiverAgeTextField.addTarget(self, action: #selector(nameChanged(_:)), for: .editingChanged)
        receiverGenderTextField.addTarget(self, action: #selector(nameChanged(_:)), for: .allEvents)

        receiverAgeTextField.keyboardType = .numberPad
    }
    
    private func changeStateOfButton() {
        if receiverNameTextField.text == "" ||
            receiverAgeTextField.text == "" ||
            receiverGenderTextField.text == "" {
            startQuestionnaireButton.isEnabled = false
            startQuestionnaireButton.backgroundColor = .lightGray
            startQuestionnaireButton.alpha = 0.5
        } else {
            startQuestionnaireButton.isEnabled = true
            startQuestionnaireButton.backgroundColor = UIColor(red: 0.0/255.0, green: 181/255.0, blue: 98/255.0, alpha: 1.0)
            startQuestionnaireButton.alpha = 1
        }
    }
    
    private func setNavigationControllerButton() {
        let closeImage = UIImage(named: "closeButton")
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: closeImage, style: .plain, target: self, action: #selector(closePressed))
    }
}

// MARK: - UITextFieldDelegate

extension ReceiverInfoViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        changeStateOfButton()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == receiverGenderTextField {
            receiverGenderTextField.text = genders.first
        }
    }
}


// MARK: - UIPickerViewDelegate

extension ReceiverInfoViewController: UIPickerViewDelegate {
}

// MARK: - UIPickerViewDataSource

extension ReceiverInfoViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        receiverGenderTextField.text = genders[row]
        receiverGenderTextField.font = Appfont.regular.size(16.0)
        changeStateOfButton()
    }
}
