//
//  ListView.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 08.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

class TaskListView: UIView {
    let edit = PublishSubject<Void>()
    private let disposeBag = DisposeBag()
    private let tableView = UITableView()
    
    var isFailed = false
    var tasks: [Task]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none

        self.addSubview(tableView)
        setConstraints()
    }
    
    private func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalTo: self.heightAnchor),
            tableView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}

extension TaskListView: UITableViewDataSource, UITableViewDelegate {    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TaskCell()
        let task = tasks![indexPath.row]
        cell.contentView.isUserInteractionEnabled = true
        let color = TaskColor(rawValue: task.color ?? "")
        cell.configure(title: task.title,
                       category: task.type,
                       date: task.deadline,
                       color: color,
                       isCompleted: task.isCompleted,
                       isFailed: isFailed)
        
        cell.editButton
            .rx.tap
            .bind { [weak self] event in
                self?.edit.onNext(event)
            }
            .disposed(by: disposeBag)
        
//        cell.doneButton
//            .rx.tap
//            .bind { [weak self] in
//                self?.tableView.reloadData()
//            }
//            .disposed(by: disposeBag)
        
        return cell
    }
}
