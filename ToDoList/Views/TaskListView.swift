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
        tableView.register(TaskCell.self, forCellReuseIdentifier: "Cell")
        
        self.addSubview(tableView)
        setConstraints()
    }
    
    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalTo: self.heightAnchor),
            tableView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
}

extension TaskListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TaskCell()
        cell.configure()
        return cell
    }
    

}

extension TaskListView: UITableViewDelegate {
    
}
