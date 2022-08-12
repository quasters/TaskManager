//
//  CreatorVC.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 08.08.2022.
//

import UIKit

class CreatorVC: UIViewController {
    var viewModel: CreatorVMProtocol?
    
    private let sideIndent: Double = 10
    
    private var saveButton: UIButton?
    private var taskConfigurationView: TaskConfigurationView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Edit Task"
        self.navigationController?.navigationBar.tintColor = UIColor(named: "blackAdaptive")
        
        
        setSaveButton()
        setTaskConfigurationView()
    }
    
    func setTaskConfigurationView() {
        taskConfigurationView = TaskConfigurationView()
        taskConfigurationView?.configure()
        
        self.view.addSubview(taskConfigurationView!)
        setTaskConfigurationViewConstraints()
    }
    
    func setSaveButton() {
        saveButton = UIButton()
        guard let saveButton = saveButton else { return }
        
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = UIColor(named: "blackAdaptive")
        configuration.baseForegroundColor = .systemBackground
        configuration.cornerStyle = .capsule
        configuration.title = "Save Task"
        saveButton.configuration = configuration
        
        self.view.addSubview(saveButton)
        setSaveButtonConstraints()
    }
    
// MARK: - Constraints
    private func setSaveButtonConstraints() {
        guard let saveButton = saveButton else { return }
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: 42),
            saveButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            saveButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            saveButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setTaskConfigurationViewConstraints() {
        guard let taskConfigurationView = taskConfigurationView else { return }
        guard let saveButton = saveButton else { return }
        taskConfigurationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskConfigurationView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            taskConfigurationView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: sideIndent),
            taskConfigurationView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -sideIndent),
            taskConfigurationView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -sideIndent)
        ])
    }
}
