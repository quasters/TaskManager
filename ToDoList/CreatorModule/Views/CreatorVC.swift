//
//  CreatorVC.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 08.08.2022.
//

import UIKit

final class CreatorVC: UIViewController {
    var viewModel: CreatorVMProtocol?
    
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
    
    // MARK: - Set UI Elements
    private func setTaskConfigurationView() {
        taskConfigurationView = TaskConfigurationView()
        taskConfigurationView?.configure()
        
        self.view.addSubview(taskConfigurationView!)
        setTaskConfigurationViewConstraints()
    }
    
    private func setSaveButton() {
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
            saveButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
    }
    
    private func setTaskConfigurationViewConstraints() {
        guard let taskConfigurationView = taskConfigurationView else { return }
        guard let saveButton = saveButton else { return }
        taskConfigurationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            taskConfigurationView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            taskConfigurationView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            taskConfigurationView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            taskConfigurationView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20)
        ])
    }
}
