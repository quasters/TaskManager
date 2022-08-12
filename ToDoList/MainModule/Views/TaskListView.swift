//
//  ListView.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 08.08.2022.
//

import UIKit

class TaskListView: UIView {
    let tableView = UITableView()
    
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
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TaskCell()
        cell.contentView.isUserInteractionEnabled = true
        cell.configure()
        
        return cell
    }
}
