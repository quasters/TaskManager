//
//  TaskConfigurationView.swift
//  ToDoList
//
//  Created by Наиль Буркеев on 12.08.2022.
//

import UIKit

class TaskConfigurationView: UIView {
    private let tableView = UITableView()
    
    func configure()  {
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
        let heights: [CGFloat] = [44, 44, 44, 38]
        return heights[indexPath.section]
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = ["Task Color", "Task Deadline", "Task Title", "Task Type"]
        return title[section]
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.section {
//        case 0:
//            let cell = ColorPickerCell()
//            cell.textLabel?.text = "\(indexPath.row)"
////            cell.selectionStyle = .none
//            return cell
//        case 3:
        let cell = TaskTypeCell()
        
        cell.contentView.isUserInteractionEnabled = true
        cell.configure()
        return cell
//        default:
//            let cell = UITableViewCell()
//            cell.textLabel?.text = "\(indexPath.row)"
//            cell.selectionStyle = .none
//            return cell
//        }
        
    }
}
