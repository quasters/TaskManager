//
//  CreatorVC.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 08.08.2022.
//

import UIKit
import RxSwift

// FIXME: - add data of edit cell
final class CreatorVC: UIViewController {
    var viewModel: CreatorVMProtocol?
    
    private var deleteButton = UIBarButtonItem()
    private var saveButton: UIButton?
    private var taskConfigurationView: TaskConfigurationView?
    
    private var taskTitle: String?
    private var taskType: TypeTab?
    private var taskDeadline: Date?
    private var taskColor: TaskColor?
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        setNavBar()
        setSaveButton()
        setTaskConfigurationView()
        bind()
    }
    
    // MARK: - Set UI Elements
    private func setNavBar() {
        self.title = "Edit Task"
        self.navigationController?.navigationBar.tintColor = UIColor(named: "blackAdaptive")
        
        if (viewModel?.editTask) != nil {
            deleteButton.image = UIImage(systemName: "trash")
            deleteButton.tintColor = .red
            self.navigationItem.rightBarButtonItem = deleteButton
        }
    }
    
    private func setTaskConfigurationView() {
        taskConfigurationView = TaskConfigurationView()
        taskConfigurationView?.configure(task: viewModel?.editTask)
        
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
        saveButton.isEnabled = false
        
        self.view.addSubview(saveButton)
        setSaveButtonConstraints()
    }
    
    // MARK: - Rx Bindings
    private func bind() {
        if let rightBarButton = self.navigationItem.rightBarButtonItem {
            rightBarButton.rx.tap
                .observe(on: MainScheduler.instance)
                .bind(onNext: { [weak self] in
                    guard let VM = self?.viewModel else { return }
                    guard let task = VM.editTask else { return }
                    VM.delete(task: task)
                    VM.popToRoot()
                })
                .disposed(by: disposeBag)
        }
        
        taskConfigurationView?.title
            .observe(on: MainScheduler.instance)
            .bind(onNext: { [weak self] title in
                guard let title = title else { return }
                self?.saveButton?.isEnabled = title.count > 0
                self?.taskTitle = title
            })
            .disposed(by: disposeBag)
        
        taskConfigurationView?.type
            .observe(on: MainScheduler.instance)
            .bind(onNext: { [weak self] type in
                self?.taskType = type
            })
            .disposed(by: disposeBag)
        
        taskConfigurationView?.deadline
            .observe(on: MainScheduler.instance)
            .bind(onNext: { [weak self] deadline in
                self?.taskDeadline = deadline
            })
            .disposed(by: disposeBag)
        
        taskConfigurationView?.color
            .observe(on: MainScheduler.instance)
            .bind(onNext: { [weak self] color in
                self?.taskColor = color
            })
            .disposed(by: disposeBag)
        
        saveButton?
            .rx.tap
            .observe(on: MainScheduler.instance)
            .bind(onNext: { [weak self] in                
                guard let title = self?.taskTitle else { return }
                guard let type = self?.taskType else { return }
                guard let deadline = self?.taskDeadline else { return }
                guard let color = self?.taskColor else { return }
                
                if let editTask = self?.viewModel?.editTask {
                    self?.viewModel?.update(task: editTask, title: title, type: type, deadline: deadline, color: color)
                } else {
                    self?.viewModel?.save(title: title, type: type, deadline: deadline, color: color)
                }
                
                self?.viewModel?.popToRoot()
            })
            .disposed(by: disposeBag)
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
