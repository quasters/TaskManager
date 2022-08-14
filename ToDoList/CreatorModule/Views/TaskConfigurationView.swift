//
//  TaskConfigurationView.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 12.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

class TaskConfigurationView: UIView {
    let title = PublishSubject<String?>()
    let color = PublishSubject<TaskColor>()
    let deadline = PublishSubject<Date>()
    let type = PublishSubject<TypeTab>()
    
    private var task: Task?
    
    private let tableView = UITableView()
    private let disposeBag = DisposeBag()
    
    func configure(task: Task? = nil) {
        self.task = task
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        
        tableView.separatorStyle = .none
        
        self.addSubview(tableView)
        setConstraints()
    }
    
    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
}

extension TaskConfigurationView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let heights: [CGFloat] = [30, 44, 44, 58]
        return heights[indexPath.section]
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = ["Task Color", "Task Deadline", "Task Title", nil]
        return title[section]
    }

    // FIXME: - update configurates()
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = ColorPickerCell()
            
            cell.configure(radius: 15, startColor: TaskColor(rawValue: task?.color ?? ""))
            
            cell.values?
                .bind(onNext: { [weak self] colorId in
                    self?.color.onNext(TaskColor(colorId: colorId))
                })
                .disposed(by: disposeBag)
            return cell
            
        case 1:
            let cell = TaskDeadlineCell()
            cell.configure(deadline: task?.deadline)

            
            cell.picker.rx.date
                .bind { date in
                    self.deadline.onNext(date)
                }
                .disposed(by: disposeBag)
            return cell
            
        case 2:
            let cell = TaskTitleCell()
            cell.configure(title: task?.title)
            
            cell.textField.rx.text
                .bind { [weak self] value in
                    self?.title.onNext(value)
                }
                .disposed(by: disposeBag)
            return cell
            
        case 3:
            let cell = TaskTypeCell()
            let width = self.bounds.width - 40
            cell.configure(height: 38, width: width, currentTab: TypeTab(rawValue: task?.type ?? "")?.getId())
            
            cell.typeSegment.values?
                .bind(onNext: { [weak self] id in
                    self?.type.onNext(TypeTab(typeId: id))
                })
                .disposed(by: disposeBag)
            return cell
            
        default:
            let cell = UITableViewCell()
            cell.textLabel?.text = "Error: Invalid UITableView IndexPath"
            cell.selectionStyle = .none
            return cell
        }
        
    }
}
